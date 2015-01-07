/**
 * Shows are hides the radar
 *
 * @param 	boolean		true to show, false to hide
 * @return	none
 */

#include "constants.hpp"

private ["_fade","_show"];
disableSerialization;

_show = _this;

if (typeName _show == typeName false) then
{
	ANIRADAR_LOG("In AniRadar_fnc_Show")
	
	_fade = 1;
	if (_show) then
	{
		_fade = 0;
	}
	else
	{
		false call aniRadarActivate;
	};
	aniRadarShown = _show;
	
	ANIRADAR_LOG(format["Fade: %1", _fade])

	{
		_x ctrlSetFade _fade;
		_x ctrlCommit 0.2;
	} forEach aniRadar_ctrls;
	
	ANIRADAR_LOG("Leaving AniRadar_fnc_Show")
};