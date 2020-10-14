sub EVENT_SAY 
	{
	if($faction > 6)
		{
		quest::say("You have done much to anger the spirits thus you are not accepted by our people.");
		}
	elsif($text=~/hail/i) 
		{
		quest::say("Shalom friend. My mate Kalaaro is the primary blacksmith of our village. I mostly create his tools, do touch ups and refurbishes, and maintain the [kejek forge].");
		}
	elsif($text=~/kejek forge/i) 
		{
		quest::say("Our forge has received the blessings of the Titan Spirits to burn with a supernatural flame! This flame has many beneficial properties but most importantly it can aid in freeing the spirits that have been imprisoned in materials by evil sorcerers.");
		}
	elsif($text=~/purification process/i) 
		{ #Wirewhisker tells us to ask.
		quest::say("The crystalline shadow must be purified in the kejek forge using a special hammer blessed by the Titan Spirits. I will craft a hammer for you to take to the Titans for their blessings if you bring me a Large Brick of High Quality Ore and an Oak Shaft. Once the hammer is blessed you may use it in the kejek forge to purify the crystalline shadow and transfer the spirits contained within it to a Soul Orb that must be taken to our village seer.");
		}
	}

sub EVENT_ITEM 
	{
	if($faction <= 6 && plugin::check_handin(\%itemcount, 10469 => 1, 10456 => 1)) 
		{ #Large Brick of High Quality Ore, Oak Shaft
		quest::emote("takes the supplies and begins to work on the hammer. She works swiftly and efficiently then cools the finished hammer and hands it to you.");
		quest::summonitem(6981); #Kejekan Smithy Hammer
		# Verified on live
		quest::faction(473,2); #Kejek Village
		quest::faction(298,1); #Peace Keepers
		quest::exp(100);
		quest::ding();
		}
	else 
		{
		quest::say("I do not need this.");
		plugin::return_items(\%itemcount);
		}
	}
