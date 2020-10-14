function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_death_complete(e)
	eq.spawn2(44104,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #Rathyl_reincarnate
end

-- EOF zone: najena NPC: Rathyl
