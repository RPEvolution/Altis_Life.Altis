	class AniRadar
	{
		idd = ANIRADAR_IDD;
		movingEnable = 0;
		duration = 86400;
		onLoad 	= "uiNamespace setVariable [""radarRsc"", _this select 0];";
		
		class controlsBackground {
			class radarFrame: RadarComponents
			{
				idc = ANIRADAR_CTRL_FRAME;
				text = ANIRADAR_FRAME_IMG;
			};
			class radarField: RadarComponents
			{
				idc = ANIRADAR_CTRL_FIELD;
				text = ANIRADAR_FIELD_IMG;
			};
		};
		
		class controls {
			class radarPulse: RadarComponents
			{
				idc = ANIRADAR_CTRL_PULSE;
				text = ANIRADAR_PULSE_IMG;
			};
			
			class entity0:RadarIcon {idc = (ANIRADAR_ENTITY + 0);};
			class entity1:RadarIcon {idc = (ANIRADAR_ENTITY + 1);};
			class entity2:RadarIcon {idc = (ANIRADAR_ENTITY + 2);};
			class entity3:RadarIcon {idc = (ANIRADAR_ENTITY + 3);};
			class entity4:RadarIcon {idc = (ANIRADAR_ENTITY + 4);};
			class entity5:RadarIcon {idc = (ANIRADAR_ENTITY + 5);};
			class entity6:RadarIcon {idc = (ANIRADAR_ENTITY + 6);};
			class entity7:RadarIcon {idc = (ANIRADAR_ENTITY + 7);};
			class entity8:RadarIcon {idc = (ANIRADAR_ENTITY + 8);};
			class entity9:RadarIcon {idc = (ANIRADAR_ENTITY + 9);};
			class entity10:RadarIcon {idc = (ANIRADAR_ENTITY + 10);};
			class entity11:RadarIcon {idc = (ANIRADAR_ENTITY + 11);};
			class entity12:RadarIcon {idc = (ANIRADAR_ENTITY + 12);};
			class entity13:RadarIcon {idc = (ANIRADAR_ENTITY + 13);};
			class entity14:RadarIcon {idc = (ANIRADAR_ENTITY + 14);};
			class entity15:RadarIcon {idc = (ANIRADAR_ENTITY + 15);};
			class entity16:RadarIcon {idc = (ANIRADAR_ENTITY + 16);};
			class entity17:RadarIcon {idc = (ANIRADAR_ENTITY + 17);};
			class entity18:RadarIcon {idc = (ANIRADAR_ENTITY + 18);};
			class entity19:RadarIcon {idc = (ANIRADAR_ENTITY + 19);};
			class entity20:RadarIcon {idc = (ANIRADAR_ENTITY + 20);};
			class entity21:RadarIcon {idc = (ANIRADAR_ENTITY + 21);};
			class entity22:RadarIcon {idc = (ANIRADAR_ENTITY + 22);};
			class entity23:RadarIcon {idc = (ANIRADAR_ENTITY + 23);};
			class entity24:RadarIcon {idc = (ANIRADAR_ENTITY + 24);};
			class entity25:RadarIcon {idc = (ANIRADAR_ENTITY + 25);};
			class entity26:RadarIcon {idc = (ANIRADAR_ENTITY + 26);};
			class entity27:RadarIcon {idc = (ANIRADAR_ENTITY + 27);};
			class entity28:RadarIcon {idc = (ANIRADAR_ENTITY + 28);};
			class entity29:RadarIcon {idc = (ANIRADAR_ENTITY + 29);};
			class entity30:RadarIcon {idc = (ANIRADAR_ENTITY + 30);};
			class entity31:RadarIcon {idc = (ANIRADAR_ENTITY + 31);};
			class entity32:RadarIcon {idc = (ANIRADAR_ENTITY + 32);};
			class entity33:RadarIcon {idc = (ANIRADAR_ENTITY + 33);};
			class entity34:RadarIcon {idc = (ANIRADAR_ENTITY + 34);};
			class entity35:RadarIcon {idc = (ANIRADAR_ENTITY + 35);};
			class entity36:RadarIcon {idc = (ANIRADAR_ENTITY + 36);};
			class entity37:RadarIcon {idc = (ANIRADAR_ENTITY + 37);};
			class entity38:RadarIcon {idc = (ANIRADAR_ENTITY + 38);};
			class entity39:RadarIcon {idc = (ANIRADAR_ENTITY + 39);};
			class entity40:RadarIcon {idc = (ANIRADAR_ENTITY + 40);};
			class entity41:RadarIcon {idc = (ANIRADAR_ENTITY + 41);};
			class entity42:RadarIcon {idc = (ANIRADAR_ENTITY + 42);};
			class entity43:RadarIcon {idc = (ANIRADAR_ENTITY + 43);};
			class entity44:RadarIcon {idc = (ANIRADAR_ENTITY + 44);};
			class entity45:RadarIcon {idc = (ANIRADAR_ENTITY + 45);};
			class entity46:RadarIcon {idc = (ANIRADAR_ENTITY + 46);};
			class entity47:RadarIcon {idc = (ANIRADAR_ENTITY + 47);};
			class entity48:RadarIcon {idc = (ANIRADAR_ENTITY + 48);};
			class entity49:RadarIcon {idc = (ANIRADAR_ENTITY + 49);};
			class entity50:RadarIcon {idc = (ANIRADAR_ENTITY + 50);};
			class entity51:RadarIcon {idc = (ANIRADAR_ENTITY + 51);};
			class entity52:RadarIcon {idc = (ANIRADAR_ENTITY + 52);};
			class entity53:RadarIcon {idc = (ANIRADAR_ENTITY + 53);};
			class entity54:RadarIcon {idc = (ANIRADAR_ENTITY + 54);};
			class entity55:RadarIcon {idc = (ANIRADAR_ENTITY + 55);};
			class entity56:RadarIcon {idc = (ANIRADAR_ENTITY + 56);};
			class entity57:RadarIcon {idc = (ANIRADAR_ENTITY + 57);};
			class entity58:RadarIcon {idc = (ANIRADAR_ENTITY + 58);};
			class entity59:RadarIcon {idc = (ANIRADAR_ENTITY + 59);};
			class entity60:RadarIcon {idc = (ANIRADAR_ENTITY + 60);};
			class entity61:RadarIcon {idc = (ANIRADAR_ENTITY + 61);};
			class entity62:RadarIcon {idc = (ANIRADAR_ENTITY + 62);};
			class entity63:RadarIcon {idc = (ANIRADAR_ENTITY + 63);};
			class entity64:RadarIcon {idc = (ANIRADAR_ENTITY + 64);};
			class entity65:RadarIcon {idc = (ANIRADAR_ENTITY + 65);};
			class entity66:RadarIcon {idc = (ANIRADAR_ENTITY + 66);};
			class entity67:RadarIcon {idc = (ANIRADAR_ENTITY + 67);};
			class entity68:RadarIcon {idc = (ANIRADAR_ENTITY + 68);};
			class entity69:RadarIcon {idc = (ANIRADAR_ENTITY + 69);};
			class entity70:RadarIcon {idc = (ANIRADAR_ENTITY + 70);};
			class entity71:RadarIcon {idc = (ANIRADAR_ENTITY + 71);};
			class entity72:RadarIcon {idc = (ANIRADAR_ENTITY + 72);};
			class entity73:RadarIcon {idc = (ANIRADAR_ENTITY + 73);};
			class entity74:RadarIcon {idc = (ANIRADAR_ENTITY + 74);};
			class entity75:RadarIcon {idc = (ANIRADAR_ENTITY + 75);};
			class entity76:RadarIcon {idc = (ANIRADAR_ENTITY + 76);};
			class entity77:RadarIcon {idc = (ANIRADAR_ENTITY + 77);};
			class entity78:RadarIcon {idc = (ANIRADAR_ENTITY + 78);};
			class entity79:RadarIcon {idc = (ANIRADAR_ENTITY + 79);};

			
			class radarOverlay: RadarComponents
			{
				idc = ANIRADAR_CTRL_OVERLAY;
				text = ANIRADAR_OVERLAY_IMG;
			};
		};
	};