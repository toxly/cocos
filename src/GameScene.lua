local GameScene = class("GameScene",function()
    return cc.Scene:create()
end)

GameScene.arrButton = {}
GameScene.arrLayer = {}
GameScene.arrScene = {}

function GameScene.create()
    local scene = GameScene.new()
    local mainScene = cc.CSLoader:createNode("MainScene.csb");
    scene:addChild(mainScene)

    GameScene.arrScene[0] = scene;
    GameScene.arrLayer[0] = mainScene;
    
    GameScene.initScene(0) 
    
    return scene
end

function GameScene.initScene(layerI) 
    local layerScene = GameScene.arrLayer[layerI];
    if 0 == layerI then
        for i = 0, 4, 1 do
            local buttonname = "Button_"..i
            cclog(buttonname)
            
            GameScene.arrButton[i] = layerScene:getChildByName(buttonname);
            GameScene.arrButton[i]:addTouchEventListener(GameScene["buttonClick"..i]);

            cclog(GameScene.arrButton[i]:getName());
        end
    else
        local returnLabel = layerScene:getChildByName("Panel_1"):getChildByName("Text_1");
        returnLabel:addTouchEventListener(GameScene.buttonClick0)
    end
end



function GameScene.commonClick(layerI)
    cclog("Click button "..layerI);
    local layerScene;
    if 0 == layerI then
        if nil == GameScene.arrScene[layerI] then
            layerScene = GameScene.new()
            local layer = cc.CSLoader:createNode("MainScene.csb");
            layerScene:addChild(layer)
            GameScene.arrScene[layerI] = layerScene
            GameScene.arrLayer[layerI] = layer
        else
            layerScene = GameScene.arrScene[layerI];
        end

        GameScene.initScene(layerI);
        cc.Director:getInstance():replaceScene(layerScene)
    elseif 1 == layerI then
        if nil == GameScene.arrScene[layerI] then
            layerScene = GameScene.new()
            local layer = cc.CSLoader:createNode("Layer0.csb");
            layerScene:addChild(layer)
            GameScene.arrScene[layerI] = layerScene
            GameScene.arrLayer[layerI] = layer
        else
            layerScene = GameScene.arrScene[layerI];
        end
        
        GameScene.initScene(layerI);
        cc.Director:getInstance():replaceScene(layerScene)
    end
end

function GameScene.buttonClick0()
    GameScene.commonClick(0);
end
function GameScene.buttonClick1()
    GameScene.commonClick(1);
end
function GameScene.buttonClick2()
    GameScene.commonClick(2);
end
function GameScene.buttonClick3()
    GameScene.commonClick(3);
end
function GameScene.buttonClick4()
    GameScene.commonClick(4);
end

return GameScene
