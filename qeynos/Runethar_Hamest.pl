sub EVENT_SIGNAL 
	{
    quest::say("Hire one soon, Wolten. We need to get in touch with Drosco!");
	}

sub EVENT_SAY 
	{ 

	my $guidance = quest::saylink("guidance", 1);
	my $follower = quest::saylink("follower", 1);
	my $assist = quest::saylink("assist", 1);
	my $retrieve = quest::saylink("retrieve", 1);

	if ($text=~/Drosco/i)
		{
		quest::say("Have you knowledge of Sir Drosco?  He is a Knight of Thunder and reports to Sir Wolten.  He has been missing for quite some time.  I believe Sir Wolten has begun to search for him.");
		}

	if ($text=~/Hail/i)
		{
		$client->Message(12,"Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you need $guidance? or are you already a $follower of Karana?");
		}

	if($text=~/guidance/i)
		{
		$client->Message(12,"You need to seek out Miltiades Tal-Azroth $name. He is right here in the Paladin Guild.");
		}

	if($text=~/follower/i)
		{
		$client->Message(12,"Excellent news $name. So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also wish to $assist Lord Bayle");
		}

	if($text=~/assist/i)
		{
		$client->Message(12,"Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of the Qeynos Guard and bring him fangs from the gnolls of Blackburrow. I believe he is at the arena. If you have earned your Thunder Staff $name and are well seasoned, I urge you to $retrieve the Bayle list");
		}

	if($text=~/retrieve/i)
		{
		$knightsofthunder=$client->GetModCharacterFactionLevel(280);
		if ($knightsofthunder < 999)
			{
			$client->Message(13,"Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause");
			}
		else
			{
			$client->Message(14,"The Temple of Thunder was asked by Antonius Bayle to retrieve a list. He does not trust his own militia of late. He asked me to send a knight to the Jaggedpine to find a man named Frenway Marthank. When you find him, you are to tell him that [Toe needs the Bayle List]. Return the Bayle List and your Thunder Staff to me and I shall provide a fine reward. Be aware that the shadowknights of Bertoxxulous are also after the list. Be careful!");
			}
		}
	}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 18710 => 1))
		{
		quest::say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder!  Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper. Once you are ready to begin your hunting training please see Miltiades Tal`Azroth, he will assist you in some tasks for your early adventures.");
		quest::summonitem("13505");
		# Facxtions verified on live.
		quest::faction(280,100);
		quest::faction(221,-100);
		quest::faction(341,75);
		quest::faction(262,75);
		quest::exp("100");
		quest::ding();
		quest::signal(1043,1);
		} 
	elsif (plugin::check_handin(\%itemcount, 18809 => 1) &&
		   plugin::check_handin(\%itemcount, 6357 => 1))
		{
		$knightsofthunder=$client->GetModCharacterFactionLevel(280);
		if ($knightsofthunder < 999)
			{
			quest::say("When you have proven yourself more, return again and I shall present you with your new weapon.");
			quest::summonitem(18809);
			quest::summonitem(6357);
			}
		else
			{
			quest::say("Antonius Bayle will be pleased. The Temple is also pleased. Here is the enchanted staff we call Bonethunder. We need more disciples like you! Go forth to tell the world of the Rainkeeper.");
			# Original text was:  quest::say("Antonius Bayle will be pleased. The Temple is also pleased. Here is the enchanted staff we call Bonethunder. Should you find the enchantment gone, just ask Kasine to [enchant Bonethunder]. We need more disciples like you! Go forth to tell the world of the Rainkeeper.");
			#Factions set to opposite of live, we think the live version is backwards.
			quest::faction(280,50);
			quest::faction(221,-50);
			quest::faction(341,37);
			quest::faction(262,37);
			quest::summonitem(6358);
			quest::exp(10000);
			quest::ding();
			}
		}

	  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	  plugin::return_items(\%itemcount);
	}

#END of FILE Zone:qeynos  ID:1136 -- Runethar_Hamest 

