
sub EVENT_SAY 
	{ 
	if($text=~/Hail/i) 
		{
		quest::say("Greetings, $name!  To enter these grounds is to proclaim your faith in the Truthbringer.  In this city you shall find no greater allies than the Knights of Truth.  We urge all knights and clerics who oppose the hand of the Freeport Militia to [join the crusade].");
		}
	if($text=~/join the crusade/i) 
		{
		quest::say("Then take arms against the Freeport Militia!  They serve no one save Sir Lucan, the fallen knight.  From this day forth, I put a bounty upon all militia members.  For every bashed milita helm, a reward!!  If you are not prepared to battle the militia just yet, you may [assist in other areas].");
		}
	if($text=~/assist in other areas/i) 
		{
		quest::say("I have need of one such as you.  I have been awaiting a message. I will need a young acolyte to [retrieve the message] for me or there are also some [fishing duties] I wish to delegate.");
		}
	if($text=~/retrieve the message/i) 
		{
		if ($faction > 5)
			{
			quest::say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
			}
		else
			{
			quest::say("Thank you, $name. Venture to the Commonlands.  There, by a lake, will be a courier from the great city of Qeynos.  Tell him you are from the Hall of Truth.  He will have a message for you to deliver to Eestyana Naestra.");
			}
		}
	if($text=~/fishing duties/i) 
		{
		quest::say("I have been creating shields for the crusade.  Right now I work on the sharkskin shield for the knights.  I require two shark skins. Unfortunately, most sharks are too dangerous for the squires.  I have begun using [reef shark] skins.  Will you hunt the [reef sharks]?");
		}
	if($text=~/reef shark/i)
		{
		quest::say("Reef sharks are the smallest and most docile of the sharks.  Even a young acolyte can slay one.  I have heard there are some in the Ocean of Tears.  I need a young acolyte to [hunt] reef sharks.  I require their skins.");
		quest::summonitem(17937);
		}
	if($text=~/hunt/i)
		{
		quest::say("I thought I spied the shoulders of a swimmer upon you! Take this large sack. Travel to the Ocean of Tears. There are numerous reef sharks there. I shall require no fewer than two shark skins. When the full sack is combined and returned to me, I shall reward you."); 
		}
	if ($text=~/honored member/i)
		{
		if ($client->GetModCharacterFactionLevel(281) > 24)
			{
			quest::say("Yes.  The light of righteousness shines from within you.");
			}
		else
			{
			quest::say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
			}
		}
	}

sub EVENT_ITEM 
	{ 
	if(plugin::check_handin(\%itemcount, 13921 => 1)) 
		{
		quest::say("Fantastic work, my young knight.  Here is a small token of the my appreciation.  I would offer you a sharkskin shield, but I have made only a few and the paladins are testing them.");
		quest::givecash("0","0","0","3");
		#Factions verified on ZAM
		quest::faction(281,25); #knights of truth
		quest::faction(362,5); #priests of marr
		quest::faction(311,2); #steel warriors
		quest::faction(271,-3); #dismal rage
		quest::faction(330,-3); #freeport militia
		quest::exp(500);
		quest::ding();
		quest::summonitem(quest::ChooseRandom(7684, 59971, 15208, 15219, 15233));
		}

	if (plugin::check_handin(\%itemcount, 13873 =>1 )) 
		{
		quest::say("Fantastic work, my young knight. Here is a small token of my appreciation -- a fine Sharkskin Shield. It should serve you well in battle.");
		quest::summonitem(13868);
		#Verified no faction adjustments for completing the quest.
		quest::exp(500);
		quest::ding();
		}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:freportn  ID:8073 -- Theron_Rolius 

