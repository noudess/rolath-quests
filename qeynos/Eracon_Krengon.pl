 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Eracon Krengon
## ID: 1086
## ZONE: qeynos
##
############################################

sub EVENT_SAY
	{
	plugin::Autovtell("greet");
#	my @neighbors = (1107,1108);
#	my $nearest = plugin::FindNearest(\@neighbors, 200);
#	quest::say($nearest->GetCleanName());
	}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 12620 => 1))
		{
		quest::say("Tis good that Jinkus has sent you with this poster. There has been talk of a Northman fugitive in the city. Take this list back to Jinkus so that our brethren in Halas are aware of the many criminals who have fled Qeynos and are still at large.");
		quest::summonitem(12622); #list of qeynos most wanted
		quest::exp(87);
		quest::ding();
		}
  else { 
    quest::say("Why do ye give me these items?"); 
    plugin::return_items(\%itemcount); 
  } 
}
