#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			default
			{
				["Altis Cop Shop",
					[
						["hgun_P07_snds_F","Stun Pistol",500],
						["optic_Yorris",nil,50],
						["optic_MRD",nil,50],
						["Rangefinder",nil,100],
						["ItemGPS",nil,100],
						["ToolKit",nil,50],
						["FirstAidKit",nil,10],
						["NVGoggles_OPFOR",nil,400],
						["16Rnd_9x21_Mag",nil,50],
						["30Rnd_9x21_Mag",nil,100],
						["hgun_Pistol_Signal_F",nil,100],
						["6Rnd_GreenSignal_F",nil,30],
						["Chemlight_red",nil,5]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein Arzt"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,20],
						["ToolKit",nil,50],
						["FirstAidKit",nil,10],
						["Medikit",nil,100],
						["NVGoggles",nil,400],
						["hgun_P07_snds_F","Stun Pistol",500],
						["30Rnd_9x21_Mag",nil,100],
						["hgun_Pistol_Signal_F",nil,100],
						["6Rnd_GreenSignal_F",nil,30],
						["optic_Yorris",nil,50],
						["optic_MRD",nil,50],
						["Chemlight_red",nil,5]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 3): {"Falscher Rang!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_sdar_F",nil,1500],
						["arifle_MXC_Black_F",nil,2000],
						["HandGrenade_Stone","Flashbang",100],
						["MineDetector",nil,100],
						["B_UavTerminal",nil,100],
						["acc_flashlight",nil,100],
						["acc_pointer_IR",nil,150],
						["optic_Holosight",nil,500],
						["optic_Arco",nil,600],
						["optic_Hamr",nil,700],
						["muzzle_snds_H",nil,100],
						["30Rnd_65x39_caseless_mag",nil,100],
						["20Rnd_556x45_UW_mag",nil,75]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 5): {"Falscher Rang!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["arifle_MXM_Black_F",nil,3000],
						["HandGrenade_Stone","Flashbang",100],
						["acc_flashlight",nil,100],
						["acc_pointer_IR",nil,150],
						["optic_Holosight",nil,500],
						["optic_Arco",nil,500],
						["optic_Hamr",nil,600],
						["optic_MRCO",nil,700],
						["optic_DMS",nil,1750],
						["optic_LRPS",nil,2000],
						["muzzle_snds_H",nil,100],
						["30Rnd_65x39_caseless_mag",nil,100]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du besitzt keine Rebellenlizenz!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["Rangefinder",nil,100],
						["Binocular",nil,20],
						["ItemMap",nil,1],
						["ItemWatch",nil,100],
						["ItemCompass",nil,25],
						["ItemGPS",nil,100],
						["ToolKit",nil,50],
						["FirstAidKit",nil,10],
						["NVGoggles",nil,400],
						["NVGoggles_INDEP",nil,400],
						["NVGoggles_OPFOR",nil,400],
						["hgun_Rook40_F",nil,500],
						["hgun_ACPC2_F",nil,750],
						["hgun_Pistol_heavy_01_F",nil,850],
						["hgun_Pistol_heavy_02_F",nil,1000],
						["hgun_PDW2000_F",nil,2000],
						["SMG_01_F",nil,2200],
						["arifle_Mk20C_plain_F",nil,2500],
						["arifle_Mk20C_F",nil,2500],
						["arifle_Mk20_plain_F",nil,2500],
						["arifle_Mk20_F",nil,2500],
						["arifle_TRG20_F",nil,2750],
						["arifle_TRG21_F",nil,2750],
						["arifle_Katiba_C_F",nil,3000],
						["arifle_Katiba_F",nil,3000],
						["srifle_DMR_01_F",nil,5000],
						["srifle_EBR_F",nil,5000],
						["arifle_SDAR_F",nil,2400],
						["muzzle_snds_L",nil,100],
						["muzzle_snds_acp",nil,100],
						["muzzle_snds_B",nil,100],
						["acc_flashlight",nil,100],
						["acc_pointer_IR",nil,150],
						["optic_Yorris",nil,150],
						["optic_MRD",nil,150],
						["optic_ACO_grn_smg",nil,150],
						["optic_Aco_smg",nil,150],
						["optic_Holosight_smg",nil,150],
						["optic_ACO_grn",nil,350],
						["optic_Holosight",nil,500],
						["optic_Arco",nil,500],
						["optic_Hamr",nil,600],
						["optic_MRCO",nil,700],
						["optic_DMS",nil,1750],
						["optic_LRPS",nil,2000],
						["9Rnd_45ACP_Mag",nil,50],
						["11Rnd_45ACP_Mag",nil,75],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,100],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["30Rnd_556x45_Stanag",nil,175],
						["30Rnd_65x39_caseless_green",nil,200],
						["10Rnd_762x51_Mag",nil,500],
						["20Rnd_762x51_Mag",nil,1000],
						["20Rnd_556x45_UW_mag",nil,125]
					]
				];
			};
		};
	};

	case "smugler":
	{
				["Ed's Waffensammlung",
					[
						["hgun_Rook40_F",nil,250],
						["hgun_ACPC2_F",nil,375],
						["hgun_Pistol_heavy_01_F",nil,425],
						["hgun_Pistol_heavy_02_F",nil,500],
						["hgun_PDW2000_F",nil,1000],
						["SMG_01_F",nil,1100],
						["arifle_Mk20C_plain_F",nil,1250],
						["arifle_Mk20C_F",nil,1250],
						["arifle_Mk20_plain_F",nil,1250],
						["arifle_Mk20_F",nil,1250],
						["arifle_TRG20_F",nil,1400],
						["arifle_TRG21_F",nil,1400],
						["arifle_Katiba_C_F",nil,1500],
						["arifle_Katiba_F",nil,1500],
						["srifle_DMR_01_F",nil,2500],
						["srifle_EBR_F",nil,2500],
						["arifle_SDAR_F",nil,1200],
						["muzzle_snds_L",nil,50],
						["muzzle_snds_acp",nil,50],
						["muzzle_snds_B",nil,50],
						["acc_flashlight",nil,50],
						["acc_pointer_IR",nil,75],
						["optic_Yorris",nil,75],
						["optic_MRD",nil,75],
						["optic_ACO_grn_smg",nil,75],
						["optic_Aco_smg",nil,75],
						["optic_Holosight_smg",nil,75],
						["optic_ACO_grn",nil,175],
						["optic_Holosight",nil,250],
						["optic_Arco",nil,250],
						["optic_Hamr",nil,300],
						["optic_MRCO",nil,350],
						["optic_DMS",nil,900],
						["optic_LRPS",nil,1000],
						["9Rnd_45ACP_Mag",nil,25],
						["11Rnd_45ACP_Mag",nil,38],
						["6Rnd_45ACP_Cylinder",nil,25],
						["30Rnd_9x21_Mag",nil,50],
						["30Rnd_45ACP_Mag_SMG_01",nil,75],
						["30Rnd_556x45_Stanag",nil,90],
						["30Rnd_65x39_caseless_green",nil,100],
						["10Rnd_762x51_Mag",nil,250],
						["20Rnd_762x51_Mag",nil,500],
						["20Rnd_556x45_UW_mag",nil,65]
					]
				];
	};
	
	case "don":
	{
				["Igor's Waffenstube",
					[
						["Rangefinder",nil,75],
						["Binocular",nil,15],
						["ItemMap",nil,1],
						["ItemWatch",nil,75],
						["ItemCompass",nil,25],
						["ItemGPS",nil,75],
						["ToolKit",nil,35],
						["FirstAidKit",nil,8],
						["NVGoggles",nil,300],
						["NVGoggles_INDEP",nil,300],
						["NVGoggles_OPFOR",nil,300],
						["hgun_Rook40_F",nil,375],
						["hgun_ACPC2_F",nil,500],
						["hgun_Pistol_heavy_01_F",nil,550],
						["hgun_Pistol_heavy_02_F",nil,750],
						["hgun_PDW2000_F",nil,1500],
						["SMG_01_F",nil,1650],
						["arifle_Mk20C_plain_F",nil,1875],
						["arifle_Mk20C_F",nil,1875],
						["arifle_Mk20_plain_F",nil,1875],
						["arifle_Mk20_F",nil,1875],
						["arifle_TRG20_F",nil,2100],
						["arifle_TRG21_F",nil,2100],
						["arifle_Katiba_C_F",nil,2250],
						["arifle_Katiba_F",nil,2250],
						["srifle_DMR_01_F",nil,3750],
						["srifle_EBR_F",nil,3750],
						["arifle_SDAR_F",nil,1600],
						["muzzle_snds_L",nil,75],
						["muzzle_snds_acp",nil,75],
						["muzzle_snds_B",nil,75],
						["acc_flashlight",nil,75],
						["acc_pointer_IR",nil,110],
						["optic_Yorris",nil,100],
						["optic_MRD",nil,100],
						["optic_ACO_grn_smg",nil,100],
						["optic_Aco_smg",nil,100],
						["optic_Holosight_smg",nil,100],
						["optic_ACO_grn",nil,260],
						["optic_Holosight",nil,375],
						["optic_Arco",nil,375],
						["optic_Hamr",nil,450],
						["optic_MRCO",nil,525],
						["optic_DMS",nil,1300],
						["optic_LRPS",nil,1500],
						["9Rnd_45ACP_Mag",nil,42],
						["11Rnd_45ACP_Mag",nil,38],
						["6Rnd_45ACP_Cylinder",nil,42],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_45ACP_Mag_SMG_01",nil,110],
						["30Rnd_556x45_Stanag",nil,130],
						["30Rnd_65x39_caseless_green",nil,150],
						["10Rnd_762x51_Mag",nil,375],
						["20Rnd_762x51_Mag",nil,750],
						["20Rnd_556x45_UW_mag",nil,90]
					]
				];
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gun): {"Du besitzt keinen Waffenschein!"};
			default
			{
				["Billy Joe's Waffenshop",
					[
						["hgun_Pistol_Signal_F",nil,100],
						["hgun_Rook40_F",nil,500],
						["hgun_ACPC2_F",nil,750],
						["hgun_Pistol_heavy_01_F",nil,850],
						["hgun_Pistol_heavy_02_F",nil,1000],
						["hgun_PDW2000_F",nil,2000],
						["optic_ACO_grn_smg",nil,300],
						["optic_Aco_smg",nil,150],
						["optic_Yorris",nil,150],
						["optic_MRD",nil,150],
						["optic_Holosight_smg",nil,150],
						["V_Rangemaster_belt",nil,150],
						["6Rnd_GreenSignal_F",nil,30],
						["16Rnd_9x21_Mag",nil,50],
						["9Rnd_45ACP_Mag",nil,50],
						["11Rnd_45ACP_Mag",nil,75],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,100]
					]
				];
			};
		};
	};
	
	case "garage":
	{
		["Big Earl's Egosteigerer",
			[
				["hgun_P07_snds_F","Stun Pistol",500],
				["30Rnd_9x21_Mag",nil,100],
				["Rangefinder",nil,100],
				["Binocular",nil,20],
				["ItemMap",nil,1],
				["ItemWatch",nil,100],
				["ItemCompass",nil,25],
				["ItemGPS",nil,100],
				["ToolKit",nil,50],
				["FirstAidKit",nil,10],
				["NVGoggles",nil,400],
				["hgun_Pistol_Signal_F",nil,100],
				["6Rnd_GreenSignal_F",nil,30],
				["optic_Yorris",nil,50],
				["optic_MRD",nil,50],
				["Chemlight_red",nil,5],
				["Chemlight_yellow",nil,5],
				["Chemlight_green",nil,5],
				["Chemlight_blue",nil,5]
			]
		];
	};
	
	case "sec":
	{
		["Happy Triggers Spielzeugladen",
			[
				["Rangefinder",nil,100],
				["Binocular",nil,20],
				["ItemMap",nil,1],
				["ItemWatch",nil,100],
				["ItemCompass",nil,25],
				["ItemGPS",nil,100],
				["ToolKit",nil,50],
				["FirstAidKit",nil,10],
				["NVGoggles",nil,400],
				["hgun_Pistol_Signal_F",nil,100],
				["hgun_Pistol_heavy_01_F",nil,850],
				["arifle_MXC_Holo_pointer_snds_F",nil,2750],
				["6Rnd_GreenSignal_F",nil,30],
				["11Rnd_45ACP_Mag",nil,75],
				["30Rnd_65x39_caseless_mag",nil,100],
				["optic_Yorris",nil,150],
				["optic_MRD",nil,150],
				["muzzle_snds_acp",nil,100],
				["Chemlight_red",nil,5],
				["Chemlight_yellow",nil,5],
				["Chemlight_green",nil,5],
				["Chemlight_blue",nil,5]
			]
		];
	};
	
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			default
			{
				["Waffenkiste",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_ACPC2_F",nil,750],
						["hgun_Pistol_heavy_01_F",nil,850],
						["hgun_Pistol_heavy_02_F",nil,1000],
						["hgun_PDW2000_F",nil,2000],
						["SMG_01_F",nil,2200],
						["optic_ACO_grn_smg",nil,150],
						["optic_Aco_smg",nil,150],
						["optic_Holosight_smg",nil,150],
						["optic_Yorris",nil,150],
						["optic_MRD",nil,150],
						["V_Rangemaster_belt",nil,150],
						["16Rnd_9x21_Mag",nil,50],
						["9Rnd_45ACP_Mag",nil,50],
						["11Rnd_45ACP_Mag",nil,75],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,100],
						["30Rnd_45ACP_Mag_SMG_01",nil,150]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Rangefinder",nil,100],
				["Binocular",nil,20],
				["ItemMap",nil,1],
				["ItemWatch",nil,100],
				["ItemCompass",nil,25],
				["ItemGPS",nil,100],
				["ToolKit",nil,50],
				["FirstAidKit",nil,10],
				["NVGoggles",nil,400],
				["NVGoggles_INDEP",nil,400],
				["NVGoggles_OPFOR",nil,400],
				["hgun_Pistol_Signal_F",nil,100],
				["6Rnd_GreenSignal_F",nil,30],
				["Chemlight_red",nil,5],
				["Chemlight_yellow",nil,5],
				["Chemlight_green",nil,5],
				["Chemlight_blue",nil,5]
			]
		];
	};
};
