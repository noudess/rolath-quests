#npc - a_vicious_skeleton
#zone - Gunthak

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

sub EVENT_DEATH {
  my $random_result = int(rand(100));
  my $a=224338;
  my $b=224008;

  quest::emote("'s corpse shatters into fragments before you.");
  if(($random_result < 20) && defined($qglobals{Alina}) && ($qglobals{Alina} == 2)) {
    #spawn 1_an_erudite_spirit (224338)
    quest::unique_spawn($a,0,0,-670.0,-856.1,19.2,385.2);
    quest::setglobal("Alina",3,3,"F");
  }
  if(($random_result >= 20 && $random_result < 40) && defined($qglobals{EthCleanse}) && ($qglobals{EthCleanse} == 2)) {
    #spawn 2_an_erudite_spirit (224008)
    quest::unique_spawn($b,0,0,-1100.0,-1100.1,19.2,385.2);
    quest::setglobal("EthCleanse",3,3,"F");
  }
}
