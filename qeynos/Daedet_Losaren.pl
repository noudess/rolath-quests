sub EVENT_SAY
	{
    if ($text=~/Hail/i)
        {
        quest::say("Welcome, Karacleri. I am Deadet Losaren, faithful priest of Karana. You appear to be in search of [guidance] or perhaps you are merely a [visitor to the temple of thunder] wishing the blessing of [holy armor]?");
        }
	elsif ($text=~/visitor/)
		{
        quest::say("Then feel free to look around and speak with the priests and paladins of Thunder.  May you find ways to serve the [Rainkeeper].");
		}
	elsif ($text=~/Rainkeeper/)
		{
        quest::say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");
		}
	elsif ($text=~/holy armor/)
		{
        quest::say("Holy Armor? I offer the blessing of Holy Armor to members in good standing of the Knights of Thunder. I must charge ten gold for the service. These [components] are expensive these days! If you were willing to get me some, I could perhaps gift you with something much [better]!");
		}
    elsif ($faction > 5)
        {
        quest::say("While I admite your interest, you need to do more work for the Knights before we can entrust this to you.");
        }
	elsif ($text=~/better/)
		{
        quest::say("I have been playing around a bit with priestly magic.  I can share the secrets I have learned if you bring me those [components].");
		}
	elsif ($text=~/guidance/)
		{
        quest::say("So it is guidance you seek. You will begin on the bottom rung. There is much more to our temple than the bashing of foes. We will need you to [collect donations].");
		}
	elsif ($text=~/donations/)
		{
        quest::say("Then you are a new acolyte. Take this Chest of Faith into Qeynos and Qeynos Hills. Find me six residents willing to donate to the Temple of Thunder.  Combine these donations within the Chest of Faith and return it to me. Do so and I shall reward you with the spell 'Ward Undead.' Now go and spread the Word of Karana.");
		quest::summonitem(17925);
		}
	elsif ($text=~/components/)
		{
        quest::say("Components are required for my daily tribute to the Rainkeeper. It is he whose power flows from my body. I require a faithful acolyte to [gather the required items].");
		}
	elsif ($text=~/gather the required items/)
		{
		if ($faction >= 5)
			{
			quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
			}
		else
			{
			quest::say("Very noble of you. Take this chest. I will require it to be filled with flame beetle eyes. Four normal beetles and four [Kerra Isle beetles].  Combine these items within the chest and return it to me. I shall reward you with the protection of Piety.");
			quest::summonitem(17934);
			}
		}
	elsif ($text=~/Kerra Isle beetles/)
		{
        quest::say("Kerra Isle beetles are normally found in the vicinity of the Kerra catpeople. They can be found in Kerra Ridge, but a closer and perhaps safer location would be on the island between Antonica and Odus. The outcast catpeople of that island are far less dangerous.");
		}
	}

sub EVENT_ITEM 
	{
	if ($gold == 10) 
		{
		quest::say("This should help you remain safe.");
		$npc->CastSpell(11,$userid);
		}

	if (plugin::check_handin(\%itemcount, 13395 => 1))
		{
		# text made up
		quest::say("You have done well.  Karana is pleased.  I cannot say the same for the cat people.  I now bestow upon you the knowledge of Piety. Study the words and soon the power shall be bestowed upon you by the greatness that is Rainkeeper.");
		quest::exp(500);
		quest::ding();
		# Factions verified on live
		quest::faction(280, 10);
		quest::faction(221, -10);
		quest::faction(341, 7);
		quest::faction(262, 7);
		quest::summonitem(26962);
		}

	if (plugin::check_handin(\%itemcount, 13289 => 1))
		{
		quest::say("You have done supremely well, my young acolyte of Thunder.  For your great service, I offer you this token of appreciation.  May it allow you to be of even greater service to the Temple of Thunder.  Now go and cast the storm into the populace of Antonica.");
		quest::exp(500);
		# Factions verified on live
		quest::ding();
		quest::faction(280, 10);
		quest::faction(221, -10);
		quest::faction(341, 7);
		quest::faction(262, 7);
		quest::summonitem(15218);
		}
	}

