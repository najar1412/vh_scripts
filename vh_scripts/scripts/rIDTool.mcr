macroScript IDTool
	category:"VH Scripts"
	tooltip:"IDTool" 
			
(
	-- v2.32	- Add "Create Vray MultiMatteElement" button
	-- v2.31	- Add "Assign Incremental ID" button
	
	--Closedialog
	try(destroydialog objects_by_id_dialog)catch()
	
	--Globals
	global objects_by_id_dialog
	global g_buffer_array = #()
	global g_buffer_sel_array = #()
	global list_items = #()
	global list_sel_items = #()
	global highlight_label_text = ""
	global show_id_fn
	
	if (getfiles ((GetDir #plugcfg) + "\\requiem_id_tool.ini")).count == 0 then
	(
		setinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "pos_x" "300"
		setinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "pos_y" "300"
		setinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "id" "1"
	)
	
	-- Locals
	local show_id_pos
	
	id_dialog_x = getinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "pos_x" as integer
	id_dialog_y = getinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "pos_y" as integer
	get_id_num = getinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "id" as integer
	
	--FN
	-- All Objects ID
	fn get_objects_id_array =
	(
		g_buffer_array = #()
		for o in objects where o.gbufferchannel != 0 do
		(
			if (findItem g_buffer_array (o.gbufferchannel as string)) == 0 then append g_buffer_array (o.gbufferchannel as string)
		)	
		
		if g_buffer_array.count > 1 then
		(
		fn sort_array p1 p2 =
			(
			local check_value = (p2 as integer) - (p1 as integer)
			case of
				(
				(check_value < 0.): 1
				(check_value > 0.): -1
				default: 0
				)
			)
		qsort g_buffer_array sort_array
		)
		return g_buffer_array
	)
	
	list_items = get_objects_id_array()
	
	-- Selected Objects ID
	fn get_slected_id_array =
	(
		g_buffer_sel_array = #()
		for o in selection where o.gbufferchannel != 0 do
		(
			if (findItem g_buffer_sel_array (o.gbufferchannel as string)) == 0 then append g_buffer_sel_array (o.gbufferchannel as string)
		)	
		
		if g_buffer_sel_array.count > 1 then
		(
		fn sort_array p1 p2 =
			(
			local check_value = (p2 as integer) - (p1 as integer)
			case of
				(
				(check_value < 0.): 1
				(check_value > 0.): -1
				default: 0
				)
			)
		qsort g_buffer_sel_array sort_array
		)
		return g_buffer_sel_array
	)
	
	--Rollout
	rollout objects_by_id_dialog "ObjectsID v2.32" width:200
	(
	    Group ""
		(
			multiListBox obj_id_list "" items:list_items height:10
			button refresh_btn "Refresh List" width:175 height:16 --align:#right
			button highlight_selected_btn "Highlight Selected ID" width:175 height:16 align:#left --across:2

		)
		
		Group "Assign ID"
		(
			spinner id_num_spn "ID: " range:[1,65535,get_id_num] align:#left type:#integer scale:1
			button assign_id_btn "Assign ID" width:140 height:16 across:2 align:#left
			button assign_id_incremental_btn "+" height:16 width:32 offset:[0,0] align:#right
		)
		
		Group "Assign Random ID"
		(
			spinner min_random_spn "min:" range:[1,65534,1] across:2 type:#integer align:#left
			spinner max_random_spn "max:" range:[2,65535,6] type:#integer align:#left offset:[-15,0]
			button assign_random_id_btn "Assign Random ID" width:175 height:16
			button assign_random_id_to_sel_count_btn "Random ID To Selection Count" width:175 height:16
		)
		
		Group "Render Elements"
		(
			button create_elements_btn "Create Vray MultiMatteElement" height:16 width:175
		)
		
		Group "Clear ID"
		(
			button clear_sel_id_btn "Clear Selected ID" width:86 height:16 across:2
			button clear_all_id_btn "Clear All ID" width:86 height:16
		)
		
 		Group "Viewport Info"
		(
			button show_id_viewport "Show ID on Viewport" width:175 height:16
			button hide_id_viewport "Hide ID on Viewport" width:175 height:16
		) 

		button help_btn "?" height:16 width:16 across:2 align:#left
		button donate_btn "D" height:16 width:16 align:#right tooltip:"This script is free. If you find it useful, you can donate."
		
		
	-- Close Dialog
		on objects_by_id_dialog close do
		(
			get_id_num = id_num_spn.value
			setinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "id" (id_num_spn.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "pos_x" ((GetDialogPos objects_by_id_dialog).x as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_id_tool.ini") "IDTool" "pos_y" ((GetDialogPos objects_by_id_dialog).y as string)
		)
		
		on create_elements_btn pressed do
		(
			if matchpattern (renderers.current as string) pattern:"v_ray*" == true or matchpattern (renderers.current as string) pattern:"vray*" == true then
			(
				id_arr = get_objects_id_array()
				get_elements = maxOps.GetCurRenderElementMgr()
				
				if id_arr.count != 0 then
				(
					get_elements_count = get_elements.NumRenderElements()
					num = 1
					check_element_count = 3
					for i in id_arr do
					(
						check_element_count += 1
						if check_element_count > 2 do
						(
							get_elements.AddRenderElement (MultiMatteElement elementname:("MME_IDTool_" + (num as string)))
							a = get_elements.GetRenderElement get_elements_count
							a.R_gbufIDOn = false
							a.G_gbufIDOn = false
							a.B_gbufIDOn = false
							a.MatID = false
							num += 1 -- za imeto
							check_element_count = 0 -- za sledvashtia element
							get_elements_count += 1 -- proveriava v koi elemnt da slaga
						)
						local a = get_elements.GetRenderElement (get_elements_count-1)
						case check_element_count of
						(
							0:
							(
								a.R_gbufIDOn = true
								a.R_gbufID = i as integer
								
							)
							1:
							(
								a.G_gbufIDOn = true
								a.G_gbufID = i as integer
							)
							2:
							(
								a.B_gbufIDOn = true
								a.B_gbufID = i as integer
							)
						)
					)
				)
			)
			else
			(
				messagebox "Use Vray Render"
			)
		)
		
		on assign_id_incremental_btn pressed do
		(
			if selection.count != 0 then
			(
				for i in selection do
				(
					i.gbufferchannel = id_num_spn.value + 1
				)
				list_items = get_objects_id_array()
				obj_id_list.items = list_items
				
				id_num_spn.value += 1
			)
		)

	-- Assign ID
		on assign_id_btn pressed do
		(
			if selection.count != 0 then
			(
				for i in selection do
				(
					i.gbufferchannel = id_num_spn.value
				)
				list_items = get_objects_id_array()
				obj_id_list.items = list_items
			)
		)
		
	-- Assign Random ID
		on assign_random_id_btn pressed do
		(
			if selection.count != 0 then
			(
				for i in selection do
				(
					i.gbufferchannel = random min_random_spn.value max_random_spn.value
				)
				list_items = get_objects_id_array()
				obj_id_list.items = list_items
			)
		)
	-- Assign Random ID To Selection Count
		on assign_random_id_to_sel_count_btn pressed do
		(
			if selection.count != 0 then
			(
				id_arr = #()
				num = 1
				for i in selection do
				(
					append id_arr num
					num += 1
				)
				for i in selection do
				(
					random_id = random 1 id_arr.count
					i.gbufferchannel = id_arr[random_id]
					deleteitem id_arr random_id
				)
				
			)
			list_items = get_objects_id_array()
			obj_id_list.items = list_items
		)
		
	-- Random Spinner
		on min_random_spn changed val do
		(
			if min_random_spn.value >= max_random_spn.value then
			(
				min_random_spn.value = (max_random_spn.value - 1)
			)
		)
		
		on max_random_spn changed val do
		(
			if max_random_spn.value <= min_random_spn.value then
			(
				max_random_spn.value = (min_random_spn.value + 1)
			)
		)
	
	-- Refresh
		on refresh_btn pressed do
		(
			list_items = get_objects_id_array()
			obj_id_list.items = list_items
		)
		
	-- Highlight
		on highlight_selected_btn pressed do
		(
			if selection.count != 0 then
			(
				get_listbox_position = #()
				list_sel_items = get_slected_id_array()
				if obj_id_list.items.count != 0 then
				(
					for i = 1 to obj_id_list.items.count do
					(
						for o in list_sel_items do
						(
							if obj_id_list.items[i] == o then
							(
								append get_listbox_position i
							)
						)
					)
				)
				obj_id_list.selection = get_listbox_position
			)
		)
		
	-- Clear All ID
		on clear_all_id_btn pressed do
		(
			if queryBox "Clear All ID's?" beep:true then
			(
				for i in objects do
				(
					i.gbufferchannel = 0
				)
			list_items = get_objects_id_array()
			obj_id_list.items = list_items
			)
		)
		
	-- Clear Selected ID
		on clear_sel_id_btn pressed do
		(
			if queryBox "Clear Selected ID?" beep:true then
			(
				if selection.count != 0 then
				(
					for i in selection do
					(
						i.gbufferchannel = 0
					)
				)
				list_items = get_objects_id_array()
				obj_id_list.items = list_items
			)
		)
		
	-- Select ID
		on obj_id_list selectionEnd do
		(
			select_objest_id = #()
			for i in (obj_id_list.selection as array) do
			(
				for o in objects where (o.gbufferchannel == obj_id_list.items[i] as integer) do
				(
					append select_objest_id o
				)
			)
			ClearSelection()
			select select_objest_id
		)
		
 	-- Viewport
		on show_id_viewport pressed do
		(
			UnRegisterRedrawViewsCallback show_id_fn
			
			--FN
			fn show_id_fn =
			(
				for i in objects where i.gbufferChannel != 0 do
				(
					get_view_size = getViewSize()
					show_id_pos = [0,0,0]
					
					txt_id = i.gbufferChannel as string
			
					gw.setTransform i.transform
					
					gw.text show_id_pos txt_id color:white
				
					gw.enlargeUpdateRect #whole --text_update
					gw.updateScreen()
				)
			)
			
			show_id_fn()
			
			RegisterRedrawViewsCallback show_id_fn
			completeRedraw()
		)
		
		on hide_id_viewport pressed do
		(
			UnRegisterRedrawViewsCallback show_id_fn
			completeRedraw()
		)
		on help_btn pressed do
		(
			ShellLaunch "C:\\Program Files\\Internet Explorer\\IEXPLORE.EXE" "http://www.tepavicharov.com/scripts.html"
		)
		on donate_btn pressed do
		(
			ShellLaunch "C:\\Program Files\\Internet Explorer\\IEXPLORE.EXE" "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4TJFMZJQA4RP8"
		)
	)
	createdialog objects_by_id_dialog pos:[id_dialog_x, id_dialog_y]
)