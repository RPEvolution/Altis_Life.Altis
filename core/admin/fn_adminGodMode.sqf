/**
* godMode(BOOLEAN ebale)
*

private ["_enable"];
_enable = _this select 0;
*/

//Hint + Infos
if( _enable ) then
{
/*[[0,format["ADMIN: %1 hat God-Mode angeschaltet.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;*/
hint "Wegen Spy Glass deaktiviert";
}
else
{
/*[[0,format["ADMIN: %1 hat God-Mode ausgeschaltet.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;*/
hint "Wegen Spy Glass deaktiviert";
};

