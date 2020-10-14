sub EVENT_SPAWN
	{
	quest::set_proximity($x -100, $x + 100, $y - 100, $y + 100);
	}

sub EVENT_ENTER
	{
	$client->PlayMP3("");
	}

sub EVENT_SAY 
	{
	if($text =~ /Hail/i) 
		{
		quest::say("Welcome, friend. Welcome to Surefall Glade. I need not remind you about [poaching], I hope");
		}
	if($text =~ /poaching/) 
		{
		quest::say("Poaching is illegal. We here are the Protectors of the Pine, rangers sworn to protect our land and all its inhabitants. This includes the wildlife. We spend a lot of time hunting poachers. If you want to [join the hunt], just let me know.");
		}
	if($text =~ /master poacher/) 
		{
		quest::say("The master poacher is Talym Shoontar. If you wish to collect the bounty on this vile man, be sure to speak with our leader, Hager Sureshot. No doubt you will find him practicing his skills at the archery range.");
		}
	if($text =~ /join the hunt/) 
		{
		if ($faction >=7)
			{
			quest::say("You dare show your face around here, as bad as your reputation is with the Protectors of Jaggedpine? Begone, enemy of the forest!");
			}
		else
			{
			quest::say("Very good, friend. Be on the lookout for poachers in Surefall Glade or Qeynos Hills, especially in the nearby caves. The poachers are not always human. Often times we find ourselves a Blackburrow gnoll or two. Bring me back their heads. Let's see how they look mounted above the mantle! Be on your way, then.");
			}
		}
	}

sub EVENT_ITEM {
  # Gnoll Head
  if ($faction <= 5 && plugin::check_handin(\%itemcount, 13813 => 1)) {
    quest::say("Fantastic work, $name.  Hager will be pleased. Not only do we rid ourself of a poacher, but we rid the land of these destructive gnolls. Our fletchers crafted this for me... Please take it as thanks.");
    quest::summonitem(8803); #Rough Elm Recurve Bow
    quest::givecash(0, 0, 8, 0);
	# Factions verified on Live.
    quest::faction(272,6); #jaggedpine treefolk
    quest::faction(302,25); #protectors of pine
    quest::faction(306,-3); #Sabertooths of Blackburrow
    quest::faction(262,6); #guards of qeynos
    quest::exp(12829);
    quest::ding();
  }
  elsif ($faction <= 7 && plugin::check_handin(\%itemcount, 13825 => 1)) {
    # Poachers head
    quest::say("Your deeds are great indeed. We shall cleanse our land of these poachers once and for all. A report has surfaced of a [master poacher].' 
Your faction standing with Protectors of Pine got better.");
    quest::givecash(0, 0, 4, 0);
	# Factions  && XP verified on live.
    quest::faction(272,3); #jaggedpine treefolk
    quest::faction(302,15); #protectors of pine
    quest::faction(306,-2); #Sabertooths of Blackburrow
    quest::faction(262,3); #guards of qeynos
    quest::exp(12829);
    quest::ding();
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}

