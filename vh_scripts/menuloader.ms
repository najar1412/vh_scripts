/*
Name: vh scripts

Originally created by: najar
Company: vh
Purpose: Single location for regularly used scripts. Should be portable.

**************************************************************************
Copyright (c) 2017 vh.
All rights reserved.

These coded instructions, statements, and computer programs contain
unpublished proprietary information written by vh., and are
protected by Federal copyright law. They may not be disclosed to third
parties or copied or duplicated in any form, in whole or in part, without
the prior written consent of vh.
**************************************************************************
*/

-- #TODO: Batchfile to copy from installation dir to user pref dirs.
-- #TODO: Refactor

ScriptDir = "V:\Scripts\*.mcr"
InnitMcr = "V:\Scripts\SR__Menu.mcr"

print ("Loading scripts from " + ScriptDir)
print (fileIn)
MacrFileList = getFiles (ScriptDir)

/* Load all the macros before the Menu script */
for File in MacrFileList do (
	print (File)
	if (File != InnitMcr) do (
		print ("Loading .mcr: " + File)
		fileIn File
	)
)

menu_name = "VH Scripts"
separ = menuMan.createSeparatorItem()


-- Check if menu exists
find_menu_name = menuMan.findMenu menu_name
if (find_menu_name != undefined) do (
    menuMan.unRegisterMenu find_menu_name
)

--get the main menu bar
default_main_menu = menuMan.getMainMenuBar()

--create a menu called VH Scripts
theMenu = menuMan.createMenu menu_name

--create a SubMenuItem
theSubMenu = menuMan.createSubMenuItem menu_name theMenu

--add the SubMenu to the Main Menu
default_main_menu.addItem theSubMenu (default_main_menu.numItems()+1)


--create an ActionItem from the MacroScript
act_idtool = menuMan.createActionItem "IDTool" menu_name
act_quick_attach = menuMan.createActionItem "Quick_Attach" menu_name

--add the ActionItem to the menu
theMenu.addItem act_idtool (theMenu.numItems()+1)
theMenu.addItem act_quick_attach (theMenu.numItems()+1)
-- theMenu.addItem separ (theMenu.numItems()+1)

--update the menu bar
menuMan.updateMenuBar()
