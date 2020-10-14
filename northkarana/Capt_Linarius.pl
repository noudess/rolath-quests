#############
#Quest Name: Corrupt Guards
#Author: Blaz
#NPCs Involved: 2
#Items Involved: 1
#################

sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}

sub EVENT_SAY {
 if($text =~ /Hail/i) {
  quest::say("Hail, traveler! You are free to rest within this keep or within any of my towers along the roads to Qeynos. My guards shall keep watch over you. While you tread upon the roads, be warned that there are [local dangers] as well as rumors of [corrupt guards].");
 }
  if($text =~ /corrupt guards/i) {
  quest::say("I have heard rumors of dissension among my guards. I will reward any fine resident for the death of these traitorous guards. If you find you must kill one, bring his guard bracelet back to me. I cannot allow such men among my guards. Be sure they are corrupt, or I shall have your head as well.");
 }
  if($text =~ /local dangers/i) {
  quest::say("My guards report daily to me of dangers in the plains. Lately, they've been telling me of rumors of [Lord Grimrot].");
 }
  if($text =~ /Lord Grimrot/i) {
  quest::say("My guards have heard rumors of this Lord Grimrot. It is said that he is a powerful shadowknight who is raising an army of undead. Such things should be reported to the Temle of Life. Journey to Qeynos and speak with Camlend Serbold. Tell him of Lord Grimrot.");
 }
}

sub EVENT_ITEM 
	{
	# Corrupt Guards Bracelet (Guard Bracelet - 13303)
	if ($faction < 7)
		{
		if  (plugin::check_handin(\%itemcount, 13303 => 1))
			{
			quest::say("What a pity. Such a promising soldier. I thank you for ridding us of this corruption and offer you this as a reward. It is nothing more than junk which littered the roadways of the Plains of Karana. I hope you can find a use for it.");
			quest::exp(2000);
			quest::ding();
			#Bunker Battle Blade , Random shield or random bronze weapon
			$random = quest::ChooseRandom(5369,5026,5027,5028,5029,5030,5031,5032,5033,5034,5035,5036,5037,6019,6021,6022,6023,6024,6025,7012,7013,7014,7015,7016,30981, 9001, 9002, 9003, 9004, 9006, 9007, 9008, 9009, 9010, 9011, 9012, 9013, 9014, 9015, 9016, 9017, 9018, 9019, 9021, 9022);
			quest::summonitem($random);
			# 8 gold, 19 copper
			quest::givecash("19","0","8","0");
			# Faction verified on live
			quest::faction(262,"10"); # Guards of Qeynos
			quest::faction(219,"1"); # Antonius Bayle 
			quest::faction(230,"-1"); # Corrupt Qeynos Guards 
			quest::faction(223,"-2"); # Circle Of Unseen Hands 
			quest::faction(291,"1"); # Merchants of Qeynos 
			}
		}
	# Loyal Guards Bracelet (Guard Bracelet - 13304)
	elsif  (plugin::check_handin(\%itemcount, 13304 => 1))
		{
		#Text made up...
		quest::say("You fool!!! You have killed a fine and outstanding guard.  You shall pay dearly for this!");
		quest::attack($name);
		}
	else
		{
		#do all other handins first with plugin
		plugin::return_items(\%itemcount);
		}

	}
