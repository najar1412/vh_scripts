 	macroScript RenderMask
		category:"VH Scripts"
		tooltip:"RenderMask"
(
	local ver = "v5.81.0"

	-- update 2015.07.11
	-- v5.81.0	- fix "Keep Opacity Map" working whith MultiMaterial
	-- v5.80.9	- add "Rename" button in "Mask State"
	-- v5.80.8	- bugs fixed "Mask State"
	-- v5.80.7	- bugs fixed in BlackMaterial when use "Keep Opacity Map"
	-- v5.80.6	- bugs fixed in "Texture" mask
	-- v5.80.5	- Update "RGBDialog" function (fucking bug in 3dsmax)
	-- v5.80.4	- Update "Texture" mask
	-- v5.80.3	- bugs fixed in "MaskState"
	-- v5.80.2	- Add ProgressBar in "Submit to Deadline" dialog
	-- v5.80.1	- bug fixed in "MaskState"
	-- v5.80.0	- Change "MaskState"
	-- v5.79.0	- Fix "Refraction" mask
	-- v5.78.9	- Save last setting in "ZDepth" mask in maxfile.
	-- v5.78.8	- "Ambient", "Texture" and "Specular" masks support MentalRay
	-- v5.78.7	- "MaterialID" mask work with "Keep OpacityMap"
	-- v5.78.6	- Update "Reflection" mask,
	-- v5.78.5	- Add enable/disable Antialiasing, Support "iToo Forest Pack"
	-- v5.78.4	- Update "Lights/Shadows" mask
	-- v5.78.3	- Add "Blacklist/Whitelist Slaves" in Deadline
	-- v5.78.2	- Add "Submit Job As Suspended" for Deadline, new rollout for deadline
	-- v5.78.1	- Add "Refraction" mask (Beta Version)
	-- v5.78	- Update "LightsMaks", RGB works with more than 3 lights.
	-- v5.77.9  - "LightsMaks" now work with FumeFX
	-- v5.77.8	- added "HairFarm" and "FumeFX" support
	-- v5.77.7	- added "Deadline 6" support
	-- v5.77.6	- bug fixed in ZDepth when using "Keep OpacityMap"
	--			- bug fixed when working whith "Vray 2.40"
	-- v5.77.5	- add "TaskPerFrame" when submit to Deadline
	-- v5.77.4	- bug fixed in "Texture" mask
	-- v5.77.3	- add "Black Hole"
	-- v5.77.2	- add "LumaRGB"
	-- v5.77.1	- bug fixed, when script crash return all materials
	-- v5.77	- add Mentalray support in "Reflection" and "Light" mask
	--			- add "Specular" mask
	--			- add turnoff active Effects
	-- v5.76.2	- add switch "anti aliasing" in "ZDepth" mask
	-- v5.76.1	- big bug fixed in "Lights/Shadow" mask (wrong black material)
	-- v5.76	- add "ZDepth" mask
	-- v5.75.71	- fix radius parameter in "AO"
	-- v5.75.7	- fix alpha channel in "TextureMask"
	--			- add "Use ColorMapping" in "TextureMask" (vray only)
	--			- add "Show Map on Viewport" in "TextureMask"
	-- v5.75.6	- add "Save\Load Preset" in SSS
	-- v5.75.5	- change "Mask State" window position
	--			- random name state in "Mask State"
	-- v5.75.4	- change OpenEXR to primary save file
	-- v5.75.3	- fix "Mask State" (send selection set to max)
	-- v5.75.2	- optimize Code (assign white material)
	-- v5.75.1	- update "Reflection Mask"
	-- v5.75	- add "Texture Mask"
	--			- add "Ambient Occlusion" (Vray Only)
	-- v5.74	- add "SSS Mask" (Vray Only)
	--			- add "Lights Multiplier" in "Lights Mask"
	-- v5.73.1	- some improvements
	-- v5.73	- add "Submit To Deadline"
	-- v5.72	- add "Shadow Mask"
	--			- bugfixed in "ObjetsID Mask" when use "Default Scaneline Renderer"
	--			- bugfixed in "ObjetsID Mask" when create dialog whit tumbs.
	--			- replace "Keep OpacityMap - White Matte" and "Keep OpacityMap - Black Matte" whith one button "Keep OpacityMap"
	-- v5.71	- upgrade "Mask State", now each object can be in more than one group.
	--			- "Mask State" corresponds with "Name Selection Set"
	--			- bugfixed when save file in "*.exr" file.
	-- v5.7		- add "ObjectsID Mask"
	--			- add "IDTool"
	-- v5.63	- bugFixed in "VectorMask"
	-- v5.62    - add "RGB Color" in "LightMask"
	--			- RenderMask use only current render.
	-- v5.61 	- add function (in "LightMask") to keep existing VrayColorMapping and VrayPhysicalCamera parameters if necessary.
	--			- bugfixed in "LightMask"
	-- v5.6		- add "LightMask" (Vray Only)
	-- v5.5		- add "VectorMask" (Vray Only)
	--			- optimize code
	-- v5.42	- more compact interface
	-- v5.41	- update "getOpacityMaps" function
	-- v5.4		- add "Mask State"
	--			  fix "Separate selection in different masks" working whit "Keep OpacityMap - Black Matte"
	--			  add "Send to Selection Set" in "Mask State"
	-- v5.35	- bugfixed when using "WireColor" and "Keep OpacityMap - White Matte"
	-- v5.34	- bugfixed when collect objects
	-- v5.32	- optimize code
	-- v5.31    - bugfixed when using "OverrideMaterial" in "Vray Global Render Options"
	-- v5.3		- rerwite code for searching opacity map
	-- v5.2		- add "Environment Multiplier" in "ReflectionMask"
	-- v5.1		- add "MaterialID" mask
	-- v5.00	- update "ReflectionMask" working whit Brazil
	-- v4.93    - add SaveToMaxFile
	--			  bugfixed In "Reflection Mask"
	-- v4.90    - add On/Off Falloff Reflection
	-- v4.82    - add "Separate Render".
	-- v4.81    - update WireColor Tool.
	-- v4.80    - add Environment Reflection Mask
	-- v4.74    - support Vray 1.50 SP3
	-- v4.73    - enable/disable "VraySeparateCannels"
	--			  enable/disable "Render to Vray RAW image"
	-- v4.72sf  - added Brazil2 support (contact@splutterfish.com)
	--            supports b2 as a renderer (new option in UI)
    --            enables/disables b2 main lights and b2 dome lights
    --            retains opacity maps from b2 advanced materials
	-- v4.71 	- original (http://www.tepavicharov.com/)

-------------------------------------------------------------------------------------------------------------------
--- DestroyDialog if Open
-------------------------------------------------------------------------------------------------------------------
	try(destroydialog RenderMaskDialog)catch()
	try(destroydialog WirecolorDialog)catch()
	try(destroydialog StateDialog)catch()
	try(destroydialog MaterialIDDialog)catch()
	try(destroydialog ReflectionDialog)catch()
	try(destroydialog VectorDialog)catch()
	try(destroydialog LightsDialog)catch()
	try(destroydialog ObjectsIDDialog)catch()
	try(destroydialog SSSDialog)catch()
	try(destroydialog TextureDialog)catch()
	try(destroydialog AmbientDialog)catch()
	try(destroydialog ZDialog)catch()
	try(destroydialog SpecularDialog)catch()
	try(destroydialog DeadlineDialog)catch()
	try(destroydialog DeadlineLimitsDialog)catch()
	try(destroydialog RGBDialog)catch()

-------------------------------------------------------------------------------------------------------------------
--- Globals
-------------------------------------------------------------------------------------------------------------------
	global RenderMaskDialog
	global WirecolorDialog
	global StateDialog
	global MaterialIDDialog
	global ReflectionDialog
	global VectorDialog
	global LightsDialog
	global ObjectsIDDialog
	global SSSDialog
	global TextureDialog
	global AmbientDialog
	global ZDialog
	global SpecularDialog
	global DeadlineDialog
	global DeadlineLimitsDialog
	global RGBDialog
	global theOutputFile
	global BitmapArray = #()
	global SSSLightArray = #()
	global SpecularLightsArray = #()
	global SelectLightsArray = #()
	global getTextureMask
	global getReflectionMask
	global getTexturePreviewObj = undefined
	global getTexturePreviewMtl = undefined
	global GroupArray = #(#())
	global BitmapArray = #()

-------------------------------------------------------------------------------------------------------------------
--- Locals
-------------------------------------------------------------------------------------------------------------------
	local VrayCam = undefined
	local VrayCamExposure = 0
	local VrayCamVignetting = 0
	local getUseEnvMap
	local getUseEnvColor
	local getExposure
	local getMentalrayFG = false
	local getMentalrayGI = false
	local getMentalrayRay = false
	local getVrayGI = false
	local getBrazilDirect = false
	local getBrazilSky = false
	local getBrazilIndirect = false
	local getBrazilSecondary = false
	local getPropagateMtlInstance = false
	local getVraySplitbuffer = false
	local getVraySaveImage = false
	local getVrayOverrideMtl
	local getVrayVFB
	local VectorRelativeNode = undefined
	local OpacityMap = #()
	local getWindowsRoot = sysInfo.windowsdir
	local getInternetExpPath = getFilenamePath getWindowsRoot + "Program Files\\Internet Explorer\\iexplore.exe"
	local HairfarmMtlArray = #()
	local HairfarmModifierArray = #()
	local FumeObjArray = #()
	local FumeObjColorArray = #()
	local FumeColorArray = #()
	local FumeLightsArray = #()
	local FumeSelLightsArray = #()
	local VrayMtlArray = #()
	local VrayRefractArray = #()
	local DeadlineLimitsWB = 1
	local DeadlineSlavesList = #()
	local ForestLiteArray = #()
	local DeadlineDialogOffsetY = 316

-------------------------------------------------------------------------------------------------------------------
--- INI Settings
-------------------------------------------------------------------------------------------------------------------

	if (getfiles ((GetDir #plugcfg) + "\\requiem_render_mask.ini")).count == 0 then
	(
		-- main_dialog
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "aa" "true"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "opacity" "false"

		-- deadline_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_version" "1"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_priority" "50"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_frametask" "5"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_suspended" "false"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list" ""
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_bw_list" "1"

		-- rendermask_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "pos_x" "300"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "pos_y" "300"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "file_name" "mask"

		-- lights_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_shadow_mask_type" "1"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_mask_type" "1"

		-- reflection_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_type" "1"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_glossy" "1.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_subdivs" "8"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_ior" "1.6"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_falloff" "true"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_multi" "1.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_type" "1"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_color" "[255,255,255]"

		-- sss_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_rate" "0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scale" "2.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_radius" "2.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_subdivs" "8"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_front" "true"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_back" "true"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_only" "false"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_gamma" "2.2"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_multi" "1.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scatter" "1"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_show_prepass" "false"

		-- ao_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_radius" "10000.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_subdivs" "8"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_invert" "false"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_gamma" "true"

		-- z_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_invert" "false"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_near" "0.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_far" "500.0"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_aa" "false"

		-- specular_ini
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_level" "100"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_gloss" "50"

		-- rgb dialog
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "rgb_dialog_filaname" "RGBMask"
		setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "rgb_dialog_path" ""
	)

	local DialogPosX = getinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "pos_x" as integer
	local DialogPosY = getinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "pos_y" as integer

	if DialogPosX == 0 then DialogPosX = 300
	if DialogPosY == 0 then DialogPosY = 300

-------------------------------------------------------------------------------------------------------------------
--- Functions
-------------------------------------------------------------------------------------------------------------------

	-- FN get_vraymtl
	------------------
	fn getVrayMtl mat =
	(
		if classof mat == VrayMtl then append VrayMtlArray mat
		for i = 1 to mat.numsubs do
		(
			if mat[i] != undefined then
			(
				if superclassof mat[i] == material then append VrayMtlArray mat[i]

				if (isProperty mat[i] #object) == true and superclassof mat[i].object == material then append VrayMtlArray mat[i].object
			)
			getVrayMtl mat[i]
		)
	)

	-- FN get_use_refract
	------------------
	fn getVrayMtlRefraction mat_arr =
	(
		if mat_arr.count != 0 then
		(
			for m in mat_arr do
			(
				if classof m == VrayMtl then
				(
					if m.refraction != black then
					(
						append VrayRefractArray m
					)
					else if m.texmap_refraction != undefined then
					(
						append VrayRefractArray m
					)
				)
			)
		)
	)

	-- FN transfer refract mtl
	------------------
	fn TransferRefractMtl mtl =
	(
		new_mtl = copy mtl
		new_mtl.diffuse = black
		new_mtl.texmap_diffuse_on = false
		new_mtl.reflection = black
		new_mtl.texmap_reflection_on = false

		new_mtl.refraction = (color new_mtl.refraction.v new_mtl.refraction.v new_mtl.refraction.v)

		return new_mtl
	)

	-- FN OpacityMap
	------------------
	fn getOpacityMaps mat =
	(
		if mat != undefined then
		(
			for i = 1 to mat.numsubs do
			(
				if mat[i] != undefined then
				(
					if classof mat[i] == SubAnim then
					(
						if superclassof mat[i].object == TextureMap then
						(
							if mat[i].object != undefined then
							(
								if (findString (mat[i].name as string) "opacity") != undefined then
								(
									append OpacityMap mat[i].object
								)
								else if (findString (mat[i].object.name as string) "opacity") != undefined then
								(
									append OpacityMap mat[i].object
								)
							)
						)
					)
				)
				getOpacityMaps mat[i]
			)
		)
	)

	-- FN Get Current Render
	------------------
	fn getCurrentRenderEngine =
	(
		if matchpattern (renderers.current as string) pattern:"v_ray*" == true or matchpattern (renderers.current as string) pattern:"vray*" == true then return "vray"
		else if matchpattern (renderers.current as string) pattern:"*mental*" == true then return "mental"
		else if matchpattern (renderers.current as string) pattern:"*brazil*" == true then return "brazil"
		else if matchpattern (renderers.current as string) pattern:"*Scanline*" == true then return "scanline"
	)

	-- FN Sort ObjectsID
	------------------
	fn getIDArray =
	(
		local gbuffer_array = #()
		for o in objects where o.gbufferchannel != 0 do
		(
			if (findItem gbuffer_array (o.gbufferchannel as string)) == 0 then append gbuffer_array (o.gbufferchannel as string)
		)

		if gbuffer_array.count > 1 then
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
			qsort gbuffer_array sort_array
		)
		return gbuffer_array
	)

	-- FN RGB Selection
	------------------
	fn getIDRGBSelection num =
	(

		local get_res = ((num as float) / 3)
		if ((filterString (get_res as string) ".")[2])[1] == "3" then return 1
		else if ((filterString (get_res as string) ".")[2])[1] == "6" then return 2
		else if ((filterString (get_res as string) ".")[2])[1] == "0" then return 3

	)

	-- FN Submint To Deadline
	------------------
	fn SubmitMaskToDeadline job_name mask_name =
	(
-- 		DeadlineDialog.pb_SubmitStatus.value
		error_deadline_txt = ""
		try
		(
			DeadlineDialog.pb_SubmitStatus.color = red
			DeadlineDialog.pb_SubmitStatus.value = 0
			local theNetworkRoot = SMTDFunctions.GetNetworkRoot()
			print theNetworkRoot
			case DeadlineDialog.rdo_DeadlineVersion.state of
			(
				1: fileIn (theNetworkRoot + "\\submission\\3dsmax\\SubmitMaxToDeadline_Functions.ms")
				2: fileIn (theNetworkRoot + "\\submission\\3dsmax\\Main\\SubmitMaxToDeadline_Functions.ms")
			)
			DeadlineDialog.pb_SubmitStatus.value = 10
			error_deadline_txt = "load settings"
			SMTDFunctions.loadSettings()
			SMTDSettings.Priority = DeadlineDialog.spn_DeadlinePriority.value
			SMTDSettings.ChunkSize = DeadlineDialog.spn_DeadlineFrameTask.value
			SMTDSettings.SubmitAsSuspended = DeadlineDialog.chk_DeadlineSuspend.state
 			SMTDSettings.SlavesList = DeadlineSlavesList
			case DeadlineLimitsWB of
			(
				1: SMTDSettings.SlavesBlackList = true
				2: SMTDSettings.SlavesBlackList = false
			)
			DeadlineDialog.pb_SubmitStatus.value = 20
			error_deadline_txt = "users"
			try(SMTDSettings.UserName = SMTDFunctions.GetDeadlineUser())catch(SMTDSettings.UserName = "RenderMask")

			error_deadline_txt = "create jobname case"
			case mask_name of
			(
				1: mask_type_name = "_Luminance]"
				2: mask_type_name = "_WireColor]"
				3: mask_type_name = "_MaterialID]"
				4: mask_type_name = "_Reflection]"
				5: mask_type_name = "_Vector]"
				6: mask_type_name = "_Lights/Shadow]"
				7: mask_type_name = "_ID]"
				8: mask_type_name = "_SSS]"
				9: mask_type_name = "_Texture]"
				10: mask_type_name = "_AO]"
				11: mask_type_name = "_ZDepth]"
				12: mask_type_name = "_Specular]"
				13: mask_type_name = "_LumaRGB]"
				14: mask_type_name = "_Refraction]"
			)

			error_deadline_txt = "create jobname"
			----------------------------------------------------------------
-- 			SMTDSettings.JobName = ((if (maxFilePath != "") then ((filterstring maxFilePath "/\/")[3]) else "Untitled") + "  ||  " + job_name + (" [RenderMask" + mask_type_name))
			SMTDSettings.JobName = (job_name + (" [RenderMask" + mask_type_name))
			DeadlineDialog.pb_SubmitStatus.value = 30
			----------------------------------------------------------------
			error_deadline_txt = "save maxfile"
			saveMaxFile ((getdir #temp) + "\\rendermask_deadline.max") useNewFile:false
			local maxFileToSubmit = ((getdir #temp) + "\\rendermask_deadline.max")
			DeadlineDialog.pb_SubmitStatus.value = 40

			error_deadline_txt = "set info/job file"
			local SubmitInfoFile = SMTDPaths.tempdir + "\\max_submit_info.job"
			DeadlineDialog.pb_SubmitStatus.value = 50
			local JobInfoFile = SMTDPaths.tempdir  + "\\max_job_info.job"
			DeadlineDialog.pb_SubmitStatus.value = 60

			error_deadline_txt = "submit info/job file"
			SMTDFunctions.CreateSubmitInfoFile SubmitInfoFile
			DeadlineDialog.pb_SubmitStatus.value = 70
			SMTDFunctions.CreateJobInfoFile JobInfoFile
			DeadlineDialog.pb_SubmitStatus.value = 80
			error_deadline_txt = "initialArgs"
			local initialArgs="\""+SubmitInfoFile+"\" \""+JobInfoFile+"\" \""+maxFileToSubmit+"\" "
			DeadlineDialog.pb_SubmitStatus.value = 90
			error_deadline_txt = "wait to complete"
			SMTDFunctions.waitForCommandToComplete initialArgs SMTDSettings.TimeoutSubmission
			DeadlineDialog.pb_SubmitStatus.value = 100
			DeadlineDialog.pb_SubmitStatus.color = green
		)
		catch (messagebox ("Job Submission FAILED\n" + error_deadline_txt))
	)

	--FN AutoDetectZDepth (Created by Blagoy Kostov http://www.coldfolio.info) (for i = 1 to 1000000000 do (Thanks Man x i).)
	------------------
	fn AutoDetectZDepth obj fullBBBin =
	(
		local BBB = nodeGetBoundingBox obj (Inverse(getViewTM()))
		local BBBmin = BBB[1]
		local BBBmax = BBB[2]
		local BBBpoints = #()
		local PointsInView = 0
		local res

		append BBBpoints ([BBBmin.x,BBBmax.y,BBBmax.z])
		append BBBpoints ([BBBmax.x,BBBmin.y,BBBmax.z])
		append BBBpoints ([BBBmax.x,BBBmax.y,BBBmin.z])
		append BBBpoints ([BBBmin.x,BBBmin.y,BBBmax.z])
		append BBBpoints ([BBBmin.x,BBBmax.y,BBBmin.z])
		append BBBpoints ([BBBmax.x,BBBmin.y,BBBmin.z])
		append BBBpoints (BBBmin)
		append BBBpoints (BBBmax)
		--append BBBpoints ((BBBmin+BBBmax)/2.0)

		rendAspect = renderWidth/renderHeight as float
		camHFov = viewport.GetFOV()
		camVFov = camHFov/rendAspect
		for p in BBBpoints do
		(
			pInCamSpace =p
			pInVplane = pInCamSpace*[0,1,1]
			pInHplane = pInCamSpace*[1,0,1]
			hAng =  acos  (dot (normalize  pInHplane) (normalize [0,0,pInHplane.z]))
			vAng =  acos  (dot (normalize pInVplane) (normalize [0,0,pInVplane.z]))

			if hAng < (camHFov/2.0) AND vAng < (camVFov/2.0) do
			(
				PointsInView += 1
			)
		)
		if fullBBBin == true then
		(
			if PointsInView == 8 then
			(
				res = 9999999
				for p in BBBpoints do
				(
					if (abs p.z) < res do res = (abs p.z)
				)
			)
			else
			(
				res = false
			)
		)
		else
		(
			if PointsInView > 0 then
			(
				res = 9999999
				for p in BBBpoints do
				(
					if (abs p.z) < res do res = (abs p.z)
				)
			)
			else
			(
				res = false
			)
		)
		res
	)

	-- FN Save MaxFile
	------------------
	fn SaveMaskMAXFile =
	(
		-- save maxfile
		local save_max_file = undefined
		local is_file_save
		local get_max_file = maxfilename
		local get_max_file_name = getFilenameFile get_max_file
		local get_max_file_path = getFilenamePath get_max_file

		if get_max_file_name != "" then
		(
			save_max_file = getMAXSaveFileName filename:(get_max_file_path + get_max_file_name + "_mask.max")
		)
		else
		(
			save_max_file = getMAXSaveFileName()
		)
		if save_max_file != undefined then
		(
			is_file_save = saveMaxFile save_max_file useNewFile:false --quiet:
		)
	)

	-- FN Render Mask
	------------------
	fn RenderMaskFN =
	(
		--open_max_file = 0
		if RenderMaskDialog.chk_SaveMaxFile.state == true then
		(
			SaveMaskMAXFile()
		)
		else
		(
			-- render_image
			if RenderMaskDialog.chk_SingleFrame.state == true then
			(
				max quick render
			)
			else
			(
				if theOutputFile != undefined then
				(
					if RenderMaskDialog.chk_SubmitDeadline.state == true then
					(
						SubmitMaskToDeadline maxfilename RenderMaskDialog.rdo_MaskType.state
					)
					else
					(
						max quick render
					)
				)
			)
		)
	)

	-- FN Get HairFarm
	------------------
	fn getHairfarmObj obj =
	(
		HairfarmMtlArray = #()
		HairfarmModifierArray = #()
		for i in obj do
		(
			if i.modifiers.count != 0 then
			(
				for m in i.modifiers do
				(
					if classof m == Hair_Generate then
					(
						append HairfarmMtlArray m.material
						append HairfarmModifierArray m
					)
				)
			)
		)
	)

	-- FN Set HairFarm
	------------------
	fn setHairfarmMtl obj mat=
	(
		if obj.modifiers.count != 0 then
		(
			for m in obj.modifiers do
			(
				if classof m == Hair_Generate then
				(
					m.material = mat
				)
			)
		)
	)

	-- FN Get FumeFX Lights
	------------------
	fn getFumeLights arr =
	(
		FumeLightsArray = #()
		FumeSelLightsArray = #()

		for i in arr where classof i == FumeFX do
		(
			local fumefx_lights_name_arr = #()
			append FumeSelLightsArray i

			for l in i.Lights do
			(
				if l != undefined then append fumefx_lights_name_arr l.name
			)
			append FumeLightsArray fumefx_lights_name_arr
		)
	)

	-- FN Get FumeFX
	------------------
	fn getFumeFX obj =
	(
		FumeObjArray = #()
		FumeObjColorArray = #()

		for i in obj where classof i == FumeFX do
		(
			FumeColorArray = #()

			-- obj_arr
			append FumeObjArray i

			-- lights arr
			append FumeLightsArray i.Lights

			-- fire_arr
			for f = 0 to (i.GetShader()).Fire_Color_Gradient.NumKeys()-1 do
			(
				append FumeColorArray ((i.GetShader()).Fire_Color_Gradient.GetKeyColor f)
			)

			-- smoke_arr
			append FumeColorArray ((i.GetShader()).SmokeAmbientColor)
			for f = 0 to (i.GetShader()).Smoke_Color_Gradient.NumKeys()-1 do
			(
				append FumeColorArray ((i.GetShader()).Smoke_Color_Gradient.GetKeyColor f)
			)

			-- fuel_arr
			append FumeColorArray ((i.GetShader()).FuelAmbientColor)
			append FumeObjColorArray FumeColorArray
		)
	)

	-- FN Set FumeFX color
	------------------
	fn setFumeMtl obj mat =
	(
		if classof obj == FumeFX do
		(
			for f = 1 to (obj.GetShader()).Fire_Color_Gradient.NumKeys() do
			(
				(obj.GetShader()).Fire_Color_Gradient[f].color = mat
			)

			(obj.GetShader()).SmokeAmbientColor = mat

			for f = 1 to (obj.GetShader()).Smoke_Color_Gradient.NumKeys() do
			(
				(obj.GetShader()).Smoke_Color_Gradient[f].color = mat
			)
			(obj.GetShader()).FuelAmbientColor = mat
		)
	)


	-- FN open RGB rollout
	------------------
	fn RGBMaskRollout arr =
	(
		if arr.count > 3 then
		(
			-- FN CreateTumbs (Created by Blagoy Kostov http://www.coldfolio.info) (for i = 1 to 1000000000 do (Thanks Man x i).)
			execute_txt = "fn CreateTumbnail bitmap_filename w h =\n"
			execute_txt += "(\n"
			execute_txt += "local b = bitmap_filename\n"
			execute_txt += "local b_thumb = bitmap w h\n"
			execute_txt += "local h_coef = b.height/h as float\n"
			execute_txt += "local w_coef = b.width/w as float\n"
			execute_txt += "for y = 0 to h do\n"
			execute_txt += "(\n"
			execute_txt += "local pix_row = getpixels b [0,y*h_coef] b.width\n"
			execute_txt += "local thumb_row = #()\n"
			execute_txt += "for x = 1 to pix_row.count by w_coef do\n"
			execute_txt += "(\n"
			execute_txt += "pix_row[x] -= (color 1 1 1 1)\n"
			execute_txt += "append thumb_row pix_row[x]\n"
			execute_txt += ")\n"
			execute_txt += "setpixels b_thumb [0, y] thumb_row\n"
			execute_txt += ")\n"
			execute_txt += "return b_thumb\n"
			execute_txt += "close b\n"
			execute_txt += "gc light:true\n"
			execute_txt += ")\n"
			--------- End Function --------------------------
			--------- Start Rollout -------------------------
			execute_txt += "rollout RGBDialog \"RGB Mask Dialog\"\n"
			execute_txt += "(\n"
			execute_txt += ("group \"\"\n")
			execute_txt += "(\n"

			-- loop fo all bitmps (create buttons)
			x = 0
			y = -1
			for i = 0 to BitmapArray.count-1 do
			(
				if i / 4. == i/4 then
				(
					y += 1
					x = 0
				)
				pos_button = [x+10,(y*60)+15] ----[x,(y*60)+32]

				execute_txt += ("button obj_id_btn" + ((i+1) as string) + " \"\" height:60 width:60 pos:" + (pos_button as string) + "\n")
				execute_txt += ("on obj_id_btn" + ((i+1) as string) + " pressed do display BitmapArray[" + ((i+1) as string) + "]\n")
				x += 60
			)

			-- save button \ filename
			execute_txt += ")\n"
			execute_txt += ("group \"\"\n")
			execute_txt += "(\n"
			execute_txt += "button btnSaveAllBitmaps \"Save All in Folder\" width:100 height:22\n"
			execute_txt += "edittext edt_FileName \"FileName: \" text:\"RGBMask\"\n"
			execute_txt += ")\n"

			-- save button
			execute_txt += "on btnSaveAllBitmaps pressed do\n"
			execute_txt += "(\n"
			execute_txt += "if edt_FileName.text != \"\" then\n"
			execute_txt += "(\n"
			execute_txt += "local theBitmapPath = getsavepath caption:\"\" initialDir:(getinisetting ((GetDir #plugcfg) + \"\\\\requiem_render_mask.ini\") \"RenderMask\" \"rgb_dialog_path\")\n"
			execute_txt += "if theBitmapPath != undefined then\n"
			execute_txt += "(\n"
			execute_txt += "setinisetting ((GetDir #plugcfg) + \"\\\\requiem_render_mask.ini\") \"RenderMask\" \"rgb_dialog_filaname\" edt_FileName.text\n"
			execute_txt += "setinisetting ((GetDir #plugcfg) + \"\\\\requiem_render_mask.ini\") \"RenderMask\" \"rgb_dialog_path\" theBitmapPath\n"
			execute_txt += "for i = 1 to BitmapArray.count do\n"
			execute_txt += "(\n"
			execute_txt += "theFileName = edt_FileName.text + \"_\" + (((1000 + i) as string)[2]) + (((1000 + i) as string)[3]) + (((1000 + i) as string)[4]) + \".exr\"\n"
			execute_txt += "BitmapArray[i].filename = (theBitmapPath + \"\\\\\" + theFileName)\n"
			execute_txt += "save BitmapArray[i]\n"
			execute_txt += ")\n"
			execute_txt += ")\n"
			execute_txt += ")\n"
			execute_txt += "else\n"
			execute_txt += "(\n"
			execute_txt += "messagebox \"FileName is Empty\"\n"
			execute_txt += ")\n"
			execute_txt += ")\n"

			-- open dialog
			execute_txt += "on RGBDialog open do\n"
			execute_txt += "(\n"
			execute_txt += "if (getinisetting ((GetDir #plugcfg) + \"\\\\requiem_render_mask.ini\") \"RenderMask\" \"rgb_dialog_filaname\") != \"\" then\n"
			execute_txt += "(\n"
			execute_txt += "edt_FileName.text = (getinisetting ((GetDir #plugcfg) + \"\\\\requiem_render_mask.ini\") \"RenderMask\" \"rgb_dialog_filaname\")\n"
			execute_txt += ")\n"
			execute_txt += "for i = 1 to BitmapArray.count do\n"
			execute_txt += "(\n"
			execute_txt += "RGBDialog.controls[i+1].images = #((CreateTumbnail BitmapArray[i] 60 60), undefined, 1, 1, 1, 1, 1)\n"
			execute_txt += ")\n"
			execute_txt += ")\n"

			-- createdialog
			execute_txt += ")\n"
			execute_txt += ("createdialog RGBDialog width:" + ((if BitmapArray.count >= 4 then 260 else (60 * BitmapArray.count)+50) as string))
			--------- End Rollout ----------------------
			-- execute
 			execute execute_txt
		)
	)

	-- FN White Material (assign)
	------------------
	fn AddMultiMtl obj mat =
	(
		local theMultiMat = Multimaterial numsubs:obj.material.materialIDList.count
		for m = 1 to obj.material.materialIDList.count do
		(
			theMultiMat.materialIDList[m] = obj.material.materialIDList[m]
			theMultiMat[theMultiMat.materialIDList[m]] = copy mat

			OpacityMap = #()
			getOpacityMaps (obj.material[m])

			if OpacityMap.count != 0 then
			(
				if RenderMaskDialog.rdo_MaskType.state == 9 then
				(
					theMultiMat[theMultiMat.materialIDList[m]].baseMtl.texmap_opacity = OpacityMap[1]
				)
				else
				(
					theMultiMat[theMultiMat.materialIDList[m]].opacityMap = OpacityMap[1]
				)
			)
		)
		return theMultiMat
	)

	-- FN Black Material (assign)
	------------------
	fn AddBlackMtl state arr mat =
	(
		if state == false then
		(
			for b in arr do
			(
				NewBlackMat = copy mat
				b.material = NewBlackMat
				setHairfarmMtl b NewBlackMat
			)
		)
		else if state == true then
		(
			for b in arr do
			(
				if classof b.material == Multimaterial then
				(
					b.material = AddMultiMtl b mat
				)
				else
				(
					OpacityMap = #()
					getOpacityMaps b.material

					NewBlackMat = copy mat
					b.material = NewBlackMat
					setHairfarmMtl b NewBlackMat
					if OpacityMap.count != 0 then
					(
						b.material.opacityMap = OpacityMap[1]
					)
				)
			)
		)
	)

	-- FN Forest_Lite
	------------------
	fn getForestLite obj =
	(
		if classof obj == forest_lite do
		(
			if obj.consmat == true then
			(
				append ForestLiteArray obj
				obj.consmat = false
			)
		)
	)


	-- FN CreateMaskDialogs
	------------------
	fn CreateMaskDialog maskstate =
	(
		case maskstate of
		(
			1: -- Luminance Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true
			)
			2:	-- WireColor Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true
			)
			3:	-- MaterialID Dialog
			(
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				if selection.count == 1 then
				(
					if classof $.material == Multimaterial then
					(
						RenderMaskDialog.chk_KeepOpacity.enabled = true

						createdialog MaterialIDDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]
					)
					else
					(
						messagebox "Object must have \"Multi/SubObject\" material"
						RenderMaskDialog.rdo_MaskType.state = 1
					)
				)
				else
				(
					messagebox "Select only one object whit \"Multi/SubObject\" material"
					RenderMaskDialog.rdo_MaskType.state = 1
				)
				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true
			)
			4:	-- Reflection Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				createdialog ReflectionDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]

				if getCurrentRenderEngine() == "brazil" then ReflectionDialog.spn_refGlossySubdiv.enabled = false
				if getCurrentRenderEngine() == "vray" then ReflectionDialog.spn_refGlossySubdiv.enabled = true

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true

			)
			5:	-- Vector Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				if getCurrentRenderEngine() != "vray" then
				(
					messagebox "Use \"Vray\" Render Engine"
					RenderMaskDialog.rdo_MaskType.state = 1
				)
				else
				(
					createdialog VectorDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]

					RenderMaskDialog.chk_KeepOpacity.enabled = true
				)
				RenderMaskDialog.chk_AA.enabled = true
			)
			6: -- Lights\Shadows Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				createdialog LightsDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true
			)
			7: -- ObjectsID Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				createdialog ObjectsIDDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_SaveMaxFile.enabled = false
				RenderMaskDialog.chk_SaveMaxFile.state = false
				--separate_chk.enabled = false
				--separate_chk.state = false
				RenderMaskDialog.chk_AA.enabled = true
			)
			8: -- SSS Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				if getCurrentRenderEngine() != "vray" then
				(
					messagebox "Use \"Vray\" Render Engine"
					RenderMaskDialog.rdo_MaskType.state = 1
				)
				else
				(
					createdialog SSSDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 150]

					RenderMaskDialog.chk_KeepOpacity.enabled = false
					RenderMaskDialog.chk_KeepOpacity.state = false
				)
				RenderMaskDialog.chk_AA.enabled = true
			)
			9: -- Texture Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				createdialog TextureDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true

			)
			10: -- Ambient Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true

				createdialog AmbientDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]
			)
			11: -- ZDepth Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog SpecularDialog)catch()

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = false
				createdialog ZDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]
			)
			12: -- Specular Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true
				createdialog SpecularDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214]
			)
			13: -- LumaRGB Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				RenderMaskDialog.chk_KeepOpacity.enabled = true
				RenderMaskDialog.chk_AA.enabled = true
			)
			14: -- Refraction Dialog
			(
				try(destroydialog MaterialIDDialog)catch()
				try(destroydialog ReflectionDialog)catch()
				try(destroydialog VectorDialog)catch()
				try(destroydialog LightsDialog)catch()
				try(destroydialog ObjectsIDDialog)catch()
				try(destroydialog SSSDialog)catch()
				try(destroydialog TextureDialog)catch()
				try(destroydialog AmbientDialog)catch()
				try(destroydialog ZDialog)catch()
				try(destroydialog SpecularDialog)catch()

				if getCurrentRenderEngine() != "vray" then
				(
					messagebox "Use \"Vray\" Render Engine"
					RenderMaskDialog.rdo_MaskType.state = 1
				)
				else
				(
					RenderMaskDialog.chk_KeepOpacity.enabled = false
				)
				RenderMaskDialog.chk_AA.enabled = true
			)
		)
	)

	--FN Get All Lights
	----------------------------------
	fn getAllLights =
	(
		local get_all_lights = for i in lights where classof i != Targetobject collect i.name
		return get_all_lights
	)

	--FN State Items
	----------------------------------
	fn StateArray =
	(
		local StateItems = #()
		if fileProperties.getNumProperties #custom != 0 then
		(
			for i = 1 to fileProperties.getNumProperties #custom do
			(
				if (filterstring (fileProperties.getPropertyName #custom i) "|")[1] == "RenderMaskState" then
				(
					append StateItems (filterstring (fileProperties.getPropertyName #custom i) "|")[2]
				)
			)
		)
		return StateItems
	)

	-- FN Save State
	------------------------
	fn StateSavePreset masktype savepath =
	(
		local StateTXT = ""
		local getGlobalParam = ""
		local getLocalParam = ""

		getGlobalParam = "RenderMaskDialog.rdo_MaskTimeRange.state = " + RenderMaskDialog.rdo_MaskTimeRange.state as string + ">"
		getGlobalParam += "RenderMaskDialog.rdo_MaskTimeRange.enabled = " + RenderMaskDialog.rdo_MaskTimeRange.enabled as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SaveMaxFile.state = " + RenderMaskDialog.chk_SaveMaxFile.state as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SaveMaxFile.enabled = " + RenderMaskDialog.chk_SaveMaxFile.enabled as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SingleFrame.state = " + RenderMaskDialog.chk_SingleFrame.state as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SingleFrame.enabled = " + RenderMaskDialog.chk_SingleFrame.enabled as string  + ">"
		getGlobalParam += "RenderMaskDialog.rdo_MaskType.state = " + RenderMaskDialog.rdo_MaskType.state as string  + ">"
		getGlobalParam += "RenderMaskDialog.rdo_MaskType.enabled = " + RenderMaskDialog.rdo_MaskType.enabled as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SubmitBackburner.state = " + RenderMaskDialog.chk_SubmitBackburner.state as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SubmitBackburner.enabled = " + RenderMaskDialog.chk_SubmitBackburner.enabled as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SubmitDeadline.state = " + RenderMaskDialog.chk_SubmitDeadline.state as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_SubmitDeadline.enabled = " + RenderMaskDialog.chk_SubmitDeadline.enabled as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_AA.state = " + RenderMaskDialog.chk_AA.state as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_AA.enabled = " + RenderMaskDialog.chk_AA.enabled as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_KeepOpacity.state = " + RenderMaskDialog.chk_KeepOpacity.state as string  + ">"
		getGlobalParam += "RenderMaskDialog.chk_KeepOpacity.enabled = " + RenderMaskDialog.chk_KeepOpacity.enabled as string  + ">"

		case masktype of
		(
			-- Luminance
			1:
			(
				getLocalParam = " "
				StateTXT = ("1||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- WireColor
			2:
			(
				getLocalParam = " "
				StateTXT = ("2||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- MaterialID
			3:
			(
				getLocalParam = "MaterialIDDialog.rdo_MaterialIDType.state = " + MaterialIDDialog.rdo_MaterialIDType.state as string + ">"
				getLocalParam += "MaterialIDDialog.mlb_MaterialIDSelection.selection = " + MaterialIDDialog.mlb_MaterialIDSelection.selection as string + ">"

				StateTXT = ("3||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- Reflection
			4:
			(
				getLocalParam = "ReflectionDialog.rdo_refReflectionType.state = " + ReflectionDialog.rdo_refReflectionType.state as string + ">"
				getLocalParam += "ReflectionDialog.rdo_refReflectionType.enabled = " + ReflectionDialog.rdo_refReflectionType.enabled as string + ">"
				getLocalParam += "ReflectionDialog.spn_refGlossy.value = " + ReflectionDialog.spn_refGlossy.value as string + ">"
				getLocalParam += "ReflectionDialog.spn_refGlossy.enabled = " + ReflectionDialog.spn_refGlossy.enabled as string + ">"
				getLocalParam += "ReflectionDialog.spn_refGlossySubdiv.value = " + ReflectionDialog.spn_refGlossySubdiv.value as string + ">"
				getLocalParam += "ReflectionDialog.spn_refGlossySubdiv.enabled = " + ReflectionDialog.spn_refGlossySubdiv.enabled as string + ">"
				getLocalParam += "ReflectionDialog.spn_refFalloff.value = " + ReflectionDialog.spn_refFalloff.value as string + ">"
				getLocalParam += "ReflectionDialog.spn_refFalloff.enabled = " + ReflectionDialog.spn_refFalloff.enabled as string + ">"
				getLocalParam += "ReflectionDialog.chk_refUseFalloff.state = " + ReflectionDialog.chk_refUseFalloff.state as string + ">"
				getLocalParam += "ReflectionDialog.chk_refUseFalloff.enabled = " + ReflectionDialog.chk_refUseFalloff.enabled as string + ">"
				getLocalParam += "ReflectionDialog.spn_refEnvMultiplier.value = " + ReflectionDialog.spn_refEnvMultiplier.value as string + ">"
				getLocalParam += "ReflectionDialog.spn_refEnvMultiplier.enabled = " + ReflectionDialog.spn_refEnvMultiplier.enabled as string + ">"
				getLocalParam += "ReflectionDialog.rdo_refEnvType.state = " + ReflectionDialog.rdo_refEnvType.state as string + ">"
				getLocalParam += "ReflectionDialog.rdo_refEnvType.enabled = " + ReflectionDialog.rdo_refEnvType.enabled as string + ">"
				getLocalParam += "ReflectionDialog.chk_refActiveMtlSlot.state = " + ReflectionDialog.chk_refActiveMtlSlot.state as string + ">"
				getLocalParam += "ReflectionDialog.chk_refActiveMtlSlot.enabled = " + ReflectionDialog.chk_refActiveMtlSlot.enabled as string + ">"
				getLocalParam += "ReflectionDialog.clr_refEnvColor.color.r = " + ReflectionDialog.clr_refEnvColor.color.r as string + ">"
				getLocalParam += "ReflectionDialog.clr_refEnvColor.color.g = " + ReflectionDialog.clr_refEnvColor.color.g as string + ">"
				getLocalParam += "ReflectionDialog.clr_refEnvColor.color.b = " + ReflectionDialog.clr_refEnvColor.color.b as string + ">"
				getLocalParam += "ReflectionDialog.clr_refEnvColor.enabled = " + ReflectionDialog.clr_refEnvColor.enabled as string + ">"
-- 				getLocalParam += "ReflectionDialog.mbt_refHDRIMap.map = " + ReflectionDialog.mbt_refHDRIMap.map as string + ">"
 				getLocalParam += "ReflectionDialog.mbt_refHDRIMap.enabled = " + ReflectionDialog.mbt_refHDRIMap.enabled as string + ">"

				StateTXT = ("4||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- Vectors
			5:
			(
				getLocalParam = "VectorDialog.ddl_vecSamplerType.selection = " + VectorDialog.ddl_vecSamplerType.selection as string + ">"
				getLocalParam += "VectorDialog.ddl_vecSamplerType.enabled = " + VectorDialog.ddl_vecSamplerType.enabled as string + ">"
				getLocalParam += "VectorDialog.spn_vecPointMultiplier.value = " + VectorDialog.spn_vecPointMultiplier.value as string + ">"
				getLocalParam += "VectorDialog.spn_vecPointMultiplier.enabled = " + VectorDialog.spn_vecPointMultiplier.enabled as string + ">"
				getLocalParam += "VectorDialog.spn_vecRefractionIOR.value = " + VectorDialog.spn_vecRefractionIOR.value as string + ">"
				getLocalParam += "VectorDialog.spn_vecRefractionIOR.enabled = " + VectorDialog.spn_vecRefractionIOR.enabled as string + ">"
				getLocalParam += "VectorDialog.spn_vecUVWChannel.value = " + VectorDialog.spn_vecUVWChannel.value as string + ">"
				getLocalParam += "VectorDialog.spn_vecUVWChannel.enabled = " + VectorDialog.spn_vecUVWChannel.enabled as string + ">"
				getLocalParam += "VectorDialog.ddl_vecCoordSys.selection = " + VectorDialog.ddl_vecCoordSys.selection as string + ">"
				getLocalParam += "VectorDialog.ddl_vecCoordSys.enabled = " + VectorDialog.ddl_vecCoordSys.enabled as string + ">"
--  				getLocalParam += "VectorDialog.pbt_vecRelativeNode.caption = " + VectorDialog.pbt_vecRelativeNode.caption as string + ">"
				getLocalParam += "VectorDialog.pbt_vecRelativeNode.enabled = " + VectorDialog.ddl_vecCoordSys.enabled as string + ">"
				getLocalParam += "VectorDialog.ddl_vecOutput.selection = " + VectorDialog.ddl_vecOutput.selection as string + ">"
				getLocalParam += "VectorDialog.ddl_vecOutput.enabled = " + VectorDialog.ddl_vecOutput.enabled as string + ">"

				StateTXT = ("5||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- Lights/Shadow
			6:
			(
				getLocalParam = "LightsDialog.rdo_lsSwitchLightShadow.state = " + LightsDialog.rdo_lsSwitchLightShadow.state as string + ">"
				getLocalParam += "LightsDialog.rdo_lsSwitchLightShadow.enabled = " + LightsDialog.rdo_lsSwitchLightShadow.enabled as string + ">"
				getLocalParam += "LightsDialog.spn_lsLightsMultiplier.value = " + LightsDialog.spn_lsLightsMultiplier.value as string + ">"
				getLocalParam += "LightsDialog.spn_lsLightsMultiplier.enabled = " + LightsDialog.spn_lsLightsMultiplier.enabled as string + ">"
				getLocalParam += "LightsDialog.mlb_lsLightsList.selection = " + LightsDialog.mlb_lsLightsList.selection as string + ">"
				getLocalParam += "LightsDialog.mlb_lsLightsList.enabled = " + LightsDialog.mlb_lsLightsList.enabled as string + ">"
				getLocalParam += "LightsDialog.rdo_lsLightsMaskType.state = " + LightsDialog.rdo_lsLightsMaskType.state as string + ">"
				getLocalParam += "LightsDialog.rdo_lsLightsMaskType.enabled = " + LightsDialog.rdo_lsLightsMaskType.enabled as string + ">"
				getLocalParam += "LightsDialog.chk_lsGI.state = " + LightsDialog.chk_lsGI.state as string + ">"
				getLocalParam += "LightsDialog.chk_lsGI.enabled = " + LightsDialog.chk_lsGI.enabled as string + ">"
				getLocalParam += "LightsDialog.chk_lsColorMapping.state = " + LightsDialog.chk_lsColorMapping.state as string + ">"
				getLocalParam += "LightsDialog.chk_lsColorMapping.enabled = " + LightsDialog.chk_lsColorMapping.enabled as string + ">"
				getLocalParam += "LightsDialog.chk_lsPhysicalcam.state = " + LightsDialog.chk_lsPhysicalcam.state as string + ">"
				getLocalParam += "LightsDialog.chk_lsPhysicalcam.enabled = " + LightsDialog.chk_lsPhysicalcam.enabled as string + ">"

				StateTXT = ("6||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- ObjectsID
			7:
			(
				getLocalParam = "ObjectsIDDialog.mlb_idObjectsIDList.selection = " + ObjectsIDDialog.mlb_idObjectsIDList.selection as string + ">"

				StateTXT = ("7||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- SSS
			8:
			(
				getLocalParam = "SSSDialog.spn_sssRate.value = " + SSSDialog.spn_sssRate.value as string + ">"
				getLocalParam += "SSSDialog.spn_sssScale.value = " + SSSDialog.spn_sssScale.value as string + ">"
				getLocalParam += "SSSDialog.clr_sssColor.color.r = " + SSSDialog.clr_sssColor.color.r as string + ">"
				getLocalParam += "SSSDialog.clr_sssColor.color.g = " + SSSDialog.clr_sssColor.color.g as string + ">"
				getLocalParam += "SSSDialog.clr_sssColor.color.b = " + SSSDialog.clr_sssColor.color.b as string + ">"
				getLocalParam += "SSSDialog.spn_sssRadius.value = " + SSSDialog.spn_sssRadius.value as string + ">"
				getLocalParam += "SSSDialog.ddl_sssScatter.selection = " + SSSDialog.ddl_sssScatter.selection as string + ">"
				getLocalParam += "SSSDialog.spn_sssSubdiv.value = " + SSSDialog.spn_sssSubdiv.value as string + ">"
				getLocalParam += "SSSDialog.chk_sssFronLight.state = " + SSSDialog.chk_sssFronLight.state as string + ">"
				getLocalParam += "SSSDialog.chk_sssBackLight.state = " + SSSDialog.chk_sssBackLight.state as string + ">"
				getLocalParam += "SSSDialog.chk_sssLightOnly.state = " + SSSDialog.chk_sssLightOnly.state as string + ">"
				getLocalParam += "SSSDialog.chk_sssShowPrepass.state = " + SSSDialog.chk_sssShowPrepass.state as string + ">"
				getLocalParam += "SSSDialog.spn_sssGamma.value = " + SSSDialog.spn_sssGamma.value as string + ">"
				getLocalParam += "SSSDialog.spn_sssLightMultiplier.value = " + SSSDialog.spn_sssLightMultiplier.value as string + ">"
				getLocalParam += "SSSDialog.mlb_sssLightList.selection = " + SSSDialog.mlb_sssLightList.selection as string + ">"

				StateTXT = ("8||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- Texture
			9:
			(
				-- getLocalParam += "TextureDialog.btn_texTextureMap.value = " + TextureDialog.btn_texTextureMap.value as string + ">"
				getLocalParam = "TextureDialog.clr_texColor.color.r = " + TextureDialog.clr_texColor.color.r as string + ">"
				getLocalParam += "TextureDialog.clr_texColor.color.g = " + TextureDialog.clr_texColor.color.g as string + ">"
				getLocalParam += "TextureDialog.clr_texColor.color.b = " + TextureDialog.clr_texColor.color.b as string + ">"
				getLocalParam += "TextureDialog.chk_texColorMapping.state = " + TextureDialog.chk_texColorMapping.state as string + ">"

				StateTXT = ("9||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- AO
			10:
			(
				getLocalParam = "AmbientDialog.spn_aoRadius.value = " + AmbientDialog.spn_aoRadius.value as string + ">"
				getLocalParam += "AmbientDialog.spn_aoSubdiv.value = " + AmbientDialog.spn_aoSubdiv.value as string + ">"
				getLocalParam += "AmbientDialog.chk_aoInvert.state = " + AmbientDialog.chk_aoInvert.state as string + ">"
				getLocalParam += "AmbientDialog.chk_aoGamma.state = " + AmbientDialog.chk_aoGamma.state as string + ">"

				StateTXT = ("10||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- ZDepth
			11:
			(
				getLocalParam = "ZDialog.chk_zInvert.state = " + ZDialog.chk_zInvert.state as string + ">"
				getLocalParam += "ZDialog.chk_zAA.state = " + ZDialog.chk_zAA.state as string + ">"
				getLocalParam += "ZDialog.spn_zNear.value = " + ZDialog.spn_zNear.value as string + ">"
				getLocalParam += "ZDialog.spn_zFar.value = " + ZDialog.spn_zFar.value as string + ">"

				StateTXT = ("11||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- Specular
			12:
			(
				getLocalParam = "SpecularDialog.spn_spLevel.value = " + SpecularDialog.spn_spLevel.value as string + ">"
				getLocalParam += "SpecularDialog.spn_spGlossy.value = " + SpecularDialog.spn_spGlossy.value as string + ">"
				getLocalParam += "SpecularDialog.chk_spColorMapping.state = " + SpecularDialog.chk_spColorMapping.state as string + ">"
				getLocalParam += "SpecularDialog.chk_spRGBLights.state = " + SpecularDialog.chk_spRGBLights.state as string + ">"
				getLocalParam += "SpecularDialog.spn_spLightMultiplier.value = " + SpecularDialog.spn_spLightMultiplier.value as string + ">"
				getLocalParam += "SpecularDialog.mlb_spLightList.selection = " + SpecularDialog.mlb_spLightList.selection as string + ">"

				StateTXT = ("12||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- LumaRGB
			13:
			(
				getLocalParam = " "
				StateTXT = ("13||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
			-- Refraction
			14:
			(
				getLocalParam = " "
				StateTXT = ("14||" + getGlobalParam + "||" + getLocalParam + "||" + savepath + "||")
				-- add objects
				for i in selection do StateTXT += i.name + ","
				StateTXT += "||"
			)
		)
	)


-------------------------------------------------------------------------------------------------------------------
--- Rollouts Start
-------------------------------------------------------------------------------------------------------------------

	-- Rollout WireColor
	-----------------------
	rollout WirecolorDialog "" width:160 height:312
	(
		GroupBox rgb_grp "RGB" pos:[8,0] width:144 height:88
		GroupBox random_grp "" pos:[8,264] width:144 height:40
		GroupBox select_grp "" pos:[8,176] width:144 height:88
		groupBox cmyk_grp "CMYK" pos:[8,88] width:144 height:88

		button red_wire_btn "Assign" pos:[16,16] width:56 height:16
		button green_wire_btn "Assign" pos:[16,40] width:56 height:16
		button blue_wire_btn "Assign" pos:[16,64] width:56 height:16
		button magenta_wire_btn "Assign" pos:[16,152] width:56 height:16
		button yellow_wire_btn "Assign" pos:[16,104] width:56 height:16
		button cyan_wire_btn "Assign" pos:[16,128] width:56 height:16

		button select_rgb_color "Select RGB" pos:[16,194] width:128 height:16
		button random_color_btn "Random" pos:[16,280] width:128 height:16
		button select_cmyk_color "Select CMYK" pos:[16,216] width:128 height:16
		button select_rgb_cmyk_color "Select RGB and CMYK" pos:[16,240] width:128 height:16

		colorPicker yellow_color_clr "" pos:[80,104] width:56 height:16 color:(color 255 255 0)
		colorPicker cyan_color_clr "" pos:[80,128] width:56 height:16 color:(color 0 255 255)
		colorPicker magenta_color_clr "" pos:[80,152] width:56 height:16 color:(color 255 0 255)
		colorPicker red_color_clr "" pos:[80,16] width:56 height:16 color:(color 255 0 0)
		colorPicker green_color_clr "" pos:[80,40] width:56 height:16 color:(color 0 0 255)
		colorPicker blue_color_clr "" pos:[80,64] width:56 height:16 color:(color 0 255 0)

		on red_wire_btn pressed do if selection.count != 0 then $.wirecolor = red_color_clr.color
		on green_wire_btn pressed do if selection.count != 0 then $.wirecolor = green_color_clr.color
		on blue_wire_btn pressed do if selection.count != 0 then $.wirecolor = blue_color_clr.color
		on magenta_wire_btn pressed do if selection.count != 0 then $.wirecolor = magenta_color_clr.color
		on yellow_wire_btn pressed do if selection.count != 0 then $.wirecolor = yellow_color_clr.color
		on cyan_wire_btn pressed do if selection.count != 0 then $.wirecolor = cyan_color_clr.color
		on select_rgb_color pressed do
		(
			clearSelection()
			local selection_array_mask = #()
			for i in geometry where i.wirecolor == blue or i.wirecolor == red or i.wirecolor == green do append selection_array_mask i
			select selection_array_mask
		)
		on random_color_btn pressed do
		(
			if selection.count != 0 then
			(
				for i in selection do i.wirecolor = random white black
			)
		)
		on select_cmyk_color pressed do
		(
			clearSelection()
			local selection_array_mask = #()
			for i in geometry where i.wirecolor == (color 0 255 255) or i.wirecolor == (color 255 255 0) or i.wirecolor == (color 255 0 255) do append selection_array_mask i
			select selection_array_mask
		)
		on select_rgb_cmyk_color pressed do
		(
			clearSelection()
			local selection_array_mask = #()
			for i in geometry where i.wirecolor == blue or i.wirecolor == red or i.wirecolor == green \
			or i.wirecolor == (color 0 255 255) or i.wirecolor == (color 255 255 0) or i.wirecolor == (color 255 0 255) do append selection_array_mask i
			select selection_array_mask
		)
	)

	-- Rollout State
	-----------------------
	rollout StateDialog "StateDialog" width:200
	(
		label lbl_SD "Mask State"
		Group "State List: "
		(
			listbox lb_StateList "" items:#("Luminance") selection:0
			edittext edt_RenameText "" width:120 across:2 align:#left
			button btn_RenameState "Rename" width:50 height:16 offset:[20,0]
			button btn_stateRefreshList "Refresh" width:170 height:16

		)
		Group "Options: "
		(
			checkbutton chb_SelectStateObjects "Select Objects State" checked:true width:170
			button btn_RemoveState "Remove State" width:170
		)

		on StateDialog open do
		(
			lb_StateList.items = StateArray()
		)

		on btn_stateRefreshList pressed do
		(
			lb_StateList.items = StateArray()
		)

		on btn_RenameState pressed do
		(
			if lb_StateList.selection != 0 then
			(
				if edt_RenameText.text != "" then
				(
					local theStateValue = (fileProperties.getPropertyValue #custom lb_StateList.selection)
					fileProperties.deleteProperty #custom ("RenderMaskState|" + lb_StateList.selected)
					fileProperties.addProperty #custom ("RenderMaskState|" + edt_RenameText.text) theStateValue
					lb_StateList.items = StateArray()
				)
			)
		)

		on lb_StateList selected sel do
		(
			edt_RenameText.text = lb_StateList.selected
		)

		-- select state double click
		on lb_StateList doubleClicked sel do
		(
			if lb_StateList.selection != 0 then
			(
				RenderMaskDialog.chb_CreateState.state = false
				local ObjList = #()
 				local theParam = (fileProperties.getPropertyValue #custom (fileProperties.findProperty #custom ("RenderMaskState|" + lb_StateList.selected)))

				-- Select Objects
				if chb_SelectStateObjects.state == true then
				(
					if (filterstring theParam "||")[5] != undefined then
					(
						for o in (filterstring (filterstring theParam "||")[5] ",") do
						(
							if (getnodebyname o) != undefined then append ObjList (getnodebyname o)
						)
						ClearSelection()
						select ObjList
					)
				)

				-- CreateDialogs
				if (filterstring theParam "||")[1] != undefined then
				(
					CreateMaskDialog ((filterstring theParam "||")[1] as integer)
				)
-- 				sleep 1

				-- Global Parameters
				if  ((filterstring theParam "||")[2]) != undefined then
				(
					for i in (filterstring (filterstring theParam "||")[2] ">") do
					(
						case (filterstring i " = ")[1] of
						(
							"RenderMaskDialog.rdo_MaskTimeRange.state": (RenderMaskDialog.rdo_MaskTimeRange.state = execute (filterstring i " = ")[2])
							"RenderMaskDialog.rdo_MaskTimeRange.enabled": (RenderMaskDialog.rdo_MaskTimeRange.enabled = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_SaveMaxFile.state": (RenderMaskDialog.chk_SaveMaxFile.state = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_SaveMaxFile.enabled": (RenderMaskDialog.chk_SaveMaxFile.enabled = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_SingleFrame.state": (RenderMaskDialog.chk_SingleFrame.state = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_SingleFrame.enabled": (RenderMaskDialog.chk_SingleFrame.enabled = execute (filterstring i " = ")[2])
							"RenderMaskDialog.rdo_MaskType.state": (RenderMaskDialog.rdo_MaskType.state = execute (filterstring i " = ")[2])
							"RenderMaskDialog.rdo_MaskType.enabled": (RenderMaskDialog.rdo_MaskType.enabled = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_SubmitBackburner.state": (RenderMaskDialog.chk_SubmitBackburner.state = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_SubmitBackburner.enabled": (RenderMaskDialog.chk_SubmitBackburner.enabled = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_SubmitDeadline.state":
							(
								RenderMaskDialog.chk_SubmitDeadline.state = execute (filterstring i " = ")[2]
								if RenderMaskDialog.chk_SubmitDeadline.state == true then
								(
									try(createdialog DeadlineDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) - 200,(GetDialogPos RenderMaskDialog).y + DeadlineDialogOffsetY])catch()
								)
								else
								(
									try(destroydialog DeadlineDialog)catch()
									try(destroydialog DeadlineLimitsDialog)catch()
								)
							)
							"RenderMaskDialog.chk_SubmitDeadline.enabled": (RenderMaskDialog.chk_SubmitDeadline.enabled = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_AA.state": (RenderMaskDialog.chk_AA.state = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_AA.enabled": (RenderMaskDialog.chk_AA.enabled = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_KeepOpacity.state": (RenderMaskDialog.chk_KeepOpacity.state = execute (filterstring i " = ")[2])
							"RenderMaskDialog.chk_KeepOpacity.enabled": (RenderMaskDialog.chk_KeepOpacity.enabled = execute (filterstring i " = ")[2])
						)
					)
				)
				-- Local Parameters
				if  ((filterstring theParam "||")[3]) != undefined then
				(
					for i in (filterstring (filterstring theParam "||")[3] ">") do
					(
						case (filterstring i " = ")[1] of
						(
							-- MaterialID
							"MaterialIDDialog.rdo_MaterialIDType.state": (MaterialIDDialog.rdo_MaterialIDType.state = execute (filterstring i " = ")[2])
							"MaterialIDDialog.mlb_MaterialIDSelection.selection": (MaterialIDDialog.mlb_MaterialIDSelection.selection = execute (filterstring i " = ")[2])
							-- Reflection
							"ReflectionDialog.rdo_refReflectionType.state": (ReflectionDialog.rdo_refReflectionType.state = execute (filterstring i " = ")[2])
							"ReflectionDialog.rdo_refReflectionType.enabled": (ReflectionDialog.rdo_refReflectionType.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refGlossy.value": (ReflectionDialog.spn_refGlossy.value = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refGlossy.enabled": (ReflectionDialog.spn_refGlossy.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refGlossySubdiv.value": (ReflectionDialog.spn_refGlossySubdiv.value = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refGlossySubdiv.enabled": (ReflectionDialog.spn_refGlossySubdiv.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refFalloff.value": (ReflectionDialog.spn_refFalloff.value = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refFalloff.enabled": (ReflectionDialog.spn_refFalloff.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.chk_refUseFalloff.state": (ReflectionDialog.chk_refUseFalloff.state = execute (filterstring i " = ")[2])
							"ReflectionDialog.chk_refUseFalloff.enabled": (ReflectionDialog.chk_refUseFalloff.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refEnvMultiplier.value": (ReflectionDialog.spn_refEnvMultiplier.value = execute (filterstring i " = ")[2])
							"ReflectionDialog.spn_refEnvMultiplier.enabled": (ReflectionDialog.spn_refEnvMultiplier.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.rdo_refEnvType.state": (ReflectionDialog.rdo_refEnvType.state = execute (filterstring i " = ")[2])
							"ReflectionDialog.rdo_refEnvType.enabled": (ReflectionDialog.rdo_refEnvType.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.chk_refActiveMtlSlot.state": (ReflectionDialog.chk_refActiveMtlSlot.state = execute (filterstring i " = ")[2])
							"ReflectionDialog.chk_refActiveMtlSlot.enabled": (ReflectionDialog.chk_refActiveMtlSlot.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.clr_refEnvColor.color.r": (ReflectionDialog.clr_refEnvColor.color.r = execute (filterstring i " = ")[2])
							"ReflectionDialog.clr_refEnvColor.color.g": (ReflectionDialog.clr_refEnvColor.color.g = execute (filterstring i " = ")[2])
							"ReflectionDialog.clr_refEnvColor.color.b": (ReflectionDialog.clr_refEnvColor.color.b = execute (filterstring i " = ")[2])
							"ReflectionDialog.clr_refEnvColor.enabled": (ReflectionDialog.clr_refEnvColor.enabled = execute (filterstring i " = ")[2])
							"ReflectionDialog.mbt_refHDRIMap.enabled": (ReflectionDialog.mbt_refHDRIMap.enabled = execute (filterstring i " = ")[2])
							-- Vector
							"VectorDialog.ddl_vecSamplerType.selection": (VectorDialog.ddl_vecSamplerType.selection = execute (filterstring i " = ")[2])
							"VectorDialog.ddl_vecSamplerType.enabled": (VectorDialog.ddl_vecSamplerType.enabled = execute (filterstring i " = ")[2])
							"VectorDialog.spn_vecPointMultiplier.value": (VectorDialog.spn_vecPointMultiplier.value = execute (filterstring i " = ")[2])
							"VectorDialog.spn_vecPointMultiplier.enabled": (VectorDialog.spn_vecPointMultiplier.enabled = execute (filterstring i " = ")[2])
							"VectorDialog.spn_vecRefractionIOR.value": (VectorDialog.spn_vecRefractionIOR.value = execute (filterstring i " = ")[2])
							"VectorDialog.spn_vecRefractionIOR.enabled": (VectorDialog.spn_vecRefractionIOR.enabled = execute (filterstring i " = ")[2])
							"VectorDialog.spn_vecUVWChannel.value": (VectorDialog.spn_vecUVWChannel.value = execute (filterstring i " = ")[2])
							"VectorDialog.spn_vecUVWChannel.enabled": (VectorDialog.spn_vecUVWChannel.enabled = execute (filterstring i " = ")[2])
							"VectorDialog.ddl_vecCoordSys.selection": (VectorDialog.ddl_vecCoordSys.selection = execute (filterstring i " = ")[2])
							"VectorDialog.ddl_vecCoordSys.enabled": (VectorDialog.ddl_vecCoordSys.enabled = execute (filterstring i " = ")[2])
							"VectorDialog.pbt_vecRelativeNode.enabled": (VectorDialog.ddl_vecCoordSys.enabled = execute (filterstring i " = ")[2])
							"VectorDialog.ddl_vecOutput.selection": (VectorDialog.ddl_vecOutput.selection = execute (filterstring i " = ")[2])
							"VectorDialog.ddl_vecOutput.enabled": (VectorDialog.ddl_vecOutput.enabled = execute (filterstring i " = ")[2])
							-- Lights
							"LightsDialog.rdo_lsSwitchLightShadow.state": (LightsDialog.rdo_lsSwitchLightShadow.state = execute (filterstring i " = ")[2])
							"LightsDialog.rdo_lsSwitchLightShadow.enabled": (LightsDialog.rdo_lsSwitchLightShadow.enabled = execute (filterstring i " = ")[2])
							"LightsDialog.spn_lsLightsMultiplier.value": (LightsDialog.spn_lsLightsMultiplier.value = execute (filterstring i " = ")[2])
							"LightsDialog.spn_lsLightsMultiplier.enabled": (LightsDialog.spn_lsLightsMultiplier.enabled = execute (filterstring i " = ")[2])
							"LightsDialog.mlb_lsLightsList.selection": (LightsDialog.mlb_lsLightsList.selection = execute (filterstring i " = ")[2])
							"LightsDialog.mlb_lsLightsList.enabled": (LightsDialog.mlb_lsLightsList.enabled = execute (filterstring i " = ")[2])
							"LightsDialog.rdo_lsLightsMaskType.state": (LightsDialog.rdo_lsLightsMaskType.state = execute (filterstring i " = ")[2])
							"LightsDialog.rdo_lsLightsMaskType.enabled": (LightsDialog.rdo_lsLightsMaskType.enabled = execute (filterstring i " = ")[2])
							"LightsDialog.chk_lsGI.state": (LightsDialog.chk_lsGI.state = execute (filterstring i " = ")[2])
							"LightsDialog.chk_lsGI.enabled": (LightsDialog.chk_lsGI.enabled = execute (filterstring i " = ")[2])
							"LightsDialog.chk_lsColorMapping.state": (LightsDialog.chk_lsColorMapping.state = execute (filterstring i " = ")[2])
							"LightsDialog.chk_lsColorMapping.enabled": (LightsDialog.chk_lsColorMapping.enabled = execute (filterstring i " = ")[2])
							"LightsDialog.chk_lsPhysicalcam.state": (LightsDialog.chk_lsPhysicalcam.state = execute (filterstring i " = ")[2])
							"LightsDialog.chk_lsPhysicalcam.enabled": (LightsDialog.chk_lsPhysicalcam.enabled = execute (filterstring i " = ")[2])
							-- ObjectsID
							"ObjectsIDDialog.mlb_idObjectsIDList.selection": (ObjectsIDDialog.mlb_idObjectsIDList.selection = execute (filterstring i " = ")[2])
							-- SSS
							"SSSDialog.spn_sssRate.value": (SSSDialog.spn_sssRate.value = execute (filterstring i " = ")[2])
							"SSSDialog.spn_sssScale.value": (SSSDialog.spn_sssScale.value = execute (filterstring i " = ")[2])
							"SSSDialog.clr_sssColor.color.r": (SSSDialog.clr_sssColor.color.r = execute (filterstring i " = ")[2])
							"SSSDialog.clr_sssColor.color.g": (SSSDialog.clr_sssColor.color.g = execute (filterstring i " = ")[2])
							"SSSDialog.clr_sssColor.color.b": (SSSDialog.clr_sssColor.color.b = execute (filterstring i " = ")[2])
							"SSSDialog.spn_sssRadius.value": (SSSDialog.spn_sssRadius.value = execute (filterstring i " = ")[2])
							"SSSDialog.ddl_sssScatter.selection": (SSSDialog.ddl_sssScatter.selection = execute (filterstring i " = ")[2])
							"SSSDialog.spn_sssSubdiv.value": (SSSDialog.spn_sssSubdiv.value = execute (filterstring i " = ")[2])
							"SSSDialog.chk_sssFronLight.state": (SSSDialog.chk_sssFronLight.state = execute (filterstring i " = ")[2])
							"SSSDialog.chk_sssBackLight.state": (SSSDialog.chk_sssBackLight.state = execute (filterstring i " = ")[2])
							"SSSDialog.chk_sssLightOnly.state": (SSSDialog.chk_sssLightOnly.state = execute (filterstring i " = ")[2])
							"SSSDialog.chk_sssShowPrepass.state": (SSSDialog.chk_sssShowPrepass.state = execute (filterstring i " = ")[2])
							"SSSDialog.spn_sssGamma.value": (SSSDialog.spn_sssGamma.value = execute (filterstring i " = ")[2])
							"SSSDialog.spn_sssLightMultiplier.value": (SSSDialog.spn_sssLightMultiplier.value = execute (filterstring i " = ")[2])
							"SSSDialog.mlb_sssLightList.selection": (SSSDialog.mlb_sssLightList.selection = execute (filterstring i " = ")[2])
							-- Texture
							"TextureDialog.clr_texColor.color.r": (TextureDialog.clr_texColor.color.r = execute (filterstring i " = ")[2])
							"TextureDialog.clr_texColor.color.g": (TextureDialog.clr_texColor.color.g = execute (filterstring i " = ")[2])
							"TextureDialog.clr_texColor.color.b": (TextureDialog.clr_texColor.color.b = execute (filterstring i " = ")[2])
							"TextureDialog.chk_texColorMapping.state": (TextureDialog.chk_texColorMapping.state = execute (filterstring i " = ")[2])
							-- Ambient
							"AmbientDialog.spn_aoRadius.value": (AmbientDialog.spn_aoRadius.value = execute (filterstring i " = ")[2])
							"AmbientDialog.spn_aoSubdiv.value": (AmbientDialog.spn_aoSubdiv.value = execute (filterstring i " = ")[2])
							"AmbientDialog.chk_aoInvert.state": (AmbientDialog.chk_aoInvert.state = execute (filterstring i " = ")[2])
							"AmbientDialog.chk_aoGamma.state": (AmbientDialog.chk_aoGamma.state = execute (filterstring i " = ")[2])
							-- Z
							"ZDialog.chk_zInvert.state": (ZDialog.chk_zInvert.state = execute (filterstring i " = ")[2])
							"ZDialog.chk_zAA.state": (ZDialog.chk_zAA.state = execute (filterstring i " = ")[2])
							"ZDialog.spn_zNear.value": (ZDialog.spn_zNear.value = execute (filterstring i " = ")[2])
							"ZDialog.spn_zFar.value": (ZDialog.spn_zFar.value = execute (filterstring i " = ")[2])
							-- Specular
							"SpecularDialog.spn_spLevel.value": (SpecularDialog.spn_spLevel.value = execute (filterstring i " = ")[2])
							"SpecularDialog.spn_spGlossy.value": (SpecularDialog.spn_spGlossy.value = execute (filterstring i " = ")[2])
							"SpecularDialog.chk_spColorMapping.state": (SpecularDialog.chk_spColorMapping.state = execute (filterstring i " = ")[2])
							"SpecularDialog.chk_spRGBLights.state": (SpecularDialog.chk_spRGBLights.state = execute (filterstring i " = ")[2])
							"SpecularDialog.spn_spLightMultiplier.value": (SpecularDialog.spn_spLightMultiplier.value = execute (filterstring i " = ")[2])
							"SpecularDialog.mlb_spLightList.selection": (SpecularDialog.mlb_spLightList.selection = execute (filterstring i " = ")[2])
						)
					)
				)
				-- Save Path
				if (filterstring theParam "||")[4] != undefined then
				(
					setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "file_name" (filterstring theParam "||")[4]
				)
			)
		)
		on btn_RemoveState pressed do
		(
			if lb_StateList.selection != 0 then
			(
 				fileProperties.deleteProperty #custom ("RenderMaskState|" + lb_StateList.selected)
 				lb_StateList.items = StateArray()
			)
		)
	)

	-- Rollout MaterialIDMask
	--------------------------
	rollout MaterialIDDialog "MaterialID Mask" width:180
	(

		Group "MaterialID Parameter"
		(
			radiobuttons rdo_MaterialIDType "" labels:#("Only Selected Object", "All Object Using This Material") columns:1 align:#left
			multiListBox mlb_MaterialIDSelection "" width:100 height:7 selection:0
		)
		on MaterialIDDialog open do
		(
			local get_material_id_list = #()
			for i = 1 to $.material.materialIDList.count do
			(
				append get_material_id_list ($.material.materialIDList[i] as string)
			)
			mlb_MaterialIDSelection.items = get_material_id_list
		)
	)


	-- Rollout ReflectionMask
	--------------------------
	rollout ReflectionDialog "Reflection Mask" width:220
	(
		Group "Type"
		(
			radiobuttons rdo_refReflectionType "" labels:#("Environment", "Objects")
		)
		Group "Reflection Parameters"
		(
			spinner spn_refGlossy "Glossy: " align:#left range:[0, 1, 1] scale:0.01 across:2
			spinner spn_refGlossySubdiv "Subdivs: " align:#left range:[1, 1000, 8] scale:1 type:#integer
			spinner spn_refFalloff "   IOR: " align:#left range:[0, 100, 1.6] scale:0.1 offset:[3,0] width:66 fieldWidth:39 across:2
			checkbox chk_refUseFalloff "Use Falloff Ref." checked:true
			spinner spn_refEnvMultiplier "Environment Multiplier: " align:#left range:[1,10,1] scale:0.1 type:#float fieldWidth:45
		)
		Group "Environment Type"
		(
			radiobuttons rdo_refEnvType "" labels:#("Solid Colors", "HDRI/Maps")
			mapbutton mbt_refHDRIMap ":: none ::" border:true width:150
			button btn_refEditHDRIMap "Edit TextureMap" height:16 width:150
			checkbox chk_refActiveMtlSlot "ActiveMtlSlot"
			colorpicker clr_refEnvColor "Environment Color" width:175 color:white
		)
		on ReflectionDialog open do
		(
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_type") != "" then \
			(rdo_refReflectionType.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_type") as integer) else (rdo_refReflectionType.state = 1)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_glossy") != "" then \
			(spn_refGlossy.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_glossy") as float) else (spn_refGlossy.value = 1.0)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_subdivs") != "" then \
			(spn_refGlossySubdiv.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_subdivs") as integer) else (spn_refGlossySubdiv.value = 8)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_ior") != "" then \
			(spn_refFalloff.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_ior") as float) else (spn_refFalloff.value = 1.6)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_falloff") != "" then \
			(chk_refUseFalloff.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_falloff") as booleanClass) else (chk_refUseFalloff.state = true)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_multi") != "" then \
			(spn_refEnvMultiplier.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_multi") as float) else (spn_refEnvMultiplier.value = 1.0)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_type") != "" then \
			(rdo_refEnvType.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_type") as integer) else (rdo_refEnvType.state = 1)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_color") != "" then
			(
				getINIval = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_color")
				clr_refEnvColor.color = (color ((filterstring getINIval "[ , ]")[1] as float) ((filterstring getINIval "[ , ]")[2] as float) ((filterstring getINIval "[ , ]")[3] as float))
			)
			else
			(
				(clr_refEnvColor.color = white)
			)

			if chk_refUseFalloff.state == false then spn_refFalloff.enabled = false

			case rdo_refReflectionType.state of
			(
				1:
				(
					rdo_refEnvType.enabled = true
					case rdo_refEnvType.state of
					(
						1:
						(
							clr_refEnvColor.enabled = true
							mbt_refHDRIMap.enabled = false
							btn_refEditHDRIMap.enabled = false
							chk_refActiveMtlSlot.enabled = false
						)
						2:
						(
							clr_refEnvColor.enabled = false
							mbt_refHDRIMap.enabled = true
							btn_refEditHDRIMap.enabled = true
							chk_refActiveMtlSlot.enabled = true
						)
					)
				)
				2:
				(
					rdo_refEnvType.enabled = false
					clr_refEnvColor.enabled = false
					mbt_refHDRIMap.enabled = false
					btn_refEditHDRIMap.enabled = false
					chk_refActiveMtlSlot.enabled = false
				)
			)

			if getReflectionMask != undefined then
			(
				mbt_refHDRIMap.text = getReflectionMask as string
			)
		)
		on ReflectionDialog close do
		(
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_type" (rdo_refReflectionType.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_glossy" (spn_refGlossy.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_subdivs" (spn_refGlossySubdiv.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_ior" (spn_refFalloff.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_falloff" (chk_refUseFalloff.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_multi" (spn_refEnvMultiplier.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_type" (rdo_refEnvType.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ref_env_color" ((clr_refEnvColor.color as point3) as string)
		)

		on rdo_refEnvType changed state do
		(
			case state of
			(
				1:
				(
					clr_refEnvColor.enabled = true
					mbt_refHDRIMap.enabled = false
					btn_refEditHDRIMap.enabled = false
					chk_refActiveMtlSlot.enabled = false
				)
				2:
				(
					clr_refEnvColor.enabled = false
					mbt_refHDRIMap.enabled = true
					btn_refEditHDRIMap.enabled = true
					chk_refActiveMtlSlot.enabled = true
				)
			)
		)
		on rdo_refReflectionType changed state do
		(
			case state of
			(
				1:
				(
					rdo_refEnvType.enabled = true
					case rdo_refEnvType.state of
					(
						1:
						(
							clr_refEnvColor.enabled = true
							mbt_refHDRIMap.enabled = false
							btn_refEditHDRIMap.enabled = false
							chk_refActiveMtlSlot.enabled = false
						)
						2:
						(
							clr_refEnvColor.enabled = false
							mbt_refHDRIMap.enabled = true
							btn_refEditHDRIMap.enabled = true
							chk_refActiveMtlSlot.enabled = true
						)
					)
				)
				2:
				(
					rdo_refEnvType.enabled = false
					clr_refEnvColor.enabled = false
					mbt_refHDRIMap.enabled = false
					btn_refEditHDRIMap.enabled = false
					chk_refActiveMtlSlot.enabled = false
				)
			)
		)
		on chk_refUseFalloff changed state do
		(
			if chk_refUseFalloff.state == true then
			(
				spn_refFalloff.enabled = true
			)
			else
			(
				spn_refFalloff.enabled = false
			)
		)

		on mbt_refHDRIMap picked texmap do
		(
			mbt_refHDRIMap.text = texmap as string
			getReflectionMask = texmap
		)

		on btn_refEditHDRIMap pressed do
		(
			if getReflectionMask != undefined then
			(
				if MatEditor.isOpen() == false then MatEditor.Open()

				if chk_refActiveMtlSlot.state == true then
				(
					meditmaterials[medit.GetActiveMtlSlot()] = getReflectionMask
					activeMeditSlot = medit.GetActiveMtlSlot()
				)
				else
				(
					meditmaterials[24] = getReflectionMask
					activeMeditSlot = 24
				)
			)
		)
	)

	-- Rollout Vectors
	-----------------------
	rollout VectorDialog "" width:240
	(
		Group ""
		(
			label lbl_vecSamplerType "type ....................." across:2 align:#left
			dropdownlist ddl_vecSamplerType "" width:120 align:#left offset:[-12,0] items:#("Point","Normal vector","Reflection vector","Refraction vector","UVW coordinates") selection:3
			label lbl_vecPointMultiplier "point multiplier ......................" align:#left across:2
			spinner spn_vecPointMultiplier "" range:[0,99999,1] type:#float scale:0.01 fieldWidth:60
			label lbl_vecRefractionIOR "refract ior ............................." align:#left across:2
			spinner spn_vecRefractionIOR "" range:[0,100,1.6] type:#float scale:0.1 fieldWidth:60
			label lbl_vecUVWChannel "uvw channel ........................" align:#left across:2
			spinner spn_vecUVWChannel "" range:[0,99,1] type:#integer scale:1 fieldWidth:60
			label lbl_vecCoordSys "coord system ......." align:#left across:2
			dropdownlist ddl_vecCoordSys "" width:120 align:#left offset:[-12,0] items:#("World", "Object", "Camera", "Relative")
			label ldl_vecRelativeNode "relative node ......." align:#left across:2
			pickbutton pbt_vecRelativeNode "None" width:120 height:16 offset:[-6,0]
			label lbl_vecOutput "output ................." align:#left across:2
			dropdownlist ddl_vecOutput "" width:120 align:#left offset:[-12,0] items:#("Vector (signed)", "Color (unsigned)") selection:2
		)

		on VectorDialog open do
		(
			spn_vecPointMultiplier.enabled = true
			spn_vecRefractionIOR.enabled = false
			spn_vecUVWChannel.enabled = false
			ddl_vecCoordSys.enabled = true
			pbt_vecRelativeNode.enabled = false
			ddl_vecOutput.enabled = true
		)

		on ddl_vecSamplerType selected sel do
		(
			case sel of
			(
				1:
				(
					spn_vecPointMultiplier.enabled = true
					spn_vecRefractionIOR.enabled = false
					spn_vecUVWChannel.enabled = false
					ddl_vecCoordSys.enabled = true
					pbt_vecRelativeNode.enabled = false
					ddl_vecOutput.enabled = false
				)
				2:
				(
					spn_vecPointMultiplier.enabled =false
					spn_vecRefractionIOR.enabled = false
					spn_vecUVWChannel.enabled = false
					ddl_vecCoordSys.enabled = true
					pbt_vecRelativeNode.enabled = false
					ddl_vecOutput.enabled = true
				)
				3:
				(
					spn_vecPointMultiplier.enabled =false
					spn_vecRefractionIOR.enabled = false
					spn_vecUVWChannel.enabled = false
					ddl_vecCoordSys.enabled = true
					pbt_vecRelativeNode.enabled = false
					ddl_vecOutput.enabled = true
				)
				4:
				(
					spn_vecPointMultiplier.enabled =false
					spn_vecRefractionIOR.enabled = true
					spn_vecUVWChannel.enabled = false
					ddl_vecCoordSys.enabled = true
					pbt_vecRelativeNode.enabled = false
					ddl_vecOutput.enabled = true
				)
				5:
				(
					spn_vecPointMultiplier.enabled =false
					spn_vecRefractionIOR.enabled = false
					spn_vecUVWChannel.enabled = true
					ddl_vecCoordSys.enabled = false
					pbt_vecRelativeNode.enabled = true
					ddl_vecOutput.enabled = false
				)
			)
		)
		on ddl_vecCoordSys selected sel do
		(
			case sel of
			(
				1:
				(
					pbt_vecRelativeNode.enabled = false
				)
				2:
				(
					pbt_vecRelativeNode.enabled = false
				)
				3:
				(
					pbt_vecRelativeNode.enabled = false
				)
				4:
				(
					pbt_vecRelativeNode.enabled = true
				)
			)
		)

		on pbt_vecRelativeNode picked obj do
		(
			if obj != undefined then
			(
				VectorRelativeNode = obj
				pbt_vecRelativeNode.caption = obj.name
			)
		)
	)

	-- Rollout Lights
	-----------------------
	rollout LightsDialog "" width:220
	(
		group "Light/Shadow"
		(
			radiobuttons rdo_lsSwitchLightShadow "" labels:#("Light Mask", "Shadow Mask")
		)
		group ""
		(
			spinner spn_lsLightsMultiplier "lights mutiplier: " range:[0.001,100.0,1.0] type:#float scale:0.1 fieldWidth:50
			multiListBox mlb_lsLightsList "" selection:0
			button btn_lsRefreshList "Refresh" width:190 height:16
			radiobuttons rdo_lsLightsMaskType "" labels:#("Luma", "RGB", "No Change")
		)
		group ""
		(
			checkbox chk_lsGI "GlobalIllumination"
			checkbox chk_lsColorMapping "Use Existing VrayColorMapping" checked:true
			checkbox chk_lsPhysicalcam "Use PhysicalCamera Parameters" checked:false tooltip:"If you use the VrayPhysicalCamera, use this option to avoid overexpose"
		)

		on LightsDialog open do
		(
			if (getinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_shadow_mask_type") != "" then \
			(rdo_lsSwitchLightShadow.state = (getinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_shadow_mask_type") as integer) else (rdo_lsSwitchLightShadow.state = 1)
			if (getinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_mask_type") != "" then \
			(rdo_lsLightsMaskType.state = (getinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_mask_type") as integer) else (rdo_lsLightsMaskType.state = 1)

			mlb_lsLightsList.items = getAllLights()

			if rdo_lsSwitchLightShadow.state == 1 then
			(

				chk_lsGI.enabled = true
				rdo_lsLightsMaskType.enabled = true
			)
			else
			(
				chk_lsGI.enabled = false
				rdo_lsLightsMaskType.enabled = false
				rdo_lsLightsMaskType.state = 1
			)

			if getCurrentRenderEngine() != "vray" then
			(
				chk_lsPhysicalcam.enabled = false
				chk_lsColorMapping.enabled = false
			)
		)

		on LightsDialog close do
		(
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_shadow_mask_type" (rdo_lsSwitchLightShadow.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "light_mask_type" (rdo_lsLightsMaskType.state as string)
		)

		on rdo_lsSwitchLightShadow changed state do
		(
			case rdo_lsSwitchLightShadow.state of
			(
				1:
				(
					chk_lsGI.enabled = true
					rdo_lsLightsMaskType.enabled = true
				)
				2:
				(
					chk_lsGI.enabled = false
					rdo_lsLightsMaskType.enabled = false
					rdo_lsLightsMaskType.state = 1
				)
			)
		)
		on btn_lsRefreshList pressed do
		(
			mlb_lsLightsList.items = getAllLights()
		)
	)

	-- Rollout ObjectsID
	-----------------------
	rollout ObjectsIDDialog "" width:150
	(
	    Group "ID's: "
		(
			multiListBox mlb_idObjectsIDList "" width:124 height:20
			button btn_idRefreshList "Refresh" width:124 height:16
		)

		on ObjectsIDDialog open do
		(
			mlb_idObjectsIDList.items = getIDArray()
		)

		on btn_idRefreshList pressed do
		(
			mlb_idObjectsIDList.items = getIDArray()
		)

		on mlb_idObjectsIDList selectionEnd do
		(
			local sel_objects_id = #()
			for i in (ObjectsIDDialog.mlb_idObjectsIDList.selection as array) do
			(
				for o in objects where (o.gbufferchannel == ObjectsIDDialog.mlb_idObjectsIDList.items[i] as integer) do
				(
					append sel_objects_id o
				)
			)
			clearSelection()
			select sel_objects_id
		)
	)

	-- Rollout SSS
	-----------------------
	rollout SSSDialog "" width:180
	(
		Group "General"
		(
			spinner spn_sssRate "rate: " range:[-100,100,0] type:#integer scale:1 fieldWidth:50
			spinner spn_sssScale "scale: " range:[0.0001,9000,3.0] type:#float scale:0.1 fieldWidth:50
		)
		Group "SSS"
		(
			colorpicker clr_sssColor "sss color: " color:white fieldWidth:50 align:#right
			spinner spn_sssRadius "scatter radius: " range:[0.0,9000,5.0] type:#float scale:0.1 fieldWidth:50
		)
		Group "Options"
		(
			dropdownlist ddl_sssScatter "single scatter: " items:#("Simple", "Reytraced (solid)", "Reytraced (refractive)") selection:1
			spinner spn_sssSubdiv "scatter subdivs: " range:[1,9000,8] type:#integer scale:1 fieldWidth:50
			checkbox chk_sssFronLight "front lighting" checked:true
			checkbox chk_sssBackLight "back lighting" checked:true
			checkbox chk_sssLightOnly "light only" checked:false tooltip:"Use it to separate \"SSS\" from \"Light\" in Compositing"
			checkbox chk_sssShowPrepass "show prepass" checked:false
		)
		Group "Lights"
		(
			spinner spn_sssGamma "gamma: " range:[0,100,2.2] type:#float scale:0.1 fieldWidth:50
			spinner spn_sssLightMultiplier "lights mutiplier: " range:[0.001,100.0,1.0] type:#float scale:0.1 fieldWidth:50
			multiListBox mlb_sssLightList "" selection:0
			button btn_sssRefreshList "Refresh" width:140 height:16
		)

		on SSSDialog open do
		(
			mlb_sssLightList.items = getAllLights()

			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_rate") != "" then \
			(spn_sssRate.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_rate") as integer) else (spn_sssRate.value = 0)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scale") != "" then \
			(spn_sssScale.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scale") as float) else (spn_sssScale.value = 2.0)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_radius") != "" then \
			(spn_sssRadius.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_radius") as float) else (spn_sssRadius.value = 2.0)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_subdivs") != "" then \
			(spn_sssSubdiv.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_subdivs") as integer) else (spn_sssSubdiv.value = 8)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_front") != "" then \
			(chk_sssFronLight.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_front") as booleanClass) else (chk_sssFronLight.state = true)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_back") != "" then \
			(chk_sssBackLight.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_back") as booleanClass) else (chk_sssBackLight.state = true)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_only") != "" then \
			(chk_sssLightOnly.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_only") as booleanClass) else (chk_sssLightOnly.state = false)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_gamma") != "" then \
			(spn_sssGamma.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_gamma") as float) else (spn_sssGamma.value = 2.2)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_multi") != "" then \
			(spn_sssLightMultiplier.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_multi") as float) else (spn_sssLightMultiplier.value = 1.0)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scatter") != "" then \
			(ddl_sssScatter.selection = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scatter") as integer) else (ddl_sssScatter.selection = 1)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_show_prepass") != "" then \
			(chk_sssShowPrepass.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_show_prepass") as booleanClass) else (chk_sssShowPrepass.state = false)
		)

		on SSSDialog close do
		(
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_rate" (spn_sssRate.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scale" (spn_sssScale.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_radius" (spn_sssRadius.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_subdivs" (spn_sssSubdiv.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_front" (chk_sssFronLight.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_back" (chk_sssBackLight.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_only" (chk_sssLightOnly.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_gamma" (spn_sssGamma.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_light_multi" (spn_sssLightMultiplier.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_scatter" (ddl_sssScatter.selection as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "sss_show_prepass" (chk_sssShowPrepass.state as string)
		)

		on btn_sssRefreshList pressed do
		(
			mlb_sssLightList.items = getAllLights()
		)
	)

	-- Rollout Texture
	-----------------------
	rollout TextureDialog "" width:180
	(
		Group "Map: "
		(
			label mal_lbl "Pick Map From Material Editor"
			mapbutton btn_texTextureMap ":: none ::" border:true width:150
			button btn_getFromActiveSlot "Get Map From Active Slot" width:150 height:16

			colorpicker clr_texColor "Diffuse: " width:125 color:black
		)
		Group "Viewport: "
		(
			checkbutton chk_texShowTexture "Show Map on Viewport" width:150 height:16
		)
		Group "Edit: "
		(
			button btn_texEditTexture "Put in Material Editor" height:16 width:150
			checkbox chk_texActiveMtlSlot "in ActiveMtlSlot"
		)
		Group "ColorMapping: "
		(
			checkbox chk_texColorMapping "Use VrayColorMapping"
		)
		on TextureDialog open do
		(
			if getTextureMask != undefined then
			(
				btn_texTextureMap.text = getTextureMask as string
			)
		)
		on TextureDialog close do
		(
			if getTexturePreviewObj != undefined then
			(
					select getTexturePreviewObj
					$.material = getTexturePreviewMtl
					getTexturePreviewObj = undefined
					getTexturePreviewMtl = undefined
			)
		)
		on btn_getFromActiveSlot pressed do
		(
			if superclassof (medit.GetCurMtl()) == textureMap then
			(
				btn_texTextureMap.text = (medit.GetCurMtl()) as string
				getTextureMask = medit.GetCurMtl()
			)
		)
		on chk_texShowTexture changed state do
		(
			if chk_texShowTexture.state == true then
			(
				if selection.count == 1 then
				(
					if getTextureMask != undefined then
					(
						getTexturePreviewObj = $
						getTexturePreviewMtl = $.material
						$.material = StandardMaterial diffuseMap:getTextureMask selfIllumAmount:100
						showTextureMap $.material $.material.diffusemap true
					)
					else
					(
						chk_texShowTexture.state = false
						messagebox "Pick Texure"
					)
				)
				else
				(
					chk_texShowTexture.state = false
					messagebox "Select Only One Object"
				)
			)
			else
			(
				if getTexturePreviewObj != undefined then
				(
					select getTexturePreviewObj
					$.material = getTexturePreviewMtl
					getTexturePreviewObj = undefined
					getTexturePreviewMtl = undefined
				)
			)
		)
		on btn_texTextureMap picked texmap do
		(
			btn_texTextureMap.text = texmap as string
			getTextureMask = texmap
		)
		on btn_texEditTexture pressed do
		(
			if getTextureMask != undefined then
			(
				if MatEditor.isOpen() == false then MatEditor.Open()

				if chk_texActiveMtlSlot.state == true then
				(
					meditmaterials[medit.GetActiveMtlSlot()] = getTextureMask
					activeMeditSlot = medit.GetActiveMtlSlot()
				)
				else
				(
					meditmaterials[24] = getTextureMask
					activeMeditSlot = 24
				)
			)
		)
		on chk_texColorMapping changed state do
		(
			if getCurrentRenderEngine() != "vray" then
			(
				chk_texColorMapping.state = false
				messagebox "Use Vray Render"
			)
		)
	)

	-- Rollout Ambient Occlusion
	------------------------------
	rollout AmbientDialog "" width:180
	(
		Group ""
		(
			spinner spn_aoRadius "radius: " range:[1,10000,10000] scale:1.0 type:#float
			spinner spn_aoSubdiv "subdivs: " range:[1,5000,8] scale:1 type:#integer
			checkbox chk_aoInvert "invert" chacked:false
			checkbox chk_aoGamma "gamma 2.2" chacked:false
		)
		on AmbientDialog open do
		(
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_radius") != "" then \
			(spn_aoRadius.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_radius") as float) else (spn_aoRadius.value = 10000.0)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_subdivs") != "" then \
			(spn_aoSubdiv.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_subdivs") as integer) else (spn_aoSubdiv.value = 8)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_invert") != "" then \
			(chk_aoInvert.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_invert") as booleanClass) else (chk_aoInvert.state = false)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_gamma") != "" then \
			(chk_aoGamma.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_gamma") as booleanClass) else (chk_aoGamma.state = true)

			if getCurrentRenderEngine() != "vray" then
			(
				chk_aoGamma.enabled = false
			)
		)
		on AmbientDialog close do
		(
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_radius" (spn_aoRadius.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_subdivs" (spn_aoSubdiv.value as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_invert" (chk_aoInvert.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "ao_gamma" (chk_aoGamma.state as string)
		)
	)

	-- Rollout ZDepth
	-----------------------
	(
		rollout ZDialog "" width:180
		(
		    Group ""
			(
				checkbox chk_zInvert "Invert" checked:false align:#left
				checkbox chk_zAA "Antialiasing"
				spinner spn_zNear "Near: " range:[0,99999,0] scale:1.0 type:#float width:128 across:2
				pickbutton pb_zPickNear "pick" height:16 width:32 align:#right
				spinner spn_zFar "Far: " range:[0,99999,500] scale:1.0 type:#float width:114 offset:[3,0] across:2
				pickbutton pb_zPickFar "pick" height:16 width:32 align:#right
				button btn_zAutoZ "auto detect" height:16 width:128 tooltip:"at least two objects must be visible"
			)
			group ""
			(
				button get_from_file_z_btn "get from file" height:16 width:128 tooltip:""
			)
			on ZDialog open do
			(
				if getCurrentRenderEngine() != "vray" and getCurrentRenderEngine() != "mental" and getCurrentRenderEngine() != "scanline" then
				(
					chk_zAA.enabled = false
				)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_invert") != "" then \
				(chk_zInvert.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_invert") as booleanClass) else (chk_zInvert.state = false)
-- 				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_extrapolate") != "" then \
-- 				(extrapolate_chk.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_extrapolate") as booleanClass) else (extrapolate_chk.state = true)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_near") != "" then \
				(spn_zNear.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_near") as float) else (spn_zNear.value = 0.0)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_far") != "" then \
				(spn_zFar.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_far") as float) else (spn_zFar.value = false)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_aa") != "" then \
				(chk_zAA.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_aa") as booleanClass) else (chk_zAA.state = false)
				if chk_zInvert.state == false then chk_zInvert.caption = "Invert (black -> white)" else chk_zInvert.caption = "Invert (white -> black)"

			)
			on ZDialog close do
			(
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_invert" (chk_zInvert.state as string)
-- 				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_extrapolate" (extrapolate_chk.state as string)
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_near" (spn_zNear.value as string)
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_far" (spn_zFar.value as string)
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "z_aa" (chk_zAA.state as string)
			)
			on get_from_file_z_btn pressed do
			(
				ptxt = ""
				if (fileProperties.getNumProperties #custom) != 0 then
				(
					for i = 1 to (fileProperties.getNumProperties #custom) do
					(
						if (fileProperties.getPropertyName #custom i) == "rendermask_ZDepth" then
						(
							ptxt = (fileProperties.getPropertyValue #custom i)
						)
					)
				)
				if ptxt != "" then
				(
					try(spn_zNear.value = (filterstring ptxt "||")[1] as float)catch()
					try(spn_zFar.value = (filterstring ptxt "||")[2] as float)catch()
				)
			)
			on chk_zInvert changed state do
			(
				if state == false then chk_zInvert.caption = "Invert (black -> white)" else chk_zInvert.caption = "Invert (white -> black)"
			)
 			on btn_zAutoZ pressed do
 			(
				local auto_near = 99999999
 				local auto_far = 0

				for i in geometry where not i.isHiddenInVpt do
				(
					get_dis = AutoDetectZDepth i false
					if get_dis != false then
					(
						if auto_near > get_dis then auto_near = get_dis
						if auto_far < get_dis then auto_far = get_dis
					)
				)
				if auto_near != 99999999 then spn_zNear.value = auto_near else spn_zNear.value = 0
 				if auto_far != 0 then spn_zFar.value = auto_far else spn_zFar.value = 500
 			)

			on pb_zPickNear picked obj do
			(
				if obj != undefined then
				(
					r = (mapScreenToWorldRay mouse.pos)
					intray = intersectray obj r
					spn_zNear.value = (distance intray.pos (mapscreentoworldray (getviewsize()/2)).pos)
				)
			)
			on pb_zPickFar picked obj do
			(
				if obj != undefined then
				(
					r = (mapScreenToWorldRay mouse.pos)
					intray = intersectray obj r
					spn_zFar.value = (distance intray.pos (mapscreentoworldray (getviewsize()/2)).pos)
				)
			)
		)
	)

	-- Rollout Specular
	-----------------------
	(
		rollout SpecularDialog "" width:180
		(
			Group ""
			(
				spinner spn_spLevel "Specular Level: " range:[0,999,10] scale:1 type:#integer
				spinner spn_spGlossy "Glossiness: " range:[0,100,10] scale:1 type:#integer
				checkbox chk_spColorMapping "Use VrayColorMapping"
			)
			Group "Lights: "
			(
				checkbox chk_spRGBLights "RGB Lights"
				spinner spn_spLightMultiplier "lights mutiplier: " range:[0.001,100.0,1.0] type:#float scale:0.1 fieldWidth:50
				multiListBox mlb_spLightList "" selection:0
				button btn_spRefreshList "Refresh" width:135 height:16
			)

			on SpecularDialog open do
			(
				if getCurrentRenderEngine() != "vray" then chk_spColorMapping.enabled = false

				mlb_spLightList.items = getAllLights()

				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_level") != "" then \
				(spn_spLevel.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_level") as integer) else (spn_spLevel.value = 100)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_gloss") != "" then \
				(spn_spGlossy.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_gloss") as integer) else (spn_spGlossy.value = 50)

				if getCurrentRenderEngine() != "vray" then
				(
					chk_spColorMapping.enabled = false
				)
			)

			on SpecularDialog close do
			(
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_level" (spn_spLevel.value as string)
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "specular_gloss" (spn_spGlossy.value as string)
			)

			on btn_spRefreshList pressed do
			(
				mlb_spLightList.items = getAllLights()
			)
		)
	)

	-- Rollout Deadline
	-----------------------
	(
		rollout DeadlineDialog "" width:200
		(
			label lbl_DL "Submit to Deadline"
			Group "Version: "
			(
				radiobuttons rdo_DeadlineVersion "" labels:#("Deadline 5", "Deadline 6/7") columns:2 default:1 --enabled:false
			)
			Group "Job: "
			(
				spinner spn_DeadlinePriority "Priority: " range:[1,100,50] scale:1 type:#integer align:#right --enabled:false --width:100
				spinner spn_DeadlineFrameTask "FramePerTask: " range:[1,100,5] scale:1 type:#integer align:#right --enabled:false --width:100
				checkbox chk_DeadlineSuspend "Submit Job As Suspended" --enabled:false
			)
			Group "Limits: "
			(
				checkbutton chk_DeadlineRunLimits "Blacklist/Whitelist Slaves" checked:false
			)
			Group "Progress"
			(
				progressbar pb_SubmitStatus "" color:green value:100
			)
			on DeadlineDialog open do
			(
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_version" ) != "" then \
				(rdo_DeadlineVersion.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_version" ) as integer) else (rdo_DeadlineVersion.state = 1)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_priority" ) != "" then \
				(spn_DeadlinePriority.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_priority" ) as integer) else (spn_DeadlinePriority.value = 50)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_frametask" ) != "" then \
				(spn_DeadlineFrameTask.value = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_frametask" ) as integer) else (spn_DeadlineFrameTask.value = 5)
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_suspended" ) != "" then \
				(chk_DeadlineSuspend.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_suspended" ) as BooleanClass) else (chk_DeadlineSuspend.state = false)

				-- for deadline function
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_bw_list" ) != "" then \
				(DeadlineLimitsWB = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_bw_list" ) as integer) else (DeadlineLimitsWB = 1)

				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list") != "" then \
				(
					DeadlineSlavesList = filterstring (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list") "||"
					DeadlineSlavesList = sort DeadlineSlavesList
				)
			)
			on DeadlineDialog close do
			(
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_version" (rdo_DeadlineVersion.state as string)
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_priority" (spn_DeadlinePriority.value as string)
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_frametask" (spn_DeadlineFrameTask.value as string)
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_suspended" (chk_DeadlineSuspend.state as string)
			)
			on chk_DeadlineRunLimits changed state do
			(
				if state == true then
				(
					try(createdialog DeadlineLimitsDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) - 200,(GetDialogPos RenderMaskDialog).y + (DeadlineDialogOffsetY + 250)])catch()
				)
				else
				(
					try(destroydialog DeadlineLimitsDialog)catch()
				)
			)
		)
	)

	-- Rollout Deadline Limits
	-----------------------
	(
		rollout DeadlineLimitsDialog "" width:200
		(
			Group "Slaves: "
			(
				listbox lb_DeadlineSlaveArray "" width:90 height:10 across:2
				listbox lb_DeadlineSlaveList "" width:90 height:10
				radiobuttons rdo_DeadlineBlackWhite "" labels:#("Blacklist", "Whitelist")
			)
			on DeadlineLimitsDialog open do
			(
				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_bw_list" ) != "" then \
				(rdo_DeadlineBlackWhite.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_bw_list" ) as integer) else (rdo_DeadlineBlackWhite.state = 1)

				SMTDFunctions.CollectSlaves()

				if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list") != "" then \
				(
					lb_DeadlineSlaveList.items = filterstring (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list") "||"
					lb_DeadlineSlaveList.items = sort lb_DeadlineSlaveList.items
					lb_DeadlineSlaveArray.items = SMTDSettings.Slaves
					for i in lb_DeadlineSlaveList.items do
					(
						if (finditem lb_DeadlineSlaveArray.items i) != 0 then
						(
							lb_DeadlineSlaveArray.items = deleteitem lb_DeadlineSlaveArray.items (finditem lb_DeadlineSlaveArray.items i)
						)
					)
				)
				else
				(
					lb_DeadlineSlaveArray.items = SMTDSettings.Slaves
				)
			)
			on DeadlineLimitsDialog close do
			(
				setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_bw_list" (rdo_DeadlineBlackWhite.state as string)
				DeadlineLimitsWB = rdo_DeadlineBlackWhite.state
			)
			on lb_DeadlineSlaveArray doubleClicked sel do
			(
				if lb_DeadlineSlaveArray.selected != undefined then
				(
					lb_DeadlineSlaveList.items = append lb_DeadlineSlaveList.items lb_DeadlineSlaveArray.selected
					lb_DeadlineSlaveArray.items = deleteItem lb_DeadlineSlaveArray.items sel
					lb_DeadlineSlaveArray.items = sort lb_DeadlineSlaveArray.items
					lb_DeadlineSlaveList.items = sort lb_DeadlineSlaveList.items
					if lb_DeadlineSlaveList.items.count != 0 then
					(
						local ini_txt = ""
						for i in lb_DeadlineSlaveList.items do
						(
							ini_txt = ini_txt + (i + "||")
						)
						setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list" ini_txt
						DeadlineSlavesList = lb_DeadlineSlaveList.items
					)
				)
			)
			on lb_DeadlineSlaveList doubleClicked sel do
			(
				if lb_DeadlineSlaveList.selected != undefined then
				(
					lb_DeadlineSlaveArray.items = append lb_DeadlineSlaveArray.items lb_DeadlineSlaveList.selected
					lb_DeadlineSlaveList.items = deleteItem lb_DeadlineSlaveList.items sel
					lb_DeadlineSlaveArray.items = sort lb_DeadlineSlaveArray.items
					lb_DeadlineSlaveList.items = sort lb_DeadlineSlaveList.items
					if lb_DeadlineSlaveList.items.count != 0 then
					(
						local ini_txt = ""
						for i in lb_DeadlineSlaveList.items do
						(
							ini_txt = ini_txt + (i + "||")
						)
						setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list" ini_txt
					)
					else
					(
						setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_slave_list" ""
					)
				)
			)
			on rdo_DeadlineBlackWhite changed state do
			(
				case state of
				(
					1: DeadlineLimitsWB = 1
					2: DeadlineLimitsWB = 2
				)
			)
		)
	)

	-- Rollout RenderMask
	-----------------------
	rollout RenderMaskDialog ("RenderMask " + ver) width:216 --height:328
	(
		Group "Time: "
		(
			radiobuttons rdo_MaskTimeRange "" labels:#("Single", "Active Time", "Range", "Frames") columns:2 align:#left enabled:false
			checkbox chk_SaveMaxFile "Save 3dsmax Mask File" checked:false enabled:false
			checkbox chk_SingleFrame "Don't Save (Single Frame)" checked:true
		)
		Group "Tools"
		(
			checkbutton btn_WireColorTool "WireColor Tool" height:14 across:2 --offset:[0,15]
			button btn_IDTool "IDTool" height:14 width:88 --offset:[45,-20]
		)
		Group "Mask Type: "
		(
			radiobuttons rdo_MaskType "" labels:#("Luminance", "Wire Color", "Material ID","Reflecton", "Vectors", \
			"Lights/Shadow", "ObjectsID", "SSS", "Texture", "AO", "ZDepth", "Specular", "Luma RGB", "Refraction") \
			default:1 columns:2 align:#left
		)
		Group "State"
		(
			checkbutton btn_MaskState "Mask State" height:18 width:190
		)
		Group "Network Render: "
		(
			checkbox chk_SubmitBackburner "Submit To Backburner" enabled:false
			checkbox chk_SubmitDeadline "Submit To Deadline" enabled:false
		)
		Group "Options: "
		(
			checkbox chk_AA "Antialiasing" checked:true
			checkbox chk_KeepOpacity "Keep OpacityMap" checked:false
		)
		Group ""
		(
			button btn_RenderMask "Render Mask" width:190
			checkbutton chb_CreateState "CreateState" enabled:false across:2 align:#left height:18 width:70 tooltip:"CreateState on Render"
			edittext edt_StateName "" enabled:false offset:[-25,0] width:120
-- 			button btn_UpdateState ".." width:14 height:17 align:#right offset:[6,0] tooltip:"Update Existing State"
		)
		button help_btn "info..." height:16 width:40 across:2 align:#left
		--button donate_btn "D" height:16 width:16 align:#right tooltip:"This script is free. If you find it useful, you can donate."
-------------------------------------------------------------------------------------------------------------------
--- Rollouts End
-------------------------------------------------------------------------------------------------------------------

	-- Open Dialog
		on RenderMaskDialog open do
		(
			edt_StateName.text = "Luminance"
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "aa") != "" then \
			(chk_AA.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "aa") as BooleanClass) else (chk_AA.state = true)
			if (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "opacity") != "" then \
			(chk_KeepOpacity.state = (getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "opacity") as BooleanClass) else (chk_KeepOpacity.state = false)
		)
	-- Close Dialog
		on RenderMaskDialog close do
		(
			--close all dialogs
			try(destroydialog WirecolorDialog)catch()
			try(destroydialog StateDialog)catch()
			try(destroydialog MaterialIDDialog)catch()
			try(destroydialog ReflectionDialog)catch()
			try(destroydialog VectorDialog)catch()
			try(destroydialog LightsDialog)catch()
			try(destroydialog ObjectsIDDialog)catch()
			try(destroydialog SSSDialog)catch()
			try(destroydialog TextureDialog)catch()
			try(destroydialog AmbientDialog)catch()
			try(destroydialog ZDialog)catch()
			try(destroydialog SpecularDialog)catch()
			try(destroydialog DeadlineDialog)catch()
			try(destroydialog DeadlineLimitsDialog)catch()

			-- set ini settings
-- 			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "deadline_version" (DeadlineDialog.rdo_DeadlineVersion.state as string)
			setinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "pos_x" ((GetDialogPos RenderMaskDialog).x as string)
			setinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "pos_y" ((GetDialogPos RenderMaskDialog).y as string)
			setinisetting ((getdir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "mask_type" (rdo_MaskType.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "aa" (chk_AA.state as string)
			setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "opacity" (chk_KeepOpacity.state as string)
		)

		on RenderMaskDialog moved pos do
		(
			try(SetDialogPos WirecolorDialog [((GetDialogPos RenderMaskDialog).x) + 220,(GetDialogPos RenderMaskDialog).y])catch()
			try(SetDialogPos StateDialog [((GetDialogPos RenderMaskDialog).x) - 200,(GetDialogPos RenderMaskDialog).y])catch()
			try(SetDialogPos MaterialIDDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos ReflectionDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos VectorDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos LightsDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos ObjectsIDDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos SSSDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 150])catch()
			try(SetDialogPos TextureDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos AmbientDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos ZDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos SpecularDialog [((GetDialogPos RenderMaskDialog).x) + 226,((GetDialogPos RenderMaskDialog).y) + 214])catch()
			try(SetDialogPos DeadlineDialog [((GetDialogPos RenderMaskDialog).x) - 200,((GetDialogPos RenderMaskDialog).y) + DeadlineDialogOffsetY])catch()
			try(SetDialogPos DeadlineLimitsDialog [((GetDialogPos RenderMaskDialog).x) - 200,((GetDialogPos RenderMaskDialog).y) + (DeadlineDialogOffsetY + 250)])catch()
		)

		-- run WireColorTool
		on btn_WireColorTool changed state do
		(
			if btn_WireColorTool.state == true then
			(
				createdialog WirecolorDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) + 220,(GetDialogPos RenderMaskDialog).y]
			)
			else
			(
				try(destroydialog WirecolorDialog)catch()
			)
		)

		-- run IDTool
		on btn_IDTool pressed do
		(
			try
			(
				macros.run "IllusionBoxStudio" "IDTool"
			)
			catch
			(
				case queryBox "IDTool not installed.\nIDTool allows you to manage objects ID.\n\nYes: Download script\nNo: Continue without downloading" title:"IDTool Missing" of
				(
					true:
					(
						ShellLaunch "C:\\Program Files\\Internet Explorer\\IEXPLORE.EXE" "http://illusionboxstudio.com/wp/scripts/id_tool.exe"
					)
				)
			)
		)

		-- radiobuttons (mask type)change
		on rdo_MaskType changed state do
		(
			CreateMaskDialog state
			case state of
			(
				1: edt_StateName.text = "Luminance"
				2: edt_StateName.text = "WireColor"
				3: edt_StateName.text = "MaterialID"
				4: edt_StateName.text = "Reflection"
				5: edt_StateName.text = "Vectors"
				6: edt_StateName.text = "Lights/Shadow"
				7: edt_StateName.text = "ObjectsID"
				8: edt_StateName.text = "SSS"
				9: edt_StateName.text = "Texture"
				10: edt_StateName.text = "AO"
				11: edt_StateName.text = "ZDepth"
				12: edt_StateName.text = "Specular"
				13: edt_StateName.text = "LumaRGB"
				14: edt_StateName.text = "Refraction"
			)
		)

		-- render button
		on btn_RenderMask pressed do
		(
			-- timestamp
-- 			st = timestamp()
			undo off
			(
				disableSceneRedraw()
				envEffectsDialog.Close()

				-- Exposure Control
				getExposure = SceneExposureControl.exposureControl
				SceneExposureControl.exposureControl = undefined

				-- Local Arrays
				local allMaterialObjArray = #()
				local allNoMaterialObjArray = #()
				local allMaterialArray = #()
				local getLightColorObjArray = #()
				local getLightColorArray = #()
				local LightsOnArray = #()
				local LightsOffArray = #()
				local BrazilLightsArray = #()
				local BrazilDomeLightsArray = #()
				local VraySunLightsArray = #()
				local VraySunLightsOffArray = #()
				local VrayIESLightsArray = #()
				local VrayIESLightsOffArray = #()
				local VrayAmbienLightsArray = #()
				local VrayAmbienLightsOffArray = #()
				local DreamScapeSunArray = #()
				local DreamScapeTerrenArray = #()
				local BlackMaterialArray = #()
				local allArray = #()
				local allArrayGeometry = #()
				local allArrayShapes = #()
				local allArrayPFlow = #()
				local VisibleToCameraArray = #()
				local VrayMatteObjArray = #()
				local AtmosphereArray = #()
				local ObjectsUseMultiMtlArray = #()
				local VisibleFromCameraArray = #()
				local getActiveEffectsArray = #()
				local ErrorMessage = ""
				--local OpacityMap = #()

				-- TurnOff Active Effects
				if numEffects != 0 then
				(
					for i = 1 to numEffects do
					(
						if IsActive (getEffect i) == true then
						(
							append getActiveEffectsArray i
							setActive (getEffect i) false
						)
					)
				)

				-- Get/Set Render Settings
				if selection.count != 0 then
				(
					--local get_selected_objects = selection as array

					getMaxRenderElements = maxOps.GetCurRenderElementMgr()
					getActiveMaxRenderElements = getMaxRenderElements.GetElementsActive()
					getMaxRenderElements.SetElementsActive false
					getUseEnvMap = useEnvironmentMap
					getUseEnvColor = backgroundColor
					useEnvironmentMap = false
					backgroundColor = black
					renderSceneDialog.close()
					getMaxRenderOutput = rendOutputFilename
					getMaxRenderType = rendTimeType
					getMaxRenderSave = rendSaveFile
					getMaxNetRender = rendUseNet

					-- Material Propagate Material to Instance
					if InstanceMgr.autoMtlPropagation == true then
					(
						getPropagateMtlInstance = true
						InstanceMgr.autoMtlPropagation = false
					)
					else
					(
						getPropagateMtlInstance = false
					)

					-- Standard Settings
					if chk_SingleFrame.state == true then
					(
						rendOutputFilename = ""
						rendTimeType = 1
						rendSaveFile = false
						rendUseNet = false

					)
					else
					(
						theOutputFile = undefined
						getFileSavePath = getinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "file_name"
						theOutputFile = getSaveFileName caption:"Save Mask Seq" filename:getFileSavePath\
						types:"OpenEXR (*.exr)|*.exr|TGA (*.tga)|*.tga|PNG (*.png)|*.png|TIF (*.tif)|*.tif|All Files (*.*)|*.*|"\
						historyCategory:"RenderMask"
						(
							if theOutputFile != undefined then
							(
								setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "file_name" (getFilenameFile theOutputFile)
								setinisetting ((GetDir #plugcfg) + "\\requiem_render_mask.ini") "RenderMask" "file_path" (getFilenamePath theOutputFile)
								rendOutputFilename = theOutputFile
								rendTimeType = rdo_MaskTimeRange.state
								rendSaveFile = true
								rendUseNet = chk_SubmitBackburner.state


								-----------MASKSTATEUPDATE---------------------------------------
								if chb_CreateState.state == true then
								(
									fileProperties.addProperty #custom ("RenderMaskState|" + edt_StateName.text ) (StateSavePreset rdo_MaskType.state theOutputFile)
-- 									if fileProperties.findProperty #custom "RenderMaskSate" != 0 then
-- 									(
-- 										print (fileProperties.getPropertyValue #custom (fileProperties.findProperty #custom "RenderMaskSate"))
-- 									)
								)
								-----------MASKSTATEUPDATE---------------------------------------

							)
						)
					)

					--Set/Get Brazil2 Settings
					if getCurrentRenderEngine() == "brazil" then
					(
						curBraz = trackviewnodes.brazil_r_s[renderers.current.renderer_no+1]
						local getBrazilDirect = curBraz.Luma_Server_Parameter_Block_Holder.directlight_on
						local getBrazilSky = curBraz.Luma_Server_Parameter_Block_Holder.dirsky_on
						local getBrazilIndirect = curBraz.Luma_Server_Parameter_Block_Holder.global_illum_on
						local getBrazilSecondary = curBraz.Ray_Server_Parameter_Block_Holder.ray_secondary_on

						curBraz.Luma_Server_Parameter_Block_Holder.directlight_on = false
						curBraz.Luma_Server_Parameter_Block_Holder.dirsky_on = false
						curBraz.Luma_Server_Parameter_Block_Holder.global_illum_on = false
						curBraz.Ray_Server_Parameter_Block_Holder.ray_secondary_on = false
					)

					--Set/Get VrayRender Settings
					if getCurrentRenderEngine() == "vray" then
					(
						getVrayVFB = renderers.current.output_on

						getVrayOverrideMtl = renderers.current.options_overrideMtl_on
						renderers.current.options_overrideMtl_on = false

						getVraySaveImage = renderers.current.output_saveRawFile
						renderers.current.output_saveRawFile = false

						getVraySplitbuffer = renderers.current.output_splitgbuffer
						renderers.current.output_splitgbuffer = false

						opt_lights_def = renderers.current.options_defaultLights
						try(renderers.current.options_defaultLights = false)catch(renderers.current.options_defaultLights = 0)

						opt_lights = renderers.current.options_lights
						renderers.current.options_lights = false

						opt_ref_raf = renderers.current.options_reflectionRefraction
						renderers.current.options_reflectionRefraction = false

						get_color_mapping_par1 = renderers.current.colorMapping_type
						get_color_mapping_par2 = renderers.current.colorMapping_darkMult
						get_color_mapping_par3 = renderers.current.colorMapping_brightMult
						get_color_mapping_par4 = renderers.current.colorMapping_gamma
						get_color_mapping_par5 = renderers.current.colorMapping_affectBackground
						get_color_mapping_par6 = renderers.current.colorMapping_clampOutput
						get_color_mapping_par7 = renderers.current.colorMapping_clampLevel
						get_color_mapping_par8 = renderers.current.colorMapping_subpixel
						get_color_mapping_par9 = renderers.current.colorMapping_adaptationOnly
						get_color_mapping_par10 = renderers.current.colorMapping_linearWorkflow

						renderers.current.colorMapping_type = 0
						renderers.current.colorMapping_darkMult = 1.0
						renderers.current.colorMapping_brightMult = 1.0
						renderers.current.colorMapping_gamma = 1.0
						renderers.current.colorMapping_affectBackground = false
						renderers.current.colorMapping_clampOutput = false
						renderers.current.colorMapping_clampLevel = 1.0
						renderers.current.colorMapping_subpixel = false
						try(renderers.current.colorMapping_adaptationOnly = false)catch(renderers.current.colorMapping_adaptationOnly = 1)
						renderers.current.colorMapping_linearWorkflow = false

						getVrayGI = renderers.current.gi_on
						renderers.current.gi_on = false

						get_vray_prepass = renderers.current.gi_irradmap_showCalcPhase


						get_gi_environment = renderers.current.environment_gi_on
						renderers.current.environment_gi_on = false
					)

					-- Set/Get MentalRay setting
					if getCurrentRenderEngine() == "mental" then
					(
						getMentalrayFG = renderers.current.FinalGatherEnable2
						getMentalrayGI = renderers.current.GlobalIllumEnable
						getMentalrayRay = renderers.current.RaytraceEnable
						renderers.current.FinalGatherEnable2 = false
						renderers.current.GlobalIllumEnable = false
						renderers.current.RaytraceEnable = false
					)

					-- Set/Get AA setting
					case getCurrentRenderEngine() of
					(
						"vray":
						(
							--renderSceneDialog.close()
							get_vray_aa = renderers.current.imageSampler_type
							if chk_AA.state == false then
							(
								renderers.current.imageSampler_type = 0
								renderers.current.fixedRate_subdivs = 1
							)
						)
						"scanline":
						(
							--renderSceneDialog.close()
							get_scanline_aa = renderers.current.antiAliasing
							if chk_AA.state == false then renderers.current.antiAliasing = false
						)
						"mental":
						(
							--renderSceneDialog.close()
							get_mental_aa_filter = renderers.current.filter
							get_mental_aa_min = renderers.current.MinimumSamples
							get_mental_aa_max = renderers.current.MaximumSamples
							if chk_AA.state == false then
							(
								renderers.current.filter = 4
								renderers.current.MinimumSamples = 0
								renderers.current.MaximumSamples = 0
							)
						)
					)

					--Exclude Lights
					-- COLOR
					for l in lights where classof l != TargetObject do
					(
						if (isProperty l #color) then
						(
							append getLightColorObjArray l
							append getLightColorArray l.color
						)
					)
					-- ON_OFF
					for z in lights where classof z != TargetObject and classof z != VRaySun and classof z != Sun and classof z != VRayIES and classof z != VRayAmbientLight do
					(
						if (isProperty z #on) then
						(
							if z.on == true then
							(
								append LightsOnArray z
								z.on = false
							)
							else
							(
								append LightsOffArray z
							)

						)
						else if (classOf z == B2_Main_Light) then
						(
							if (z.Base_Parameters.enabled_on) do
							(
								append BrazilLightsArray z
								z.Base_Parameters.enabled_on = false
							)
						)
						else if (classOf z == Dome_Light) then
						(
							if (z.Parameters.enabled_on) do
							(
								append BrazilDomeLightsArray z
								z.Parameters.enabled_on = false
							)
						)
					)

					--Exclude VrayAmbient
					for a in lights where classof a != TargetObject and classof a == VRayAmbientLight do
					(
						if a.enabled == true then
						(
							append VrayAmbienLightsArray a
							a.enabled = false
						)
						else
						(
							append VrayAmbienLightsOffArray a
						)
					)

					--Exclude VraySun
					for j in lights where classof j != TargetObject and classof j == VRaySun do
					(
						if j.enabled == true then
						(
							append VraySunLightsArray j
							j.enabled = false
						)
						else
						(
							append VraySunLightsOffArray j
						)
					)

					--Exclude VrayIES
					for i in lights where classof i != TargetObject and classof i == VRayIES do
					(
						if i.enabled == true then
						(
							append VrayIESLightsArray i
							i.enabled = false
						)
						else
						(
							append VrayIESLightsOffArray i
						)
					)

					--Exclude DreamScapeSun
					for d in lights where classof d != TargetObject and classof d == Sun do
					(
						if d.onoff == true do
						(
							append DreamScapeSunArray d
							d.onoff = false
						)
					)

					-- Exclude DreamTerren
					for g in geometry where classof g == Terra do
					(
						if g.RenderAsGeom == false then
						(
							append DreamScapeTerrenArray g
							g.RenderAsGeom = true
						)

					)

					-- TurnOff DreamScape Atmospheric
					if numAtmospherics != 0 then
					(
						AtmosphereArray = #()
						for a = 1 to numAtmospherics do
						(
							if classof (getAtmospheric a) == DreamScape then
							(
								if isActive (getAtmospheric a) == true then
								(
									setActive (getAtmospheric a) false
									append AtmosphereArray a
								)
							)
						)
					)

					-- Get\Set VrayCamera Settings
					VrayCam = viewport.getCamera()
					if classof VrayCam == VRayPhysicalCamera do
					(
						VrayCamExposure = VrayCam.exposure
						VrayCamVignetting = VrayCam.vignetting
						VrayCam.exposure = false
						VrayCam.vignetting = false
					)


					--select_pflow_event()
					--print (selection as array)

					-- Array Materials
					allArrayGeometry = for o in geometry where not o.isHiddenInVpt collect o
					allArrayShapes = for o in shapes where not o.isHiddenInVpt collect o
					--allArrayPFlow = for p in objects where classof p == ParticleGroup collect p
					allArray = allArrayGeometry + allArrayShapes
					allMaterialArray = for m in allArray where m.material != undefined collect m.material
					allMaterialObjArray = for o in allArray where o.material != undefined collect o
					allNoMaterialObjArray = for m in allArray where m.material == undefined collect m
					VisibleToCameraArray = for o in allArrayGeometry where o.primaryVisibility == true collect o

					-- Get HairFarm materials
					getHairfarmObj allArray

					-- Get FumeFX Colors & Lights
					getFumeFX allArray
					getFumeLights (selection as array)

					-- Get Forest_Lite
					(
						for i in selection do getForestLite i
					)

					-- Get VrayPropreties
					for i in allArray do
					(
						if (getUserProp i "VRay_Matte_Enable") == true then
						(
							append VrayMatteObjArray i
							setUserProp i "VRay_Matte_Enable" false
						)
					)

					-- Get Objects whit One MultiMaterial
					case rdo_MaskType.state of
					(
						3:
						(
							if selection.count == 1 then
							(
								ObjectsUseMultiMtlArray = #()
								for o in objects where o.material == $.material do
								(
									append ObjectsUseMultiMtlArray o
								)
							)
						)
					)

-----------------------------------------------------------------------------------------
					-- Start Try()Catch()
-----------------------------------------------------------------------------------------
					try
					(
-----------------------------------------------------------------------------------------
						-- Start Black Material
-----------------------------------------------------------------------------------------
						(
							ErrorMessage = "Error Collecting Black Material"
							BlackMaterialArray = #()
							BlackMaterialArray = for i in allArray where i.isselected == false collect i

							ErrorMessage = "Error FumeFX Black Material"
							for b in BlackMaterialArray do
							(
								setFumeMtl b black
							)

							-- Black Refraction
							if rdo_MaskType.state == 14 then
							(
								ErrorMessage = "Error Creating Black Material \"Refraction Mask\""
								for b in BlackMaterialArray do
								(
									VrayMtlArray = #()
									VrayRefractArray = #()
									if b.material != undefined then
									(
										getVrayMtl b.material
										if VrayMtlArray.count != 0 then
										(
											getVrayMtlRefraction VrayMtlArray
										)
									)
									if VrayRefractArray.count != 0 then
									(
										b.material = TransferRefractMtl VrayRefractArray[1]
									)
									else
									(
										b.material = StandardMaterial diffuse:black
									)
								)
							)

							--Black TextureMask
							else if rdo_MaskType.state == 9 then
							(
								ErrorMessage = "Error Creating Black Material \"Texture Mask\""
								local texture_mask_material = StandardMaterial diffuse:black
								if (getCurrentRenderEngine()) == "vray" then
								(
									texture_mask_material = VrayMtlWrapper()
									texture_mask_material.baseMtl = VrayMtl diffuse:black
									texture_mask_material.matteSurface = true
									texture_mask_material.alphaContribution = -1
								)
								if (getCurrentRenderEngine()) == "scanline" then
								(
									texture_mask_material = MatteShadow()
								)
								if (getCurrentRenderEngine()) == "mental" then
								(
									texture_mask_material = Matte_Shadow_Reflection__mi()
									texture_mask_material.ao_on = false
									texture_mask_material.catch_shadows = false
								)
								AddBlackMtl chk_KeepOpacity.state BlackMaterialArray texture_mask_material
							)

							--Black ObjectsID Mask
							else if rdo_MaskType.state == 7 then
							(
								ErrorMessage = "Error Creating Black Material \"ObjectsID Mask\""
								AddBlackMtl chk_KeepOpacity.state allArray (StandardMaterial diffuse:black)
							)

							--Black LumaRGB Mask
							else if rdo_MaskType.state == 13 then
							(
								ErrorMessage = "Error Creating Black Material \"LumaRGB Mask\""
								AddBlackMtl chk_KeepOpacity.state allArray (StandardMaterial diffuse:black)
							)

							--Black Light Mask
							else if rdo_MaskType.state == 6 then
							(
								ErrorMessage = "Error Creating Black Material \"Light/Shadow Mask\""

								if LightsDialog.rdo_lsSwitchLightShadow.state == 2 then
								(
									local shadow_mask_material = VrayMtlWrapper()
									shadow_mask_material.baseMtl = VrayMtl diffuse:white
									shadow_mask_material.matteSurface = true
									shadow_mask_material.matte_shadows = true
									shadow_mask_material.matte_shadowColor = white

									AddBlackMtl chk_KeepOpacity.state BlackMaterialArray shadow_mask_material
								)
								else if LightsDialog.rdo_lsSwitchLightShadow.state == 1 then
								(
									AddBlackMtl chk_KeepOpacity.state BlackMaterialArray (StandardMaterial diffuse:black)
								)
							)

							-- Black All
							else
							(
								ErrorMessage = "Error Creating Black Material"
								AddBlackMtl chk_KeepOpacity.state BlackMaterialArray (StandardMaterial diffuse:black)
							)
						)

-----------------------------------------------------------------------------------------
						-- End Black Material
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
						-- Start White Material
-----------------------------------------------------------------------------------------
						case rdo_MaskType.state of
						(
							----------------------------------------------------------
							--- Luminance Mask
							----------------------------------------------------------
							1:
							(
								ErrorMessage = "Error Creating White Material \"Luminance Mask\""
								if chk_KeepOpacity.state == false then
								(
									for i in selection do
									(
										i.material = StandardMaterial diffuse:white selfIllumAmount:100
										setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
										setFumeMtl i white
									)
								)
								else
								(
									for i in selection do
									(
										if classof i.material == Multimaterial then
										(
											i.material = AddMultiMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
										)
										else
										(
											OpacityMap = #()
											getOpacityMaps i.material

											i.material = StandardMaterial diffuse:white selfIllumAmount:100
											setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
											setFumeMtl i white
											if OpacityMap.count != 0 then
											(
												i.material.opacityMap = OpacityMap[1]
											)
										)
									)
								)
							)
							----------------------------------------------------------
							--- Wirecolor Mask
							----------------------------------------------------------
							2:
							(
								ErrorMessage = "Error Creating White Material \"Wirecolor Mask\""
								if chk_KeepOpacity.state == false then
								(
									for i in selection do
									(
										i.material = StandardMaterial diffuse:i.wirecolor selfIllumAmount:100
										setHairfarmMtl i (StandardMaterial diffuse:i.wirecolor selfIllumAmount:100)
										setFumeMtl i i.wirecolor
									)
								)
								else
								(
									for i in selection do
									(
										if classof i.material == Multimaterial then
										(
											i.material = AddMultiMtl i (StandardMaterial diffuse:i.wirecolor selfIllumAmount:100)
										)
										else
										(
											OpacityMap = #()
											getOpacityMaps i.material

											i.material = StandardMaterial diffuse:i.wirecolor selfIllumAmount:100
											setHairfarmMtl i (StandardMaterial diffuse:i.wirecolor selfIllumAmount:100)
											setFumeMtl i i.wirecolor
											if OpacityMap.count != 0 then
											(
												i.material.opacityMap = OpacityMap[1]
											)
										)
									)
								)
							)

							----------------------------------------------------------
							--- MaterialID Mask
							----------------------------------------------------------
							3:
							(
								ErrorMessage = "Error Creating White Material \"MaterialID Mask\""
								if selection.count == 1 then
								(
									if classof $.material == Multimaterial then
									(
										new_multi_mat = Multimaterial numsubs:$.material.materialIDList.count
										for m = 1 to new_multi_mat.materialIDList.count do
										(
											new_multi_mat.materialIDList[m] = $.material.materialIDList[m]

											if (MaterialIDDialog.mlb_MaterialIDSelection.selection as array).count != 0 then
											(
												if (finditem (MaterialIDDialog.mlb_MaterialIDSelection.selection as array) m) != 0 then
												(
													new_multi_mat[new_multi_mat.materialIDList[m]] = StandardMaterial diffuse:white selfIllumAmount:100

													if chk_KeepOpacity.state == true then
													(
														OpacityMap = #()
														getOpacityMaps ($.material[m])

														if OpacityMap.count != 0 then
														(
															new_multi_mat[new_multi_mat.materialIDList[m]].opacityMap = OpacityMap[1]
														)
													)
												)
												else
												(
													new_multi_mat[new_multi_mat.materialIDList[m]]= StandardMaterial diffuse:black

													if chk_KeepOpacity.state == true then
													(
														OpacityMap = #()
														getOpacityMaps ($.material[m])

														if OpacityMap.count != 0 then
														(
															new_multi_mat[new_multi_mat.materialIDList[m]].opacityMap = OpacityMap[1]
														)
													)
												)
											)
										)
										case MaterialIDDialog.rdo_MaterialIDType.state of
										(
											1:
											(
												$.material = new_multi_mat
												setHairfarmMtl $ new_multi_mat
											)
											2:
											(
												for i in ObjectsUseMultiMtlArray do
												(
													i.material = new_multi_mat
													setHairfarmMtl i new_multi_mat
												)
											)
										)
									)
									else
									(
										messagebox "Object must have \"Multi/SubObject\" material"
									)
								)
								else
								(
									messagebox "Select only one object whit \"Multi/SubObject\" material"
								)
							)

							----------------------------------------------------------
							--- Reflection Mask
							----------------------------------------------------------
							4:
							(
								case ReflectionDialog.rdo_refReflectionType.state of
								(
									1:
									(
										if getCurrentRenderEngine() == "vray" then
										(
											ErrorMessage = "Error Creating White Material \"Reflection Mask (Vray)\""

											local vray_mat_ref = VrayMtl()
											vray_mat_ref.diffuse = black
											vray_mat_ref.reflection = (color 255 255 255)
											vray_mat_ref.reflection_subdivs = ReflectionDialog.spn_refGlossySubdiv.value
											vray_mat_ref.reflection_glossiness = ReflectionDialog.spn_refGlossy.value
											if ReflectionDialog.chk_refUseFalloff.state == true then
											(
												vray_mat_ref.reflection_fresnel = true
												vray_mat_ref.reflection_lockIOR = false
												vray_mat_ref.reflection_ior = ReflectionDialog.spn_refFalloff.value
											)
											else if ReflectionDialog.chk_refUseFalloff.state == false then
											(
												vray_mat_ref.reflection_fresnel = false
											)

											case ReflectionDialog.rdo_refEnvType.state of
											(
												1:
												(
													vray_mat_ref.texmap_environment = VRayColor color:ReflectionDialog.clr_refEnvColor.color
													vray_mat_ref.texmap_environment.rgb_multiplier = ReflectionDialog.spn_refEnvMultiplier.value
												)
												2:
												(
													if getReflectionMask != undefined then
													(
														vray_mat_ref.texmap_environment = getReflectionMask
													)
												)
											)

											vray_mat_ref.texmap_environment_on = true

											vray_over_mat = VRayOverrideMtl()
											vray_over_mat.baseMtl = vray_mat_ref
											vray_over_mat.reflectMtl = VrayMtl diffuse:black
											vray_over_mat.reflectMtl_on = true

											renderers.current.options_reflectionRefraction = true

											for i in selection do
											(
												i.material = vray_over_mat
												setHairfarmMtl i vray_over_mat
												setFumeMtl i black
											)
										)

										-- Brazil Reflection Mask
										else if getCurrentRenderEngine() == "brazil" then
										(
											ErrorMessage = "Error Creating White Material \"Reflection Mask (Brazil)\""

											brazil_mat_ref = Brazil2_Advanced_Material()
											brazil_mat_ref.bmtl_Cs_color = black
											brazil_mat_ref.bmtl_twosided_on = true
											brazil_mat_ref.Brazil_Default.reflect_color = white
											brazil_mat_ref.TexmapMgr.Reflectivity.tms_map = Brazil2_Fresnel()
											brazil_mat_ref.TexmapMgr.Reflectivity.tms_map.base_ior = ReflectionDialog.spn_refFalloff.value
											brazil_mat_ref.Phong_Highlight.specular_level = 0
											brazil_mat_ref.Advanced_Reflection_Params.refl_gloss_on = true
											brazil_mat_ref.Advanced_Reflection_Params.refl_gloss_type = 1
											brazil_mat_ref.Advanced_Reflection_Params.refl_glossiness = ReflectionDialog.spn_refGlossy.value * 100
											brazil_mat_ref.TexmapMgr.Reflectivity.tms_map_on = ReflectionDialog.chk_refUseFalloff.state
											brazil_mat_ref.bmtl_env_map = Output()
											brazil_mat_ref.bmtl_env_map.output.RGB_Level = ReflectionDialog.spn_refEnvMultiplier.value

											curBraz.Ray_Server_Parameter_Block_Holder.ray_secondary_on = true

											for i in selection do
											(
												i.material = brazil_mat_ref
												setHairfarmMtl i brazil_mat_ref
												setFumeMtl i black
											)
										)

										-- Mentalray Reflection Mask
										else if getCurrentRenderEngine() == "mental" then
										(
											ErrorMessage = "Error Creating White Material \"Reflection Mask (MentalRay)\""

											mental_mat_ref = Arch___Design__mi()
											mental_mat_ref.diff_color = black
											mental_mat_ref.refl_color = white
											mental_mat_ref.refl_weight = 1
											mental_mat_ref.refl_gloss = ReflectionDialog.spn_refGlossy.value
											mental_mat_ref.refl_samples = ReflectionDialog.spn_refGlossySubdiv.value
											mental_mat_ref.refl_func_fresnel = ReflectionDialog.chk_refUseFalloff.state
											mental_mat_ref.refr_ior = ReflectionDialog.spn_refFalloff.value
											mental_mat_ref.refl_func_low = 1
											mental_mat_ref.refl_func_high = 1
											mental_mat_ref.refl_func_curve = 1
											mental_mat_ref.environment_map = Output()
											mental_mat_ref.environment_map.output.RGB_Level = ReflectionDialog.spn_refEnvMultiplier.value
											mental_mat_ref.opts_hl_to_refl_balance = 0

											renderers.current.RaytraceEnable = true

											for i in selection do
											(
												i.material = mental_mat_ref
												setHairfarmMtl i mental_mat_ref
												setFumeMtl i black
											)
										)
									)
									2:
									(
										-- Vray Reflection Mask
										if getCurrentRenderEngine() == "vray" then
										(
											ErrorMessage = "Error Creating White Material \"Reflection Mask (Vray)\""

											local vray_mat_ref = VrayMtl()
											vray_mat_ref.diffuse = black
											vray_mat_ref.reflection = (color 255 255 255)
											vray_mat_ref.reflection_subdivs = ReflectionDialog.spn_refGlossySubdiv.value
											vray_mat_ref.reflection_glossiness = ReflectionDialog.spn_refGlossy.value
											if ReflectionDialog.chk_refUseFalloff.state == true then
											(
												vray_mat_ref.reflection_fresnel = true
												vray_mat_ref.reflection_lockIOR = false
												vray_mat_ref.reflection_ior = ReflectionDialog.spn_refFalloff.value
											)
											else if ReflectionDialog.chk_refUseFalloff.state == false then
											(
												vray_mat_ref.reflection_fresnel = false
											)
											renderers.current.options_reflectionRefraction = true


											for b in objects where b.isselected == false do
											(
												b.material = vray_mat_ref
												setHairfarmMtl b vray_mat_ref
												--setFumeMtl b black
											)

											if chk_KeepOpacity.state == false then
											(
												for i in selection do
												(
													i.material = StandardMaterial diffuse:white selfIllumAmount:100
													setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
													setFumeMtl i white

													if i.primaryVisibility == true then append VisibleFromCameraArray i
													i.primaryVisibility = false
												)
											)
											else
											(
												for i in selection do
												(
													OpacityMap = #()
													getOpacityMaps i.material

													i.material = StandardMaterial diffuse:white selfIllumAmount:100
													setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
													setFumeMtl i white

													if OpacityMap.count != 0 then
													(
														i.material.opacityMap = OpacityMap[1]
													)

													if i.primaryVisibility == true then append VisibleFromCameraArray i
													i.primaryVisibility = false
												)
											)
										)

										-- Mentalray Reflection Mask
										else if getCurrentRenderEngine() == "mental" then
										(
											ErrorMessage = "Error Creating White Material \"Reflection Mask (MentalRay)\""

											local mental_mat_ref = Arch___Design__mi()
											mental_mat_ref.diff_color = black
											mental_mat_ref.refl_color = white
											mental_mat_ref.refl_weight = 1
											mental_mat_ref.refl_samples = ReflectionDialog.spn_refGlossySubdiv.value
											mental_mat_ref.refl_gloss = ReflectionDialog.spn_refGlossy.value
											mental_mat_ref.refl_func_fresnel = ReflectionDialog.chk_refUseFalloff.state
											mental_mat_ref.refr_ior = ReflectionDialog.spn_refFalloff.value
											mental_mat_ref.refl_func_low = 1
											mental_mat_ref.refl_func_high = 1
											mental_mat_ref.refl_func_curve = 1
											mental_mat_ref.opts_hl_to_refl_balance = 0

											renderers.current.RaytraceEnable = true

											for b in objects where b.isselected == false do
											(
												b.material = mental_mat_ref
												setHairfarmMtl b mental_mat_ref
												setFumeMtl b black
											)

											if chk_KeepOpacity.state == false then
											(
												for i in selection do
												(
													i.material = StandardMaterial diffuse:white selfIllumAmount:100
													setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
													setFumeMtl i white

													if i.primaryVisibility == true then append VisibleFromCameraArray i
													i.primaryVisibility = false
												)
											)
											else
											(
												for i in selection do
												(
													OpacityMap = #()
													getOpacityMaps i.material

													i.material = StandardMaterial diffuse:white selfIllumAmount:100
													setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
													setFumeMtl i white

													if OpacityMap.count != 0 then
													(
														i.material.opacityMap = OpacityMap[1]
													)

													if i.primaryVisibility == true then append VisibleFromCameraArray i
													i.primaryVisibility = false
												)
											)
										)
									)
								)
							)

							----------------------------------------------------------
							--- Vectors Mask
							----------------------------------------------------------
							5:
							(
								ErrorMessage = "Error Creating White Material \"Vector Mask\""

								vray_vector_mat = StandardMaterial selfillumination:100
								vray_vector_mat.diffusemap = VraySamplerInfoTex()
								vray_vector_mat.diffusemap.type = VectorDialog.ddl_vecSamplerType.selection-1
								vray_vector_mat.diffusemap.point_multiplier = VectorDialog.spn_vecPointMultiplier.value
								vray_vector_mat.diffusemap.refract_ior = VectorDialog.spn_vecRefractionIOR.value
								vray_vector_mat.diffusemap.uvw_channel = VectorDialog.spn_vecUVWChannel.value
								vray_vector_mat.diffusemap.coord_system = VectorDialog.ddl_vecCoordSys.selection-1
								vray_vector_mat.diffusemap.relative_node = VectorRelativeNode
								vray_vector_mat.diffusemap.output = VectorDialog.ddl_vecOutput.selection-1

								if chk_KeepOpacity.state == false then
								(
									for i in selection do
									(
										i.material = vray_vector_mat
										setHairfarmMtl i vray_vector_mat
										setFumeMtl i black
									)
								)
								else
								(
									for i in selection do
									(
										if classof i.material == Multimaterial then
										(
											i.material = AddMultiMtl i vray_vector_mat
										)
										else
										(
											OpacityMap = #()
											getOpacityMaps i.material

											i.material = vray_vector_mat
											setHairfarmMtl i vray_vector_mat
											setFumeMtl i black
											if OpacityMap.count != 0 then
											(
												i.material.opacityMap = OpacityMap[1]
											)
										)
									)
								)
							)

							----------------------------------------------------------
							--- Lights/Shadows Mask
							----------------------------------------------------------
							6:
							(
								-- error message
								ErrorMessage = "Error Creating White Material \"Light/Shadow Mask\""

								-- collect selected lights
								SelectLightsArray = #()
								for i = 1 to (LightsDialog.mlb_lsLightsList.selection as array).count do
								(
									append SelectLightsArray (getnodebyname LightsDialog.mlb_lsLightsList.items[(LightsDialog.mlb_lsLightsList.selection as array)[i]])
								)


								if getCurrentRenderEngine() == "vray" then
								(

									--- Turn on GI
									renderers.current.gi_on = LightsDialog.chk_lsGI.state

									-- Change VrayGlobalSettings
									renderers.current.options_lights = true

									-- Keep ColorMapping
									if LightsDialog.chk_lsColorMapping.state == true then
									(
										renderers.current.colorMapping_type = get_color_mapping_par1
										renderers.current.colorMapping_darkMult = get_color_mapping_par2
										renderers.current.colorMapping_brightMult = get_color_mapping_par3
										renderers.current.colorMapping_gamma = get_color_mapping_par4
										renderers.current.colorMapping_affectBackground = get_color_mapping_par5
										renderers.current.colorMapping_clampOutput = get_color_mapping_par6
										renderers.current.colorMapping_clampLevel = get_color_mapping_par7
										renderers.current.colorMapping_subpixel = get_color_mapping_par8
										renderers.current.colorMapping_adaptationOnly = get_color_mapping_par9
										renderers.current.colorMapping_linearWorkflow = get_color_mapping_par10
									)
									-- Keep VrayPhysicalCamera Parameters
									if LightsDialog.chk_lsPhysicalcam.state == true then
									(
										if classof VrayCam == VRayPhysicalCamera do
										(
											try(if VrayCamExposure == 1 then VrayCam.exposure = true else VrayCam.exposure = false)catch()
											try(if VrayCamVignetting == 1 then VrayCam.vignetting = true else VrayCam.vignetting = false)catch()
										)
									)
								)

								if getCurrentRenderEngine() == "mental" then
								(
									--- Turn on GI
									renderers.current.GlobalIllumEnable = LightsDialog.chk_lsGI.state
								)

								-- Turn On Selected Lights
								for i in SelectLightsArray do
								(
									try(i.on = true)catch(i.enabled = true)

									if (hasProperty i #multiplier) then
									(
										i.multiplier = i.multiplier * LightsDialog.spn_lsLightsMultiplier.value
									)

									if (hasProperty i #power) then
									(
										i.power = i.power * LightsDialog.spn_lsLightsMultiplier.value
									)

									if (hasProperty i #intensity_multiplier) then
									(
										i.intensity_multiplier = i.intensity_multiplier * LightsDialog.spn_lsLightsMultiplier.value
									)

									if (hasProperty i #intensity) then
									(
										i.intensity = i.intensity * LightsDialog.spn_lsLightsMultiplier.value
									)
								)

								case LightsDialog.rdo_lsSwitchLightShadow.state of
								(
									-- LightMask
									---------------------------
									1:
									(
										if SelectLightsArray.count != 0 then
										(
											-- Assign material
											if chk_KeepOpacity.state == false then
											(
												for i in selection do
												(
													i.material = StandardMaterial diffuse:white
													setHairfarmMtl i (StandardMaterial diffuse:white)
													setFumeMtl i black
													if classof i == FumeFX then
													(
														for f = 1 to (i.GetShader()).Smoke_Color_Gradient.NumKeys() do
														(
															(i.GetShader()).Smoke_Color_Gradient[f].color = white
														)
														for l in SelectLightsArray do
														(
															i.addlight l
														)
													)
												)
											)
											else
											(
												for i in selection do
												(
													if classof i.material == Multimaterial then
													(
														i.material = AddMultiMtl i (StandardMaterial diffuse:white)
													)
													else
													(
														OpacityMap = #()
														getOpacityMaps i.material

														i.material = StandardMaterial diffuse:white
														setHairfarmMtl i (StandardMaterial diffuse:white)
														setFumeMtl i white
														if OpacityMap.count != 0 then
														(
															i.material.opacityMap = OpacityMap[1]
														)
													)
												)
											)

											case LightsDialog.rdo_lsLightsMaskType.state of
											(
												-- Luma Light
												1:
												(
													for i in SelectLightsArray do
													(
														if (isProperty i #color) then
														(
															i.color = white
														)
													)
												)
												-- RGB Light
												2:
												(
													for i in SelectLightsArray do
													(
														try(i.color = black)catch()
													)

													GroupArray = #(#())
													BitmapArray = #()

													----------------
													----- group by 3
													for i = 1 to SelectLightsArray.count do
													(
														if i/3. == i/3 then
														(

															append GroupArray[GroupArray.count] (SelectLightsArray)[i]
															if i != SelectLightsArray.count do
															(
																append GroupArray #()
															)
														)
														else
														(
															append GroupArray[GroupArray.count] SelectLightsArray[i]
														)
													)
													------------------
													----end group by 3

													num_pass = 1
													-- loop for each group
													for i in GroupArray do
													(
														render_name_arr = ""
														num = 1
														-- loop for items in group
														for p in i do
														(
															if (getIDRGBSelection num) == 1 then try(p.color = red)catch()
															else if (getIDRGBSelection num) == 2 then try(p.color = green)catch()
															else if (getIDRGBSelection num) == 3 then try(p.color = blue)catch()
															num += 1
														)

														render_name_arr = (num_pass as string)
														num_pass += 1
														-- end loop for items in group

														if RenderMaskDialog.chk_SaveMaxFile.state == true then
														(
															SaveMaskMAXFile()
														)
														else
														(
															if chk_SingleFrame.state == true then
															(
																if SelectLightsArray.count <= 3 then
																(
																	if chk_SubmitDeadline.state == true then
																	(
																		SubmitMaskToDeadline maxfilename RenderMaskDialog.rdo_MaskType.state
																	)
																	else
																	(
																		max quick render
																	)
																)
																else if SelectLightsArray.count > 3 then
																(
																	if getCurrentRenderEngine() == "vray" then renderers.current.output_on = off

																	render_bitmap = render vfb:on
																	undisplay render_bitmap
																	append BitmapArray render_bitmap
																)
															)
															else
															(
																if theOutputFile != undefined then
																(
																	rendOutputFilename = ((getFilenamePath theOutputFile) + (getFilenameFile theOutputFile) + "_LightsPass_" + render_name_arr + "_" + (getFilenameType theOutputFile))

																	if chk_SubmitDeadline.state == true then
																	(
																		SubmitMaskToDeadline (maxfilename + "_LightsPass_" + render_name_arr) rdo_MaskType.state
																	)
																	else
																	(
																		max quick render
																	)
																)
															)
														)
														for p in i do
														(
															if (isProperty p #color) then p.color = black
														)
													)
													-- end loop for each group

													-- Open RGB Rollout
													if chk_SingleFrame.state == true then
													(
														RGBMaskRollout SelectLightsArray
													)
												)
											)
										)
									)

									-- Shadows
									--------------------------------
									2:
									(
										if chk_KeepOpacity.state == false then
										(
											for i in selection do
											(
												i.material = StandardMaterial diffuse:black
												setHairfarmMtl i (StandardMaterial diffuse:black)
												setFumeMtl i black
											)
										)
										else
										(
											for i in selection do
											(
												if classof i.material == Multimaterial then
												(
													i.material = AddMultiMtl i (StandardMaterial diffuse:black)
												)
												else
												(
													OpacityMap = #()
													getOpacityMaps i.material

													i.material = StandardMaterial diffuse:black
													setHairfarmMtl i (StandardMaterial diffuse:black)
													setFumeMtl i black

													if OpacityMap.count != 0 then
													(
														i.material.opacityMap = OpacityMap[1]
													)
												)
											)
										)
									)
								)
							)

							----------------------------------------------------------
							--- ObjectsID Mask
							----------------------------------------------------------
							7:
							(
								ErrorMessage = "Error Creating White Material \"ObjectsID\""
								GroupArray = #(#())
								BitmapArray = #()

								----- group by 3
								for i = 1 to (ObjectsIDDialog.mlb_idObjectsIDList.selection as array).count do
								(
									if i/3. == i/3 then
									(

										append GroupArray[GroupArray.count] (ObjectsIDDialog.mlb_idObjectsIDList.selection as array)[i]
										if i != (ObjectsIDDialog.mlb_idObjectsIDList.selection as array).count do
										(
											append GroupArray #()
										)
									)
									else
									(
										append GroupArray[GroupArray.count] (ObjectsIDDialog.mlb_idObjectsIDList.selection as array)[i]
									)
								) ----end group by 3

								-- loop for each group
								for i in GroupArray do
								(
									render_name_arr = ""
									local get_id_black_material = #()

									num = 1

									-- loop for items in group
									for p in i do
									(
										for o in objects where (o.gbufferchannel == ObjectsIDDialog.mlb_idObjectsIDList.items[p] as integer) do
										(
											append get_id_black_material o.material

											if (getIDRGBSelection num) == 1 then obj_id_mat = StandardMaterial diffuse:red selfIllumAmount:100
											else if (getIDRGBSelection num) == 2 then obj_id_mat = StandardMaterial diffuse:green selfIllumAmount:100
											else if (getIDRGBSelection num) == 3 then obj_id_mat = StandardMaterial diffuse:blue selfIllumAmount:100

											if chk_KeepOpacity.state == false then
											(
												o.material = obj_id_mat
												setHairfarmMtl o obj_id_mat
												setFumeMtl o obj_id_mat.diffuse
											)
											else
											(
												if classof o.material == Multimaterial then
												(
													o.material = AddMultiMtl o obj_id_mat
												)
												else
												(
													OpacityMap = #()
													getOpacityMaps o.material

													o.material = obj_id_mat
													setHairfarmMtl o obj_id_mat
													setFumeMtl o obj_id_mat.diffuse

													if OpacityMap.count != 0 then
													(
														o.material.opacityMap = OpacityMap[1]
													)
												)
											)
										)
										num += 1
										render_name_arr = render_name_arr + ("-" + (ObjectsIDDialog.mlb_idObjectsIDList.items[p] as string))
									) -- end loop for items in group


									if RenderMaskDialog.chk_SaveMaxFile.state == true then
									(
										SaveMaskMAXFile()
									)
									else
									(
										if chk_SingleFrame.state == true then
										(
											if (ObjectsIDDialog.mlb_idObjectsIDList.selection as array).count <= 3 then
											(
												if chk_SubmitDeadline.state == true then
												(
													SubmitMaskToDeadline maxfilename rdo_MaskType.state
												)
												else
												(
													max quick render
												)
											)
											else if (ObjectsIDDialog.mlb_idObjectsIDList.selection as array).count > 3 then
											(
												if getCurrentRenderEngine() == "vray" then renderers.current.output_on = off

												render_bitmap = render vfb:on
												undisplay render_bitmap
												append BitmapArray render_bitmap
											)
										)
										else
										(
											if theOutputFile != undefined then
											(
												rendOutputFilename = ((getFilenamePath theOutputFile) + (getFilenameFile theOutputFile) + "_mask_ID" + render_name_arr + "_" + (getFilenameType theOutputFile))

												if chk_SubmitDeadline.state == true then
												(
													SubmitMaskToDeadline (maxfilename + "_ID" + render_name_arr) rdo_MaskType.state
												)
												else
												(
													max quick render
												)
											)
										)
									)

									for p in i do
									(
										num = 1
										for o in objects where (o.gbufferchannel == ObjectsIDDialog.mlb_idObjectsIDList.items[p] as integer) do
										(
											o.material = get_id_black_material[num]

											if HairfarmModifierArray.count != 0 then
											(
												num = 1
												for f in HairfarmModifierArray do
												(
													f.material = StandardMaterial diffuse:black
													num += 1
												)
											)
											num += 1
										)
									)
								)-- end loop for each group

								if chk_SingleFrame.state == true then
								(
									RGBMaskRollout (ObjectsIDDialog.mlb_idObjectsIDList.selection as array)
								)
							)

							----------------------------------------------------------
							--- SSS Mask
							----------------------------------------------------------
							8:
							(
								ErrorMessage = "Error Creating White Material \"SSS Mask\""

								SSSLightArray = #()

								---Select Lights
								for i = 1 to (SSSDialog.mlb_sssLightList.selection as array).count do
								(
									append SSSLightArray (getnodebyname SSSDialog.mlb_sssLightList.items[(SSSDialog.mlb_sssLightList.selection as array)[i]])
								)

								-- Change VrayGlobalSettings
								renderers.current.options_lights = true

								try(renderers.current.options_defaultLights = true)catch(renderers.current.options_defaultLights = 1)


								-- Turn On Selected Lights
								for i in SSSLightArray do
								(
									try(i.on = true)catch(i.enabled = true)

									-- multiplier lights
									if (isProperty i #color) then
									(
										i.color = white

										if (hasProperty i #multiplier) then
										(
											i.multiplier = i.multiplier * SSSDialog.spn_sssLightMultiplier.value
										)

										if (hasProperty i #power) then
										(
											i.power = i.power * SSSDialog.spn_sssLightMultiplier.value
										)

										if (hasProperty i #intensity_multiplier) then
										(
											i.intensity_multiplier = i.intensity_multiplier * SSSDialog.spn_sssLightMultiplier.value
										)

										if (hasProperty i #intensity) then
										(
											i.intensity = i.intensity * SSSDialog.spn_sssLightMultiplier.value
										)
									)
								)

								-- ColorMapping
								--renderers.current.colorMapping_darkMult = SSSDialog.sss_dark_spn.value
								renderers.current.colorMapping_gamma = SSSDialog.spn_sssGamma.value

								--prepass
								renderers.current.gi_irradmap_showCalcPhase = SSSDialog.chk_sssShowPrepass.state


								--- SSS Material
								if SSSDialog.chk_sssLightOnly.state == false then
								(
									vray_sss_mat = VRayFastSSS2()
									vray_sss_mat.preset = 0
									vray_sss_mat.prepass_rate = SSSDialog.spn_sssRate.value
									vray_sss_mat.prepass_id = 0
									vray_sss_mat.scale = SSSDialog.spn_sssScale.value ---
									vray_sss_mat.IOR = 1.3

									vray_sss_mat.overall_color = white
									vray_sss_mat.diffuse_color = black
									vray_sss_mat.diffuse_amount = 0
									vray_sss_mat.sub_surface_color = SSSDialog.clr_sssColor.color ----
									vray_sss_mat.scatter_color = SSSDialog.clr_sssColor.color ----
									vray_sss_mat.scatter_radius = SSSDialog.spn_sssRadius.value ----
									vray_sss_mat.phase_function = 0

									vray_sss_mat.specular_color = black

									vray_sss_mat.single_scatter = SSSDialog.ddl_sssScatter.selection
									vray_sss_mat.single_scatter_subdivs = SSSDialog.spn_sssSubdiv.value ----
									vray_sss_mat.front_lighting = SSSDialog.chk_sssFronLight.state ----
									vray_sss_mat.back_lighting = SSSDialog.chk_sssBackLight.state ---
									vray_sss_mat.scatter_gi = false
									vray_sss_mat.prepass_blur
									vray_sss_mat.cutoff_threshold = 0.01

									for i in selection do
									(
										i.material = vray_sss_mat
										setHairfarmMtl i vray_sss_mat
										setFumeMtl i black
									)
								)
								else
								(
									vray_light_sss_mat = VrayMtl diffuse:SSSDialog.clr_sssColor.color
									for i in selection do
									(
										i.material = vray_light_sss_mat
										setHairfarmMtl i vray_light_sss_mat
										setFumeMtl i black
									)
								)
							)

							----------------------------------------------------------
							--- Texture Mask
							----------------------------------------------------------
							9:
							(
								ErrorMessage = "Error Creating White Material \"Texture Mask\""
								if getTextureMask != undefined then
								(
									if TextureDialog.chk_texColorMapping.state == true do
									(
										renderers.current.colorMapping_type = get_color_mapping_par1
										renderers.current.colorMapping_darkMult = get_color_mapping_par2
										renderers.current.colorMapping_brightMult = get_color_mapping_par3
										renderers.current.colorMapping_gamma = get_color_mapping_par4
										renderers.current.colorMapping_affectBackground = get_color_mapping_par5
										renderers.current.colorMapping_clampOutput = get_color_mapping_par6
										renderers.current.colorMapping_clampLevel = get_color_mapping_par7
										renderers.current.colorMapping_subpixel = get_color_mapping_par8
										renderers.current.colorMapping_adaptationOnly = get_color_mapping_par9
										renderers.current.colorMapping_linearWorkflow = get_color_mapping_par10
									)
									if chk_KeepOpacity.state == false then
									(
										for i in selection do
										(
											i.material = StandardMaterial diffuse:TextureDialog.clr_texColor.color diffuseMap:getTextureMask selfIllumAmount:100
											setHairfarmMtl i (StandardMaterial diffuse:TextureDialog.clr_texColor.color diffuseMap:getTextureMask selfIllumAmount:100)
											setFumeMtl i black
										)
									)
									else
									(
										for i in selection do
										(
											if classof i.material == Multimaterial then
											(
												i.material = AddMultiMtl i (StandardMaterial diffuse:TextureDialog.clr_texColor.color diffuseMap:getTextureMask selfIllumAmount:100)
											)
											else
											(
												OpacityMap = #()
												getOpacityMaps i.material

												i.material = StandardMaterial diffuse:TextureDialog.clr_texColor.color diffuseMap:getTextureMask selfIllumAmount:100
												setHairfarmMtl i (StandardMaterial diffuse:TextureDialog.clr_texColor.color diffuseMap:getTextureMask selfIllumAmount:100)
												setFumeMtl i black
												if OpacityMap.count != 0 then
												(
													i.material.opacityMap = OpacityMap[1]
												)
											)
										)
									)
								)
								else
								(
									messagebox "Pick TextureMap From Material Editor"
								)
							)

							----------------------------------------------------------
							--- Ambient Mask
							----------------------------------------------------------
							10:
							(
								ErrorMessage = "Error Creating White Material \"Ambient Mask\""

								if getCurrentRenderEngine() == "vray" then
								(
									ao_material = VRayDirt()
									ao_material.radius = AmbientDialog.spn_aoRadius.value
									ao_material.subdivs = AmbientDialog.spn_aoSubdiv.value
									if AmbientDialog.chk_aoInvert.state == true then
									(
										ao_material.occluded_color = white
										ao_material.unoccluded_color = black
									)
									else
									(
										ao_material.occluded_color = black
										ao_material.unoccluded_color = white
									)
									if chk_KeepOpacity.state == false then
									(
										for i in selection do
										(
											i.material = StandardMaterial diffuseMap:ao_material selfIllumAmount:100
											setHairfarmMtl i (StandardMaterial diffuseMap:ao_material selfIllumAmount:100)
											setFumeMtl i black
										)
									)
									else
									(
										for i in selection do
										(
											if classof i.material == Multimaterial then
											(
												i.material = AddMultiMtl i (StandardMaterial diffuseMap:ao_material selfIllumAmount:100)
											)
											else
											(
												OpacityMap = #()
												getOpacityMaps i.material

												i.material = StandardMaterial diffuseMap:ao_material selfIllumAmount:100
												setHairfarmMtl i (StandardMaterial diffuseMap:ao_material selfIllumAmount:100)
												setFumeMtl i black
												if OpacityMap.count != 0 then
												(
													i.material.opacityMap = OpacityMap[1]
												)
											)
										)
									)
									if AmbientDialog.chk_aoGamma.state == true then
									(
										renderers.current.colorMapping_gamma = 2.2
									)
								)

								if getCurrentRenderEngine() == "mental" then
								(
									ao_material = Ambient_Reflective_Occlusion__3dsmax()
									ao_material.max_distance = AmbientDialog.spn_aoRadius.value
									ao_material.samples = AmbientDialog.spn_aoSubdiv.value
									if AmbientDialog.chk_aoInvert.state == true then
									(
										ao_material.dark = white
										ao_material.bright = black
									)
									else
									(
										ao_material.dark = black
										ao_material.bright = white
									)
									if chk_KeepOpacity.state == false then
									(
										for i in selection do
										(
											i.material = StandardMaterial diffuseMap:ao_material selfIllumAmount:100
											setHairfarmMtl i (StandardMaterial diffuseMap:ao_material selfIllumAmount:100)
											setFumeMtl i black
										)
									)
									else
									(
										for i in selection do
										(
											if classof i.material == Multimaterial then
											(
												i.material = AddMultiMtl i (StandardMaterial diffuseMap:ao_material selfIllumAmount:100)
											)
											else
											(
												OpacityMap = #()
												getOpacityMaps i.material

												i.material = StandardMaterial diffuseMap:ao_material selfIllumAmount:100
												setHairfarmMtl i (StandardMaterial diffuseMap:ao_material selfIllumAmount:100)
												setFumeMtl i black
												if OpacityMap.count != 0 then
												(
													i.material.opacityMap = OpacityMap[1]
												)
											)
										)
									)
								)
							)
							----------------------------------------------------------
							--- ZDepth Mask
							----------------------------------------------------------
							11:
							(
								ErrorMessage = "Error Creating White Material \"ZDepth Mask\""
								if ZDialog.chk_zAA.state == false then
								(
									case getCurrentRenderEngine() of
									(
										"vray":
										(
											renderSceneDialog.close()
											renderers.current.imageSampler_type = 0
											renderers.current.fixedRate_subdivs = 1
										)
										"scanline":
										(
											renderSceneDialog.close()
											renderers.current.antiAliasing = false
										)
										"mental":
										(
											renderSceneDialog.close()
											renderers.current.filter = 4
											renderers.current.MinimumSamples = 0
											renderers.current.MaximumSamples = 0
										)
									)
								)
								else
								(
									if get_vray_aa != undefined do
									(
										renderers.current.imageSampler_type = get_vray_aa
									)
									if get_scanline_aa != undefined do
									(
										renderers.current.antiAliasing = get_scanline_aa
									)
									if get_mental_aa_filter != undefined do
									(
										renderers.current.filter = get_mental_aa_filter
										renderers.current.MinimumSamples = get_mental_aa_min
										renderers.current.MaximumSamples = get_mental_aa_max
									)
								)

								z_material = StandardMaterial selfIllumAmount:100
								z_material.diffusemap = falloff()
								if ZDialog.chk_zInvert.state == false then
								(
									z_material.diffusemap.color1 = white
									z_material.diffusemap.color2 = black
								)
								else
								(
									z_material.diffusemap.color1 = black
									z_material.diffusemap.color2 = white
								)
								z_material.diffusemap.type = 4
								z_material.diffusemap.direction = 0
								z_material.diffusemap.nearDistance = ZDialog.spn_zNear.value
								z_material.diffusemap.farDistance = ZDialog.spn_zFar.value
-- 									z_material.diffusemap.extrapolateOn = ZDialog.extrapolate_chk.state
								z_material.diffusemap.extrapolateOn = true

								if chk_KeepOpacity.state == false then
								(
									for i in selection do
									(
										i.material = z_material
										setHairfarmMtl i z_material
										setFumeMtl i black
									)
								)
								else
								(
									for i in selection do
									(
										if classof i.material == Multimaterial then
										(
											i.material = AddMultiMtl i z_material
										)
										else
										(
											OpacityMap = #()
											getOpacityMaps i.material

											i.material = z_material
											setHairfarmMtl i z_material
											setFumeMtl i black
											if OpacityMap.count != 0 then
											(
												i.material = copy z_material
												i.material.opacityMap = OpacityMap[1]
											)
										)
									)
								)
								ptxt = (ZDialog.spn_zNear.value as string) + "||" + (ZDialog.spn_zFar.value as string)
								fileProperties.addProperty #custom "rendermask_ZDepth" ptxt
							)
							----------------------------------------------------------
							--- Specular Mask
							----------------------------------------------------------
							12:
							(
								ErrorMessage = "Error Creating White Material \"Specular Mask\""

								if getCurrentRenderEngine() == "vray" then
								(
									if SpecularDialog.chk_spColorMapping.state == true do
									(
										renderers.current.colorMapping_type = get_color_mapping_par1
										renderers.current.colorMapping_darkMult = get_color_mapping_par2
										renderers.current.colorMapping_brightMult = get_color_mapping_par3
										renderers.current.colorMapping_gamma = get_color_mapping_par4
										renderers.current.colorMapping_affectBackground = get_color_mapping_par5
										renderers.current.colorMapping_clampOutput = get_color_mapping_par6
										renderers.current.colorMapping_clampLevel = get_color_mapping_par7
										renderers.current.colorMapping_subpixel = get_color_mapping_par8
										renderers.current.colorMapping_adaptationOnly = get_color_mapping_par9
										renderers.current.colorMapping_linearWorkflow = get_color_mapping_par10
									)

									-- Change VrayGlobalSettings
									renderers.current.options_lights = true

									try(renderers.current.options_defaultLights = true)catch(renderers.current.options_defaultLights = 1)
								)

								---Select Lights
								SpecularLightsArray = #()
								for i = 1 to (SpecularDialog.mlb_spLightList.selection as array).count do
								(
									append SpecularLightsArray (getnodebyname SpecularDialog.mlb_spLightList.items[(SpecularDialog.mlb_spLightList.selection as array)[i]])
								)

								-- Turn On Selected Lights
								for i in SpecularLightsArray do
								(
									try(i.on = true)catch(i.enabled = true)

									-- multiplier lights
									if (isProperty i #color) then
									(
										--i.color = white
										if (hasProperty i #multiplier) then
										(
											i.multiplier = i.multiplier * SpecularDialog.spn_spLightMultiplier.value
										)

										if (hasProperty i #power) then
										(
											i.power = i.power * SpecularDialog.spn_spLightMultiplier.value
										)

										if (hasProperty i #intensity_multiplier) then
										(
											i.intensity_multiplier = i.intensity_multiplier * SpecularDialog.spn_spLightMultiplier.value
										)

										if (hasProperty i #intensity) then
										(
											i.intensity = i.intensity * SpecularDialog.spn_spLightMultiplier.value
										)
									)
								)

								--LightsColor
								if SpecularDialog.chk_spRGBLights.state == false then
								(
									-- WhiteColor
									for i in SpecularLightsArray do
									(
										if (isProperty i #color) then
										(
											i.color = white
										)
									)
								)
								else
								(
									-- RGB Color
									if SpecularLightsArray.count <= 3 then
									(
										num = 1
										for i in SpecularLightsArray do
										(
											if (isProperty i #color) then
											(
												case num of
												(
													1: i.color = red
													2: i.color = green
													3: i.color = blue
												)
											)
											num += 1
										)
									)
									else
									(
										messagebox "Select One, Two or Tree Lights"
									)
								)

								if chk_KeepOpacity.state == false then
								(
									for i in selection do
									(
										i.material = StandardMaterial diffuse:black specularLevel:SpecularDialog.spn_spLevel.value \
										glossiness:SpecularDialog.spn_spGlossy.value

										setHairfarmMtl i (StandardMaterial diffuse:black specularLevel:SpecularDialog.spn_spLevel.value \
										glossiness:SpecularDialog.spn_spGlossy.value)

										setFumeMtl i black
									)
								)
								else
								(
									for i in selection do
									(
										if classof i.material == Multimaterial then
										(
											i.material = AddMultiMtl i (StandardMaterial diffuse:black specularLevel:SpecularDialog.spn_spLevel.value \
											glossiness:SpecularDialog.spn_spGlossy.value)
										)
										else
										(
											OpacityMap = #()
											getOpacityMaps i.material

											i.material = StandardMaterial diffuse:black specularLevel:SpecularDialog.spn_spLevel.value \
											glossiness:SpecularDialog.spn_spGlossy.value

											setHairfarmMtl i (StandardMaterial diffuse:black specularLevel:SpecularDialog.spn_spLevel.value \
											glossiness:SpecularDialog.spn_spGlossy.value)

											setFumeMtl i black

											if OpacityMap.count != 0 then
											(
												i.material.opacityMap = OpacityMap[1]
											)
										)
									)
								)
							)

							----------------------------------------------------------
							--- LumaRGB Mask
							----------------------------------------------------------
							13:
							(
								ErrorMessage = "Error Creating White Material \"LumaRGB\""
								GroupArray = #(#())
								sel_rgb_arr = selection as array
								BitmapArray = #()

								----- group by 3
								for i = 1 to sel_rgb_arr.count do
								(
									if i/3. == i/3 then
									(

										append GroupArray[GroupArray.count] sel_rgb_arr[i]
										if i != sel_rgb_arr.count do
										(
											append GroupArray #()
										)
									)
									else
									(
										append GroupArray[GroupArray.count] sel_rgb_arr[i]
									)
								) ----end group by 3

								-- loop for each group
								num_pass = 1
								for i in GroupArray do
								(
									render_name_arr = ""
									local get_id_black_material = #()

									num = 1
									-- loop for items in group
									for p in i do
									(

										append get_id_black_material p.material

										if (getIDRGBSelection num) == 1 then obj_id_mat = StandardMaterial diffuse:red selfIllumAmount:100
										else if (getIDRGBSelection num) == 2 then obj_id_mat = StandardMaterial diffuse:green selfIllumAmount:100
										else if (getIDRGBSelection num) == 3 then obj_id_mat = StandardMaterial diffuse:blue selfIllumAmount:100

										if chk_KeepOpacity.state == false then
										(
											p.material = obj_id_mat
											setHairfarmMtl p obj_id_mat
											setFumeMtl p obj_id_mat.diffuse
										)
										else
										(
											if classof p.material == Multimaterial then
											(
												p.material = AddMultiMtl p obj_id_mat
											)
											else
											(
												OpacityMap = #()
												getOpacityMaps p.material

												p.material = obj_id_mat
												setHairfarmMtl p obj_id_mat
												setFumeMtl p obj_id_mat.diffuse
												if OpacityMap.count != 0 then
												(
													p.material.opacityMap = OpacityMap[1]
												)
											)
										)
										num += 1
										render_name_arr = render_name_arr + ("-" + (num_pass as string))
										num_pass += 1
									) -- end loop for items in group


									if RenderMaskDialog.chk_SaveMaxFile.state == true then
									(
										SaveMaskMAXFile()
									)
									else
									(
										if chk_SingleFrame.state == true then
										(
											if sel_rgb_arr.count <= 3 then
											(
												if chk_SubmitDeadline.state == true then
												(
													SubmitMaskToDeadline maxfilename rdo_MaskType.state
												)
												else
												(
													max quick render
												)
											)
											else if sel_rgb_arr.count > 3 then
											(
												if getCurrentRenderEngine() == "vray" then renderers.current.output_on = off

												render_bitmap = render vfb:on
												undisplay render_bitmap
												append BitmapArray render_bitmap
											)
										)
										else
										(
											if theOutputFile != undefined then
											(
												rendOutputFilename = ((getFilenamePath theOutputFile) + (getFilenameFile theOutputFile) + "_LumaRGB_pass" + render_name_arr + "_" + (getFilenameType theOutputFile))

												if chk_SubmitDeadline.state == true then
												(
													SubmitMaskToDeadline (maxfilename + "_LumaRGB_" + render_name_arr) rdo_MaskType.state
												)
												else
												(
													max quick render
												)
											)
										)
									)

									for p in i do
									(
										num = 1
										p.material = get_id_black_material[num]

										if HairfarmModifierArray.count != 0 then
										(
											for f in HairfarmModifierArray do
											(
												f.material = Standardmaterial diffuse:black
											)
										)
										num += 1
									)
								)-- end loop for each group

								if chk_SingleFrame.state == true then
								(
									RGBMaskRollout sel_rgb_arr
								)
							)
							----------------------------------------------------------
							--- Refraction Mask
							----------------------------------------------------------
							14:
							(
								ErrorMessage = "Error Creating White Material \"Refraction Mask\""

								renderers.current.options_reflectionRefraction = true
								if chk_KeepOpacity.state == false then
								(
									for i in selection do
									(
										i.primaryVisibility = false

										i.material = StandardMaterial diffuse:white selfIllumAmount:100
										setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
										setFumeMtl i white
									)
								)
								else
								(
									for i in selection do
									(
										i.primaryVisibility = false

										OpacityMap = #()
										getOpacityMaps i.material

										i.material = StandardMaterial diffuse:white selfIllumAmount:100
										setHairfarmMtl i (StandardMaterial diffuse:white selfIllumAmount:100)
										setFumeMtl i white
										if OpacityMap.count != 0 then
										(
											i.material.opacityMap = OpacityMap[1]
										)
									)
								)
							)
						)
----------------------------------------------------------
					-- End White Material
----------------------------------------------------------
					-- timestamp
-- 	 					et = timestamp()
-- 	 					print "====PreRender====="
-- 	 					print ((et-st)/1000.)

----------------------------------------------------------------------------------
						-- RENDER
----------------------------------------------------------------------------------
						(
							ErrorMessage = "Error While Render"
							if RenderMaskDialog.rdo_MaskType.state != 7 then
							(
								if RenderMaskDialog.rdo_MaskType.state != 13 then
								(
									if LightsDialog.rdo_lsLightsMaskType.state != 2 then
									(
										RenderMaskFN ()
									)
								)
							)
						)
					)
					catch
					(
						messagebox ("RenderMask Error\n" + ErrorMessage)
					)
----------------------------------------------------------------------------------
						-- RENDER
----------------------------------------------------------------------------------
				-- timestamp
-- 					st = timestamp()

				-- TurnOn Active Effects
					if getActiveEffectsArray.count != 0 then
					(
						for i in getActiveEffectsArray do
						(
							setActive (getEffect i) true
						)
					)

					-- Return Expolsure Control
					SceneExposureControl.exposureControl = getExposure

					-- Return Original Material and Settings
					(
						undo off
						(
							num = 1
							if allMaterialObjArray.count != 0 do
							(
								for i in allMaterialObjArray do
								(
									allMaterialObjArray[num].material = allMaterialArray[num]
									num += 1
								)
							)
						)
						-- Return No Material
						if allNoMaterialObjArray.count != 0 do allNoMaterialObjArray.material = undefined

						-- Return Visible to Camera
						if VisibleToCameraArray.count != 0 then for o in VisibleToCameraArray do o.primaryVisibility = true

						-- Return Lights
						if LightsOnArray.count != 0 do (for l in LightsOnArray do (l.on = true))
						if BrazilLightsArray.count != 0 do (for l in BrazilLightsArray do ( l.Base_Parameters.enabled_on = true ))
						if BrazilDomeLightsArray.count != 0 do (for l in BrazilDomeLightsArray do (l.Parameters.enabled_on = true ))
						if VraySunLightsArray.count != 0 do (for l in VraySunLightsArray do (l.enabled = true))
						if VrayIESLightsArray.count != 0 do (for l in VrayIESLightsArray do (l.enabled = true))
						if DreamScapeSunArray.count != 0 do (for l in DreamScapeSunArray do (l.enabled = true))
						if VrayAmbienLightsArray.count != 0 do (for l in VrayAmbienLightsArray do (l.enabled = true))
						case rdo_MaskType.state of
						(
							6:
							(
								if getLightColorObjArray.count != 0 then
								(
									num = 1
									for l in getLightColorObjArray do
									(
										l.color = getLightColorArray[num]
										num += 1
									)
								)
								if LightsOffArray.count != 0 do (for l in LightsOffArray do (l.on = false))
								if VraySunLightsOffArray.count != 0 do (for l in VraySunLightsOffArray do (l.enabled = false))
								if VrayIESLightsOffArray.count != 0 do (for l in VrayIESLightsOffArray do (l.enabled = false))
								if VrayAmbienLightsOffArray.count != 0 do (for l in VrayAmbienLightsOffArray do (l.enabled = false))

								if SelectLightsArray.count != 0 then
								(
									for i in SelectLightsArray do
									(
										if (hasProperty i #multiplier) then i.multiplier = i.multiplier * 1 / LightsDialog.spn_lsLightsMultiplier.value
										if (hasProperty i #power) then i.power = i.power * 1 / LightsDialog.spn_lsLightsMultiplier.value
										if (hasProperty i #intensity_multiplier) then i.intensity_multiplier = i.intensity_multiplier * 1 / LightsDialog.spn_lsLightsMultiplier.value
										if (hasProperty i #intensity) then i.intensity = i.intensity * 1 / LightsDialog.spn_lsLightsMultiplier.value
									)
								)
							)
							8:
							(
								if SSSLightArray.count != 0 then
								(
									for i in SSSLightArray do
									(
										if (hasProperty i #multiplier) then i.multiplier = i.multiplier * 1 / SSSDialog.spn_sssLightMultiplier.value
										if (hasProperty i #power) then i.power = i.power * 1 / SSSDialog.spn_sssLightMultiplier.value
										if (hasProperty i #intensity_multiplier) then i.intensity_multiplier = i.intensity_multiplier * 1 / SSSDialog.spn_sssLightMultiplier.value
										if (hasProperty i #intensity) then i.intensity = i.intensity * 1 / SSSDialog.spn_sssLightMultiplier.value
									)
								)
							)
							12:
							(
								if getLightColorObjArray.count != 0 then
								(
									num = 1
									for l in getLightColorObjArray do
									(
										l.color = getLightColorArray[num]
										num += 1
									)
								)
								if LightsOffArray.count != 0 do (for l in LightsOffArray do (l.on = false))
								if VraySunLightsOffArray.count != 0 do (for l in VraySunLightsOffArray do (l.enabled = false))
								if VrayIESLightsOffArray.count != 0 do (for l in VrayIESLightsOffArray do (l.enabled = false))
								if VrayAmbienLightsOffArray.count != 0 do (for l in VrayAmbienLightsOffArray do (l.enabled = false))

								if SelectLightsArray.count != 0 then
								(
									for i in SelectLightsArray do
									(
										if (hasProperty i #multiplier) then i.multiplier = i.multiplier * 1 / SpecularDialog.spn_spLightMultiplier.value
										if (hasProperty i #power) then i.power = i.power * 1 / SpecularDialog.spn_spLightMultiplier.value
										if (hasProperty i #intensity_multiplier) then i.intensity_multiplier = i.intensity_multiplier * 1 / SpecularDialog.spn_spLightMultiplier.value
										if (hasProperty i #intensity) then i.intensity = i.intensity * 1 / SpecularDialog.spn_spLightMultiplier.value
									)
								)
							)
						)

						-- Return DreamTerren
						if DreamScapeTerrenArray.count != 0 then DreamScapeTerrenArray.RenderAsGeom = false

						-- Return DreamScape Atmospheric
						if AtmosphereArray.count != 0 then
						(
							for a in AtmosphereArray do
							(
								setActive (getAtmospheric a) true
							)
						)

						-- Return VrayCamera Options
						if classof VrayCam == VRayPhysicalCamera do
						(
							VrayCam.exposure = VrayCamExposure
							VrayCam.vignetting = VrayCamVignetting
						)

						-- Return VrayPropreties
						if VrayMatteObjArray.count != 0 then
						(
							for i in VrayMatteObjArray do
							(
								setUserProp i "VRay_Matte_Enable" true
							)
						)

						-- Return Visible From Camera
						if VisibleFromCameraArray.count != 0 then
						(
							for i in VisibleFromCameraArray do
							(
								i.primaryVisibility = true
							)
						)
					)

				-- Return Brazil2 settings
					if getCurrentRenderEngine() == "brazil" then
					(
						curBraz = trackviewnodes.brazil_r_s[renderers.current.renderer_no+1]
						curBraz.Luma_Server_Parameter_Block_Holder.directlight_on = getBrazilDirect
						curBraz.Luma_Server_Parameter_Block_Holder.dirsky_on = getBrazilSky
						curBraz.Luma_Server_Parameter_Block_Holder.global_illum_on = getBrazilIndirect
						curBraz.Ray_Server_Parameter_Block_Holder.ray_secondary_on = getBrazilSecondary
					)

				-- Return VrayRender settings
					if getCurrentRenderEngine() == "vray" then
					(
						renderers.current.output_on = getVrayVFB
						renderers.current.options_overrideMtl_on = getVrayOverrideMtl
						renderers.current.output_saveRawFile = getVraySaveImage
						renderers.current.output_splitgbuffer = getVraySplitbuffer
						renderers.current.options_defaultLights = opt_lights_def
						renderers.current.options_lights = opt_lights
						renderers.current.options_reflectionRefraction = opt_ref_raf
						renderers.current.gi_on = getVrayGI
						renderers.current.gi_irradmap_showCalcPhase = get_vray_prepass
						renderers.current.environment_gi_on = get_gi_environment

						renderers.current.colorMapping_type = get_color_mapping_par1
						renderers.current.colorMapping_darkMult = get_color_mapping_par2
						renderers.current.colorMapping_brightMult = get_color_mapping_par3
						renderers.current.colorMapping_gamma = get_color_mapping_par4
						renderers.current.colorMapping_affectBackground = get_color_mapping_par5
						renderers.current.colorMapping_clampOutput = get_color_mapping_par6
						renderers.current.colorMapping_clampLevel = get_color_mapping_par7
						renderers.current.colorMapping_subpixel = get_color_mapping_par8
						renderers.current.colorMapping_adaptationOnly = get_color_mapping_par9
						renderers.current.colorMapping_linearWorkflow = get_color_mapping_par10
					)

					-- Return MentalRay Setting
					if getCurrentRenderEngine() == "mental" then
					(
						renderers.current.FinalGatherEnable2 = getMentalrayFG
						renderers.current.GlobalIllumEnable = getMentalrayGI
						renderers.current.RaytraceEnable = getMentalrayRay
					)

					-- Return Render Settings
					(
						getMaxRenderElements.SetElementsActive getActiveMaxRenderElements
						useEnvironmentMap = getUseEnvMap
						backgroundColor = getUseEnvColor
						rendOutputFilename = getMaxRenderOutput
						rendTimeType = getMaxRenderType
						rendSaveFile = getMaxRenderSave
						rendUseNet = getMaxNetRender
						renderSceneDialog.update()
						theOutputFile = undefined
					)

					-- Return AA
					(
						if get_vray_aa != undefined do
						(
							renderers.current.imageSampler_type = get_vray_aa
						)
						if get_scanline_aa != undefined do
						(
							renderers.current.antiAliasing = get_scanline_aa
						)
						if get_mental_aa_filter != undefined do
						(
							renderers.current.filter = get_mental_aa_filter
							renderers.current.MinimumSamples = get_mental_aa_min
							renderers.current.MaximumSamples = get_mental_aa_max
						)
					)

					-- Return HairFarm
					(
						if HairfarmModifierArray.count != 0 then
						(
							num = 1
							for f in HairfarmModifierArray do
							(
								f.material = HairfarmMtlArray[num]
								num += 1
							)
						)
					)

					-- Return FumeFX
					(
						if FumeObjArray.count != 0 then
						(
							num = 1
							for i in FumeObjArray do
							(
								for f = 1 to (i.GetShader()).Fire_Color_Gradient.NumKeys() do
								(
									(i.GetShader()).Fire_Color_Gradient[f].color = FumeObjColorArray[num][f]
								)

								(i.GetShader()).SmokeAmbientColor = FumeObjColorArray[num][((i.GetShader()).Fire_Color_Gradient.NumKeys())+1]

								for f = 1 to (i.GetShader()).Smoke_Color_Gradient.NumKeys() do
								(
									(i.GetShader()).Smoke_Color_Gradient[f].color = FumeObjColorArray[num][(((i.GetShader()).Fire_Color_Gradient.NumKeys())+1) + f]
								)
								(i.GetShader()).FuelAmbientColor = FumeObjColorArray[num][(((i.GetShader()).Fire_Color_Gradient.NumKeys()) + ((i.GetShader()).Smoke_Color_Gradient.NumKeys())) + 2]

								num += 1
							)
						)

						-- Return FumeFX Lights
						if rdo_MaskType.state == 6 then
						(
							if LightsDialog.rdo_lsSwitchLightShadow.state == 1 then
							(
								if FumeSelLightsArray.count != 0 then
								(
									num = 1
									for obj in FumeSelLightsArray do
									(
										local remove_lights = obj.Lights
										for r in remove_lights do
										(
											obj.RemoveLight r
										)
										if FumeLightsArray[num].count != 0 then
										(
											for l in FumeLightsArray[num] do
											(
												obj.AddLight (getnodebyname l)
											)
										)
										num += 1
									)
								)
							)
						)
					)
					-- Return Forest_Lite
					if ForestLiteArray.count != 0 then
					(
						for i in ForestLiteArray do
						(
							i.consmat = true
						)
						ForestLiteArray = #()
					)
					-- Material Propagate Material to Instance
					if getPropagateMtlInstance == true do
					(
						InstanceMgr.autoMtlPropagation = true
					)

					gc light:true
				)
				else (messagebox "Select Object(s)" title:"Render Mask")
				enableSceneRedraw()

			-- timestamp
--  				et = timestamp()
--  				print "====PostRender====="
--  				print ((et-st)/1000.)
			)
		)

		on chk_SubmitBackburner changed state do
		(
			if chk_SubmitBackburner.state == true then
			(
				chk_SubmitDeadline.state = false
				try(destroydialog DeadlineDialog)catch()
				try(destroydialog DeadlineLimitsDialog)catch()
			)
		)

		on chk_SubmitDeadline changed state do
		(
			if chk_SubmitDeadline.state == true then
			(
				chk_SubmitBackburner.state = false
				try(createdialog DeadlineDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) - 200,(GetDialogPos RenderMaskDialog).y + DeadlineDialogOffsetY])catch()
			)
			if chk_SubmitDeadline.state == false then
			(
				try(destroydialog DeadlineDialog)catch()
				try(destroydialog DeadlineLimitsDialog)catch()
			)
		)

		on chk_SingleFrame changed state do
		(
			if chk_SingleFrame.state == true then
			(
				rdo_MaskTimeRange.enabled = false
				chk_SaveMaxFile.enabled = false
				chk_SaveMaxFile.checked = false
				chk_SubmitBackburner.state = false
				chk_SubmitBackburner.enabled = false
				chk_SubmitDeadline.state = false
				chk_SubmitDeadline.enabled = false
				edt_StateName.enabled = false
				chb_CreateState.enabled = false
				chb_CreateState.state = false
				try(destroydialog DeadlineDialog)catch()
				try(destroydialog DeadlineLimitsDialog)catch()
			)
			else
			(
				rdo_MaskTimeRange.enabled = true
				chk_SaveMaxFile.enabled = true
				chk_SubmitBackburner.enabled = true
				chk_SubmitDeadline.enabled = true
				edt_StateName.enabled = true
				chb_CreateState.enabled = true
				try(destroydialog DeadlineDialog)catch()
				try(destroydialog DeadlineLimitsDialog)catch()
			)

			if rdo_MaskType.state == 7 then
			(
				chk_SaveMaxFile.enabled = false
				chk_SaveMaxFile.state = false
			)
		)

	-- run State
	----------------------------------------------------------------------------
		on btn_MaskState changed state do
		(
			if btn_MaskState.state == true then
			(
				createdialog StateDialog style:#(#style_sysmenn) pos:[((GetDialogPos RenderMaskDialog).x) - 200,(GetDialogPos RenderMaskDialog).y]
			)
			else
			(
				try(destroydialog StateDialog)catch()
			)
		)

	-- help button
	----------------------------------------------------------------------------
		on help_btn pressed do
		(
			ShellLaunch getInternetExpPath "http://www.illusionboxstudio.com"
		)
	)
	createdialog RenderMaskDialog pos:[DialogPosX, DialogPosY]
)
