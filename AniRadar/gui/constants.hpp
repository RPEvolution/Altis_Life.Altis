// Control types
#define CT_STATIC           	0
#define CT_STATIC_SKEW      	10

#define ST_TYPE           		0xF0
#define ST_PICTURE        		48

// AniRadar Defines
#define ANIRADAR_IDD	  		12000
#define ANIRADAR_LAYER			678
#define	ANIRADAR_PULSE	  		3
#define	ANIRADAR_FIELD	  		2
#define	ANIRADAR_OVERLAY  		4
#define ANIRADAR_FRAME	  		1
#define ANIRADAR_CTRL_FRAME		(ANIRADAR_IDD+ANIRADAR_FRAME)
#define ANIRADAR_CTRL_FIELD		(ANIRADAR_IDD+ANIRADAR_FIELD)
#define ANIRADAR_CTRL_PULSE		(ANIRADAR_IDD+ANIRADAR_PULSE)
#define ANIRADAR_CTRL_OVERLAY	(ANIRADAR_IDD+ANIRADAR_OVERLAY)
#define ANIRADAR_ENTITY	  		12100

#define ANIRADAR_NUM_ENTITIES	50
#define ANIRADAR_MAX_ENTITIES	80

#define ANIRADAR_DOT_SCALE		(16/512)
#define ANIRADAR_SCALE			1.0

#define ANIRADAR_W		  		(0.266667 * safezoneW) * ANIRADAR_SCALE		// 512/1920
#define ANIRADAR_H		  		(0.474074 * safezoneH) * ANIRADAR_SCALE		// 512/1080
#define ANIRADAR_X		  		safezoneX
#define ANIRADAR_Y		  		safezoneY

#define ANIRADAR_RADIUS			0.9375	// 

#define ANIRADAR_ICON_W			(ANIRADAR_W * ANIRADAR_DOT_SCALE)
#define ANIRADAR_ICON_H			(ANIRADAR_H * ANIRADAR_DOT_SCALE)
#define ANIRADAR_ICON_X			(ANIRADAR_X+(ANIRADAR_W/2))-(ANIRADAR_ICON_W/2)	
#define ANIRADAR_ICON_Y			(ANIRADAR_Y+(ANIRADAR_H/2))-(ANIRADAR_ICON_H/2)

#define ANIRADAR_FRAME_IMG		"AniRadar\images\radarbackground.paa"	
#define ANIRADAR_FIELD_IMG		"AniRadar\images\radarfield.paa"
#define ANIRADAR_PULSE_IMG		"AniRadar\images\radarpulse.paa"
#define ANIRADAR_OVERLAY_IMG	"AniRadar\images\overlay.paa"
#define ANIRADAR_DOT			"AniRadar\images\dot.paa"

#define ANIRADAR_NORTH			0
#define ANIRADAR_NORTH_EAST		1
#define ANIRADAR_EAST			2
#define ANIRADAR_SOUTH_EAST		3
#define ANIRADAR_SOUTH			4
#define ANIRADAR_SOUTH_WEST		5
#define ANIRADAR_WEST			6
#define ANIRADAR_NORTH_WEST		7
#define ANIRADAR_CENTER			8

#define ANIRADAR_IMMEDIATE		0
#define ANIRADAR_MINIMIZE		1
#define ANIRADAR_MAXIMIZE		2

#define ANIRADAR_MIN_FACTOR		0.33	// 33% of the original size

//#define ANIRADAR_DEBUG			1

#ifdef ANIRADAR_DEBUG
	#define ANIRADAR_LOG(TEXT) player sideChat TEXT; sleep 0.1;
#else
	#define ANIRADAR_LOG(TEXT)
#endif