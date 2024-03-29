sub EVENT_SAY
	{
	$mg628=$client->GetModCharacterFactionLevel(322);
	if ($faction > 5)
		{
		quest::say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		}
	elsif ($text =~ /Hail/i)
		{
		quest::say("How is life treating you, bud?  What are you doing around the mines?  Either you are a [member of 628] or you are lost.  If you are lost, I can't help you.  I ain't no guide.");
		}
	elsif ($faction > 4)
		{
		quest::say("Don't take this personally,  but I can't quite trust you with such matters.  Maybe a few less Butcherblock bandits would prove your worth.");
		}
	elsif ($text =~ /member of 628/i)
		{
		quest::say("It's my duty to assign [guild tasks] to all new members of Mining Guild 628.");
		}
	elsif ($text =~ /guild tasks/i)
		{
		quest::say("I see you are interested in helping out. Good! For starters, go into the surrounding territory of Kaladim and destroy all the goblins. We hear they sometimes carry necklaces of ornate design. 628 wants these Runnyeye warbeads. You bring me no fewer than four and I will pay you and maybe, just maybe, I may have an extra piercing weapon lying around which has your name on it.");
		}
	elsif ($text =~ /small job/i)
		{
		if ($class eq 'Rogue')
			{
			quest::say("Consider this both a favor and a test. I couldn't rest at night knowing that someone carrying around my secrets was anything less than proficient at smithin'. On top of that, relics crafted by the infamous $name will make some fine conversation pieces I think. Ha ha. If that isn't clear enough for ye, I'd like ye to demonstrate your skill with forge and a hammer. Here's a list of items that ye can make for me. Seal them up in this satchel when you're done and bring them back to me, lad.");
			quest::summonitem(8775);
			quest::summonitem(52331);
			}
		else
			{
			quest::emote("doesn't appear to want to speak with you.");
			}
		}
	elsif ($mg628 < 250)
		{
		quest::say("Don't take this personally,  but I can't quite trust you with such matters.  Maybe a few less Butcherblock bandits would prove your worth.");
		}
	elsif ($text =~ /earn a parrying pick/i)
		{
		quest::say("So you want to earn a parrying pick? Consider it an honor that I am even speaking of this with you. The guild had these picks made just for us. It is a magic item used to fend off attacks. Before you can have one, you will have to do me a [great favor]");
		}
	elsif ($text =~ /great favor/i)
		{
		quest::say("Mater has asked me to exterminate the dwarven family of Dunfire. They were once members of our guild. They left and now use their talents to aid the Butcherblock bandits. We will not allow them to speak of the skills we taught them. Go and rip out their tongues. Return the tongues of Crytil, Rondo, Keldyn and Barma Dunfire and the parrying pick is yours");
		}
	}

sub EVENT_ITEM
	{
	$mg628=$client->GetModCharacterFactionLevel(322);
	if ($faction < 5 && plugin::check_handin( \%itemcount, 13931 => 4 ))
		{
		quest::say("Good work. We shall add these to the stash. Here is your reward, as promised. Be happy with it and continue your work. Maybe soon you shall be able to [earn a parrying pick].");
		# Factions verified via ZAM
		quest::faction( 379, -1 );
		quest::faction( 223, -1 );
		quest::faction( 241, 1 );
		quest::faction( 322, 10 );
		quest::faction( 244, -1 );
		quest::exp(5000);
		quest::ding();
		quest::summonitem( quest::ChooseRandom( 7007, 7008, 7009, 7010 ) );
		}
	elsif ($mg628 > 249 && (plugin::takeItems(12170 => 1, 12172 => 1, 12174 => 1, 12178 => 1))) {
		quest::say("Excellent work!! You are quite an asset to this mining guild. Please accept this Parrying Pick 628 for your great service. If you truly wish to serve our guild. Go and speak with Mater. Tell him you are ready to earn Mining Pick 628.");
		#:: Reward a 12166 - Parrying Pick 628
		quest::summonitem(12166);
		#:: Ding!
		quest::ding();
		#:: Reward a moderate amount of experience
		quest::exp(5000);
		#:: Set factions
		quest::faction(322, 50);	#:: + Miners Guild 628
		quest::faction(223, -2);	#:: - Circle Of Unseen Hands
		quest::faction(379, -2);	#:: - Butcherblock Bandits
		quest::faction(241, 2);	#:: + Deeppockets
		quest::faction(244, -7);	#:: - Ebon Mask
	}
	elsif (plugin::check_handin( \%itemcount, 9813 => 1 ))
		{	#rogue 1.5 handin
		quest::say("Fine job, $name. I knew ye had the burning fire of a smith ragin' inside ye. These little relics are going on my mantle, or I may sell em. Not sure yet.' He sets the items aside, 'Now, sit fer a spell and allow me to tell ye what you need to know. It should go without sayin', $name, that a fine blade is crafted with the best metals possible. Any fool knows that. What ye don't know is that the lightest and sturdiest stuff to be found is an alloy called Velixite. With a few pounds of raw Velixite you could truly forge a blade to be feared. Give me jes' a moment while I take down some notes in your journal, $name. There ye are, all done!");
		quest::emote("You have coerced Diggins into revealing his secret. ");
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins( \%itemcount, $class, 'Rogue' );
	plugin::return_items( \%itemcount );
	}

#END of FILE Zone:kaladimb  ID:67017 -- Diggins
