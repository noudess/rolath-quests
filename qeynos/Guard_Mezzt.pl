#############
#NPC: Guard_Mezzt
#Quest Name:
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Lieutenant_Arathur
#Items Involved: 
#zone: qeynos

my $mute=0;

sub EVENT_SAY {
  if($text=~/Hail/i){
    my $random_result = int(rand(125));
      my $fullname = plugin::fixNPCName();
      my $mname = substr($fullname, 6);
      if($random_result<=25){
        quest::say("Hail! my name is $mname. If you had any smarts at all you would be careful who you talk to around here.");
      }elsif($random_result<=50){
        quest::say("<Burp!> Heh? $name? Nevah hoid o'ya. Beat it. I got woik ta do.");
      }elsif($random_result<=75){
        quest::say("Yeah, my name is $mname.. Listen up! Kane says I don't have to talk to none of you peons if I don't feel like it. I DON'T feel like it. So unless you want trouble, get a move on!");
      }elsif($random_result<=100){
        quest::say("Heh. Me name's $mname. Guardin' is what I do. But I likes when I gets to bash faces, too.");
      }elsif($random_result<=125){
        quest::say("Oh good. Another fine example of why I am growing to hate this city. If Commander Bayle were running things here, we would not have to put up with weaklings like you walking our streets.");
      }
  quest::signalwith(1006, 2, 0);
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
#END of FILE Zone:qeynos  ID:1001 -- Guard_Mezzt

