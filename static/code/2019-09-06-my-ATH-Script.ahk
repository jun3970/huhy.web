;Notes: #==win !==Alt ^==Ctr  +==shift
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#include %A_ScriptDir%\HHY.ahk
#SingleInstance force


;自定义快捷键以打开特定网页
#+j::Run https://www.github.com/jun3970
#+g::Run https://www.google.com.hk/
#+s::Run https://scholar.google.com.tw/
#+n::Run https://nber.org

#+l::Run https://lib.jnu.edu.cn/



;自定义快捷键以启动特定软件
!n::run notepad
#e::run, C:\Program Files\Everything\Everything.exe
#+e::Run, C:\Program Files (x86)\Evernote\Evernote.exe

!+i::run, C:\Program File\Internet Download Manager\IDMan.exe
!+f::run, C:\Program File\foobar2000\foobar2000.exe

!+j::run, C:\Program File\JabRef\JabRef.exe

!+g::Run, C:\Users\Hu\AppData\Local\GitHubDesktop\GitHubDesktop.exe
!+s::run, C:\Program Files\Sublime Text 3\sublime_text.exe
!+r::run, C:\Program Files\RStudio\bin\rstudio.exe
!+m::run, C:\Program Files\Typora\bin\typora.exe


; Open Downloads folder
^+d::Run "C:\Users\Hu\Downloads" ; ctrl+shift+d
return





;缩写快速打出常用语
::/mail::huhy_1995@163.com

;signature
::/sig::
d = %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%
t = 胡弘宇
clipboard = %t%`n%d%
Send ^v
return



; Google Search highlighted text
^!+c::
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}



;一键拷贝文件路径
;sleep 说明，单位：毫秒，60000即为60秒
;给脚本时间片,目的在于使请求的时间少于实际延迟时间. 
#c::	; win +c
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return



; Always on Top
^SPACE:: Winset, Alwaysontop, , A ; ctrl + space
Return



;最小化当前窗口
#w::		
WinMinimize,A	
return



;vim风格方向键
!k::   ;; !->alt键   k->字母键k
Send {Up}   ;;输入 上 键
return
!j::
Send {Down}
return
!h::
Send {Left}
return
!l::
Send {Right}
return



;替换热键
;replace CapsLock to LeftEnter; CapsLock = Alt CapsLock
$CapsLock::BackSpace
LAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

