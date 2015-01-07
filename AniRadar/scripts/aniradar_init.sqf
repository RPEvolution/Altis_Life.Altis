/**
 * AniRadar v0.9.2
 * Images and Scripts made by XxAnimusxX
 *
 * Last modified: 09.04.2013, 00:48
 *
 * License: 
 * This scripts are free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version. This scripts are distributed in the hope that it
 * will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
 * Public License for more details.
 */

/*
 * DO NOT CHANGE ANY OF THE VALUES BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU
 * ARE DOING. CHANGING VALUES CAN NEGATIVELY AFFECT OVERALL BEHAVIOUR.
 */

#include "constants.hpp"

private ["_varName","_ctrl","_capitalize","_aniRadarModules","_template","_rsc"];
disableSerialization;
 
if (isNil "aniRadarInitialized") then
{
	ANIRADAR_LOG("Initializing AniRadar...")
	
	_capitalize = {
		
		private ["_subArray","_topArray","_return"];
		_return = _this;
		if (typeName _this == typeName "") then 
		{
			_subArray = toArray _this;
			_topArray = [_subArray select 0];
			_subArray set [0, -1];
			_subArray = _subArray - [-1];
			_return = format["%1%2", toUpper(toString(_topArray)), toString _subArray];
		};
		_return;
	};
	
	// Variables used in commands
	aniRadarPlaySound		= true;
	aniRadarAnimPlayed		= false;
	aniRadarShown			= false;
	aniRadarStopOnDeath		= true;
	aniRadarMaxDistance 	= 1000;
	aniRadarMinDistance 	= 0;
	aniRadarPulseDuration 	= 2.0;
	aniRadarPulseDelay		= 0.4;
	aniRadarLoopHandle		= 0 spawn {};	
	aniRadarPulseHandle 	= 0 spawn {};
	aniRadarResizeHandle	= 0 spawn {};
	aniRadarSourceObject	= objNull;

	aniRadarCallback		= {};
	aniRadar_ctrls			= [];
	aniRadar_entities		= [];
	aniRadar_iconHandles	= [];

	// cardinal directions
	aniRadar_NORTH			= ANIRADAR_NORTH;
	aniRadar_NORTH_EAST		= ANIRADAR_NORTH_EAST;
	aniRadar_EAST			= ANIRADAR_EAST;
	aniRadar_SOUTH_EAST		= ANIRADAR_SOUTH_EAST;
	aniRadar_SOUTH			= ANIRADAR_SOUTH;
	aniRadar_SOUTH_WEST		= ANIRADAR_SOUTH_WEST;
	aniRadar_WEST			= ANIRADAR_WEST;
	aniRadar_NORTH_WEST		= ANIRADAR_NORTH_WEST;
	aniRadar_CENTER			= ANIRADAR_CENTER;
	aniRadar_IMMEDIATE		= ANIRADAR_IMMEDIATE;
	aniRadar_MINIMIZE		= ANIRADAR_MINIMIZE;
	aniRadar_MAXIMIZE		= ANIRADAR_MAXIMIZE;
	// -------------------------------------------
	aniRadar_lastPosition	= ANIRADAR_NORTH;
	aniRadar_currentSize	= 1.0;
	aniRadar_lastSize		= 1.0;
	aniRadar_stateResize	= [];

	// dock position factors
	aniRadar_dock_factors	= [
		[0.5, 0], [1, 0], [1, 0.5],
		[1, 1], [0.5, 1], [0, 1],
		[0, 0.5], [0, 0], [0.5, 0.5]
	];

	// Load the function modules
	_aniRadarModules = [
		"activate",
		"playPing",
		"setCallback",
		"setPulseDelay",
		"setPulseDuration",
		"show",
		"setDistance",
		"resize",
		"setLocation",
		"setReferenceObject",
		// DO NOT CALL THESE COMMANDS BELOW, THEY'RE EXCLUSIVELY USED BY ABOVE SCRIPTS
		"reset",
		"getRsc",
		"pulse",
		"loop"
	];
	
	_template = "aniRadar%1 = compile preprocessFileLineNumbers ""AniRadar\scripts\aniradar_fnc_%2.sqf"";";
	_varName = "";
	{
		_varName = _x call _capitalize;
		call compile format[_template, _varName, _x];
	} forEach _aniRadarModules;


	// Create the HUD, but hide it for later use	
	ANIRADAR_LOG("Creating AniRadar-HUD")
		
	ANIRADAR_LAYER cutRsc ["AniRadar", "PLAIN"];
	waituntil {!(isNull (call aniRadarGetRsc))};
	
	aniRadarHUDCreated = true;
	
	_rsc = call aniRadarGetRsc;
	aniRadar_ctrls set [ANIRADAR_FRAME, _rsc displayCtrl ANIRADAR_CTRL_FRAME];
	aniRadar_ctrls set [ANIRADAR_FIELD, _rsc displayCtrl ANIRADAR_CTRL_FIELD];
	aniRadar_ctrls set [ANIRADAR_PULSE, _rsc displayCtrl ANIRADAR_CTRL_PULSE];
	aniRadar_ctrls set [ANIRADAR_OVERLAY, _rsc displayCtrl ANIRADAR_CTRL_OVERLAY];
	
	for "_i" from 1 to 4 do
	{
		(aniRadar_ctrls select _i) ctrlSetFade 1;
		(aniRadar_ctrls select _i) ctrlCommit 0;
	};
	
	_ctrl = objNull;

	for "_i" from 0 to (ANIRADAR_MAX_ENTITIES-1) do
	{
		if (_i >= ANIRADAR_NUM_ENTITIES) exitWith {};
		
		_ctrl = _rsc displayCtrl (ANIRADAR_ENTITY+_i);
		aniRadar_entities set [_i, _ctrl];
	};
	
	ANIRADAR_LOG("HUD created")
	
	aniRadarInitialized = true;
	
	ANIRADAR_LOG("AniRadar successfully initialized")
};