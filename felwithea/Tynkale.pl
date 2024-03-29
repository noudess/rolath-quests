sub EVENT_SAY 
	{ 
	if($text=~/Hail/i) 
		{
		quest::say("Hail noble, $name!  Can you be of [service to the Clerics of Tunare] or are you not from our order?");
		}
	if ($text=~/honored member/i)
		{
		if ($client->GetModCharacterFactionLevel(226) > 24)
			{
			quest::say("Yes.  The light of righteousness shines from within you.");
			}
		else
			{
			quest::say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
			}
		}
	if((($text=~/service to the clerics of tunare/i) || ($text=~/new to felwithe/i) || ($text=~/i am a veteran of the good fight/i)) && ($faction > 4)) 
		{
		quest::say("When you have furthered your service to the Paladins of Tunare. we shall make conversation.");
		}
	if(($text=~/service to the clerics of tunare/i) && ($faction < 5)) 
		{
		quest::say("That is good. Prove yourself, then.  Are you [new to Felwithe] or have I been conversing with a [veteran of the good fight]?");
		}
	if(($text=~/new to felwithe/i) && ($faction < 5)) 
		{
		quest::say("Then stand at attention when I speak.  I want you to venture to Kelethin and seek out Tandan Nybright.  He is an old member of ours.  He had some hardships and he fell from Tunare's grace, yet he is still a member of our family.  He will be the one who reeks of elven wine.  Greet him by name.  We are worried for him.");
		}
	if(($text=~/veteran of the good fight/i) && ($faction < 5)) 
		{
		quest::say("I command you to venture to Innothule and seek a beast called Jojongua, a name penned by the trolls.  It is said to be ten feet tall and nothing but fury.  Some say it resembles a kobold, but how can that be?  You bring this beast's hide to me and then I will believe you to be a veteran.  Beware!  Innothule is a very dangerous place even for a noble veteran."); 
		}
	if($text=~/trades/i)
	{
	quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
	quest::summonitem(51121);
	}
	if($text=~/second book/i)
		{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
		}
	}

sub EVENT_ITEM 
	{ 
	if(plugin::check_handin(\%itemcount, 18781 => 1))
		{
		quest::say("Greetings. young paladin!  I am Master Tynkale of the Clerics of Tunare.  Here. we shall teach and train you in the skills needed to defeat our evil and diseased enemies.  Take this, our guild tunic - it will help protect you.  Once you are ready to begin your training please make sure that you see Seria Woodwind, she can assist you in experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#Verified on ZAM
		quest::summonitem("13591"); #Used Gold Tunic
		quest::faction(226, 100);
		quest::faction(279, 100);
		quest::exp(100); 
		quest::ding();
		}
	if ($faction < 5)
		{
		if (plugin::check_handin(\%itemcount, 	13351 => 1)) 
			{
			quest::say("So you have proven yourself to be a great slayer of beasts.Now it is time to prove yourself to be an asset to the Crown. You are to meet a man named Tolon Nurbyte.He will be at the local inn. Go to him and repeat the phrase, 'The glory of the Mother shines bright.' I can say no more. Oh.. and here. This may help you on your upcoming adventure.");
			quest::ding();
			quest::faction(226, 20);
			quest::faction(279, 20);
			quest::exp(150); 
			quest::ding();
			}
		else 
			{
			#do all other handins first with plugin, then let it do disciplines
			plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
			plugin::return_items(\%itemcount);
			}
		}	
	}

#END of FILE Zone:felwithea  ID:61018 -- Tynkale 

