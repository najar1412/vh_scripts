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
-- #TODO: IMP loop for building actions and assigning to main menu
-- #TODO: programically find 'user_scripts_dir'

-- globals
menu_name = "VH Scripts"
separ = menuMan.createSeparatorItem()

-- get scripts dir, and local user scripts dir
scripts_dir = "V:\Scripts\*.mcr"
user_scripts_dir = "C:\Users\render\AppData\Local\Autodesk\3dsMax\2017 - 64bit\ENU\usermacros"

-- process scripts into memory
Macro_scripts_list = getFiles (scripts_dir)

-- Load macros before main menu init
for script in Macro_scripts_list do (
	if (script != user_scripts_dir) do (
		fileIn script
	)
)

-- Check if menu exists, if so unreg.
find_menu_name = menuMan.findMenu menu_name
if (find_menu_name != undefined) do (
    menuMan.unRegisterMenu find_menu_name
)

-- get the main menu bar, create a menu called VH Scripts, create a SubMenuItem
default_main_menu = menuMan.getMainMenuBar()
theMenu = menuMan.createMenu menu_name
theSubMenu = menuMan.createSubMenuItem menu_name theMenu

--add the SubMenu to the Main Menu
default_main_menu.addItem theSubMenu (default_main_menu.numItems()+1)

--create an ActionItem from the MacroScript
act_quick_attach = menuMan.createActionItem "Quick_Attach" menu_name
act_idtool = menuMan.createActionItem "IDTool" menu_name

--add the ActionItem to the menu
theMenu.addItem act_quick_attach (theMenu.numItems()+1)
theMenu.addItem separ (theMenu.numItems()+1)
theMenu.addItem act_idtool (theMenu.numItems()+1)

--update the menu bar
menuMan.updateMenuBar()
