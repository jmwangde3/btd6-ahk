MAP_COORDS := [[444, 280], [878, 280], [1289, 280], [444, 590], [878, 590], [1289, 590]]

MapSelection() {
    Switch mapCategory {
        Case "advanced":
            SelectAdvancedMap()
        Default:
            SelectExpertMap()
    }
    LogMsg("Selected map: " MAPS[currentMap[1]][currentMap[2]][1])
    SelectDifficulty()
    CheckOwerwrite()
    Sleep(4000)
}

SelectAdvancedMap() {
    mapToSelect := Random(1, 2)
    SelectMap(9, mapToSelect)
}

SelectExpertMap() {
    mapToSelect := Random(1, 11)
    if mapSelect == "dark_castle" {
        mapToSelect := 9
    }
    if FileExist("img\events\" mapSelect) {
        While true {
            ClickImage("buttons\expert")
            currentMap[1] := GetCurrentMapPage()
            Loop 6 {
                if ClickImage("events\" mapSelect "\" A_Index - 1) {
                    currentMap[2] := A_Index
                    return
                }
            }
        }
    } else {
        if mapToSelect < 7 {
            SelectMap(12, mapToSelect)
        } else {
            SelectMap(13, mapToSelect - 6)
        }
    }
}

SelectMap(page, number) {
    While GetCurrentMapPage() != page {
        Switch page {
            Case 1,2,3,4:
                ClickImage("buttons\beginner")
            Case 5,6,7,8:
                ClickImage("buttons\intermediate")
            Case 9,10,11:
                ClickImage("buttons\advanced")
            Case 12,13:
                ClickImage("buttons\expert")
        }
    }
    Click(MAP_COORDS[number][1], MAP_COORDS[number][2])
    currentMap[2] := number
    currentMap[1] := page
    Sleep(1000)
}

CheckOwerwrite() {
    if SearchImage("states\overwrite") {
        if overwriteSave {
            ClickImage("buttons\ok", 1000, "*TransBlack", 1080, 700, 1180, 770)
        } else {
            LogMsg("Script stopped to protect an existing save")
            Reload()
        }
    }
}
