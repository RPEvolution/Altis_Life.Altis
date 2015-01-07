/**
 * Sets the amount of time the radar pulse takes to wholly cover the radar field.
 * Using bigger values than 5 seconds is discouraged - moving entities could be far off 
 * of the radar when used with a short maxDistance.
 * Accepts only non zero, positive values greater equal to 500 (1/2 seconds).
 *
 * @param	integer 	The amount of time in milliseconds (1000 milliseconds = 1 second)
 * @return	none
 *
 * @example	
 * 2400 call aniRadarSetPulseDuration;
 */


private ["_ms"];
_ms = _this;

if (_ms >= 500) then
{
	aniRadarPulseDuration = _ms / 1000;
}
else
{
	aniRadarPulseDuration = 0.5;
};
