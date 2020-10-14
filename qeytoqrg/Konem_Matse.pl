############################################
# ZONE: Qeynos Hills (qeytoqrg)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: September 14, 2007
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Konem_Matse
# ID: 4072
# TYPE: Monk
# RACE: Human
# LEVEL: 28
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Message to Konem ID-18921
# Grathin's Invoice ID-18922
#
# *** QUESTS INVOLVED IN ***
#
# Note for Konem
#
# *** QUESTS AVAILABLE TO ***
#
# Konem - Anyone not KOS
#
############################################

sub EVENT_SAY
	{
	if ($faction <= 3) 
		{ # Need dubious or better (not sure this is correct).
		if($text=~/Hail/i) 
			{
		 	quest::say("Hello, you look to be from the Order.  Did [Seta] send you?");
			}
		elsif($text=~/Seta/i)
			{
		 	quest::say("It's about time.  We need help out here.  Those [dirty guards] have become a problem.");
			}
		elsif($text=~/dirty guards/i)
			{
		 	quest::say("Yeah, Sironan and Talroen. Someone needs to put an end to their illegal activities.");
			}
		}
	elsif ($text=~/Hail/i)
		{
		quest::say("Ah, greetings, young $name, how are you on this fine day?  Perfect day for a nice stroll through the hills, if I do say so myself.");
		}
		
	}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 2) {
	$npc->SetAppearance(1);
	}
  if($wp == 3) {
    $npc->SetAppearance(0);
	}
  if($wp == 5) {
    $npc->SetAppearance(1);
  }
}


sub EVENT_ITEM 
	{
	# Note from Phin_Esrinap, Message to Konem ID-18921
	if(plugin::check_handin(\%itemcount, 18921 => 1)) 
		{
		quest::ding();
		quest::say("Oh I see.. Phin's always after me about something.  I mean, it's not my fault the order hasn't come in yet.  Hey, since I'm so busy right now, why don't you be a friend and take this back to Phin for me, huh?");
		# Grathin's Invoice ID-18922
		quest::summonitem("18922");
		#Faction verified on live Nov 7, 2015
		# Silent Fist Clan faction
		quest::faction(309,"5");
		# Guards of Qeynos faction
		quest::faction(262,"1");
		# Ashen Order faction
		quest::faction(361,"1");
		quest::exp("200");
		quest::ding();
		}
	# Give back incorrect items
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:qeytoqrg  NPC:Konem_Matse 
