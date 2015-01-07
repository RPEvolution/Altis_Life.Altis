/**
 * Moves the radar to the specified dock position.
 * Possible locations are: 
 * 		aniRadar_NORTH,
 *		aniRadar_NORTH_EAST,
 *		aniRadar_EAST,
 *		aniRadar_SOUTH_EAST,
 *		aniRadar_SOUTH,
 *		aniRadar_SOUTH_WEST,
 *		aniRadar_WEST,
 *		aniRadar_NORTH_WEST,
 *		aniRadar_CENTER,
 *
 *	When called with the optional state parameter, the radar also gets
 *	resized while being moved.
 *  Possible states are:
 *		aniRadar_MINIMIZE, (resizes the radar to 20%)
 *		aniRadar_MAXIMIZE  (restores original size before minimizing)
 *
 *	If aniRadarResize is used after this command is called with aniRadar_MINIMIZE,
 *  the former size won't get overriden, which means after calling this command with
 *	aniRadar_MAXIMIZE, the size will be restored to the one which got saved after minimizing.
 *
 * @param 	aniRadar_LOCATION	one of the above dock positions
 * @param	aniRadar_STATE		(optional) one of the above states
 * @return	none
 * @example
 *	
 * aniRadar_CENTER call aniRadarSetLocation;	// Center the radar without resizing
 * [aniRadar_SOUTH_WEST, aniRadar_MINIMIZE] call aniRadarSetLocation;	// minimizing the radar to the bottom left corner
 * [aniRadar_SOUTH_WEST, aniRadar_MAXIMIZE] call aniRadarSetLocation;	// restores the size, doesn't move.
 */
#include "constants.hpp"


private ["_state","_location","_validStates","_scaling","_width","_height","_safeX","_safeY","_safeW","_safeH","_factors","_newX","_newY","_validLocations"];
disableSerialization;

_state = aniRadar_IMMEDIATE;
_location = 0;
if (typeName _this == typeName []) then
{
	_location = _this select 0;
	_state = _this select 1;
	
	// check if the given state is valid
	_validStates = [aniRadar_IMMEDIATE, aniRadar_MINIMIZE, aniRadar_MAXIMIZE];
	if (!(_state in _validStates)) then
	{
		_state = aniRadar_IMMEDIATE;
	};
}
else
{
	_location = _this;
};

// Check if the given location is valid
_validLocations = [
	aniRadar_NORTH, 		aniRadar_NORTH_EAST, 	aniRadar_EAST, 
	aniRadar_SOUTH_EAST, 	aniRadar_SOUTH, 		aniRadar_SOUTH_WEST,
	aniRadar_WEST, 			aniRadar_NORTH_WEST, 	aniRadar_CENTER
];

if (_location in _validLocations) then
{
	// seems to be legit, calculate the coordinates ...
	
	_scaling = aniRadar_currentSize;
	if (_state == aniRadar_MINIMIZE) then
	{
		_scaling = ANIRADAR_MIN_FACTOR;
		if (aniRadar_currentSize != ANIRADAR_MIN_FACTOR) then
		{
			aniRadar_lastSize = aniRadar_currentSize;
		};
	}
	else
	{
		if (_state == aniRadar_MAXIMIZE) then
		{
			_scaling = aniRadar_lastSize;
		};
	};

	_width = ANIRADAR_W * _scaling;
	_height = ANIRADAR_H * _scaling;

	_safeX = safezoneX;
	_safeY = safezoneY;
	_safeW = safezoneW;
	_safeH = safezoneH;
	
	_factors = aniRadar_dock_factors select _location;
	_newX = _safeX + ((_safeW * (_factors select 0)) - (_width * (_factors select 0)));
	_newY = _safeY + ((_safeH * (_factors select 1)) - (_height * (_factors select 1)));
	
	aniRadar_stateResize = [_newX, _newY];
	_scaling call aniRadarResize;
	
};