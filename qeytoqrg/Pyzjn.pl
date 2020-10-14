sub EVENT_SAY
	{
	quest::say("Hail, $name. Pyzjin is working for Master Varsoon. If Pyzjin do good work then maybe Master Varsoon tell Master Bruax he is worthy. Pyzjin must go now. All glory to the Plaguebringe! May you die a painful, oozing death.");
	}

sub EVENT_SPAWN {
   if ($zonetime > 700 && $zonetime < 1899) {
   $npc->Depop(1);
   }
}

sub EVENT_WAYPOINT_ARRIVE {
   if (($zonetime > 700 && $zonetime < 1899) && ($wp == 1)) {
   $npc->Depop(1);
   }
}
