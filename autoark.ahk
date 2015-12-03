#SingleInstance force

;;;;;; Global Variables (expressed in milliseconds)

;; Use the Ark Wikipedia discover the proper value to use
giveNarcoticEvery := 30000 
 
;; this depends on baby. Start from 6000 and increase it gradually
giveFoodEvery := 8000
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AutoClicker - it'll keep stupidly clicking
;;               the left mouse button
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
Click() {
    click
}
 
AutoClickToggle := false
AutoClick() {
	global AutoClickToggle
    AutoClickToggle := !AutoClickToggle
   
    if (!AutoClickToggle)
        SetTimer Click, Off
    else
        SetTimer Click, 50
}
F8::AutoClick()
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autowalk - middle mouse click or ALT+W
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
MButton::Send % "{w " . ( GetKeyState("w") ? "Up}" : "Down}" )
!w::
	KeyWait,LAlt
	KeyWait,w
	SendInput {w down}
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AutoInfo - keep the H button pressed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!h::
	KeyWait,LAlt
	KeyWait,h
	SendInput {h down}
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autofeed: put the 4rd position in your inventory in dino's
;;           inventory. (breeding purposes)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
Feed() {
    click 450 270 ; location depends on screen resolution!
    sleep 3
    send, t
}
 
AutoFoodToggle := false
AutoFeed() {
    global giveFoodEvery, AutoFoodToggle
   
    AutoFoodToggle := !AutoFoodToggle
    if (!AutoFoodToggle)
        SetTimer Feed, Off
    else
        SetTimer Feed, %giveFoodEvery%
}
F9::AutoFeed()
       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto tame: remote use of narcotics in
;;            3rd position of dino's inventory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
Tame() {
    click 960 320 ; location depends on screen resolution
    sleep 3
    click 1150 770 ; location depends on screen resolution
}
 
AutoTameToggle := false
AutoTame() {
    global giveNarcoticEvery, AutoTameToggle
   
    AutoTameToggle := !AutoTameToggle
    if (!AutoTameToggle)
        SetTimer Tame, Off
    else
        SetTimer Tame, %giveNarcoticEvery%
}
 
F10::AutoTame()
