sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("It is good to see new blood in our halls. I am the leader of this house. If you are looking for guidance, seek out the masters within. I rarely appoint tasks to new recruits, unless I need to retrieve the [foreign take].");
  }
  if($text=~/take/i) {
    quest::say("We have rogues operating in a few great cities. We send young rogues to retrieve the monthly take. We have been awaiting the Freeport delivery. The last youth I sent must have been killed along the way. I will need a new runner to [retrieve the chest].");
  }
  if($text=~/chest/i) {
    quest::say("You seem able enough. Here. Take this note to Freeport. Go through the Commonlands and be careful not to encounter any Freeport guards. There is a network of aqueducts accessible through hidden passages. Search the outside walls of Freeport. Take the note to Giz. She will meet you at night, on an island in the harbor. Good luck.");
    quest::summonitem(18844);
  }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18752 => 1)) 
		{
		quest::say("You wanna be part of the Ebon Mask, huh? Well, you'll need to impress me. Here's your guild tunic. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks. Go find Hekzin, he'll have some work for you, I'm sure. Don't screw up, kid. That pretty face of yours would make a fine trophy, got it? Now, quit breathin' my air, and go get some work done.");
		quest::summonitem(13581);
		quest::faction(244,100);
		quest::faction(262,-5);
		quest::faction(320,-25);
		quest::faction(263,-10);
		quest::faction(329,-25);
		quest::exp(100);
		quest::ding();
		}
	elsif (plugin::check_handin(\%itemcount, 13891 => 1))
		{
		quest::say("The Hall thanks you. You have performed supremely. We are glad to have you with us. I offer you this, loot from former takes. I hope you can use it.");
		# Faction verified on live
		quest::faction(244,10);
		quest::faction(262,-1);
		quest::faction(320,-2);
		quest::faction(263,-1);
		quest::faction(329,-2);
		quest::exp(200);
		quest::ding();
		my $reward = quest::ChooseRandom(1050, 1051, 7007, 7008);
		quest::summonitem($reward);
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:neriakc  ID:42074 -- Eolorn_J`Axx
