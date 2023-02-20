## Rebuild `status_wx.zip` guide

1) Optional:
    - edit `..\exported\frame\frame-0.png` (`frame-0.psd` included)
    - edit `..\exported\build.xml`
    - edit `..\exported\animation.xml`
2) Create zip archive named `status_wx.zip` from: `build.xml`, `animation.xml`, `bee_chip ... taser_chip` (everything from `..\exported` folder)
3) `."C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Mod Tools\mod_tools\buildtools\windows\Python27\python.exe" "C:\Program Files (x86)\Steam\steamapps\common\Don't Starve Mod Tools\mod_tools\tools\scripts\buildanimation.py" status_wx.zip`
4) in result you will have `.\data\anim\status_wx.zip` ... it should contain 3 files: `atlas-0.tex`, `build.bin`, `anim.bin`
5) replace `status_wx.zip` in your mod's anim folder

### Profit!