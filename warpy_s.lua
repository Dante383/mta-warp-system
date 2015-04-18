addEventHandler("onResourceStart", getResourceRootElement(getThisResource()),
  function (  )
    local xml = xmlLoadFile("warpy.xml") -- ladujemy warpy z pliku xml
    local xmlNode = xmlNodeGetChildren(xml)
    
    for i, node in ipairs(xmlNode) do
      local name = xmlNodeGetAttribute(node,"name")
      local x = tonumber(xmlNodeGetAttribute(node,"x"))
      local y = tonumber(xmlNodeGetAttribute(node,"y"))
      local z = tonumber(xmlNodeGetAttribute(node,"z"))
      local d = tonumber(xmlNodeGetAttribute(node,"dimension"))
      local i = tonumber(xmlNodeGetAttribute(node,"interior"))
      
      local warp = createElement("warp")
      setElementData(warp, "name", name)
      setElementData(warp, "x", x)
      setElementData(warp, "y", y)
      setElementData(warp, "z", z)
      setElementData(warp, "d", d)
      setElementData(warp, "i", i)
    end
    xmlUnloadFile(xml)
end
)


addCommandHandler("warps",
  function ( )
    outputChatBox("Warpy:", source)
    for k,v in ipairs (getElementsByType("warp")) do
      outputChatBox(getElementData(v,"name"), source) 
    end
  end
)



addCommandHandler("warp",
  function ( plr, cmd, warp )
    if not warp then
      outputChatBox("Poprawna forma: /warp nazwawarpu  Lista warpów znajduje się pod komendą /warps", plr)
    return end

    for k,v in ipairs(getElementsByType("warp")) do
      if warp == getElementData(v, "name") then
        outputChatBox("Teleportowanie do "..getElementData(v, "name").."", plr)
        setElementDimension(plr, getElementData(v, "d"))
        setElementInterior(plr,  getElementData(v, "i"))
        setElementPosition(plr, getElementData(v, "x"), getElementData(v, "y"), getElementData(v, "z"))
        return
      end
    end
end
)


