#############
#NPC: Guard_Jerith
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Lieutenant_Arathur
#Items Involved: 
#zone: qeynos

my $mute=0;

sub EVENT_SAY {
  if($text=~/Hail/i){
  quest::say("Um, sorry, $name. I don't wish to be rude, but I must not be distracted while I am at my post. Commander Bayle trusted me with this watch and I will not let him down.");
  }
}

sub EVENT_COMBAT
	{
	if ($combat_state == 1)
		{
		my $cur_target = $npc->GetHateTop();
		if($cur_target) 
			{
			my $target_name = $cur_target->GetCleanName();
			quest::say("Time to die $target_name!");
			}
		}
	else
		{
		quest::say("How I loath to soil my blade with such filth.");
		}
	}

sub EVENT_ITEM {
  quest::emote("I have no need for this $name, you can have it back.");
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  #response to Lieutenant_Arathur
  if ($signal == 1) {
    # Lieutenant Arathur ID:1085
    my $npc_checkID = 1085;
    my $mob_check = $entity_list->GetMobByNpcTypeID($npc_checkID);
    my $mobX = int($mob_check->GetX());
    my $mobY = int($mob_check->GetY());
    my $mobZ = int($mob_check->GetZ());

    # get distance from npc
    my $npc_dist = int($npc->CalculateDistance($mobX, $mobY, $mobZ));
	
    #Checking if within range of Lieutenant_Arathur to respond.
    if ($mute != 1 && $npc_dist <= 60) {
		quest::settimer("unmute", 10);
		$mute=1;
      quest::say("Yes, sir!");
    }
  }
}

sub EVENT_TIMER
	{
	#Can start replying again.
	$mute=0;
	quest::stoptimer("unmute");
	}
#END of FILE Zone:qeynos  ID:1002 -- Guard_Jerith
 
