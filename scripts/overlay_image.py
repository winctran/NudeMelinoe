"""
Overlay image with transparency over multiple files.

Allows to edit all the animation frames at once.
Some frames may still need to be edited manually.

Required file structure is:
.
├── MainMenu
│   ├── MainMenu000.png
│   ├── MainMenu001.png
│   └── MainMenu002.png
│   └── ...
└── MainMenu_overlay.png

Where MainMenu holds animation frames (possibly exported with bink)
And MainMenu_overlay.png is a file to overlay over all the frames. 
"""

import cv2
import os


# folder_name = "./MainMenu"
# folder_name = "./TalentScreen"
folder_name = "./SpellScreen"

overlay = cv2.imread(f"{folder_name}_overlay.png", cv2.IMREAD_UNCHANGED)
output_folder = f"{folder_name}/output/"
os.makedirs(output_folder, exist_ok=True)

filelist = os.listdir(folder_name + "/")
for file_name in filelist[:]:
    if file_name.endswith(".png"):
        image = cv2.imread(f"{folder_name}/{file_name}", cv2.IMREAD_UNCHANGED)

        alpha_background = image[:, :, 3] / 255.0
        alpha_foreground = overlay[:, :, 3] / 255.0

        for color in range(0, 3):
            image[:, :, color] = alpha_foreground * overlay[:, :, color] + \
                alpha_background * image[:, :, color] * (1 - alpha_foreground)

        image[:, :, 3] = (1 - (1 - alpha_foreground)
                          * (1 - alpha_background)) * 255

        cv2.imwrite(f"{folder_name}/output/" + file_name, image)
