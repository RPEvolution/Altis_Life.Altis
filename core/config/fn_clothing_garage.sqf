/*
	File: fn_clothing_garage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Charlie's Werkstatt Bekleidung.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Charlie's Werkstatt Bekleidung"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_Competitor","Arbeitsbekleidung",50]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_blk_ION",nil,20]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,20],
			["G_Shades_Blue",nil,20],
			["G_Shades_Green",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,20],
			["G_Lady_Mirror",nil,20],
			["G_Lady_Dark",nil,20],
			["G_Lady_Blue",nil,20],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_Rangemaster_belt","Werkzeuggürtel",150]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_blk",nil,100]
		];
	};
};
