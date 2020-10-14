sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. mighty $name! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane. only surviving descendant of the legendary Trondle Ogrebane. slayer of the [Mudtoes]. If you wish to serve the grand city of Kaladim. I urge you to speak with any of the trainers. Good day.");
}
if($text=~/what mudtoes/i){
quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
}
if($text=~/who is trondle/i){
quest::say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe. speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
}
if($text=~/what searching for mudtoes/i){
quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
}
if($text=~/i am searching for the mudtoes/i){
quest::say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name [Mudtoe].  Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
}
if($text=~/who is mudtoe/i){
quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?"); }
}
sub EVENT_ITEM { 
 if($itemcount{18766} == 1){
	quest::say("Greetings, friend, and welcome to Stormguard Hall!  I am Furtog Ogrebane, Captain of the Guard.  We shall train you to be a fearless warrior, who will serve and protect King Kazon well. Here is your tunic. Once you are ready to begin your training please make sure that you see Dirjadak Barbrawler, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
	# Factions verified
	quest::faction(312,100);
	quest::faction(274,15);
	quest::faction(293,15);
	quest::faction(290,25);
	quest::faction(232,-25);
	quest::summonitem(13515);
	quest::ding(10);
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:kaladima  ID:60008 -- Furtog_Ogrebane 

