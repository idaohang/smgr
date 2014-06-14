/*************** DEFINES ******************/

#define SMGR_TOTAL_X 			(0.29375 * safezoneW + safezoneX)
#define	SMGR_TOTAL_Y 			(0.225 * safezoneH + safezoneY)
#define	SMGR_TOTAL_W 			0.275
#define	SMGR_TOTAL_H 			0.785714

#define	SMGR_SCREEN_X			0.0374991
#define	SMGR_SCREEN_Y			0.06
#define	SMGR_SCREEN_W			0.2
#define	SMGR_SCREEN_H			0.29
#define SMGR_SCREEN_XPADDING	0.0125
#define SMGR_SCREEN_YPADDING	0.01

#define	SMGR_KEYPAD_ORIGIN_X	0.043
#define	SMGR_KEYPAD_ORIGIN_Y	0.398
#define	SMGR_KEYPAD_KEY_SIZE	0.06
#define	SMGR_KEYPAD_KEY_SPA		(SMGR_KEYPAD_KEY_SIZE + 0.002)

#define	SMGR_TEXT_SIZE			0.025
#define	SMGR_TEXTLINE_H			0.025
#define	SMGR_TEXT_COLOR			{0,0,0,1}
#define	SMGR_TEXT_COLOR_HEX		"#000000"
#define	SMGR_TEXT_FONT			"EtelkaMonospacePro"
#define	SMGR_TEXT_SELECTED		{0.35,0.40,0.37}

#define	SMGR_BCKGROUND_SELECTED	{0,0,0,0.7}

#define	TRANSPARENT				{0,0,0,0}


/****************** CONTROLS ******************/
/*
class RscControlsGroup;
class RscShortcutButton;
class RscStructuredText;
class RscListBox;
class RscPicture; */

class RscSmgrBackground
{
	idc = -1;
	type = CT_STATIC;
	style = ST_POS;
	colorText[] = {0.04,0.04,0.04,0.95};
	colorBackground[] = {0.2,0.25,0.125,1};
	text = "";
	font = SMGR_TEXT_FONT;
	sizeEx = 0.02;
};

class RscSmgrMainBox : RscControlsGroup {};

class RscSmgrKey : RscShortcutButton
{
	w = SMGR_KEYPAD_KEY_SIZE;
	h = SMGR_KEYPAD_KEY_SIZE * 1.25;
	shadow = 0;
	colorBackground[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	animTextureDefault = "";
	animTextureNormal = "";
	animTextureDisabled = "";
	animTextureOver = "";
	animTextureFocused = "";
	animTexturePressed = "";
};


class RscSmgrText : RscStructuredText 
{
	size = SMGR_TEXT_SIZE;
	colorText[] = SMGR_TEXT_COLOR;
	class Attributes
	{
		font = SMGR_TEXT_FONT;
		color = SMGR_TEXT_COLOR_HEX;
	};
};
class RscSmgrTextLine : RscSmgrText
{
	x = 0;
	w = SMGR_SCREEN_W;
	h = SMGR_TEXTLINE_H;
};

class RscSmgrMenuTitle: RscSmgrTextLine
{
	y = SMGR_SCREEN_YPADDING;
	colorText[] = SMGR_TEXT_COLOR;
	class Attributes
	{
		font = SMGR_TEXT_FONT;
		align = "center";
		color = SMGR_TEXT_COLOR_HEX;
	};
};

class RscSmgrScreen : RscControlsGroup 
{
	x = SMGR_SCREEN_X;
	y = SMGR_SCREEN_Y;
	w = SMGR_SCREEN_W;
	h = SMGR_SCREEN_H;
};
class RscSmgrScreenMenu : RscSmgrScreen {};

//Menus
class RscSmgrMenuList : RscListBox
{
	x = SMGR_SCREEN_W * 0.01;
	y = 0.05;
	w = SMGR_SCREEN_W * 0.98;
	h = 0.2;
	sizeEx = SMGR_TEXTLINE_H * 1.2 ;
	rowHeight = SMGR_TEXTLINE_H * 1.2;
	font = SMGR_TEXT_FONT;
	colorText[] = SMGR_TEXT_COLOR;
	colorSelect[] = SMGR_TEXT_SELECTED;
	colorSelect2[] = SMGR_TEXT_SELECTED;
	colorBackground[] = TRANSPARENT;
	colorSelectBackground[] = SMGR_BCKGROUND_SELECTED;
	colorSelectBackground2[] = SMGR_BCKGROUND_SELECTED;
};
class RscSmgrInputBufferText : RscSmgrText
{
	x = SMGR_SCREEN_X;
	y = (SMGR_SCREEN_Y + 0.25);
	w = SMGR_SCREEN_W;
	h = SMGR_TEXTLINE_H;
	class Attributes
	{
		font = SMGR_TEXT_FONT;
		align = "center";
		color = SMGR_TEXT_COLOR_HEX;
	};
};

class RscSmgrProgressBar
{
	access = 0;
	type = CT_PROGRESS;
	style = ST_HORIZONTAL;
	idc= -1;

	x = 0;
	y = 0;
	w = 0;
	h = 0;

	colorFrame[] = SMGR_BCKGROUND_SELECTED;
	colorBar[] = SMGR_BCKGROUND_SELECTED;
	texture = "";
};

