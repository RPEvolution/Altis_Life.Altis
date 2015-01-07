/**
 * DO NOT EDIT BEYOND THIS LINE
 */
#include "constants.hpp"
 

private ["_pulse","_frame","_frame_pos","_frame_x","_frame_y","_frame_w","_frame_h"];
disableSerialization;

if (aniRadarPlaySound) then
{
	playSound "radarPing";
};

_pulse = aniRadar_ctrls select ANIRADAR_PULSE;
_frame = aniRadar_ctrls select ANIRADAR_FRAME;

_frame_pos = ctrlPosition _frame;
_frame_x = _frame_pos select 0;
_frame_y = _frame_pos select 1;
_frame_w = _frame_pos select 2;
_frame_h = _frame_pos select 3;


// Center it with 0% size
_pulse ctrlSetPosition [_frame_x + _frame_w / 2, _frame_y + _frame_h / 2, 0, 0];
_pulse ctrlSetFade 0;
if (!ctrlShown _pulse) then
{
	_pulse ctrlShow true;
};
_pulse ctrlCommit 0;

// Set to whole field
_pulse ctrlSetPosition [_frame_x, _frame_y, _frame_w, _frame_h];
_pulse ctrlCommit aniRadarPulseDuration;

sleep aniRadarPulseDuration;

_pulse ctrlSetFade 1;
_pulse ctrlCommit aniRadarPulseDelay;