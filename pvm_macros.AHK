#MaxThreadsPerHotkey 2
#SingleInstance Force
#IfWinActive RuneScape

profile := 0

; creates a message box showing the current profile
display_current_profile()
{
    if (global profile = 0)
        MsgBox, 0, , The current profile is %profile% (default), 1.2
        
    if (global profile = 1)
        MsgBox, 0, , The current profile is %profile% Solak, 1.2
        
    if (global profile = 2)
        MsgBox, 0, , The current profile is %profile% Vorago, 1.2
    
    Return
}

; default
F9::
    global profile := 0
    display_current_profile()
Return

; Solak
F10::
    global profile := 1
    display_current_profile()
Return

; Vorago
F11::
    global profile := 2
    display_current_profile()
Return

global skip_check := 0

; returns 0 if both need to be equipped, 1 if offhand only
OH_check() {
    CoordMode, Pixel, Screen
    ImageSearch, , , 1376, 896, 1408, 928, *40 *TransBlack D:\scripting\offhand_empty.png
    if (ErrorLevel = 0 || global skip_check = 1) {
        return 0
    } else {
        return 1
    }
}

; MOUSE BINDS

F16::
    if (OH_check() = 0) {
        Send {, down}
        Send {/ down}
        Sleep 30
        Send {, up}
        Send {/ up}
        skip_check := 0
    } else {
        Send {/ down}
        Sleep 30
        Send {/ up}
    }
return

F17::
    if (OH_check() = 0) {
        Send {, down}
        Send {. down}
        Sleep 30
        Send {, up}
        Send {. up}
        skip_check := 0
    } else {
        Send {. down}
        Sleep 30
        Send {. up}
    }
return

F18::
    Send {PGDN down}
    Sleep 30
    Send {PGDN up}
    global skip_check := 1
return

F19::
    if (OH_check() = 0) {
        Send {, down}
        Send {; down}
        Sleep 30
        
        Send {, up}
        Send {; up}
        skip_check := 0
    } else {
        Send {; down}
        Sleep 30
        Send {; up}
    }
return

9::
    Send {9 down}
    Sleep 30
    Send {9 up}
    global skip_check := 1
return

F21::
    Send {INS down}
    Sleep 30
    Send {INS up}
    global skip_check := 1
return

F22::
    Send {k down}
    Sleep 30
    Send {j down}
    Sleep 30
    Send {k up}
    Send {j up}
return

F23::
    Send {j down}
    Sleep 30
    Send {l down}
    Sleep 30
    Send {j up}
    Send {l up}
return

; KEYBOARD BINDS

DEL::
    Send {9 down}
    Send {0 down}
    Sleep, 30
    Send {9 up}
    Send {0 up}
    global skip_check := 1
return

PGUP::
    Send {F5 down}
    Sleep, 30
    Send {F5 up}
    global skip_check := 1
return

F5::
    if (profile = 1) {
        Send {7 down}
        Send {8 down}
        Send {F5 down}
        Send {F6 down}
        Sleep 30
        Send {7 up}
        Send {8 up}
        Send {F5 up}
        Send {F6 up}

        Send {F4 down}
        Sleep 30
        Send {F4 up}

        Send {F8 down}
        Sleep 30
        Send {F8 up}

        global skip_check := 1
    } else {
        Send {F5 down}
        Send {F6 down}
        Sleep 30
        Send {F5 up}
        Send {F6 up}
        Send {Home down}
        Sleep 30
        Send {Home up}
        Sleep 600
        Send {F8 down}
        Sleep 30
        Send {F8 up}

        global skip_check := 1
    }
return

END::
    if (profile = 2) {
       Send {f down}
        Send {a down}
        Send {y down}
        Sleep 30
        Send {f up}
        Send {a up}
        Send {y up} 
    } else {
        Send {END down}
        Sleep 30
        Send {END up}
    }
return    

]::
    if (profile = 2) {
        Send {i down}
        Sleep 30
        Send {i up}
    } else {
        Send {] down}
        Sleep 30
        Send {] up}
    }   
return


F8::
    Send {F3 down}
    Sleep 30
    Send {F3 up}
    Send {F down}
    Sleep 30
    Send {F up}
return