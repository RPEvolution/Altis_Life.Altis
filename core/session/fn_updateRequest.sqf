/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag","_position","_positions"];
_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_position = [];
_positions = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
	};
} foreach life_licenses;
_packet set[count _packet,_array];

[] call life_fnc_saveGear;
_packet set[count _packet, life_gear];
switch (playerSide) do {
	case civilian: {
		_packet set[count _packet,life_is_arrested];
	};
};

for "_i" from 0 to 2 do {
	_position set [_i, format["%1", str (position player select _i)]];
};

switch(_flag) do {
	case "cop": {
		_positions set[0, _position];
		_positions set[1, life_last_positions select 1];
		_positions set[2, life_last_positions select 2];
	};
	case "civ": {
		_positions set[0, life_last_positions select 1];
		_positions set[1, _position];
		_positions set[2, life_last_positions select 1];
	};
	case "med": {
		_positions set[0, life_last_positions select 0];
		_positions set[1, life_last_positions select 1];
		_positions set[2, _position];
	};
};

hint format["%1", _positions];

_packet set[8, format["%1", str life_player_perms]];
_packet set[9, _positions];

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;