#Te-Anara.pl
#Updated by Kilelen for Gharin's Note (Good)

sub EVENT_SPAWN
	{
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	}

sub EVENT_ENTER
	{
	plugin::playmp3once("");
	}

sub EVENT_EXIT
	{
	plugin::playmp3once("otr.mp3");
	}

sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Welcome, friend. I hope your stay in Surefall Glade will enlighten your soul. While you are here we ask you to abide by the [laws of the Jaggedpine].");
		}

	elsif ($text =~ /laws of the jaggedpine/i)
		{
		quest::say("We ask that you do not start campfires on our land. Do not litter our land with any items. Do not chop down our pines or tread upon any foliage. Please do not take more than a bellyful of fish. Do not harm any other wildlife and stay clear of [the great bear]!");
		}

	elsif ($text =~ /great bear/i)
		{
		quest::say("The great bear I speak of is Mammoth. He has lived among us for over a century. Tunare has truly blessed us with his presence. As long as Mammoth lives, so too does Surefall Glade. We are currently worried. Corun has reported that there is something [wrong with Mammoth].");
		}

	elsif ($text =~ /wrong with Mammoth/i)
		{
		quest::say("Mammoth is not eating. We believe something is lodged in his throat. We require a young druid to [fetch a special potion].");
		}

	elsif ($text =~ /fetch a special potion/i)
		{
		quest::say("Go to the gnome city of Ak'Anon on the continent of Faydwer. With their great zoo, you will find a gnome named Kimble Nogflop. Give him this flask of nitrates and he shall hand you a special potion which will force Mammoth to cough up whatever may be stuck inside his throat. Be sure to show me what you find inside his throat upon your return.");
		quest::summonitem(13945);
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 18809 => 1))
		{
		quest::say("Oh my, this must belong to Antonius Bayle! I shall see that he receives it. You have done a great service to Qeynos and Surefall Glade. I rewards you with this. May it be of good use in your future deeds.");
		quest::summonitem(15222);
		quest::faction(272, 10);
		quest::faction(302, 10);
		quest::faction(343, 10);
		quest::faction(262, 10);
		quest::faction(324, -30);
		quest::exp(100);
		quest::ding();
		}

	elsif (plugin::check_handin(\%itemcount, 18713 => 1))
		{
		quest::say("Well met, friend of the forest. You will find power and enlightenment among these woods. Here, wear this tunic and represent the Jaggedpine with pride. Gerael Woodone will help train you and teach you the duties of Jaggedpine Treefolk. The forests, being the soul and heart of Norrath, depend on you and your actions from this day forth.");
		quest::summonitem("13510");

		#faction verified on live
		quest::faction(272, 100);    #Jaggedpine Treefolk
		quest::faction(302, 25);     #Protectors of the Pine
		quest::faction(343, 15);     #QRG Protected Animals
		quest::faction(262, 15);     #Guards of Qeynos
		quest::faction(324, -25);    #Unkempt Druids
		quest::exp("100");
		quest::ding();
		}

	elsif (plugin::check_handin(\%itemcount, 18807 => 1))
		{                            #Sealed Letter [Note To Jaggedpine - real]
		quest::say("Aye! This is good news. We shall try to supply Qeynos with a limited number of acres to begin their lumberyard. Here, my good messenger. A token to share in the good news.");

		# Faction and XP verified on live.
		quest::faction(272, 30);    #Jaggedpine Treefolk
		quest::faction(302, 7);     #Protectors of Pine
		quest::faction(343, 4);     #QRG Protected Animals
		quest::faction(324, -7);    #Unkempt Druids
		quest::faction(262, 4);     #Guards of Qeynos
		quest::exp(1007);
		quest::ding();
		quest::givecash(0, 8, 2, 0);    #8sp, 2gp
		}
	elsif (plugin::check_handin(\%itemcount, 18806 => 1))
		{                               # fake note
		quest::say("This is dreadful news. We have been nothing but kind neighbors to Qeynos. Now Antonius Bayle wishes to abuse our friendship. This will not sit well with the others. Begone, messenger!");
		quest::faction(272, -30);    #Jaggedpine Treefolk
		quest::faction(302, -7);     #Protectors of Pine
		quest::faction(343, -4);     #QRG Protected Animals
		quest::faction(324, 7);      #Unkempt Druids
		quest::faction(262, -4);     #Guards of Qeynos
		quest::exp(100);
		quest::ding();
		}
	else
		{
		plugin::return_items(\%itemcount);
		}
	}

# Quest by mystic414
#End of File zone:qrg ID: 3035 -- Te-Anara.pl
