syn clear

"+/- actios
setlocal iskeyword+=-,+
syn match   csHoldRelease /[+-]/ nextgroup=csActionHR,csNetworkHR,csSoundHR
syn match   csActionHR /attack\>/    contained
syn match   csActionHR /attack2\>/   contained
syn match   csActionHR /back\>/      contained
syn match   csActionHR /duck\>/      contained
syn match   csActionHR /forward\>/   contained
syn match   csActionHR /jump\>/      contained
syn match   csActionHR /klook\>/     contained
syn match   csActionHR /left\>/      contained
syn match   csActionHR /lookdown\>/  contained
syn match   csActionHR /lookup\>/    contained
syn match   csActionHR /mlook\>/     contained
syn match   csActionHR /movedown\>/  contained
syn match   csActionHR /movedown\>/  contained
syn match   csActionHR /moveright\>/ contained
syn match   csActionHR /moveup\>/    contained
syn match   csActionHR /reload\>/    contained
syn match   csActionHR /klook\>/     contained
syn match   csActionHR /right\>/     contained
syn match   csActionHR /speed\>/     contained
syn match   csActionHR /strafe\>/    contained
syn match   csActionHR /use\>/       contained
syn match   csActionHR /zoom\>/      contained

syn keyword csAction   cl_autowepswitch chooseteam drop force_centerview 
syn keyword csAction   impulse hud_fastswitch jointeam kill use

syn keyword csBuyCmds   autobuy rebuy buy buyammo1 buyammo2 buyequip buymenu 

syn keyword csConsoleCmds   alias bind BindToggle con_enable con_notifytime
syn keyword csConsoleCmds   contimes clear cvarlist developer differences 
syn keyword csConsoleCmds   echo exec exit find help hideconsole incrementvar 
syn keyword csConsoleCmds   key_findbinding key_listboundkeys key_updatelayout mem_dump
syn keyword csConsoleCmds   quit status stuffcmds toggleconsole unbind unbindall wait

syn keyword csHudOnscreen   cl_autohelp cl_c4progressbar cl_righthand cl_showfps
syn keyword csHudOnscreen   cl_showtextmsg gameui_hide hud_centerid hud_deathnotice_time
syn keyword csHudOnscreen   hud_drawhistory_time hud_saytext_time hud_showtargetid 
syn keyword csHudOnscreen   messagemode messagemode2  name radio1 radio2 radio3 
syn keyword csHudOnscreen   revert scr_centertime say say_team timeleft

syn keyword csHudCrosshair   cl_crosshairalpha cl_crosshaircolor cl_crosshairscale 
syn keyword csHudCrosshair   cl_crosshairusealpha cl_dynamiccrosshair cl_observercrosshair 
syn keyword csHudCrosshair   cl_scalecrosshair crosshair

syn keyword csHudRadar   cl_radaralpha cl_radartype drawradar hideradar

syn keyword csMenu   cancelselect escape invnext invprev lastinv menuselect 
syn keyword csMenu   slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10

syn keyword csMouse   m_filter m_forward m_pitch m_side m_yaw 
syn keyword csMouse   sensitivity zoom_sensitivity_ratio

syn match   csNetworkHR /graph\>/ contained 
syn keyword csNetwork   cl_allowdownload cl_allowupload cl_cmdbackup 
syn keyword csNetwork   cl_cmdrate cl_updaterate connect disconnect net_channels 
syn keyword csNetwork   net_graph net_graphheight net_graphpos net_maxfragments 
syn keyword csNetwork   net_scale ping retry

syn match   csScore /score\>/      contained
syn match   csScore /showscores\>/ contained
syn keyword csScore togglescores

syn keyword csScreenshot  jpeg jpeg_quality screenshot

syn match   csSoundHR /voicerecord\>/ contained
syn keyword csSound   bgmvolume cd cl_customsounds play soundscape_fadetime 
syn keyword csSound   soundscape_flush stopsoundscape voice_enable 
syn keyword csSound   voice_overdrive voice_scale volume

syn keyword csVideo   fog_enable fps_max mat_antialias mat_bumpmap mp_decals 
syn keyword csVideo   mat_dxlevel mat_fastspecular mat_forceansio mat_monitorgamma 
syn keyword csVideo   mat_specular mat_vsync r_decals r_propsmaxdist r_rainalpha 
syn keyword csVideo   r_shadows r_WaterDrawReflection r_WaterDrawRefraction

syn keyword csDemo   benchframe cl_demoviewoverride demo_debug 
syn keyword csDemo   demo_fastforwardfinalspeed demo_fastforwardramptime 
syn keyword csDemo   demo_fastforwardstartspeed demo_interpolateview 
syn keyword csDemo   demo_pauseatservertick demo_quitafterplayback 
syn keyword csDemo   demo_recordcommands demogototick demolist demopause demoresume 
syn keyword csDemo   demos demotimescale demotogglepause demoui listdemo nextdemo 
syn keyword csDemo   playdemo startdemos stop stopdemo timedemo timedemoquit 
syn keyword csDemo   endmovie startmovie 

"add weapon_...
syn keyword csPistol    glock usp p228 deagle fiveseven elite
syn keyword csShotgun   m3 xm1014
syn keyword csSmg       tmp mac10 mp5navy ump45 p90
syn keyword csRifle     galil famas ak47 m4a1 sg552 aug
syn keyword csSniper    cout sg550 awp g3sg1
syn keyword csMg        m249

syn keyword csAmmo      primammo secammo
syn keyword csEquipment vest vesthelm flashbang hegrenade smokegrenade defuser nvgs

syn match   csBindableKeys   +\<[a-z0-9,./\\;'\*\[\]\-\=~]\>+
syn keyword csBindableKeys   mouse1 mouse2 mouse3 mouse4 mouse5 mwheelup mwheeldown
syn keyword csBindableKeys   joy1 joy2 joy3 joy4 aux5 aux6
syn keyword csBindableKeys   enter space shift ctrl pause alt backspace tab capslock
syn keyword csBindableKeys   ins del home end pgdn pgup leftarrow rightarrow uparrow downarrow
syn keyword csBindableKeys   kp_leftarrow kp_del kp_end kp_downarrow kp_pgup kp_ins
syn keyword csBindableKeys   kp_5 kp_plus kp_uparrow kp_enter kp_pgdn kp_rightarrow 
syn keyword csBindableKeys   kp_slash kp_minus kp_home
syn keyword csBindableKeys   f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12    

syn match   csNumber /\<[0-9]\+\>/


"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=75

if !exists("did_cs_syntax_inits")
  let did_cs_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
   hi link csActionHR     Repeat
   hi link csAction       Label
   hi link csHoldRelease  Repeat
   hi link csConsoleCmds  Type      
   hi link csBuyCmds      StorageClass
   hi link csHudOnscreen  Macro
   hi link csHudCrosshair Macro
   hi link csHudRadar     Macro
   hi link csMenu         Macro
   hi link csMouse        Macro
   hi link csNetworkHR    Include
   hi link csNetwork      Include    
   hi link csScore        Operator
   hi link csScreenshot   Operator
   hi link csSoundHR      Operator
   hi link csSound        Operator
   hi link csVideo        Operator
   hi link csDemo         Operator
   hi link csPistol       Special
   hi link csShotgun      Special
   hi link csSmg          Special
   hi link csRifle        Special
   hi link csSniper       Special
   hi link csMg           Special
   hi link csAmmo         Delimiter
   hi link csEquipment    Delimiter

   hi link csBindableKeys Function
   
   hi link csNumber       Number
endif

let b:current_syntax = "csx"

" vim: ts=8

