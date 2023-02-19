## Rebuild `status_wx.zip` guide

1) Optional:
    - edit `..\exported\frame\frame-0.png` (`frame-0.psd` included)
        - Note: in case you've only edited `png` assets - skip (6)
    - edit `..\exported\build.xml`
    - edit `..\exported\anim.xml`
2) Create new dir named `status_wx`, copy to it: `build.xml`, `bee_chip ... taser_chip` (all dirs from `..\exported` folder)
3) create zip archive from `status_wx` -> `status_wx.zip`

4) `."C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Mod Tools\mod_tools\buildtools\windows\Python27\python.exe" "C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Mod Tools\mod_tools\tools\scripts\buildanimation.py" status_wx.zip`
5) in result you will have `.\data\anim\status_wx.zip` ... it should contain 2 files: `atlas-0.tex`, `build.bin`

6)  `."C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Mod Tools\mod_tools\buildtools\windows\Python27\python.exe" enanim.py ..\exported\anim.xml`
7) in result you will have `anim.xml.bin`, insert it as `anim.bin` to `.\data\anim\status_wx.zip`

8) replace `status_wx.zip` in your mod's anim folder

### Profit!