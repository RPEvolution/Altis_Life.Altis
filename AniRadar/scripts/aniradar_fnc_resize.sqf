/**
 * Resizes the radar by the given factor
 * Supported parameter values are between (inclusive) 0.1 - 2.0
 *
 * @param	decimal		factor for resize
 * @return	none
 * @example
 *
 * 0.5 call aniRadarResize; // halfs the size
 */

#include "constants.hpp"
private ["_factor","_prevPos","_newW","_newH","_newIconW","_newIconH"];
disableSerialization;

_factor = _this;
if (_factor < 0.1) then
{
	_factor = 0.1;
};
if (_factor > 2.0) then
{
	_factor = 2.0;
};
aniRadar_currentSize = _factor;

if (aniRadarShown) then
{
	false call aniRadarActivate;
};

_prevPos = [];
if (count aniRadar_stateResize > 0) then
{
	_prevPos = aniRadar_stateResize;
	aniRadar_stateResize = [];
}
else
{
	_prevPos = ctrlPosition (aniRadar_ctrls select ANIRADAR_FRAME);
};

_newW = ANIRADAR_W * _factor;
_newH = ANIRADAR_H * _factor;
_newIconW = ANIRADAR_ICON_W * _factor;
_newIconH = ANIRADAR_ICON_H * _factor;

// Do we need to alter the position?
if (((_prevPos select 0) + _newW) > (safeZoneW)) then
{
	_prevPos set [0, (safeZoneW - _newW)];
};

{
	if (!(isNull _x)) then
	{
		_x ctrlSetPosition [_prevPos select 0, _prevPos select 1, _newW, _newH];
		_x ctrlCommit 0.5;
	};
} forEach aniRadar_ctrls;

{
	_x ctrlSetPosition [0, 0, _newIconW, _newIconH];
	_x ctrlCommit 0.5;
} forEach aniRadar_entities;

if (aniRadarShown) then
{
    if (scriptDone aniRadarResizeHandle) then
    {
		aniRadarResizeHandle = [] spawn {
			sleep 0.5;
			true call aniRadarActivate;
		};
	};
};