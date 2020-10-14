
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Who are you that you dare to speak with the great Pietro Zarn!! I see nothing more than a whelp in front of me. Innoruuk himself speaks with me. And now you expect me to waste words on you, a common. Begone $name . You have nothing to peak my interest, only my rage.");
		}
	}

sub EVENT_ITEM
	{
	my $dismal = $client->GetModCharacterFactionLevel(271);

	# A tattered note ID- 18743
	if(plugin::check_handin(\%itemcount, 18743 => 1))
		{
		quest::say("A new member to carry the rage of Innoruuk into the city and beyond. How wonderful. I must admit that you do not appear to carry the rage within. Hopefully you shall color the battlefields with the blood of many knights from the Hall of Truth. Here. Wear this tunic with pride. Ha ha ha!! We shall see young one. We shall see.");
		quest::exp("100");
		quest::ding();
		# Faded Crimson Tunic ID- 13561
		quest::summonitem("13561");
		#Factions verified on Live
		# Opal Dark Briar 
		quest::faction(296,"20");
		# Dismal Rage 
		quest::faction(271,"100");
		# Knights of Truth 
		quest::faction(281,"-15");
		}

	# Translated Parchment ID- 18961
	elsif($dismal > 249 && plugin::check_handin(\%itemcount, 18961 => 1))
		{
		quest::ding();
		quest::say("You have proven yourself truly evil.  Your hatred shall shine from this day forth.  Innoruuk commands that I reward you with this.  It is called Rage and it serves the powers of hate.  Use it to smite the forces of good.  Hail Innoruuk!");
		# Faction verified on live
		quest::exp(40000);
		quest::faction(296,20);
		quest::faction(271,100);
		quest::faction(281,-15);
		quest::summonitem("12153");

		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:freporte  ID:10102 -- Pietro_Zarn
