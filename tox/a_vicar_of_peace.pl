my @features = ("Gender", "Haircolor", "Beardcolor", "Eyecolor1", "Eyecolor2", "Hair", "Face", "helm", "Texture");

sub EVENT_SPAWN
	{
	plugin::SEV($npc, "value", plugin::RandomRange(53,67));
	quest::npcfeature("Size", plugin::REV($npc, "value"));	

	foreach $feature (@features)
		{
		plugin::SEV($npc, "feature", $feature);
		plugin::SEV($npc, "max", 4);
		if (plugin::REV($npc, "feature") eq "Gender")
			{
			plugin::SEV($npc, "max", 1);
			}
		plugin::SEV($npc, "value", plugin::RandomRange(0,plugin::REV($npc, "max")));
		my $shit = plugin::REV($npc, "feature");
		my $shit2 = plugin::REV($npc, "value");
#		quest::say("$shit : $shit2");
		quest::npcfeature(plugin::REV($npc, "feature"), plugin::REV($npc, "value"));
		}	
	}
