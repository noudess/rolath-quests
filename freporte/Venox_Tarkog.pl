
sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the shrine of the Dismal Rage.  May [Innoruuk] guide your every move in life.  Here. we will teach you to release your rage unto the world.  My priests are at your disposal.");
		}

	if($text=~/Innoruuk/i)
		{
		quest::say("You do not even know the name of the Prince of Hate!  That is a crime in here.  Our god Innoruuk speaks with Pietro Zarn himself.  It was Innoruuk who told him to create the Dismal Rage.  You should speak with our family.  Perhaps someone will help you better understand our beliefs.");
		}

	if ($text=~/bayle list/i)
		{
		my $dismal = $client->GetModCharacterFactionLevel(271);
		
		if ($dismal < 100)
			{
			plugin::reject_say();
			}
		elsif ($dismal < 250)
			{
			quest::say("You have not earned my rage, that is good.  You have not earned enough trust from the Dismal Rage, that is bad.  Go and find ways to serve us better.");
			}
		else
			{
			quest::say("Oh.  You must be the shadowknight who is to return the list to [Pietro Zarn].  The Bayle List is actually three scrolls with coded words.  Alone they are nonsense.  Together they can be decoded and tell something of value.  Antonius Bayle had them created and gave them to three of his most trusted friends.  Of these, I know Lady Shae, his old love.  Then there is Captain Linarius Grafe, captain of the outer Qeynos Guards.  Lastly, there is Frenway Marthank, Antonius Bayle's oldest friend.  He is a resident of the Jaggedpine.  When you recover the scrolls, you must take them to Rathmana Allin.  He is a master scribe.  He will decode the scrolls for us.  He can be found in the deserts of South Ro.  Now you'd best be off, before some other finds the scrolls.  You must get there first and return the decoded list to Pietro Zarn.");
			}
		}
	}

sub EVENT_ITEM
	{

	# A tattered note ID- 18744
	if($itemcount{18744} == 1)
		{
		quest::say("Here we find a new follower...  Here we find a tunic of the Dismal Rage. Put the two together and let the hate grow. Let it be known from now on that your soul belongs to the Prince of Hate, Innoruuk. It is his power which flows within you. Destroy all those who oppose us. Please introduce your hate to the others in this shrine. Once you are ready to begin your training please make sure that you see Zhem Xecia, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks.");
		quest::exp(100);
		quest::ding();
		quest::summonitem("13561"); #Faded Crimson Tunic
		#Factions verified on live
        quest::faction(271,100); # Dismal Rage
        quest::faction(296,20); # Opal Dark Briar
        quest::faction(281,-15); # Knights of Truth
		}
	}

