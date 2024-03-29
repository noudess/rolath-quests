my $REJECTED = 1;
my $ACCEPTED = 0;

sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Hail, $name! This is the Deepwater Temple. Here you shall find the wisdom and courage of Prexus, the Ocean Lord. I am glad to see you have an interest. Forgive me if I cut our conversation short, but I have many [Deepwater tasks] to complete.");
		}

	if ($text =~ /deepwater tasks/i)
		{
		if (faction_reject() == $ACCEPTED)
			{
			quest::say("We here at the Deepwater Temple must tend to the [Peacekeeper battlestaff] and the [Deepwater harpoon] as well as other duties such as [ocean protection]. There is always something we must do.");
			}
		}

	# He will answer at indiff..
	if ($text =~ /deepwater harpoon/i)
		{
		quest::say("We do not award the Deepwater harpoon to just any paladin.  Nobility is all well and good, but you must still prove yourself.  We have heard rumors of a very distressing matter.  Perhaps it is your calling.  Are you ready to [prove allegiance to Erudin] and earn the Deepwater harpoon?");
		}

	if ($text =~ /prove allegiance to Erudin/i)
		{
		if (faction_reject() == $ACCEPTED)
			{
			quest::say("Yes, you are ready. We have heard rumors of a great bridge which will connect Antonica with Odus!! This must not happen! We must shield ourselves from the savage and evil ways of the other races. They say that a list exists. A list of three grand architects who wish to see this bridge erected. You will venture to Qeynos and find the list, then exterminate these three men. Return the list along with their heads and the Deepwater Harpoon is yours. Go!!");
			}
		}

	if ($text =~ /peacekeeper battlestaff/i)
		{
		if (faction_reject() == $ACCEPTED)
			{
			quest::say("Every sentinel in Erudin carries a High Guard battlestaff.  The creation of these weapons is the duty of the Deepwater Temple and the Temple of Divine Light.  Our portion of the task is to send young members to [collect the Pearls of Odus].  These are imbedded into the staff and used to store mystical power.");
			}
		}

	if ($text =~ /ocean protection/i)
		{
		if (faction_reject() == $ACCEPTED)
			{
			quest::say("In the name of Prexus, we are sworn to protect all ocean creatures.  We have heard reports of a shark carrying a deadly malady.  We believe she is pregnant.  If she delivers her young to the ocean, it will endanger all other creatures.  We need to find a young paladin to [hunt the diseased shark].");
			}
		}

	if ($text =~ /hunt the diseased shark/i)
		{
		if (faction_reject() == $ACCEPTED)
			{
			quest::say("Ah, yes!  Take this bag with you.  When you have collected the remains of the diseased shark and no fewer than three of her young in it, combine them in it and return it to me.  Then, you shall get your reward.");
			quest::summonitem(17938);
			}
		}

	if ($text =~ /collect the pearls of odus/i)
		{
		if (faction_reject() == $ACCEPTED)
			{
			quest::say("Then venture to the harbor of Erudin. There, you shall dive into the shark-infested water and search for the Pearls of Odus. They lie upon the grounds of our waters.  Fill the bag I have given you, combine it, and return it to me.  Good luck.");
			quest::summonitem(17939);
			}
		}

	if ($text =~ /harpoon no more/i)
		{
		quest::say("The Deepwater harpoon's distribution has been restricted by order of the High Council. The last one awarded was to an outsider, the brave and noble paladin, Sentry Xyrin. She hailed from the Temple of Marr.");
		}

	if ($text =~ /honored member/i)
		{
		if ($client->GetModCharacterFactionLevel(242) > 24)
			{
			quest::say("Yes.  The light of righteousness shines from within you."); }
		else
			{
			quest::say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
			}
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 13876 => 1))
		{
		quest::say("Very good, my dear young follower of Prexus. You will learn that swimming is a strong skill among the Deepwater Knights. Keep this up and you may wield a Deepwater harpoon soon enough. For now, you shall wear this barnacle breastplate. It is strong enough to aid a young knight in his quest for perfection.");
		quest::summonitem(12194);

		# Faction verified on live
		quest::faction(242, 20);    #Deepwater Knights
		quest::faction(266, 3);     #High Council of Erudin
		quest::faction(265, -3);    #Heretics
		quest::exp(100);
		quest::ding();
		}

	#Pearls of Odus Handin: full bag of pearls
	if (plugin::check_handin(\%itemcount, 13879 => 1))
		{
		quest::say("Fine work, Deepwater Knight. You have proven yourself an excellent addition to our ranks. These shall be used to create more Peacekeeper staffs. Oh yes, I almost forgot your reward. Here you are. Now, go, and serve Prexus.");
		quest::summonitem(quest::ChooseRandom(2104, 2106, 2108, 2111, 2112));

		# Faction verified on live
		quest::faction(242, 5);
		quest::faction(266, 1);
		quest::faction(265, -1);
		quest::exp(200);    # about 1 yellow at level 1 per Live
		quest::ding();
		}

	#Bridge Quest Handin: 3 heads + sealed list
	if (
		plugin::check_handin(\%itemcount, 18835 => 1, 13838 => 1, 13839 => 1, 13840 => 1))
		{
		quest::say("It is done!! I pray to Prexus that the knowledge of the bridge's design has departed from this world with the passing of these intelligent men. A pity they had to die. As for you, the other states may not tolerate your presence any longer, but you have proven that allegiance to Erudin is paramount among all Erudites. I am afraid the [harpoon is no more]!! I bestow upon you Deep Six, my personal cutlass!! May you wield it in the name of Erudin.");
		quest::summonitem(5377);

		# Faction verified on zam
		quest::faction(242, 25);
		quest::faction(266, 3);
		quest::faction(265, -3);
		quest::exp(100);
		quest::ding();
		}

	#Paladin Newbie Note
	if (plugin::check_handin(\%itemcount, 18725 => 1))
		{
		quest::say("Greetings and welcome to the Deepwater Knights.  Here is your guild tunic.  Wear it with pride, and Prexus will keep a watchful eye on you.  Go find sister Laoni, she will help you get started with your studies.  Kordian Keshalian can also help you to make some armor for yourself.");
		quest::summonitem(13544);
		quest::faction(242, 100);
		quest::faction(266, 15);
		quest::faction(265, 15);
		quest::exp(100);
		quest::ding();
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}

# This guy only rejects some based on faction.  Oddly he wont give the list of tasks,
# but he will respond to some of the more direct questions.

sub faction_reject()
	{
	if ($faction > 5)
		{
		quest::say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		return $REJECTED;
		}
	elsif ($faction == 5)
		{
		quest::say("There is no reason to dislike you, but we of the Deepwater Knights must see more done for our cause before we truly accept you.");
		return $REJECTED;
		}

	return $ACCEPTED;
	}

#END of FILE Zone:erudnext  ID:24065 -- Weligon_Steelherder
