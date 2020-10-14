my $k=0;
my $kname="Executioner";

%RaceTEXT = (
 1, => "human" ,
 2, => "barbarian" ,
 3, => "erudin" ,
 4, => "woodelf" ,
 5, => "highelf" ,
 6, => "darkelf" ,
 7, => "halfelf" ,
 8, => "dwarf" ,
 9, => "troll" ,
 10, => "ogre" ,
 11, => "halfling" ,
 12, => "gnome" ,
 128, => "iksar" ,
 330, => "froglok" ,
 130, => "vahshir" ,
);

sub EVENT_SIGNAL
	{
	$k = $signal;
	foreach $pc ($entity_list->GetClientList())
		{
		if ($pc->GetID() == $signal)
			{
			$kname = $pc->GetName();
			quest::shout("Do not think I shall let you have the eye, $kname!");
			quest::settimer("findplayer", 5);
			}
		}
	quest::settimer("die", 1200);
	}

sub EVENT_TIMER
	{
	if ($timer eq "findplayer")
		{
		foreach $pc ($entity_list->GetClientList())
			{
			if ($pc->GetID() == $k)
				{
				my $pcX = int($pc->GetX());
				my $pcY = int($pc->GetY());
				my $pcZ = int($pc->GetZ());

				my $pc_dist=int($npc->CalculateDistance($pcX, $pcY, $pcZ));

				if ($pc_dist <= 175)
					{
					quest::stoptimer("findplayer");
					my $pr = $pc->GetRace();
					quest::shout("$kname! I can smell your foul stench, $RaceTEXT{$pr}.  Now you will give me the eye!");
					quest::attack($kname);
					}
				}
			}
		}

	if ($timer eq "die")
		{
		quest::stoptimer("die");
		$npc->Depop();
		}
	}
