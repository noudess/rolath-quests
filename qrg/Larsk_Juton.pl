# NPC: Larsk_Juton
# Zone: Qrg
# By Andrew80k

sub EVENT_SAY {
 if($text =~ /Hail/i) {
        quest::say("Hail, Adventurer! I hope you are enjoying your time in Surefall Glade. You must be careful when leaving the Jaggedpine. There have been many report of [Sabertooths] attacking travelers.");
 }
 if($text =~ /Sabertooths/i) {
        quest::say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something. We have even heard rumors of a [pact] between Qeynos merchants and the dogs.");
 }
 if($text =~ /pact/i) {
        quest::say("Sources have come forward to tell of a pact between a merchant of Qeynos and the Sabertooths. It all has to do with blades and brew. We hear that a meeting will occur soon, somewhere in the Qeynos Hills at night. Do not fear, we shall find a brave ranger to [halt this meeting].");
 }
 if ($text =~ /Blackburrow Stout/i){
        quest::say("Blackburrow Stout is a grog created by the gnolls of Blackburrow. It is no surprise that the grog is illegal in Qeynos. Even so, I hear there are some barkeeps who dare sell it.");
 }
 if($faction > 4) {
        quest::say("Well, I, and the Protectors of Jaggedpine, have noticed your helpful deeds so far...  just keep up the good work, and you will soon be trusted enough to handle such important matters.");
 }
 elsif($text =~ /halt this meeting/i) {
        quest::say("Very good of you. Stop this meeting by killing the gnoll in Qeynos Hills. We hear that he shall be there in the late evening, and that his name is Furgoot or Furgy, something like that. Find him and kill him. I want his head. And if you should find any evidence of who the merchant is, be sure to hand it over to me.");
 }
 elsif ($text =~ /assist in the extermination of the gnoll brewers/i){
        quest::say("Within the bowels of Blackburrow, our scouts have reported seeing the gnoll brewers.  You will go and brave the lair of the dogs and slay these brewers in order to cease the flow of [Blackburrow Stout].  During your mission, should you find any Blackburrow casks, you must return them to me.  When you have recovered three of these casks, I shall award you the [Cloak of Jaggedpine].");
 }
 elsif ($text =~ /Cloak of Jaggedpine/i) {
       quest::say("The Cloak of Jaggedpine was made for those loyal to the ways of the forest.  It is enchanted to increase one\'s dexterity.  It is awarded to those who have aided in our cause to rid the land of those vile dogs called the Sabertooths.  Should you earn one, be sure to hold onto it - you never know when we may alter the enchantments placed upon the cloak.");
 }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  if($faction < 5 && plugin::check_handin(\%itemcount,13309=>1)) {
     quest::say("So, I see you rid the hills of the beast. Good work! I have a reward for you. I hope it will be usefull. I am afraid this gnoll\'s death will not halt the alliance between the two. I shall require your services to [assist in the extermination of the gnoll brewers].");
	 # Factions Verified on Live
     quest::faction(302,25);
     quest::faction(272,6);
     quest::faction(306,-3);
     quest::faction(262,1);
     quest::givecash(int(rand(10)),int(rand(10)),int(rand(5)),0);
     quest::exp(1000);
	 $roll=plugin::RandomRange(1,100);
	 if ($roll < 61)
		{
		$reward=plugin::RandomRange(2137, 2148);
		}
	 
		{
		$reward=quest::ChooseRandom(59971, 15051, 15239, 15240, 7691, 15242, 15026, 15200);
		}
	 quest::summonitem($reward);
	 quest::ding();

  } 

	if ($faction < 5 && plugin::check_handin(\%itemcount,17970=>3)) {
     quest::say("You have done well and served the people of the forest through this brave and noble deed. I now bestow upon you our friendship and reward you with the [Cloak of Jaggedpine]. Wear it as a mark of your allegiance.");
     quest::summonitem(2915);
     quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),0);
	 # Factions Verified on Live
     quest::faction(302,20);
     quest::faction(272,5);
     quest::faction(306,-3);
     quest::faction(262,5);
     quest::exp(1000);
	quest::ding();
	}

  if ($faction < 5 && plugin::check_handin(\%itemcount,18811=>1)) {
     quest::say("Fine Work, $name. Hmmm. It seems this needs taking care of. Take this note to the Captain of the City Guard in Qeynos. His name is Captain Tillin. He will have to attend to this matter. Also.. Let me see the gnoll\'s head. I must know you killed him. Be safe, my friend. I am sure that whoever this McNeal is, he was simply a lackey. Whoever he works for is most likely going to be looking for you. Watch your back in Qeynos.");
     quest::summonitem(18815);
	 # Factions verified on live
     quest::faction(302,5);
     quest::faction(272,1);
     quest::faction(306,-1);
     quest::faction(262,1);
     quest::exp(1000);
     quest::givecash(int(rand(10)),int(rand(10)),int(rand(5)),0);
	 quest::ding();
  }    

  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}
