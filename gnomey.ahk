﻿#Requires AutoHotkey v2.0
#SingleInstance
#WinActivateForce

CoordMode "Mouse", "Window"

WIN_USED := false

#HotIf !WinActive('ahk_class XamlExplorerHostIslandWindow')

ConsumeWin() {
    global WIN_USED
    WIN_USED := true
}

GetMouseDragCoords(&x, &y) {
    ; Handle windows with non-standard drag bars

    x := 64
    y := 15

    if WinActive("ahk_class CabinetWClass") {
        ; Explorer
        WinGetPos , , &w
        x := w - 200
    } else if WinActive("ahk_exe Code.exe") {
        x := 15
    } else if WinActive("ahk_exe firefox.exe") {
        x := 15
    } else if WinActive("ahk_class Chrome_WidgetWin_1") {
        x := 200
        y := 30
    }
}

$#LButton:: {

    MouseGetPos &origin_x, &origin_y, &window
    WinActivate window

    ; Check if clicking on Desktop
    if WinGetClass(window) == "WorkerW" {
        return
    }

    WinRestore window
    WinGetPos &win_x, &win_y, , , window

    GetMouseDragCoords(&x, &y)
    MouseClick "Left", x, y, , , "D"
    while GetKeyState("LButton", "P") {
        ConsumeWin()
    }
    MouseClick , , , , , "U"
    MouseMove origin_x, origin_y
}

$LWin:: {
    Send("{LWin down}")
}

$LWin up:: {
    global WIN_USED

    if WIN_USED {
        ; Send an no-op hotkey to consume the win event.
        ; As far as I know, Win+J does nothing. Win+O, Win+Y are also contenders.
        ; TODO This is not necessary when Window Spy is open (even if minimized). why??
        Send("j")
    } else {
        Send("{Tab}")
    }
    Send("{LWin up}")

    WIN_USED := false
}

~#*a:: ConsumeWin()
~#*b:: ConsumeWin()
~#*c:: ConsumeWin()
~#*d:: ConsumeWin()
~#*e:: ConsumeWin()
~#*f:: ConsumeWin()
~#*g:: ConsumeWin()
~#*h:: ConsumeWin()
~#*i:: ConsumeWin()
~#*j:: ConsumeWin()
~#*k:: ConsumeWin()
~#*l:: ConsumeWin()
~#*m:: ConsumeWin()
~#*n:: ConsumeWin()
~#*o:: ConsumeWin()
~#*p:: ConsumeWin()
~#*q:: ConsumeWin()
~#*r:: ConsumeWin()
~#*s:: ConsumeWin()
~#*t:: ConsumeWin()
~#*u:: ConsumeWin()
~#*v:: ConsumeWin()
~#*w:: ConsumeWin()
~#*x:: ConsumeWin()
~#*y:: ConsumeWin()
~#*z:: ConsumeWin()
~#*1:: ConsumeWin()
~#*2:: ConsumeWin()
~#*3:: ConsumeWin()
~#*4:: ConsumeWin()
~#*5:: ConsumeWin()
~#*6:: ConsumeWin()
~#*7:: ConsumeWin()
~#*8:: ConsumeWin()
~#*9:: ConsumeWin()
~#*0:: ConsumeWin()
~#*up:: ConsumeWin()
~#*down:: ConsumeWin()
~#*left:: ConsumeWin()
~#*right:: ConsumeWin()
~#*Tab:: ConsumeWin()

; #HotIf WinExist("ahk_exe StartMenuExperienceHost.exe")
; $LWin:: {
;     ConsumeWin()
;     Send("{Esc}")
; }

#HotIf WinActive('ahk_class XamlExplorerHostIslandWindow')
$LWin::Esc

StartWinSearch() {
    Send("{Esc}{LWin}")
    Sleep(10)
    Send(A_ThisHotkey)
}

a:: StartWinSearch()
b:: StartWinSearch()
c:: StartWinSearch()
d:: StartWinSearch()
e:: StartWinSearch()
f:: StartWinSearch()
g:: StartWinSearch()
h:: StartWinSearch()
i:: StartWinSearch()
j:: StartWinSearch()
k:: StartWinSearch()
l:: StartWinSearch()
m:: StartWinSearch()
n:: StartWinSearch()
o:: StartWinSearch()
p:: StartWinSearch()
q:: StartWinSearch()
r:: StartWinSearch()
s:: StartWinSearch()
t:: StartWinSearch()
u:: StartWinSearch()
v:: StartWinSearch()
w:: StartWinSearch()
x:: StartWinSearch()
y:: StartWinSearch()
z:: StartWinSearch()
1:: StartWinSearch()
2:: StartWinSearch()
3:: StartWinSearch()
4:: StartWinSearch()
5:: StartWinSearch()
6:: StartWinSearch()
7:: StartWinSearch()
8:: StartWinSearch()
9:: StartWinSearch()
0:: StartWinSearch()