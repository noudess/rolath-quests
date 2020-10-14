#my $eventclient=0;
#my $saveX = 0;
#my $saveY = 0;
#my $leader = 0;
#
##sub EVENT_SAY
##	{
##	if ($client->AccountID() == $eventclient)
##		{
##		quest::say("$name arrives?  We not wait much longer and we eat instead.");
##		quest::say("Lead to the forest.  We will guard.");
##		$leader = $userid;
##		quest::setglobal("KorvikGuards", 1, 7, "D10");
##		quest::follow($userid);
##		}
##	}
#
#sub EVENT_SIGNAL
#	{
#	# We got signaled with an accountid.  This means one of the allies in
#	# Paineel has zoned in.  It is time for the march.
#	if ($signal < 0 && $eventclient == -$signal)
#		{
#		quest::crosszonesignalnpcbynpctypeid(75005, $eventclient);
#		quest::say("Time to go to war boys!");
#		quest::stoptimer("followme");
#		quest::sfollow();
#		$eventclient = 0;
#		quest::repopzone();
#		}
#	elsif (!defined $qglobals{KorvikGuards})
#		{
#		if ($signal > 0)
#			{
#			quest::say("He has come.");
#			quest::moveto(-350, 332, -73, 393,1);
#			$eventclient = $signal;
#			my $c = $entity_list->GetClientByAccID($signal);
#			my $clean = $npc->GetCleanName();
#			$c->SendColoredText(13, "The time has come to show our strength.  Come and we shall follow you to your city. - $clean");
#			quest::settimer("spawn", 15);
#			}
#		}
#	}
#
#sub EVENT_TIMER
#	{
#	if ($timer eq "spawn")
#		{
#		plugin::SpawnMixedFormation($mob,15, 3, 4, 5, 2, 101007, 101129, 101006, 101052);
#		quest::stoptimer("spawn");
#		quest::settimer("followme", 1);
#		plugin::MM("The time has come to show our strength.  Come and we shall follow you to your city. - $clean");
#		}
#	else
#		{
#		my $curx;
#		my $cury;
#		$curx = $npc->GetX();
#		$cury = $npc->GetY();
#
#		if (abs($curx - $saveX) > .1  || abs($cury - $saveY) > .1)
#			{
#			$saveX=$curx;
#			$saveY=$cury;
#			plugin::FollowInFormation(101007, $npc,5);
#			plugin::FollowInFormation(101129, $npc,5);
#			plugin::FollowInFormation(101006, $npc,5);
#			plugin::FollowInFormation(101052, $npc,5);
#			}
#		}
#	}
