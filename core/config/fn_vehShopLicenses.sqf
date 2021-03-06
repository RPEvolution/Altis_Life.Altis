#include <macro.h>
/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "quad_shop": {_ret = true;};
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_airhq": {_ret = license_cop_air;};
	case "civ_truck": {_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "reb_air": {_ret = license_civ_rebel;};
	case "reb_ship": {_ret = license_civ_rebel;};
	case "cop_car": {_ret = true;};
	case "garage_car": {_ret = (["adac"] call life_fnc_permLevel) > 1;};
	case "garage_air": {_ret = (["adac"] call life_fnc_permLevel) > 1;};
	case "sec_car": {_ret = (["sec"] call life_fnc_permLevel) >= 2;};
	case "sec_air": {_ret = (["sec"] call life_fnc_permLevel) >= 2;};
	case "don_car": {_ret = (["don"] call life_fnc_permLevel) >= 1;};
	case "don_air": {_ret = (["don"] call life_fnc_permLevel) >= 1;};
	case "smugler_car": {_ret = (["smugler"] call life_fnc_permLevel ) >= 2;};
	case "smugler_air": {_ret = (["smugler"] call life_fnc_permLevel ) >= 2;};	
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;
