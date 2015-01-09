#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.
	
	"oilp": {"life_inv_oilp"}; --- oil processed
	"cannabis": {"life_inv_cannabis"}; --- marijuana unprocessed
	"iron_r": {"life_inv_ironr"}; --- iron processed
	"copper_r": {"life_inv_copperr"}; --- copper processed
	"glass": {"life_inv_glass"}; --- glass processed

*/
private["_craft"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			default
			{
				["Waffen",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["hgun_Pistol_Signal_F", ["life_inv_copperr",1]],
						["hgun_P07_F", ["life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]],
						["hgun_Rook40_F", ["life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]],
						["hgun_ACPC2_F", ["life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]],
						["hgun_Pistol_heavy_01_F", ["life_inv_copperr",5,"life_inv_ironr",5,"life_inv_diamondr",2]],
						["hgun_Pistol_heavy_02_F", ["life_inv_copperr",5,"life_inv_ironr",5,"life_inv_diamondr",2]],
						["hgun_PDW2000_F", ["life_inv_copperr",7,"life_inv_ironr",7,"life_inv_diamondr",3]],
						["SMG_01_F", ["life_inv_copperr",7,"life_inv_ironr",7,"life_inv_diamondr",3]]
					]
				];
			};
		};
	};

	case "uniform":
	{
		switch(true) do
		{
			default
			{
				["Kleidung",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["U_C_Poloshirt_blue", ["life_inv_cannabis",1]],
						["U_C_Poloshirt_burgundy", ["life_inv_cannabis",5]],
						["U_C_Poloshirt_redwhite", ["life_inv_cannabis",5]],
						["U_C_Poloshirt_salmon", ["life_inv_cannabis",5]],
						["U_C_Poloshirt_stripped", ["life_inv_cannabis",5]],
						["U_C_Poloshirt_tricolour", ["life_inv_cannabis",5]],
						["U_C_Poor_2", ["life_inv_cannabis",5]],
						["U_IG_Guerilla2_2", ["life_inv_cannabis",10]],
						["U_IG_Guerilla3_1", ["life_inv_cannabis",10]],
						["U_IG_Guerilla2_3", ["life_inv_cannabis",10]],
						["U_C_HunterBody_grn", ["life_inv_cannabis",10]],
						["U_OrestesBody", ["life_inv_cannabis",15]],
						["U_C_Journalist", ["life_inv_cannabis",18]],
						["U_C_WorkerCoveralls", ["life_inv_cannabis",20]],
						["U_I_HeliPilotCoveralls", ["life_inv_cannabis",20]],
						["U_B_HeliPilotCoveralls", ["life_inv_cannabis",20]]
					]
				];
			};
		};
	};

	case "headgear":
	{
		switch(true) do
		{
			default
			{
				["Kopfbedeckung",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["H_Bandanna_surfer", ["life_inv_cannabis",1]],
						["H_Bandanna_blu", ["life_inv_cannabis",1]],
						["H_Bandanna_sand", ["life_inv_cannabis",1]],
						["H_Bandanna_gry", ["life_inv_cannabis",1]],
						["H_Bandanna_cbr", ["life_inv_cannabis",1]],
						["H_Bandanna_surfer_grn", ["life_inv_cannabis",1]],
						["H_Bandanna_surfer_blk", ["life_inv_cannabis",1]],
						["H_Bandanna_khk", ["life_inv_cannabis",1]],
						["H_Bandanna_sgg", ["life_inv_cannabis",1]],
						["H_StrawHat", ["life_inv_cannabis",1]],
						["H_Booniehat_tan", ["life_inv_cannabis",2]],
						["H_Booniehat_khk", ["life_inv_cannabis",2]],
						["H_Booniehat_oli", ["life_inv_cannabis",2]],
						["H_Hat_blue", ["life_inv_cannabis",2]],
						["H_Hat_checker", ["life_inv_cannabis",2]],
						["H_Hat_grey", ["life_inv_cannabis",2]],
						["H_Hat_tan", ["life_inv_cannabis",2]],
						["H_Cap_blu", ["life_inv_cannabis",2]],
						["H_Cap_grn", ["life_inv_cannabis",2]],
						["H_Cap_grn_BI", ["life_inv_cannabis",2]],
						["H_Cap_blk_CMMG", ["life_inv_cannabis",2]],
						["H_Cap_press", ["life_inv_cannabis",2]],
						["H_Cap_blk", ["life_inv_cannabis",2]],
						["H_Cap_surfer", ["life_inv_cannabis",2]],
						["H_Cap_oli", ["life_inv_cannabis",2]],
						["H_Cap_red", ["life_inv_cannabis",2]],
						["H_Cap_tan", ["life_inv_cannabis",2]],
						["H_Cap_marshal", ["life_inv_cannabis",2,"life_inv_copperr",1]],
						["H_Cap_headphones", ["life_inv_cannabis",2,"life_inv_copperr",1]],
						["H_PilotHelmetHeli_B", ["life_inv_ironr",3,"life_inv_glass",1]],
						["H_PilotHelmetHeli_O", ["life_inv_ironr",3,"life_inv_glass",1]],
						["H_RacingHelmet_1_black_F", ["life_inv_oilp",5]],
						["H_RacingHelmet_1_red_F", ["life_inv_oilp",5]],
						["H_RacingHelmet_1_white_F", ["life_inv_oilp",5]],
						["H_RacingHelmet_1_blue_F", ["life_inv_oilp",5]],
						["H_RacingHelmet_1_yellow_F", ["life_inv_oilp",5]],
						["H_RacingHelmet_1_green_F", ["life_inv_oilp",5]],
						["H_RacingHelmet_1_F", ["life_inv_oilp",4]],
						["H_RacingHelmet_2_F", ["life_inv_oilp",4]],
						["H_RacingHelmet_3_F", ["life_inv_oilp",4]],
						["H_RacingHelmet_4_F", ["life_inv_oilp",4]]
					]
				];
			};
		};
	};
	
	case "goggles":
	{
		switch(true) do
		{
			default
			{
				["Brillen",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["G_Shades_Black", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Shades_Green", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Shades_Red", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Shades_Blue", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Sport_Blackred", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Sport_Checkered", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Sport_Blackyellow", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Sport_BlackWhite", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Spectacles", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Spectacles_Tinted", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Squares", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Aviator", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Lady_Mirror", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Lady_Dark", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Lady_Red", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Lady_Blue", ["life_inv_ironr",1,"life_inv_glass",1]],
						["G_Tactical_Black", ["life_inv_ironr",2,"life_inv_copperr",2]]
					]
				];
			};
		};
	};
	
	case "vest":
	{
		switch(true) do
		{
			default
			{
				["Westen",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["V_Rangemaster_belt", ["life_inv_cannabis",2]],
						["V_Press_F", ["life_inv_cannabis",5]],
						["V_TacVest_khk", ["life_inv_cannabis",10]],
						["V_TacVest_brn", ["life_inv_cannabis",10]],
						["V_TacVest_oli", ["life_inv_cannabis",10]],
						["V_TacVest_blk", ["life_inv_cannabis",10]],
						["V_I_G_resistanceLeader_F", ["life_inv_cannabis",10]]
					]
				];
			};
		};
	};
	
	case "backpack":
	{
		switch(true) do
		{
			default
			{
				["Rucksäcke",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["B_AssaultPack_cbr", ["life_inv_cannabis",8]],
						["B_AssaultPack_rgr", ["life_inv_cannabis",8]],
						["B_AssaultPack_sgg", ["life_inv_cannabis",8]],
						["B_AssaultPack_blk", ["life_inv_cannabis",8]],
						["B_Kitbag_cbr", ["life_inv_cannabis",10]],
						["B_Kitbag_rgr", ["life_inv_cannabis",10]],
						["B_Kitbag_sgg", ["life_inv_cannabis",10]],
						["B_TacticalPack_oli", ["life_inv_cannabis",12]],
						["B_TacticalPack_rgr", ["life_inv_cannabis",12]],
						["B_TacticalPack_blk", ["life_inv_cannabis",12]],
						["B_FieldPack_khk", ["life_inv_cannabis",15]],
						["B_FieldPack_oli", ["life_inv_cannabis",15]],
						["B_FieldPack_blk", ["life_inv_cannabis",15]],
						["B_Carryall_oli", ["life_inv_cannabis",15]],
						["B_Carryall_cbr", ["life_inv_cannabis",15]],
						["B_Carryall_khk", ["life_inv_cannabis",15]],
						["B_Parachute", ["life_inv_cannabis",1]]
					]
				];
			};
		};
	};

	case "item":
	{
		switch(true) do
		{
			default
			{
				["Gegenstände",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["life_inv_pickaxe", ["life_inv_copperr",1,"life_inv_ironr",1]],
						["life_inv_boltcutter", ["life_inv_copperr",4,"life_inv_ironr",4]],
						["life_inv_fuelF", ["life_inv_oilp",2]],
						["life_inv_zipties", ["life_inv_oilp",1]],
						["life_inv_storagesmall", ["life_inv_copperr",6,"life_inv_ironr",6]],
						["life_inv_storagebig", ["life_inv_copperr",10,"life_inv_ironr",10]]
					]
				];
			};
		};
	};
};
