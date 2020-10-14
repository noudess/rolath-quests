sub EVENT_SPAWN 
	{
    quest::set_proximity($x-50,$x+50,$y-50,$y+50);
    }

sub EVENT_ENTER
    {
    quest::settarget("entity",$mobid);
    plugin::SetAnim("sit");
    }

sub EVENT_EXIT
    {
    quest::settarget("entity",$mobid);
    plugin::SetAnim("sit");
    }

sub EVENT_SAY 
	{
	quest::settarget("entity",$mobid);
	plugin::SetAnim("stand");
	my $circle = $client->GetModCharacterFactionLevel(223);
	if ($circle < -250) # Circle of Unseen Hands - made sure db correct
		{
		quest::say("You had best be on your way before you end up as a feast for the worms!");
		}
	elsif($text =~ /Hail, Collier/i) 
		{
		quest::say("Make it a habit of walking into peoples rooms now do ya? Well seeing as I'm here on business I may have a [proposition] for you.");
		}
	elsif ($ulevel <= 19) # Verified 14 too low, 20 works
		{
		quest::say("You are far too inexperienced to assist me in my endeavors.");
		}
	elsif($text =~ /What is the proposition/i) 
		{
		quest::say("I'm in the employment of an alchemist that desires some rare venom from this region of Norrath. I will reward you with a special weapon treatment if you can return to me with a venomous spikefish poison sac, an ancient poison sac, an ancient snake fang, and the blood of a necromancer.");
		}
	elsif($text =~ /What special weapon treatment/i) 
		{
		quest::say("My employer has uncovered the secrets of the Bloodclaw and can reproduce the weapon treatment used in the forging of the legendary Stiletto of the Bloodclaw.");
		}
	}

sub EVENT_ITEM 
	{
	my $circle = $client->GetModCharacterFactionLevel(223);
	if ($circle > -251 && plugin::check_handin(\%itemcount, 31828 => 1, 22570 => 1, 6949 => 1, 6950 => 1)) 
		{
		quest::say("There is the weapon treatment I promised you. Use it with any standard forged weapon. Choose which weapon you prefer carefully as there is only enough of the substance for a single treatment. Combine it and your weapon of choice in a forge.");
		quest::say("Ahh!  I have enough here to also give you a second treatment that can be used directly with any weapon you like, as long as you are skilled enough to master the combination.  Take this as well.");
		quest::summonitem(22571);
		quest::summonitem(232508);
		quest::exp(500);
		quest::faction(223, 2);
		quest::faction(291, -1);
		quest::faction(230, 1);
		quest::faction(262, -1);
		quest::faction(273, 1);
		quest::ding();
		}
	plugin::return_items(\%itemcount);
	}
