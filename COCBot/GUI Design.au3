$frmBot = GUICreate($sBotTitle, 417, 545, 207, 158)

; ---------------------------------------------------------------------------------------------------------------------
; On all tabs ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
; BrokenBot.org
GUISetIcon(@ScriptDir & "BrokenBot.org\images\icons\brokenbot.ico")
TraySetIcon(@ScriptDir & "BrokenBot.org\images\icons\brokenbot.ico")
$imgLogo = GUICtrlCreatePic("BrokenBot.org\images\misc\brokenbot_logo.jpg", 8, 405, 401, 112)
GUICtrlSetCursor($imgLogo, 0)
; End BrokenBot.org
$btnStart = GUICtrlCreateButton("Start Bot", 20, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnStart")
$btnStop = GUICtrlCreateButton("Stop Bot", 20, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnStop")
GUICtrlSetState(-1, $GUI_HIDE)
$btnHide = GUICtrlCreateButton("Hide BS", 100, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnHide")
GUICtrlSetState(-1, $GUI_DISABLE)
$btnAtkNow = GUICtrlCreateButton("Attack Now", 190, 365, 115, 25)
GUICtrlSetOnEvent(-1, "btnAtkNow")
GUICtrlSetState(-1, $GUI_DISABLE)
$btnPause = GUICtrlCreateButton("Pause", 320, 365, 75, 25)
GUICtrlSetOnEvent(-1, "btnPause")
GUICtrlSetState($btnPause, $GUI_DISABLE)

$tabMain = GUICtrlCreateTab(8, 0, 403, 403, $TCS_MULTILINE)
GUICtrlSetOnEvent(-1, "tabMain")

; ---------------------------------------------------------------------------------------------------------------------
; General Tab ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageGeneral = GUICtrlCreateTabItem("General")
$txtLog = _GUICtrlRichEdit_Create($frmBot, "", 16, 45, 385, 200, BitOR($ES_MULTILINE, $ES_READONLY, $WS_VSCROLL, $WS_HSCROLL, 8912))
$Controls = GUICtrlCreateGroup("Controls", 15, 245, 385, 41)
$chkBotStop = GUICtrlCreateCheckbox("", 37, 264, 16, 16)
$cmbBotCommand = GUICtrlCreateCombo("", 60, 260, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Halt Attack Mode|Shutdown PC|Sleep PC", "Halt Attack Mode")
$lblPC = GUICtrlCreateLabel("IF :", 178, 264, 25, 17)
$cmbBotCond = GUICtrlCreateCombo("", 198, 260, 163, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "G and E Full and Max.Trophy|(G and E) Full or Max.Trophy|(G or E) Full and Max.Trophy|G or E Full or Max.Trophy|Gold and Elixir Full|Gold or Elixir Full|Gold Full and Max.Trophy|Elixir Full and Max.Trophy|Gold Full or Max.Trophy|Elixir Full or Max.Trophy|Gold Full|Elixir Full|Reach Max. Trophy", "Gold and Elixir Full")
GUICtrlCreateGroup("", -99, -99, 1, 1)

$otherSettings = GUICtrlCreateGroup("Other Settings", 15, 290, 385, 66)
$chkNoAttack = GUICtrlCreateCheckbox("Donate/Train Only", 24, 307, 105, 17)
GUICtrlSetBkColor($chkNoAttack, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkNoAttack")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Disable attacking, only do collections/training/donating")
$chkDonateOnly = GUICtrlCreateCheckbox("Donate Only", 140, 307, 80, 17)
GUICtrlSetBkColor($chkDonateOnly, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkNoAttack")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Disable attacking & training, only do collections/donating")
$expMode = GUICtrlCreateCheckbox("Exp Mode", 24, 330, 80, 17)
GUICtrlSetBkColor($chkDonateOnly, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkNoAttack")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Attack goblin base")

$lblMaxTrophy = GUICtrlCreateLabel("Trophy Range:", 232, 308, 75, 17)
$txtMinimumTrophy = GUICtrlCreateInput("1000", 311, 308, 32, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 4)
$lblMaxTrophy2 = GUICtrlCreateLabel("-", 349, 308, 5, 17)
$txtMaxTrophy = GUICtrlCreateInput("9999", 360, 308, 32, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 4)

; ---------------------------------------------------------------------------------------------------------------------
; Strategies ----------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageAttackOptions = GUICtrlCreateTabItem("Strategies")
$lstStrategies = GUICtrlCreateList("", 20, 50, 375, 200)
$btnSaveStrat = GUICtrlCreateButton("Save current as", 20, 240, 185, 20)
$btnRefresh = GUICtrlCreateButton("Refresh", 210, 240, 185, 20)
$AtkSpeed = GUICtrlCreateGroup("Deploy Speed", 15, 275, 385, 79)
$lblUnitDelay = GUICtrlCreateLabel("Unit Delay:", 30, 292, 75, 17)
$cmbUnitDelay = GUICtrlCreateCombo("", 90, 289, 50, 17, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
$lblWaveDelay = GUICtrlCreateLabel("Wave Delay:", 155, 292, 75, 17)
$cmbWaveDelay = GUICtrlCreateCombo("", 225, 289, 50, 17, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9|10", "5")
$Randomspeedatk = GUICtrlCreateCheckbox("Random Speeds", 295, 292, 100, 17)
GUICtrlSetOnEvent(-1, "Randomspeedatk")
$lblAttackdelay = GUICtrlCreateLabel("Delays of troops deployment speed, 1 (fast) = like a Bot, 10 (slow) = Like a Human. Random will make bot more varied and closer to a person.", 35, 315, 350, 67, $SS_CENTER)
GUICtrlCreateGroup("", -99, -99, 1, 1)


; ---------------------------------------------------------------------------------------------------------------------
; Donate --------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageDonateSettings = GUICtrlCreateTabItem("Donate/Request")
$Donation = GUICtrlCreateGroup("", 15, 36, 385, 325)
$Barbarians = GUICtrlCreateGroup("Troop 1", 20, 70, 120, 235)
$chkDonateAllBarbarians = GUICtrlCreateCheckbox("Donate to All", 30, 95, 97, 17)
GUICtrlSetTip(-1, "Donate Troop 1 without checking keywords")
$cmbDonateBarbarians = GUICtrlCreateCombo("", 25, 120, 85, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarian|Archer|Giant|Goblin|WB|Balloon|Wizard|Healer|Dragon|Pekka|Minion|Hog|Valkyrie|Golem|Witch|Lava", "Barbarian")
$NoOfBarbarians = GUICtrlCreateInput("5", 115, 120, 20, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 1)
$txtDonateBarbarians = GUICtrlCreateEdit("", 25, 145, 110, 154, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("any\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Troop 1")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Archers = GUICtrlCreateGroup("Troop 2", 148, 70, 120, 235)
$chkDonateAllArchers = GUICtrlCreateCheckbox("Donate to All", 155, 95, 97, 17)
GUICtrlSetTip(-1, "Donate Troop 2 without checking keywords")
$cmbDonateArchers = GUICtrlCreateCombo("", 153, 120, 85, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarian|Archer|Giant|Goblin|WB|Balloon|Wizard|Healer|Dragon|Pekka|Minion|Hog|Valkyrie|Golem|Witch|Lava", "Archer")
$NoOfArchers = GUICtrlCreateInput("5", 243, 120, 20, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 1)
$txtDonateArchers = GUICtrlCreateEdit("", 153, 145, 110, 154, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("any\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Troop 2")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Giants = GUICtrlCreateGroup("Troop 3", 275, 70, 120, 235)
$chkDonateAllGiants = GUICtrlCreateCheckbox("Donate to All", 285, 95, 97, 17)
GUICtrlSetTip(-1, "Donate Troop 3 without checking keywords")
$cmbDonateGiants = GUICtrlCreateCombo("", 280, 120, 85, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarian|Archer|Giant|Goblin|WB|Balloon|Wizard|Healer|Dragon|Pekka|Minion|Hog|Valkyrie|Golem|Witch|Lava", "Giant")
$NoOfGiants = GUICtrlCreateInput("5", 370, 120, 20, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 1)
$txtDonateGiants = GUICtrlCreateEdit("", 280, 145, 110, 154, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL))
GUICtrlSetData(-1, StringFormat("any\r\nreinforcement"))
GUICtrlSetTip(-1, "Keywords for donating Troop 3")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$chkDonateGiants = GUICtrlCreateCheckbox("Donate Troop 3", 275, 305, 97, 17)
GUICtrlSetTip(-1, "Check keywords before donating Troop 3")
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateArchers = GUICtrlCreateCheckbox("Donate Troop 2", 149, 305, 97, 17)
GUICtrlSetTip(-1, "Check keywords before donating Troop 3")
GUICtrlSetState(-1, $GUI_CHECKED)
$chkDonateBarbarians = GUICtrlCreateCheckbox("Donate Troop 1", 20, 305, 112, 17)
GUICtrlSetTip(-1, "Check keywords before donating Troop 3")
GUICtrlSetState(-1, $GUI_CHECKED)
$chkRequest = GUICtrlCreateCheckbox("Request for :", 30, 45, 82, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "chkRequest")
$txtRequest = GUICtrlCreateInput("any", 115, 45, 200, 21)
GUICtrlSetTip(-1, "Request for input.")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$gtfo = GUICtrlCreateCheckbox("GTFO", 330, 47, 50, 17)
GUICtrlSetTip(-1, "Kick after donating")

; ---------------------------------------------------------------------------------------------------------------------
; Upgrade -------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageUpgradeBuilding = GUICtrlCreateTabItem("Upgrade")
$Upgrade = GUICtrlCreateGroup("Upgrade Defenses / Upgrade Storage / Upgrade Camp ", 20, 40, 375, 120)
$chkUpgrade1 = GUICtrlCreateCheckbox("Upgrade 1 :", 30, 65, 80, 17)
$lblUP1PosX = GUICtrlCreateLabel("Pos X : ", 112, 66, 40, 17)
$txtUpgradeX1 = GUICtrlCreateInput("", 152, 64, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP1PosY = GUICtrlCreateLabel("Pos Y : ", 195, 66, 40, 17)
$txtUpgradeY1 = GUICtrlCreateInput("", 235, 64, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp1 = GUICtrlCreateButton("Locate Building 1", 285, 64, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp1")
GUICtrlSetState(-1, $GUI_DISABLE)
$chkUpgrade2 = GUICtrlCreateCheckbox("Upgrade 2 :", 30, 93, 80, 17)
$lblUP2PosX = GUICtrlCreateLabel("Pos X : ", 112, 95, 40, 17)
$txtUpgradeX2 = GUICtrlCreateInput("", 152, 90, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP2PosY = GUICtrlCreateLabel("Pos Y : ", 195, 95, 40, 17)
$txtUpgradeY2 = GUICtrlCreateInput("", 235, 90, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp2 = GUICtrlCreateButton("Locate Building 2", 285, 90, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp2")
GUICtrlSetState(-1, $GUI_DISABLE)
$chkUpgrade3 = GUICtrlCreateCheckbox("Upgrade 3 :", 30, 123, 80, 17)
$lblUP2PosX = GUICtrlCreateLabel("Pos X : ", 112, 125, 40, 17)
$txtUpgradeX3 = GUICtrlCreateInput("", 152, 120, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP2PosY = GUICtrlCreateLabel("Pos Y : ", 195, 125, 40, 17)
$txtUpgradeY3 = GUICtrlCreateInput("", 235, 120, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp3 = GUICtrlCreateButton("Locate Building 3", 285, 120, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp3")
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Upgrade = GUICtrlCreateGroup("Upgrade Collector/Barrack Lv 5 - Max", 20, 165, 375, 125)
$chkUpgrade4 = GUICtrlCreateCheckbox("Upgrade 4 :", 30, 192, 80, 17)
$lblUP4PosX = GUICtrlCreateLabel("Pos X : ", 112, 194, 40, 17)
$txtUpgradeX4 = GUICtrlCreateInput("", 152, 189, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP4PosY = GUICtrlCreateLabel("Pos Y : ", 195, 194, 40, 17)
$txtUpgradeY4 = GUICtrlCreateInput("", 235, 189, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp4 = GUICtrlCreateButton("Locate Building 4", 285, 189, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp4")
GUICtrlSetState(-1, $GUI_DISABLE)
$chkUpgrade5 = GUICtrlCreateCheckbox("Upgrade 5 :", 30, 222, 80, 17)
$lblUP5PosX = GUICtrlCreateLabel("Pos X : ", 112, 224, 40, 17)
$txtUpgradeX5 = GUICtrlCreateInput("", 152, 219, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP5PosY = GUICtrlCreateLabel("Pos Y : ", 195, 224, 40, 17)
$txtUpgradeY5 = GUICtrlCreateInput("", 235, 219, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp5 = GUICtrlCreateButton("Locate Building 5", 285, 219, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp5")
GUICtrlSetState(-1, $GUI_DISABLE)
$chkUpgrade6 = GUICtrlCreateCheckbox("Upgrade 6 :", 30, 252, 80, 17)
$lblUP6PosX = GUICtrlCreateLabel("Pos X : ", 112, 254, 40, 17)
$txtUpgradeX6 = GUICtrlCreateInput("", 152, 249, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$lblUP6PosY = GUICtrlCreateLabel("Pos Y : ", 195, 254, 40, 17)
$txtUpgradeY6 = GUICtrlCreateInput("", 235, 249, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER, $ES_READONLY))
$btnLocateUp6 = GUICtrlCreateButton("Locate Building 6", 285, 249, 100, 21)
GUICtrlSetOnEvent(-1, "btnLocateUp6")
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)

; ---------------------------------------------------------------------------------------------------------------------
; PushBullet ----------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pagenotificationSetting = GUICtrlCreateTabItem("PushBullet")
$lblpushbullet = GUICtrlCreateGroup("PushBullet", 20, 40, 370, 170)
$pushbullettoken1 = GUICtrlCreateLabel("Account Token:", 30, 90, 80, 17, $SS_CENTER)
$pushbullettokenvalue = GUICtrlCreateInput("", 120, 90, 260, 17)
$lblpushbulletenabled = GUICtrlCreateCheckbox("Enable", 30, 65, 60, 17)
GUICtrlSetTip(-1, "Enable pushbullet notification")
$lblpushbulletdebug = GUICtrlCreateCheckbox("Debug", 100, 65, 60, 17)
GUICtrlSetTip(-1, "This will add verbosity on log while sending files via pushbullet")
$lblpushbulletremote = GUICtrlCreateCheckbox("Remote", 170, 65, 60, 17)
GUICtrlSetTip(-1, "Enables pushbullet remote function")
$lblpushbulletdelete = GUICtrlCreateCheckbox("Delete Msg on Start", 240, 65, 120, 17)
GUICtrlSetTip(-1, "Will delete your messages on start button click")

$lblpushmessage = GUICtrlCreateGroup("Push Messages As Text", 30, 115, 200, 80)
$lblvillagereport = GUICtrlCreateCheckbox("Village Report", 40, 140, 95, 17)
$lblmatchfound = GUICtrlCreateCheckbox("Match Found", 40, 160, 95, 17)
$lbllastraid = GUICtrlCreateCheckbox("Last Raid", 140, 140, 80, 17)
$lblfreebuilder = GUICtrlCreateCheckbox("Free Builder", 140, 160, 80, 17)

$lblpushbulletloot = GUICtrlCreateGroup("As JPG", 240, 115, 140, 80)
$UseJPG = GUICtrlCreateCheckbox("Last Raid", 260, 135, 60, 17)
GUICtrlSetTip(-1, "Attach the loot jpg file in push message")
$UseAttackJPG = GUICtrlCreateCheckbox("Attack", 260, 155, 60, 17)
GUICtrlSetTip(-1, "Attach the attack jpg file in push message")

$lblpushbullet = GUICtrlCreateGroup("PushBullet Remote", 20, 210, 370, 140)
$pushbullettoken1 = GUICtrlCreateLabel("You can remotely control your bot using the following command format" & @CRLF & "Enter the command in the title of the message" & @CRLF & "Bot <command> where <command> is:" & @CRLF & @CRLF & "Pause - pause the bot" & @CRLF & "Resume - resume the bot" & @CRLF & "Stats - send bot current statistics" & @CRLF & "Logs - send the current log file" & @CRLF & "Help - send this help message", 25, 230, 340, 350, $SS_LEFT)

; ---------------------------------------------------------------------------------------------------------------------
; Misc ----------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageMiscSettings = GUICtrlCreateTabItem("Misc")
$Miscs = GUICtrlCreateGroup("Misc", 20, 40, 375, 215)
$lblReconnect = GUICtrlCreateLabel("Reconnect Interval:", 30, 65, 100, 17)
GUICtrlSetTip(-1, "Set reconnect interval when other devices connected - COC English version Only")
$txtReconnect = GUICtrlCreateInput("2", 130, 60, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblReconnectmin = GUICtrlCreateLabel("minutes", 165, 65, 100, 17)
$lblSpellCap = GUICtrlCreateLabel("Spell factory capacity:", 217, 118, 120, 17)
$txtSpellCap = GUICtrlCreateInput("3", 335, 115, 50, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$lblCapacity = GUICtrlCreateLabel("Camp Capacity :", 30, 118, 95, 17)
$txtCapacity = GUICtrlCreateInput("0", 120, 115, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))

$chkTrap = GUICtrlCreateCheckbox("Auto Rearm Traps", 270, 65, 110, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetTip(-1, "Auto rearm for Traps, Crossbows & Inferno Towers")

$lblSearchsp = GUICtrlCreateLabel("Seach Base Speed:", 30, 92, 100, 17)
GUICtrlSetTip(-1, "Set search base speed to higher number if having frequent server sync issue")
$cmbSearchsp = GUICtrlCreateCombo("", 130, 87, 45, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5", "0") ; Search Base Speed
$lblSearchspd = GUICtrlCreateLabel("Tips: 0 = Fast, 5 = Slow", 182, 92, 200, 17)

$lblReturnh = GUICtrlCreateLabel("Return Home Delay:", 30, 146, 100, 17)
GUICtrlSetTip(-1, "Set delay timing for return home during raid")
$txtReturnh = GUICtrlCreateInput("10", 130, 141, 31, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblReturndelay = GUICtrlCreateLabel("seconds after no income detected", 165, 146, 200, 17)

$chkWideEdge = GUICtrlCreateCheckbox("Look deeper for inside town hall", 30, 180, 177, 17)
$chkAvoidEdge = GUICtrlCreateCheckbox("Smart deployment", 253, 180, 118, 17)

$chkAlertSearch = GUICtrlCreateCheckbox("Base Found Alert", 30, 205, 100, 17)
$chkCollect = GUICtrlCreateCheckbox("Collect Resources", 30, 230, 110, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkTakeLootSS = GUICtrlCreateCheckbox("Take Loots Image", 140, 205, 110, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$chkTakeTownSS = GUICtrlCreateCheckbox("Take All Towns Image", 253, 205, 141, 17)
$chkTakeAttackSS = GUICtrlCreateCheckbox("Take Attack Image", 140, 230, 110, 17)
GUICtrlSetTip(-1, "Snapshot of attack and all deployments")
$chkDebug = GUICtrlCreateCheckbox("Collect debug info", 253, 230, 141, 17)
GUICtrlSetTip(-1, "Allow debug mode to store data")
If @Compiled Then GUICtrlSetState($chkDebug, $GUI_HIDE)

$LocationSettings = GUICtrlCreateGroup("Locate Buildings", 20, 255, 375, 100)
$btnLocateKingAltar = GUICtrlCreateButton("King Altar", 32, 270, 83, 25)
GUICtrlSetOnEvent(-1, "btnLocateKingAltar")
$btnLocateQueenAltar = GUICtrlCreateButton("Queen Altar", 118, 270, 83, 25)
GUICtrlSetOnEvent(-1, "btnLocateQueenAltar")
$btnLocateDarkBarracks = GUICtrlCreateButton("D.Barrack", 213, 270, 83, 25)
GUICtrlSetOnEvent(-1, "btnLocateDarkBarracks")
$btnLocateSFactory = GUICtrlCreateButton("S.Factory", 299, 270, 83, 25)
GUICtrlSetOnEvent(-1, "btnLocateSFactory")
$btnLocateTownHall = GUICtrlCreateButton("Locate Townhall Manually", 32, 297, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateTownHall")
$btnLocateClanCastle = GUICtrlCreateButton("Locate Clan Castle Manually", 32, 324, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateClanCastle")
$btnLocateCamp = GUICtrlCreateButton("Locate Camp Manually", 213, 297, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateCamp")
$btnLocateBarracks = GUICtrlCreateButton("Locate Barracks Manually", 213, 324, 170, 25)
GUICtrlSetOnEvent(-1, "btnLocateBarracks")
GUICtrlCreateGroup("", -99, -99, 1, 1)

; ---------------------------------------------------------------------------------------------------------------------
; Other ---------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageOtherSettings = GUICtrlCreateTabItem("Other")
$Walls = GUICtrlCreateGroup("Walls", 20, 40, 375, 125)
$chkWalls = GUICtrlCreateCheckbox("Auto Wall Upgrade", 30, 62, 110, 17)
$UseGold = GUICtrlCreateRadio("Use Only Gold", 40, 87, 115, 17)
$WallMinGold = GUICtrlCreateLabel("Minimum Gold: ", 220, 92, 76, 17)
GUICtrlSetTip(-1, "Minimum level of Gold storage to perform the upgrade")
$txtWallMinGold = GUICtrlCreateInput("1300000", 325, 87, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
$UseElixir = GUICtrlCreateRadio("Use Only Elixir", 40, 112, 115, 17)
$WallMinElixir = GUICtrlCreateLabel("Minimum Elixir:", 220, 117, 72, 17)
GUICtrlSetTip(-1, "Minimum level of Elixir storage to perform the upgrade")
$txtWallMinElixir = GUICtrlCreateInput("1300000", 325, 112, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
$UseGoldElix = GUICtrlCreateRadio("Use Gold and then Elixir", 40, 137, 150, 17)
$lblWalls = GUICtrlCreateLabel("Current Wall Level:", 220, 64, 100, 17)
$cmbWalls = GUICtrlCreateCombo("", 325, 60, 40, 21, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "4|5|6|7|8|9|10", "4")

$lblTolerance = GUICtrlCreateLabel("Tolerance Level:", 220, 142, 80, 17)
$cmbTolerance = GUICtrlCreateCombo("", 325, 137, 60, 17, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Default|Lower|Higher", "Default")
$btnFindWall = GUICtrlCreateButton("Find Wall", 145, 60, 63, 21)
GUICtrlSetOnEvent(-1, "btnFindWall")
GUICtrlCreateGroup("", -99, -99, 1, 1)


$Boosts = GUICtrlCreateGroup("Boosts", 20, 255, 375, 100)
$lblBoostBarracks = GUICtrlCreateLabel("Barracks Boosts left :", 30, 275, 100, 17)
$cmbBoostBarracks = GUICtrlCreateCombo("", 150, 271, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5", "0")
$chkBoostKing = GUICtrlCreateCheckbox("King Altar", 30, 300, 65, 17)
$chkBoostQueen = GUICtrlCreateCheckbox("Queen Altar", 115, 300, 75, 17)
$chkBoostRax1 = GUICtrlCreateCheckbox("Barrack 1", 200, 275, 65, 17)
$chkBoostRax2 = GUICtrlCreateCheckbox("Barrack 2", 200, 300, 65, 17)
$chkBoostRax3 = GUICtrlCreateCheckbox("Barrack 3", 285, 275, 65, 17)
$chkBoostRax4 = GUICtrlCreateCheckbox("Barrack 4", 285, 300, 65, 17)
$chkBoostSpell = GUICtrlCreateCheckbox("Spell Factory", 30, 325, 90, 17)
$chkBoostDB1 = GUICtrlCreateCheckbox("Dark Barrack 1", 140, 325, 90, 17)
$chkBoostDB2 = GUICtrlCreateCheckbox("Dark Barrack 2", 250, 325, 90, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

; ---------------------------------------------------------------------------------------------------------------------
; Stats ---------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageStatsSetting = GUICtrlCreateTabItem("Stats")
$resourceonstart = GUICtrlCreateGroup("Resources at Start", 20, 40, 185, 120)
$lblgoldonstart = GUICtrlCreateLabel("Gold at Start :", 50, 68, 65, 17)
$lblresultgoldtstart = GUICtrlCreateLabel("0", 128, 68, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Gold.jpg", 30, 68, 15, 15)
$lblelixironstart = GUICtrlCreateLabel("Elixir at Start :", 50, 88, 65, 17)
$lblresultelixirstart = GUICtrlCreateLabel("0", 128, 88, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Elixir.jpg", 30, 88, 15, 15)
$lbldeonstart = GUICtrlCreateLabel("DE at Start :", 50, 108, 60, 17)
$lblresultdestart = GUICtrlCreateLabel("0", 128, 108, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Dark.jpg", 30, 108, 15, 15)
$lbltrophyonstart = GUICtrlCreateLabel("Trophies at Start :", 50, 128, 100, 17)
$lblresulttrophystart = GUICtrlCreateLabel("0", 128, 128, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Trophy.jpg", 30, 128, 15, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$Currentresource = GUICtrlCreateGroup("Other Stats", 210, 40, 185, 120)
$lblvillagesattacked = GUICtrlCreateLabel("Attacked :", 220, 68, 100, 17)
$lblresultvillagesattacked = GUICtrlCreateLabel("0", 318, 68, 60, 17, $SS_RIGHT)
$lblvillagesskipped = GUICtrlCreateLabel("Skipped :", 220, 83, 100, 17)
$lblresultvillagesskipped = GUICtrlCreateLabel("0", 318, 83, 60, 17, $SS_RIGHT)
$lblsearchcost = GUICtrlCreateLabel("Search Cost :", 220, 98, 100, 17)
$lblresultsearchcost = GUICtrlCreateLabel("0", 318, 98, 60, 17, $SS_RIGHT)
$lblruntime = GUICtrlCreateLabel("Bot Run Time :", 220, 113, 100, 17)
$lblresultruntime = GUICtrlCreateLabel("00:00:00", 318, 113, 60, 17, $SS_RIGHT)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$LastLoot = GUICtrlCreateGroup("Buildings/Walls Upgrade", 20, 160, 375, 70)
$lblwallupgrade = GUICtrlCreateLabel("Wall Upgrade :", 50, 185, 100, 17)
$lblwallupgradecount = GUICtrlCreateLabel("0", 128, 185, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Wall.jpg", 30, 186, 15, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$CurrentLoot = GUICtrlCreateGroup("Current Resources", 20, 230, 185, 110)
$lblgoldnow = GUICtrlCreateLabel("Gold Now :", 50, 253, 60, 17)
$lblresultgoldnow = GUICtrlCreateLabel("0", 128, 253, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Gold.jpg", 30, 253, 15, 15)
$lblelixirnow = GUICtrlCreateLabel("Elixir Now :", 50, 273, 60, 17)
$lblresultelixirnow = GUICtrlCreateLabel("0", 128, 273, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Elixir.jpg", 30, 273, 15, 15)
$lbldenow = GUICtrlCreateLabel("DE Now :", 50, 293, 60, 17)
$lblresultdenow = GUICtrlCreateLabel("0", 128, 293, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Dark.jpg", 30, 293, 15, 15)
$lbltrophynow = GUICtrlCreateLabel("Trophies Now :", 50, 313, 100, 17)
$lblresulttrophynow = GUICtrlCreateLabel("0", 128, 313, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Trophy.jpg", 30, 313, 15, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$totalresource = GUICtrlCreateGroup("Total Gain", 210, 230, 185, 110)
$lblgoldgain = GUICtrlCreateLabel("Gold Gain :", 250, 253, 100, 17)
$lblresultgoldgain = GUICtrlCreateLabel("0", 318, 253, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Gold.jpg", 230, 253, 15, 15)
$lblelixirgain = GUICtrlCreateLabel("Elixir Gain :", 250, 273, 100, 17)
$lblresultelixirgain = GUICtrlCreateLabel("0", 318, 273, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Elixir.jpg", 230, 273, 15, 15)
$lbldegain = GUICtrlCreateLabel("DE Gain :", 250, 293, 100, 17)
$lblresultdegain = GUICtrlCreateLabel("0", 318, 293, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Dark.jpg", 230, 293, 15, 15)
$lbltrophygain = GUICtrlCreateLabel("Trophy Gain :", 250, 313, 100, 17)
$lblresulttrophygain = GUICtrlCreateLabel("0", 318, 313, 60, 17, $SS_RIGHT)
GUICtrlCreatePic(@ScriptDir & "\images\Resource\Trophy.jpg", 230, 313, 15, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)

; ---------------------------------------------------------------------------------------------------------------------
; Configuration -------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$pageConfigLoadSave = GUICtrlCreateTabItem("Config")
$ConfigLoadSave = GUICtrlCreateGroup("Config Load/Save", 20, 40, 375, 65)
$btnLoad = GUICtrlCreateButton("Load", 180, 64, 97, 25)
GUICtrlSetOnEvent(-1, "btnLoad")
$btnSave = GUICtrlCreateButton("Save", 280, 64, 97, 25)
GUICtrlSetOnEvent(-1, "btnSave")
$lblConfig = GUICtrlCreateLabel(getfilename($config), 40, 70, 112, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

$btnBugRep = GUICtrlCreateButton("Debug Data", 320, 175, 75, 25)
GUICtrlSetOnEvent(-1, "btnBugRep")

$grpUpdate = GUICtrlCreateGroup("Auto Update", 20, 225, 375, 60)
$chkUpdate = GUICtrlCreateCheckbox("Check GitHub site for updates on launch", 40, 250, 300, 15)
GUICtrlSetBkColor($chkUpdate, $COLOR_WHITE)
GUICtrlSetState(-1, $GUI_UNCHECKED)

$grpBluestacks = GUICtrlCreateGroup("BlueStacks", 20, 295, 375, 60)
$chkBackground = GUICtrlCreateCheckbox("Background Mode", 40, 320, 105, 15)
GUICtrlSetBkColor($chkBackground, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkBackground")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Activate Background Mode")
$chkForceBS = GUICtrlCreateCheckbox("Force Active", 175, 320, 105, 15)
GUICtrlSetBkColor($chkForceBS, $COLOR_WHITE)
GUICtrlSetOnEvent(-1, "chkForceBS")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Force activate Bluestack if unable to locate it")
$chkStayAlive = GUICtrlCreateCheckbox("Stay Alive", 290, 320, 75, 15)
GUICtrlSetBkColor($chkStayAlive, $COLOR_WHITE)
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlSetTip(-1, "Prevent monitor sleeping")
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")

; ---------------------------------------------------------------------------------------------------------------------
; Status Bar ----------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
$statLog = _GUICtrlStatusBar_Create($frmBot)
_GUICtrlStatusBar_SetSimple($statLog)
_GUICtrlStatusBar_SetText($statLog, "Status : Idle")
$tiAbout = TrayCreateItem("About")
TrayCreateItem("")
$tiExit = TrayCreateItem("Exit")
