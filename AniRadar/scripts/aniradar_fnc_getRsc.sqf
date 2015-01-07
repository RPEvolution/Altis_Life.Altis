/**
 * Returns the handle to the radar HUD
 * Will return displayNull when called before the HUD has been created.
 *
 * @param	none
 * @return	display
 */


private ["_radarRsc"];
_radarRsc = uiNamespace getVariable ["radarRsc", displayNull];
_radarRsc;
