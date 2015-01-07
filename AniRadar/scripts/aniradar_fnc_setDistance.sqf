/**
 * Sets the minimum and maximum distance of the radar field in meters
 * @param 	array
 * 		  	[0] minimum distance in meters. Must be 0 or greater
 *		  	[1] maximum distance in meters. Must be greater than minimum.
 *
 * @return	none
 * @example
 * [0, 100] call  aniRadarSetDistance;
 */

aniRadarMaxDistance = _this select 1;
aniRadarMinDistance = _this select 0;

if (aniRadarMaxDistance <= 0) then
{
	aniRadarMaxDistance = 100;
};
if (aniRadarMinDistance < 0 || aniRadarMinDistance > aniRadarMaxDistance) then
{
	aniRadarMinDistance = 0;
};
