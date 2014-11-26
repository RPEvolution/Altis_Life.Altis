#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
private["_session", "_coplevel", "_perm_coplevel", "_last_positions"];
_session = _this;
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

life_gear = _this select 8;
[] call life_fnc_loadGear;

//Queries the PERMS of a Player
life_player_perms = (_session select 11);					
life_player_perms = call compile format["%1", life_player_perms];

// Queries the Last Positions of Player
life_last_positions = _this select 12;

//Parse side specific information.
switch(playerSide) do {

	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		life_blacklisted = _this select 9;
		
		_perm_coplevel = ["cop"] call life_fnc_permLevel;	
		if(_perm_coplevel > __GETC__(life_coplevel)) then {		
			//use PERM coplevel
			__CONST__(life_coplevel,_perm_coplevel);
			systemChat "CopLevel loaded from PERM";		
		} else {
			//use DB coplevel
			__CONST__(life_coplevel,_coplevel);			
			systemChat "CopLevel loaded from DB";		
		};
		
		life_last_position = life_last_positions select 0;
		for "_i" from 0 to (count life_last_position)-1 do
		{
			life_last_position set[_i, call compile format["%1", life_last_position select _i]];
		};	
		life_last_position = createMarker ["last_position", life_last_position];
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		
		life_houses = _this select 9;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles set[count life_vehicles,_house];
		} foreach life_houses;
		
		life_gangData = _this select 10;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		
		[] spawn life_fnc_initHouses;
		
		life_last_position = life_last_positions select 1;
		for "_i" from 0 to (count life_last_position)-1 do
		{
			life_last_position set[_i, call compile format["%1", life_last_position select _i]];
		};	
		life_last_position = createMarker ["last_position", life_last_position];
		
		// Adds more Paycheck for PERMS
		switch (true) do {
			case ((["adac"] call life_fnc_permLevel) > 2): {life_paycheck = life_paycheck + 50;};
			case ((["security"] call life_fnc_permLevel) > 2): {life_paycheck = life_paycheck + 50;};
			case ((["smugler"] call life_fnc_permLevel) > 2): {life_paycheck = life_paycheck + 50;};
			case ((["don"] call life_fnc_permLevel) > 1): {life_paycheck = life_paycheck + 150;};
		};
	};
	
	case independent: {	
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_copLevel,0);
		
		life_last_position = life_last_positions select 2;
		for "_i" from 0 to (count life_last_position)-1 do
		{
			life_last_position set[_i, call compile format["%1", life_last_position select _i]];
		};	
		life_last_position = createMarker ["last_position", life_last_position];
	};
};

switch(__GETC__(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 50;};
	case 2: {life_paycheck = life_paycheck + 75;};
	case 3: {life_paycheck = life_paycheck + 100;};
	case 4: {life_paycheck = life_paycheck + 125;};	
	case 5: {life_paycheck = life_paycheck + 150;};	
};

[true] call life_fnc_dynPermCheckout;
life_session_completed = true;
