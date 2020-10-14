#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
}

if($text=~/i am interested/i){
quest::say("I have messages that need to go to Highpass and to Freeport.  Will you [deliver] mail to [Highpass] or [Freeport] for me?");
}

if($text=~/deliver to highpass/i){
quest::say("Take this pouch to Lislia Goldtune in Highpass.  You can find her at the entrance to HighKeep.  I am sure she will compensate you for your troubles.");
quest::summonitem("18152");
}

if($text=~/deliver to Freeport/i){
quest::say("Take this letter to Felisity Starbright in Freeport.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
quest::summonitem("18155");
}

if($text=~/what mail/i){
quest::say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?"); }

}

sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18165 => 1)) {
    quest::say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
    quest::givecash(0,0,quest::ChooseRandom(11,12,13,14,15),0);
    quest::exp(150);
	quest::ding();
	# verified on live
    quest::faction(284,5); #league of antonican bards
    quest::faction(281,1); #knights of truth
    quest::faction(262,1); #guards of qeynos
    quest::faction(304,-1); #ring of scale
    quest::faction(285,-1); #mayong mistmoore
  }

else {
    quest::say("I have no need for that.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SIGNAL
	{
	quest::settimer("depart", 27);
	}

sub EVENT_TIMER
	{
	quest::start(70);
	quest::shout("Another mail carrier!  We will unite this world yet.");
	quest::stoptimer("depart");
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	if ($wp == 13)
		{
		quest::emote("smiles and pecks Korvik on the cheek");
		}
	elsif ($wp == 14)
		{
		quest::stop();
		quest::moveto(135.5, 7.5, 3.75, 131.2,1);
		plugin::DoAnim("salute");
		}
	}

#END of FILE Zone:qeynos
