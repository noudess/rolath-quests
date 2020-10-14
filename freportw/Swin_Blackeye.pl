############################################
# ZONE: West Freeport (freportw)
# LAST EDIT DATE: November 17,2011
# DEVELOPER: MWMDRAGON
# REVISED BY:  robregen
############################################

my $orig; 

sub EVENT_SPAWN
	{
	$orig = $h;
	quest::say("$orig");
	}

sub EVENT_SAY { 
	if($text=~/Hail/i) {
		quest::say("Greetings, friend! Welcome to the Hog Caller's Inn! Don't let the name fool you.  We are the finest establishment in Freeport. Please feel free to relax in our lounge. There is usually music to soothe your blues away.");
	}
	if($text=~/need the mail for room two/i) {
		quest::say("Hmmph !! If you're here to get the mail for room two you first need to show me the room key.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12147 => 1)) { # Hog Key # 2 ID-12147
		quest::say("Here you go then.");
		quest::ding();
		quest::summonitem(18814);# A Sealed Letter ID-18814 filename "NERtoShintl"
		quest::exp(100);
		quest::faction(229,1);# Faction Coalition of Trade Folk ID-47
		quest::faction(281,1);# Faction Knights of Truth ID-184
		quest::faction(291,1);# Faction Merchants of Qeynos ID-217
		quest::faction(336,1);# Faction Coalition of TradeFolk III ID-369
	}
	else {
		plugin::return_items(\%itemcount);
	}
}

sub EVENT_SIGNAL 
	{
	if ($signal == 1)
		{
		quest::say("Hmmph !! If you're here to get the mail for room two, you'll need to show me the room key.");
		}
	elsif ($signal == 2)
		{
		my $facemob = $entity_list->GetMobByNpcTypeID(9144);
		$npc->FaceTarget($facemob);
		quest::say("Very well.");
		quest::settimer("head", 5);
		}
	}

sub EVENT_TIMER
	{
	quest::say("$orig");
	quest::stoptimer("head");
	quest::moveto($x,$y,$z,$orig, 0);
	}

#END of FILE Zone:freportw  ID:9103 -- Swin_Blackeye
