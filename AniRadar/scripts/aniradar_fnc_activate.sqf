/**
 * Activates and deactivates the radar pulses
 * If the radar is not shown, this command will block until
 * the radar is visible.
 *
 * @param	boolean		True to activate, false to deactivate
 * @return	none
 */
#include "constants.hpp"
 
if (typeName _this == typeName false) then
{
	if (!_this) then
	{
		ANIRADAR_LOG("DEACTIVATING")

		aniRadarAnimPlayed = false;
		call aniRadarReset;
	}
	else
	{
		if (aniRadarShown && !aniRadarAnimPlayed) then
		{
			ANIRADAR_LOG("ACTIVATING")
			
			terminate aniRadarLoopHandle;
			
			aniRadarAnimPlayed = true;
			aniRadarLoopHandle = 0 spawn aniRadarLoop;
		};
	};
};
