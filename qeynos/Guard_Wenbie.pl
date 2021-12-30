#############
#NPC: Guard_Wenbie
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Lieutenant_Arathur
#Items Involved: Muffin ID:13014
#zone: qeynos

my $mute=0;

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello, $name. What brings you to Qeynos? Must be the mighty fine muffins over at [Voleen's Bakery]. I just love those muffins!");
  }
  elsif($text=~/voleen's bakery/i) {
    quest::say("Oh, it will be easier for us both if I just show you where it is. Follow me. But be quick about it, because I have to get back to my patrol.");
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
  # Muffin ID:13014
  my $muffins = 0;
  if (plugin::check_handin(\%itemcount,13014=>4)) {
    $muffins=4;
  } 
  elsif (plugin::check_handin(\%itemcount,13014=>3)) {
    $muffins=3;
  }
  elsif (plugin::check_handin(\%itemcount,13014=>2)) {
    $muffins=2;
  }
  elsif (plugin::check_handin(\%itemcount,13014=>1)) {
    $muffins=1;
  }
  elsif ($muffins>=1) {
    for ($i=0; $i<$muffins; $i++) {
      quest::say("Oh, thank you so much. I do get hungry on patrol. Here, please take this reward for your kindness.");
      # Verified on live
      quest::faction(262,1);  #Guards of Qeynos
      quest::faction(219,1);    # Antonius Bayle
      quest::faction(289,1);  # Merchants of Qeynos
      quest::faction(230,-1);  # Corrupt Qeynos Guards
      quest::faction(223,-1); # Circle of the unseen hand
      quest::ding();
      quest::exp(10);
      quest::givecash(0,0,0,4);
    }
  }
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
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
#END of FILE zone:qeynos ID:1147 -- Guard_Wenbie.pl

