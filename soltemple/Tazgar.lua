function event_say(e)
  if(e.message:findi("hail")) then
    e.other:Faction(415,-50,0); -- Temple of Solusek Ro
  end
end

function event_death_complete(e)
    x = e.self:GetX();
    y = e.self:GetY();
    z = e.self:GetZ();
    h = e.self:GetHeading();

    -- Spawn a_blazing elemental
    eq.spawn2(80040,0,0,x,y,z,h);
end
