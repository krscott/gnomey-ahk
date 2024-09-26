#Requires AutoHotkey v2.0
#SingleInstance
; #WinActivateForce

CoordMode "Mouse", "Window"

WIN_USED := false

#HotIf !WinActive('ahk_class XamlExplorerHostIslandWindow')

GetMouseDragCoords(&x, &y) {
    x := 64
    y := 15

    if WinActive("ahk_class CabinetWClass") {
        ; Explorer
        WinGetPos , , &w
        x := w - 200
    } else if WinActive("ahk_exe Code.exe") {
        x := 15
    }
}

$#LButton:: {
    global WIN_USED
    WIN_USED := true

    MouseGetPos &origin_x, &origin_y, &win_title
    WinActivate win_title
    WinRestore win_title
    WinGetPos &win_x, &win_y, , , win_title

    GetMouseDragCoords(&x, &y)
    MouseClick "Left", x, y, , , "D"
    while GetKeyState("LButton", "P") {
    }
    MouseClick , , , , , "U"
    MouseMove origin_x, origin_y
}

$LWin:: {
    Send("{LWin down}")
}

$LWin up:: {
    global WIN_USED

    if !WIN_USED {
        Send("{Tab}")
    }
    Send("{LWin up}")

    WIN_USED := false
}

ConsumeWin() {
    global WIN_USED
    WIN_USED := true
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
~#*Tab:: ConsumeWin()

#HotIf WinActive('ahk_class XamlExplorerHostIslandWindow')
$LWin::Esc

StartWinSearch() {
    Send("{Esc}{LWin}")
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