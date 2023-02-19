GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})

local UIAnim = require "widgets/uianim"

TUNING.WX78_MOVESPEED_CHIPBOOSTS = {0.00, 0.25, 0.40, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50, 0.50}
TUNING.WX78_MAXELECTRICCHARGE = 24
TUNING.WX78_CHARGE_REGENTIME = GetModConfigData("_WX78_CHARGE_REGENTIME") or 90
TUNING.WX78_HEALTH = GetModConfigData("_WX78_BASE_HEALTH") or 125
TUNING.WX78_HUNGER = GetModConfigData("_WX78_BASE_HUNGER") or 125
TUNING.WX78_SANITY = GetModConfigData("_WX78_BASE_SANITY") or 150

-- if TheWorld ~= nil and not TheWorld.ismastersim then 
--     module_defs = require("wx78_moduledefs").module_definitions
--     num_wide = math.ceil(math.sqrt(#module_defs))
--     for y = 0, num_wide - 1 do
--             for x = 0, num_wide - 1 do
--                 def = module_defs[(y*num_wide) + x + 1]
--                 AddPrefabPostInit("wx78module_"..def.name, function(inst)
--                     if inst.components.finiteuses then
--                         inst:RemoveComponent("finiteuses")
--                     end
--                 end)
--             end
--     end
-- end

local OnUpgradeModulesListDirty = function(inst)
    if inst._parent ~= nil then
        local module1 = inst.upgrademodules[1]:value()
        local module2 = inst.upgrademodules[2]:value()
        local module3 = inst.upgrademodules[3]:value()
        local module4 = inst.upgrademodules[4]:value()
        local module5 = inst.upgrademodules[5]:value()
        local module6 = inst.upgrademodules[6]:value()
        local module7 = inst.upgrademodules[7]:value()
        local module8 = inst.upgrademodules[8]:value()
        local module9 = inst.upgrademodules[9]:value()
        local module10 = inst.upgrademodules[10]:value()
        local module11 = inst.upgrademodules[11]:value()
        local module12 = inst.upgrademodules[12]:value()
        local module13 = inst.upgrademodules[13]:value()
        local module14 = inst.upgrademodules[14]:value()
        local module15 = inst.upgrademodules[15]:value()
        local module16 = inst.upgrademodules[16]:value()
        local module17 = inst.upgrademodules[17]:value()
        local module18 = inst.upgrademodules[18]:value()
        local module19 = inst.upgrademodules[19]:value()
        local module20 = inst.upgrademodules[20]:value()
        local module21 = inst.upgrademodules[21]:value()
        local module22 = inst.upgrademodules[22]:value()
        local module23 = inst.upgrademodules[23]:value()
        local module24 = inst.upgrademodules[24]:value()

        if module1 == 0 and module2 == 0 and module3 == 0 and module4 == 0 and module5 == 0 and module6 == 0 and module7 == 0 and module8 == 0 and module9 == 0 and module10 == 0 and module11 == 0 and module12 == 0 and module13 == 0 and module14 == 0 and module15 == 0 and module16 == 0 and module17 == 0 and module18 == 0 and module19 == 0 and module20 == 0 and module21 == 0 and module22 == 0 and module23 == 0 and module24 == 0 then
            inst._parent:PushEvent("upgrademoduleowner_popallmodules")
        else
            inst._parent:PushEvent("upgrademodulesdirty", {module1, module2, module3, module4, module5, module6, module7, module8, module9, module10, module11, module12, module13, module14, module15, module16, module17, module18, module19, module20, module21, module22, module23, module24})
        end
    end
end

AddPrefabPostInit("player_classified",function(inst)
    for i=7,24,1 do
        table.insert(inst.upgrademodules,net_smallbyte(inst.GUID, "upgrademodules.mods"..i, "upgrademoduleslistdirty"))
    end

    if not TheWorld.ismastersim then
        inst.event_listeners["upgrademoduleslistdirty"]={}
        inst.event_listening["upgrademoduleslistdirty"]={}
        inst:ListenForEvent("upgrademoduleslistdirty", OnUpgradeModulesListDirty)
    end
end)

AddClassPostConstruct("widgets/upgrademodulesdisplay",function(self, ...)
    for i = 1, 6 do
        local chip_object = self:AddChild(UIAnim())
        chip_object:GetAnimState():SetBank("status_wx")
        chip_object:GetAnimState():SetBuild("status_wx")
        chip_object:GetAnimState():AnimateWhilePaused(false)

        chip_object:GetAnimState():Hide("plug_on")
        chip_object._power_hidden = true

        chip_object:MoveToBack()
        chip_object:Hide()

        table.insert(self.chip_objectpool, chip_object)
    end

    for i,v in ipairs(self.chip_objectpool) do
        v:SetPosition(0,-60)
    end

    self.battery_frame:SetPosition(0,165)


end)

AddClassPostConstruct("widgets/secondarystatusdisplays",function(self, ...)
    if self.upgrademodulesdisplay then
        if GetModConfigData("_SEPARATE_BACKPACK_MODE") then
            self.upgrademodulesdisplay:SetPosition(-100,-310)
        else
            self.upgrademodulesdisplay:SetPosition(self.column1,-200)
        end
    end
end)

local function OnAllUpgradeModulesRemoved(inst)
    SpawnPrefab("wx78_big_spark"):AlignToTarget(inst)

    inst:PushEvent("upgrademoduleowner_popallmodules")

    if inst.player_classified ~= nil then
        for i=1,24,1 do
            inst.player_classified.upgrademodules[i]:set(0)
        end
    end
end

AddPrefabPostInit("wx78",function(inst)
    if TheWorld.ismastersim then
        inst:DoTaskInTime(.1,function()
            inst.components.upgrademoduleowner.onallmodulespopped = OnAllUpgradeModulesRemoved
        end)
    end
end)
