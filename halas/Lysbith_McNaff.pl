sub EVENT_SAY {
$won=$client->GetModCharacterFactionLevel(320);
if($text=~/Hail/i){
quest::say("Hail! Ye've come to [serve Halas]. have ye not? We're the Wolves o' the North and it is our task to defend our city from harm.");
}
elsif($text=~/ice goblins/i){
quest::say("The ice goblins have plagued our community fer some time now.  At times. they even manage to get inside our walls. Fer the most part. they prey on travelers who pass through Everfrost Peaks. Since they're a weak race. we employ our youngest warriors to [protect the pass].");
}
elsif($text=~/seax/i){
quest::say("The Seax is a Northman warrior's piercing weapon.  Dinnae confuse this with another [weapon].  The local rogues have also learned to master the Seax.  I'll only offer it to those who battle the [orc troopers].");
}
elsif($text=~/weapon/i){
quest::say("The langseax is a one-handed slashing weapon crafted fer a warrior.  Tis the brother to the [Seax]");
}
elsif($text=~/gnoll bounty/i){
quest::say("I've placed a bounty on the gnolls o'Blackburrow.  Their whelps have invaded our land and we must carry the fight into their dens.  Join the fight and return three gnoll fangs as proof of yer victory in Blackburrow.  Do so, and earn the respect o' the Wolves o' the North.");
}
elsif ($faction > 4) #Verified
	{
	quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do to earn our trust.  Perhaps ye should inquire o' the [gnoll bounty].");
	}
elsif($text=~/protect the pass/i){
quest::say("Then travel to the Everfrost Peaks and take this pack with you.  I want you to return this pack to me when it is filled with the beaded ice necklaces of the Ice Goblins.  When it is filled, combine the items and return it to me and I shall decide if you deserve a reward for your deed.");
quest::summonitem(17944);
}
elsif($text=~/serve halas/i){
quest::say("Halas is surrounded by barren arctic tundra. We've many foes. Among them are the [orc troopers]. [ice goblins] and the ever-present polar bears.");
}
elsif ($won < 200) #Verified to need more than min amiable
	{
	quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do to earn our trust.  Perhaps ye should inquire o' the [gnoll bounty].");
	}
elsif($text=~/orc troopers/i){
quest::say("So. Ye think yerself strong enough to battle the snow orc troopers?  I pray to the Tribunal that ye are.  If ye can return to me four wrath orc wristbands  from the troopers' bodies. I'll reward ye with the [Seax].");
}
 }

sub EVENT_ITEM {
  if  ($won >= 200 && plugin::check_handin(\%itemcount, 12223 => 4)){
   quest::say("Well done! You've proved yerself worthy o' this!");
   quest::summonitem(7322);
   quest::exp(300);
   quest::ding();
   # Wolves of the North
   quest::faction(320,"20");
   # Shamen of Justice
   quest::faction(327,"4");
   # Merchants of Halas
   quest::faction(328,"5");
   # Steel Warriors
   quest::faction(311,"1");
 }
  if  ($faction < 5 && plugin::check_handin(\%itemcount, 13898 => 1)){
   quest::say("Ye've done well, me young $class .  We've gathered these to add to yer provisions.  While in the Everfrost Peaks, be on the watch fer any gnolls ye may find.  I declare there to be a [gnoll bounty].");
   quest::exp(950);
   quest::ding();
   quest::givecash("0","0","4","0");
   # Reward: Choose random minor item
   $reward = quest::ChooseRandom(13003,13005,13007,13002,13006);
   quest::summonitem($reward);
   # Wolves of the North Verified
   quest::faction(320,"10");
   # Shamen of Justice Verified
   quest::faction(327,"2");
   # Merchants of Halas Verified
   quest::faction(328,"2");
   # Steel Warriors Verified
   quest::faction(311,"1");
 }

 # Gnoll Bounty - Return 3 Gnoll Fangs
   if  (plugin::check_handin(\%itemcount, 13915 => 3)){
   quest::say("Fine work, fine work!  The gnoll threat must be extinguished before it can ever fully grow.  Ye've done yer part to aid our cause.  Please allow me to repay ye with a few provisions and a wee bit o' coin.  Then, continue with yer good deeds.");
   quest::exp(3800);
   quest::ding();
   quest::givecash("0","0","5","0");
   # Reward: Choose random minor item
   $reward = quest::ChooseRandom(13003,13005,13007,13002,13006);
   quest::summonitem($reward);
   # Wolves of the North - Verified on ZAM
   quest::faction(320,"15");
   # Shamen of Justice - Verified on ZAM
   quest::faction(327,"3");
   # Merchants of Halas - Verified on ZAM
   quest::faction(328,"3");
   # Steel Warriors - Verified on ZAM
   quest::faction(311,"1");
 }

 else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:halas  ID:29056 -- Lysbith_McNaff - Updated by Blaz
