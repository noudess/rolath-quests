# NPC:an_emaciated_zombie (224005)
# Angelox


sub EVENT_SPAWN 
	{
	#Set a random timer between 5 and 30
	my $StartMove = int(rand(25)) + 5;
	quest::settimer("roam", $StartMove);
	}

sub EVENT_TIMER 
	{
	if ($timer eq "roam") 
		{
		quest::stoptimer("roam");
		plugin::RandomRoam(100,100,75);
		my $NextMove = int(rand(25)) + 5;
		quest::settimer("roam", $NextMove);
		}
	}

sub EVENT_DEATH{
  quest::emote("'s corpse attracts curious flies as it plops wetly to the ground.");
 }

# EOF zone: Gunthak
