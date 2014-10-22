#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Marshal","Polizei Uniform",75]];
		_ret set[count _ret,["U_O_Wetsuit",nil,250]];
	};
	
	//Hats
	case 1:
	{
		_ret set[count _ret,["H_Cap_blk",nil,15]];

		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["H_Beret_blk",nil,25]];
			_ret set[count _ret,["H_CrewHelmetHeli_B",nil,250]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_Beret_Colonel",nil,25]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["H_Beret_Colonel",nil,25]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,20],
			["G_Shades_Green",nil,20],
			["G_Shades_Red",nil,20],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Spectacles",nil,20],
			["G_Spectacles_Tinted",nil,20],
			["G_Squares",nil,20],
			["G_Aviator",nil,20],
			["G_Lady_Mirror",nil,20],
			["G_Lady_Dark",nil,20],
			["G_Lady_Red",nil,20],
			["G_Lady_Blue",nil,20],
			["G_Tactical_Black","NSA Glass",125]
		];
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_PlateCarrier1_blk",nil,400]];
		_ret set[count _ret,["V_RebreatherIR",nil,625]];
	};
	
	//Backpacks
	case 4:
	{
		_ret set[count _ret,["B_AssaultPack_blk",nil,100]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["B_UAV_01_backpack_F",nil,1000]];
		};
	};
};

_ret;
