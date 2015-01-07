/**
 * Sets whether a ping sound should be played whenever a new pulse starts.
 * The soundfile can be changed in gui/sounds.hpp
 *
 * @param	boolean		Set to false to deactivate, true for the opposite.
 * @return	none
 * @example
 * false call aniRadarPlayPing
 */

if (typeName _this == typeName false) then
{
	aniRadarPlaySound = _this;
};
