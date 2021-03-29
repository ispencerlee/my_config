-- you can find weather location codes here: http://weather.noaa.gov/index.html
--black   = "#21222c"
--red     = "#ff5555"
--green   = "#50fa7b"
--yellow  = "#f1fa8c"
--blue    = "#bd93f9"
--magenta = "#ff79c6"
--cyan    = "#8be9fd"
--white   = "#f8f8f2"
--orange  = "#ffb86c"
--purple  = "#bd9cf9"
Config { 
    font = "xft:Ubuntu:weight=bold:pixelsize=16:antialias=true:hinting=true" 
       , additionalFonts = [ "xft:Mononoki Nerd Font:pixelsize=16:antialias=true:hinting=true"
                           , "xft:Mononoki Nerd Font:pixelsize=16:antialias=true:hinting=true"
                           , "xft:FontAwesome:pixelsize=16"
                          
                           ]
    --   , bgColor = "#282c34"
       , bgColor = "#282a36"
    --   , fgColor = "#ff6c6b"
       , fgColor = "#f8f8f2"
       , alpha = 255
       , border = NoBorder
    ,  position = Static { xpos = 0 , ypos = 0, width = 1860, height = 28 }
      -- , position = Top L 
       , borderColor =  "#373b41"
       , lowerOnStart = True 
       , hideOnStart = False
       , allDesktops = True
       , persistent = True
       , iconRoot = "/home/ispencer/.xmonad/xpm/"  -- default: "."
       , commands = [ 
                      -- Time and date
                      Run Date "<fn=1>\xf133 </fn>  %d %b %H:%M " "date" 60
                      -- Network up and down
                    , Run DynNetwork ["-t", "<fn=1>\xf0ab </fn> <rx>kb  <fn=1>\xf0aa </fn> <tx>kb", "--","--devices","wlan0,eno1" ] 20
                      -- Cpu usage in percent
                    , Run Cpu ["-t", "<fn=1>\xf108 </fn> <total>%","-H","50","--high","red"] 20

                    , Run MultiCoreTemp  [ "--template" , 
                           -- "<fn=1>\xf134</fn> Temp: <avg>°C" 
                             "<avg>°C"
                             , "--Low"      , "60"  
                             , "--High"     , "80"
                             , "--low"      , "darkgreen"
                             , "--normal"   , "yellow"
                             , "--high"     , "red"
                            ,"--" ,"--mintemp", "20", "--maxtemp", "100" ] 50
                    , Run  Alsa "default" "Master" ["-t","vol <volume>% <status>","--","-C","#50fa7b", "-c","#ff5555", "--alsactl=/usr/bin/alsactl"] 
                 --  , Run Brightness ["-t", "<bar>"] 60
                    ,Run  Uptime ["-t", "Up <days>d <hours>h <minutes>m"] 60
                 -- ,Run MPD ["-t", "<state>: <artist> - <track>"] 10
-- Ram used number and percent
                    , Run Memory ["-t", "<fn=1>\xf233 </fn> <usedratio>%" ] 20
                      -- Disk space free
                    , Run DiskU [("/", "<fn=1>\xf0c7 </fn> hdd: <free> free")] [] 60 
                 --   ,Run DiskIO [("/", "<fn=1>\xf0ab </fn><write> <fn=1>\xf0aa </fn><read>"), ("sda4", "<total>")] [] 10
    --   , Run CpuFreq ["-t", "Freq:<cpu0>|<cpu1>GHz", "-L", "0", "-H", "3",
    --            "-l", "lightblue", "-n","white", "-h", "red"] 50 

                    , Run Com "/home/ispencer/scripts/pacupdate" [] "pacupdate" 36000
                      -- Runs a standard shell command 'uname -r' to get kernel version
                    , Run Com "uname" ["-r"] "" 3600
                      -- Prints out the left side items such as workspaces, layout, etc.
                      -- The workspaces are 'clickable' in my configs.
                    , Run UnsafeStdinReader  
                     -- battery monitor
                    , Run BatteryP       [ "BAT0" ]
                                         [ "--template" , "<fc=#B1DE76><fn=1></fn></fc> <acstatus>"
                                         , "--Low"      , "10"        -- units: %
                                         , "--High"     , "80"        -- units: %
                                         , "--low"      , "#fb4934" -- #ff5555
                                         , "--normal"   , "#bbc2cf"
                                         , "--high"     , "#98be65"

                                         , "--" -- battery specific options
                                                   -- discharging status
                                                   , "-o"   , "<left>% "
                                                   -- AC "on" status
                                                   , "-O"   , "<left>% (<fc=#98be65>Charging</fc>)" -- 50fa7b
                                                   -- charged status
                                                   , "-i"   , "<fc=#98be65>Charged</fc>"
                                         ] 50
 
                    ] 
-- <fc=#b3afc2><fn=1> </fn></fc><fc=#666666> <ft=2>|</fn></fc> 
--, template = "<action=~/.config/xmenu/xmenu.sh><fc=#57c7ff>  </fc></action> %StdinReader% }{| <fc=#ff6ac1>%cpu%</fc> | <fc=#f1fa8c>%memory%</fc> | <fc=#57c7ff>%internet%</fc> | <fc=#bd93f9>%backlight% %volume%</fc> | <fc=#5af78e>%battery%</fc> | <fc=#57c7ff>%clock% </fc>" 

       , sepChar = "%"
       , alignSep = "}{"
       , template = " <action=~/scripts/sysinfo-popup.sh><fc=#57c7ff><fn=1>   </fn></fc></action> | %UnsafeStdinReader% }{  <fc=#5af78e>%dynnetwork%</fc> | <fc=#f1fa8c>%cpu%</fc> | <fc=#ffb86c>%memory%</fc> |  <fc=#8be9fd>%alsa:default:Master%</fc> | %battery%  <fc=#ff6ac1>%uptime%</fc> | <fc=#57c7ff> %date%  </fc>" }
