---@meta _
---@diagnostic disable

function is_animation_disabled(phrase)
    local not_allowed = {
        "^Portrait_Mel.*Wiggle",
        "^Portrait_Mel.*ArmGlow",
        "^Portrait_Mel.*Glint",

        -- "BoonSelectMelIn",
        -- "BoonSelectMelOut",
    }

    for _, bad_word in ipairs(not_allowed) do
        if string.find(phrase, bad_word) then
            return true
        end
    end
    return false
end

local gui_portraits_vfx_path = rom.path.combine(rom.paths.Content, 'Game/Animations/GUI_Portraits_VFX.sjson')
sjson.hook(gui_portraits_vfx_path, function(data)
    for index, animation_data in ipairs(data.Animations) do
        if animation_data.Name == "Portrait_Mel_Default_01"
            or animation_data.Name == "Portrait_Mel_Default_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_01"
        end

        if animation_data.Name == "Portrait_Mel_Vulnerable_01"
            or animation_data.Name == "Portrait_Mel_Vulnerable_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Vulnerable_01"
        end

        if animation_data.Name == "Portrait_Mel_Intense_01"
            or animation_data.Name == "Portrait_Mel_Intense_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Intense_01"
        end

        if animation_data.Name == "Portrait_Mel_Pleased_01"
            or animation_data.Name == "Portrait_Mel_Pleased_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Pleased_01"
        end

        if animation_data.Name == "Portrait_Mel_PleasedFlushed_01"
            or animation_data.Name == "Portrait_Mel_PleasedFlushed_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_PleasedFlushed_01"
        end

        if animation_data.Name == "Portrait_Mel_Casual_01"
            or animation_data.Name == "Portrait_Mel_Casual_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Casual_01"
        end

        if animation_data.Name == "Portrait_Mel_Hesitant_01"
            or animation_data.Name == "Portrait_Mel_Hesitant_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Hesitant_01"
        end

        if animation_data.Name == "Portrait_Mel_Empathetic_01"
            or animation_data.Name == "Portrait_Mel_Empathetic_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Empathetic_01"
        end

        if animation_data.Name == "Portrait_Mel_EmpatheticFlushed_01"
            or animation_data.Name == "Portrait_Mel_EmpatheticFlushed_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_EmpatheticFlushed_01"
        end

        if animation_data.Name == "Portrait_Mel_Proud_01"
            or animation_data.Name == "Portrait_Mel_Proud_01_Exit" then
            animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Proud_01"
        end



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

local gui_screens_vfx_path = rom.path.combine(rom.paths.Content, 'Game/Animations/GUI_Screens_VFX.sjson')
sjson.hook(gui_screens_vfx_path, function(data)
    for index, animation_data in ipairs(data.Animations) do
        if animation_data.Name == "BoonSelectMelStatic" then
            animation_data.FilePath = "NudeMelinoe\\GUI_BoonSelectMelIn0015"
        end

        if animation_data.Name == "MainMenuIn"
            or animation_data.Name == "MainMenuLoop" then
            animation_data.VideoTexture = "NudeMain"
        end

        if animation_data.Name == "BoonSelectMelIn" then
            animation_data.FilePath = "NudeMelinoe\\GUI_BoonSelectMelIn"
        end

        -- GUI\Screens\BoonSelect\BoonSelectMelIn\BoonSelectMelIn

        -- if animation_data.Name == "SpellScreenIn"
        --     or animation_data.Name == "SpellScreenLoop"
        --     or animation_data.Name == "SpellScreenOut" then
        --     animation_data.FilePath = "NudeMelinoe\\Portraits_Melinoe_Proud_01"
        -- end

        -- if animation_data.Name == "SpellScreenLoop" then
        --     animation_data.FilePath = "NudeMelinoe\\SpellScreenBG"
        -- end

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
