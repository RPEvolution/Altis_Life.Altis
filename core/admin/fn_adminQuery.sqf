/*
	File: fn_adminQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the query on a player.
*/
private["_display","_text","_info","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
disableSerialization;
_display = findDisplay 2900;
if(!isNil {admin_query_ip}) exitWith {hint "Du fragst bereits einen Spieler ab."};
_text = _display displayCtrl 2903;
_info = lbData[2902,lbCurSel (2902)];
_info = call compile format["%1", _info];
if(isNil "_info") exitWith {_text ctrlSetText "Spieler existiert nicht mehr?";};
if(isNull _info) exitWith {_text ctrlSetText "Spieler existiert nicht mehr?";};
[[player],"fnc_player_query",_info,false] spawn life_fnc_MP;
_text ctrlSetText "Frage Spieler ab...";