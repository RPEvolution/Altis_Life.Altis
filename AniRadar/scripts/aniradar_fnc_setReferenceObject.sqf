/**
 * Sets the object which serves as the center of the radar instead of the
 * default (which is the player obviously), calculating the distances
 * of all detected objects with the set object as the epicenter.
 *
 * This command could be useful to set mobile radar stations or other
 * scenarios which require mobile radar tracking.
 *
 * If the referenced object is not alive (buildings can "die" as well!) anymore,
 * the player will be taken as the reference object until a new one is assigned.
 * If this behaviour is not satisfactory for your needs, you can consider using
 * the optional parameter to set whether the radar should be deactivated once
 * the referenced object isn't alive anymore.
 *
 * When the referenced object isn't alive and you set the radar to deactivate, 
 * the behaviour will be set back to false afterwards - you have to set it again
 * with a new object if you wish to prolong the effect.
 *
 * @param	object	Any object/unit
 *
 * or alternatively:
 * 
 * @param	array
 *			[0]	object		Any object/unit. 
 *			[1]	boolean		Set whether the radar shall be stopped after the referenced object isn't alive
 *
 * @return	none
 * @example
 *
 * myRadarStation = "TK_WarfareBAntiAirRadar_EP1" createVehicle (getMarkerPos radarPosition);
 * myRadarStation call  aniRadarSetReferenceObject;
 * // or alternatively:
 * [myRadarStation, false] call aniRadarSetReferenceObject;
 *
 */


private ["_obj"];
_obj = objNull;
if (typeName _this == typeName []) then
{
	aniRadarStopOnDeath = _this select 1;
	_obj = _this select 0;
}
else
{
	_obj = _this;
};

if (!isNull _obj && alive _obj) then
{
	aniRadarSourceObject = _obj;
};