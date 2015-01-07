/**
 * Sets the delay between every pulse.
 * Once again, bigger values than 2 seconds are discouraged. 
 * See the above commands comment for more information.
 *
 * Accepts only positive values.
 *
 * @param	integer 	The amount of time in milliseconds to wait until a next pulse is sent.
 * @return	none
 * @example	
 * 400 call aniRadarSetPulseDelay; 
 */


private ["_ms"];
_ms = _this;

if (_ms >= 0) then
{
	aniRadarPulseDelay = _ms / 1000;
}
else
{
	aniRadarPulseDelay = 0.4;
};
