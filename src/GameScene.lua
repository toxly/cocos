local gs = {};
gs.GameScene = nil;
gs.GameScene = class("GameScene",function()
  return cc.Scene:create()
end)

gs.arrButton = {}
gs.arrLayer = {}

function gs.create()
  local scene = gs.GameScene.new()
  local mainScene = cc.CSLoader:createNode("MainScene.csb");
  scene:addChild(mainScene)

  gs.arrLayer[0] = mainScene;

  gs.initScene(0)

  return scene
end

function gs.initScene(layerI)
  local layerScene = gs.arrLayer[layerI];
  if 0 == layerI then
    for i = 0, 4, 1 do
      local buttonname = "Button_"..i

      gs.arrButton[i] = layerScene:getChildByName(buttonname);
      gs.arrButton[i]:addTouchEventListener(gs["buttonClick"..i]);

      cclog(gs.arrButton[i]:getName());
    end
  elseif 1 == layerI then
    local panelHead = layerScene:getChildByName("Panel_main"):getChildByName("Panel_head");
    local returnLabel = panelHead:getChildByName("Button_return")
    cclog(returnLabel:getName());
    returnLabel:addTouchEventListener(gs.buttonClick0)

    local buttonNew = panelHead:getChildByName("Button_new")
    cclog(buttonNew:getName());
    buttonNew:addTouchEventListener(gs.buttonClickNew)
    
    local touchOneListener = cc.EventListenerTouchOneByOne
    touchOneListener:setEnabled(true);
    
  elseif 2 == layerI then
    
  end
end



function gs.commonClick(layerI)
  cclog("Click button "..layerI);
  local layerScene;
  if 0 == layerI then
    layerScene = gs.GameScene.new()
    local layer = cc.CSLoader:createNode("MainScene.csb");
    layerScene:addChild(layer)
    gs.arrLayer[layerI] = layer

    gs.initScene(layerI);
    cc.Director:getInstance():replaceScene(layerScene)
  elseif 1 == layerI then
    layerScene = gs.GameScene.new()
    local layer = cc.CSLoader:createNode("LayerList.csb");
    layerScene:addChild(layer)
    gs.arrLayer[layerI] = layer

    gs.initScene(layerI);
    cc.Director:getInstance():replaceScene(layerScene)
  elseif 2 == layerI then
    layerScene = gs.GameScene.new()
    local layer = cc.CSLoader:createNode("LayerNew.csb");
    layerScene:addChild(layer)
    gs.arrLayer[layerI] = layer

    gs.initScene(layerI);
    cc.Director:getInstance():replaceScene(layerScene)
  end
end

function gs.buttonClickNew()
  gs.commonClick(2);
end

function gs.buttonClick0()
  gs.commonClick(0);
end
function gs.buttonClick1()
  gs.commonClick(1);
end
function gs.buttonClick2()
  gs.commonClick(2);
end
function gs.buttonClick3()
  gs.commonClick(3);
end
function gs.buttonClick4()
  gs.commonClick(4);
end

return gs
