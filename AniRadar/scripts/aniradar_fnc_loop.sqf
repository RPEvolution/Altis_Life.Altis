/**
 * DO NOT EDIT BEYOND THIS LINE!
 */
#include "constants.hpp"
 

private ["_pos","_img","_imgScale","_percentualDistance","_entry","_entriesNum","_distance","_lastEntity","_icon_w","_icon_h","_icon_x","_icon_y","_lastEntityUsed","_frame","_mid_x","_mid_y","_diameterX","_diameterY","_return","_entities","_type_array","_type_string","_type_int","_showDot","_spawn","_epicenter","_selfReference"];
disableSerialization;

_entities = [];
_return = [];
_type_array = typeName [];
_type_string= typeName "";
_type_int   = typeName 1;
_lastEntityUsed = 0;
_epicenter = aniRadarSourceObject;
_selfReference = false;

_showDot = {
	
    private ["_dotCtrl","_sleepTime"];
    disableSerialization;
	
	_dotCtrl = _this select 0;
	_sleepTime = _this select 1;

	sleep ((_sleepTime/100) * aniRadarPulseDuration);

	_dotCtrl ctrlCommit 0;
	_dotCtrl ctrlSetFade 1;
	_dotCtrl ctrlCommit (aniRadarPulseDuration);
};

while {aniRadarAnimPlayed} do
{
	_epicenter = aniRadarSourceObject;
	
	if (isNull aniRadarSourceObject) then
	{
		_epicenter = vehicle player;
	};
	
	if (!alive _epicenter) then
	{
		if (aniRadarStopOnDeath) exitWith
		{
			aniRadarStopOnDeath = false;
			false call aniRadarActivate;
		};
		
		_epicenter = vehicle player;
		aniRadarSourceObject = _epicenter;
	};
	
	// Call the callback to get the needed data
	_return = [getPosATL _epicenter, aniRadarMaxDistance] call aniRadarCallback;
	_entities = [];
	_entriesNum = 0;
	
	if (typeName _return == typeName []) then
	{
		if (count _return > 0) then
		{
			_percentualDistance = 0;
			_distance = 0;
			_pos = [];
			_img = "";
			_imgScale = 1;
			_entry = [];
			
			{
				_selfReference = false;
				_img = ANIRADAR_DOT;
				_imgScale = 1;
				
				if (typeName _x != _type_array) then
				{
					// We have a single object here
					_pos = getPosATL _x;
				}
				else
				{
					// We seem to have an array here, get the specific type!
					if (typeName (_x select 1) == _type_int) then
					{
						// We got a single position-array.
						_pos = _x;
					}
					else
					{
						// we have a custom picture here!
						if (typeName (_x select 0) == _type_array) then
						{
							_pos = _x select 0;
						}
						else
						{
							// Did we reference ourselfs here?
							if ( (_x select 0) == _epicenter) then
							{
								_selfReference = true;
							}
							else
							{
								_pos = getPosATL (_x select 0);
							};
						};
					
						if (!_selfReference) then
						{
							if (typeName (_x select 1) == _type_string) then
							{
								_img = (_x select 1);
							}
							else
							{
								_img = (_x select 1) select 0;
								if (count (_x select 1) > 1) then
								{
									_imgScale = (_x select 1) select 1;
									if (_imgScale < 0.5) then
									{
										_imgScale = 0.5;
									};
								};
							};		
						};
					};
				};
				
				if (!_selfReference) then
				{
					_distance = _epicenter distance _pos;
					if (_distance < aniRadarMaxDistance) then
					{
						if (_distance >= aniRadarMinDistance) then
						{
							if (_entriesNum < ANIRADAR_NUM_ENTITIES) then
							{
								_percentualDistance = (_distance*100) / aniRadarMaxDistance;
								_entry = [_percentualDistance, 360-([_epicenter, _pos] call BIS_fnc_relativeDirTo), _img, _imgScale];
								
								_entities set [_entriesNum, _entry];
								
								_entriesNum = _entriesNum + 1;
							};
						};
					};
				};
				
			} forEach _return;
			
		};
	};

	if (_entriesNum > 0) then
	{
		_lastEntity = objNull;
		_spawn = 0;
		_icon_w = 0;
		_icon_h = 0;
		_icon_x = 0;
		_icon_y = 0;
		_frame = ctrlPosition (aniRadar_ctrls select ANIRADAR_FRAME);
		_mid_x = ((_frame select 0) + ((_frame select 2) / 2));
		_mid_y = ((_frame select 1) + ((_frame select 3) / 2));
		_diameterX = ((_frame select 2) * ANIRADAR_RADIUS) / 2;
		_diameterY = ((_frame select 3) * ANIRADAR_RADIUS) / 2;
		_lastEntityUsed = 0;
		aniRadar_iconHandles = [];
		
		{
			// Get the next "free" entity node in the field
			_lastEntity = aniRadar_entities select _lastEntityUsed;
			_lastEntity ctrlSetFade 1;
			_lastEntity ctrlCommit 0;
			
			_icon_w = (ANIRADAR_ICON_W*aniRadar_currentSize) * (_x select 3);
			_icon_h = (ANIRADAR_ICON_H*aniRadar_currentSize) * (_x select 3);
			_icon_x = (_mid_x - (((_x select 0)/100) * _diameterX) * sin(_x select 1)) - (_icon_w/2);
			_icon_y = (_mid_y - (((_x select 0)/100) * _diameterY) * cos(_x select 1)) - (_icon_h/2);
			
			_lastEntity ctrlSetText (_x select 2);
			_lastEntity ctrlSetFade 0;
			_lastEntity ctrlSetPosition [_icon_x, _icon_y, _icon_w, _icon_h];

			_spawn = [_lastEntity, _x select 0] spawn _showDot;
			aniRadar_iconHandles set [_lastEntityUsed, _spawn];
			
			_lastEntityUsed = _lastEntityUsed + 1;
	
		} forEach _entities;

	};
	
	aniRadarPulseHandle = [] spawn aniRadarPulse;
	
	sleep (aniRadarPulseDelay + aniRadarPulseDuration);
};