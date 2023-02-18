victories := 0
defeats := 0

maps := Map(
    "sanctuary", SanctuaryGameScript,
    "ravine", RavineGameScript,
    "flooded_valley", FloodedValleyGameScript,
    "infernal", InfernalGameScript,
    "bloody_puddles", BloodyPuddlesGameScript,
    "workshop", WorkshopGameScript,
    "quad", QuadGameScript,
    "dark_castle", DarkCastleGameScript,
    "muddy_puddles", MuddyPuddlesGameScript,
    "hashtag_ouch", HashtagOuchGameScript,
    "dark_dungeons", DarkDungeonsGameScript,
)

states := ["home", "map_selection", "in_game"]
if eventType != "none" {
    states.Push("collect", "event")
}
