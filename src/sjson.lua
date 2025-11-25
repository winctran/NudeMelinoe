---@meta _
---@diagnostic disable

-- Check if animation of given name should be disabled.
function is_animation_disabled(phrase)
    local not_allowed = {
        "^Portrait_Mel.*Wiggle",  -- Moving specular lights on armor contour
        "^Portrait_Mel.*ArmGlow", -- Lines on waist
        "^Portrait_Mel.*Glint",   -- Armor light. Can be allowed for "magic armor" effect
    }

    for _, bad_word in ipairs(not_allowed) do
        if string.find(phrase, bad_word) then
            return true
        end
    end
    return false
end

-- Change some character dialogue portraits
local gui_portraits_vfx_path = rom.path.combine(rom.paths.Content, 'Game/Animations/GUI_Portraits_VFX.sjson')
sjson.hook(gui_portraits_vfx_path, function(data)
    for index, animation_data in ipairs(data.Animations) do
        if animation_data.Name == "Portrait_Mel_Default_01"
            or animation_data.Name == "Portrait_Mel_Default_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_01"
        end

        if animation_data.Name == "Portrait_Mel_Vulnerable_01"
            or animation_data.Name == "Portrait_Mel_Vulnerable_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_Vulnerable_01"
        end

        if animation_data.Name == "Portrait_Mel_Intense_01"
            or animation_data.Name == "Portrait_Mel_Intense_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_Intense_01"
        end

        if animation_data.Name == "Portrait_Mel_Pleased_01"
            or animation_data.Name == "Portrait_Mel_Pleased_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_Pleased_01"
        end

        if animation_data.Name == "Portrait_Mel_PleasedFlushed_01"
            or animation_data.Name == "Portrait_Mel_PleasedFlushed_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_PleasedFlushed_01"
        end

        if animation_data.Name == "Portrait_Mel_Casual_01"
            or animation_data.Name == "Portrait_Mel_Casual_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_Casual_01"
        end

        if animation_data.Name == "Portrait_Mel_Hesitant_01"
            or animation_data.Name == "Portrait_Mel_Hesitant_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_Hesitant_01"
        end

        if animation_data.Name == "Portrait_Mel_Empathetic_01"
            or animation_data.Name == "Portrait_Mel_Empathetic_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_Empathetic_01"
        end

        if animation_data.Name == "Portrait_Mel_EmpatheticFlushed_01"
            or animation_data.Name == "Portrait_Mel_EmpatheticFlushed_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_EmpatheticFlushed_01"
        end

        if animation_data.Name == "Portrait_Mel_Proud_01"
            or animation_data.Name == "Portrait_Mel_Proud_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Melinoe_Proud_01"
        end

        if animation_data.Name == "Portrait_Mel_Bath_01"
            or animation_data.Name == "Portrait_Mel_Bath_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Mel_Bath_Custom"
            animation_data.CreateAnimations = {}
            animation_data.Scale = 0.8
            animation_data.OffsetY = -100
            animation_data.OffsetX = 0
        end

        -- Replace two bath sprites with a custom one
        if animation_data.Name == "Portrait_Mel_Bath_Shock_01"
            or animation_data.Name == "Portrait_Mel_Bath_Shock_01_Exit"
            or animation_data.Name == "Portrait_Mel_Bath_Tearful_01"
            or animation_data.Name == "Portrait_Mel_Bath_Tearful_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portrait_Mel_Bath_Shock_01"
            animation_data.CreateAnimations = {}
            animation_data.Scale = 0.8
            animation_data.OffsetY = -100
            animation_data.OffsetX = 0
        end

        -- disable animations with names that follow one of patterns defined above
        if is_animation_disabled(animation_data.Name) then
            animation_data.FilePath = "Dev\\blank_invisible"
            animation_data.EndFrame = 1
            animation_data.Loop = false
            animation_data.NumFrames = 1
            animation_data.StartFrame = 1
            animation_data.Slides = {
                { DurationFrames = 1, FilePath = "Dev\\blank_invisible" }
            }
        end
    end
end)

-- Change some screen animations
local gui_screens_vfx_path = rom.path.combine(rom.paths.Content, 'Game/Animations/GUI_Screens_VFX.sjson')
sjson.hook(gui_screens_vfx_path, function(data)
    for index, animation_data in ipairs(data.Animations) do
        -- BoonSelect screen.
        -- Numbers 0000-0015 are added automatically for In and Out animations

        if animation_data.Name == "BoonSelectMelStatic" then
            animation_data.FilePath = "NudeMelinoe\\GUI_BoonSelectMelIn0015"
        end

        if animation_data.Name == "BoonSelectMelIn" then
            animation_data.FilePath = "NudeMelinoe\\GUI_BoonSelectMelIn"
        end

        if animation_data.Name == "BoonSelectMelOut" then
            animation_data.FilePath = "NudeMelinoe\\GUI_BoonSelectMelOut"
        end

        -- Replace movies that should be dropped in the games' Movie folder

        if animation_data.Name == "MainMenuIn"
            or animation_data.Name == "MainMenuLoop" then
            animation_data.VideoTexture = "NudeMain"
        end

        if animation_data.Name == "SpellScreenIn"
            or animation_data.Name == "SpellScreenLoop"
            or animation_data.Name == "SpellScreenOut" then
            animation_data.VideoTexture = "NudeSpellSc"
        end

        if animation_data.Name == "TalentScreenIn"
            or animation_data.Name == "TalentScreenLoop"
            or animation_data.Name == "TalentScreenOut" then
            animation_data.VideoTexture = "NudeTalentSc"
        end
    end
end)
