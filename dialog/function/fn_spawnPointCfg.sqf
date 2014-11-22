/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Sofia","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Athira","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case civilian:
	{
		if(license_civ_citizen) then {
			_return = [
				["civ_spawn","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		// Only Player with Rebel License can spawn in Kavala
		if(license_civ_rebel) then {
			_return set[count _return,["reb_spawn","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
		if((["adac"] call life_fnc_permLevel) > 1) then {
			_return set[count _return,["civ_adac_spawn","ADAC","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
		if((["smugler"] call life_fnc_permLevel) > 1) then {
			_return set[count _return,["civ_smugler_spawn","Schmuggler","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return set[count _return,[format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Krankenhaus","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Krankenhaus","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Krankenhaus","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;