# Quest for Cindl in halas - Cindls two tasks 
# NPC ID 29052 -- Cindl 

sub EVENT_SAY { 
  if($text=~/hail/i){ 
    quest::say("Welcome to my humble shop. I offer fine items fashioned from the skins of the beasts of Everfrost. Leather is my specialty and I can always use [extra hides]."); 
  }
  if($text=~/extra hides/i) { 
    quest::say("I will offer any hunter some used Tattered Armor for every Polar Bear Skin. I am sure that even you can wrestle the skins from the back of a polar bear cub.");
  }
  if($text=~/second job/i) { 
    quest::say("I have seen the warriors bringing in items called Wrath Orc Wristbands. Apparently they find them upon the lifeless bodies of the snow orc troopers. They are made from a skin I have yet to find. I will gladly reward you with either a Rawhide Tunic or Leggings or even perhaps Leather Gloves. All I ask for are Two Wrath Orc Wristbands.");
  }
  if($text=~/mammoth hide parchment/i) {
    quest::say("Jinkus must've sent ye fer some more mammoth hide parchment fer his posters. Here, take it, free o' charge, as a donation to the church and to the will o' the Tribunal as well.");
    quest::summonitem(12621); #Mammoth Hide Parchment
  }
} 

sub EVENT_ITEM 
	{
	if ($itemcount{13761} > 0) 
		{
		plugin::mass_handin(13761, 1, \&POLAR_REWARD);
		}
	elsif($itemcount{12223} > 0)
		{
		plugin::mass_handin(12223, 2, \&WRATH_REWARD);
		}
	else 
		{ 
		plugin::return_items(\%itemcount); 
		quest::say("This is not what I asked for!"); # not the right dialogue 
		} 
	}

sub WRATH_REWARD
	{
	quest::say("Fine work hunter!  As your reward please accept this item which I have fashioned for you."); 
	quest::summonitem(quest::ChooseRandom(2034, 2171, 2164)); 
	quest::exp(150); 
	quest::ding();
	#Verified on live
	quest::faction(328, 10); #Merchants of Halas 
	quest::faction(320, 7); #Wolves of the North
	quest::faction(327, 7); #Shamen of Justice
	}

sub POLAR_REWARD
	{
	quest::say("This is much appreciated.  Please accept this used armor in return and also a gold piece for yer troubles.  You have done well! I may have a [second job] fer ye, if ye like?"); 
	quest::summonitem(quest::ChooseRandom(2125, 2126, 2127, 2128, 2129, 2130, 2131, 2132, 2133, 2134, 2135, 2136)); 
	quest::givecash(0,0,1,0); 
	quest::exp(150); 
	quest::ding();
	#Verified on live
	quest::faction(328, 5); #Merchants of Halas 
	quest::faction(320, 3); #Wolves of the North
	quest::faction(327, 3); #Shamen of Justice
	}

#END of FILE Zone:halas  ID:29052 -- Cindl
