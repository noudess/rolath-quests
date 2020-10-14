# Illegible Scrolls

sub EVENT_SAY 
	{ 

	if($text=~/Hail/i)
		{
		quest::say("Greetings. friend!!  I am Lozani. Scribe Supreme of the Eldritch Collective.  I have been sent forth from the great Library of Mechanimagica in the city of Ak'Anon. to study the arcane knowledge of man and beast alike.  I have studied many languages and spells. from Crushbone to Kerra Ridge.  I have found most languages hard to decipher.  As of this date. I have learned to read only the script of the [orc oracles].  Oh well. I am on a five decade mission.  Better luck next language."); 
		}

	if($text=~/orc oracles/i)
		{
		quest::say("Oh!! Heard of the orc oracles have you? A ghastly bunch they are!! Argh! The numerous days I spent interrogating those beasts with their foul breath. It was as if rats had gone and died in their mouths. I wished I could read minds after those days. TWENTY WEEKS of that rat-carcass breath and all I have learned is the ability to decipher [oracle scrolls] and [apprentice cantrips]. What a mess that was! I'm beginning to think I should have become a Gemchopper.");
		}

	if($text=~/scrolls/i)
		{
		quest::say("Orc oracle scrolls? Mere shaman spells are they. I know how to decipher those illegible scrolls. I can do so, but it will cost you. Nothing is for free in this world, y'know? You give me one of those illegible scrolls and four gold coins.");
		}

	if($text=~/cantrips/i)
		{
		quest::say("Orc apprentice cantrips. Child's play they are. Very difficult to decipher, mostly due to the orc sweat smearing the writing. I fill in the blanks with a second orc cantrip and my universe of knowledge, so you never know what spell is going to be scribed! Could be magic, could be wizardry, could be necromancy, golly!! Sometimes I even end up with a recipe!! If you want me to try to decipher one just hand me two illegible cantrips. No coinage necessary!! They are mostly apprentice spells. Nothing much.");
		}
	}

sub EVENT_ITEM 
	{ 

	if (plugin::check_handin(\%itemcount, 13225 => 1))  # Illegible Scroll
		{
		quest::say("Hmmm...  Aha!  Well, I think this is it.  A fine spell.  I hope you need it because you are not getting your gold back.");
		quest::summonitem(quest::ChooseRandom(7621,15079,15277,15275)); #low level spell
		}

	elsif (plugin::check_handin(\%itemcount, 13845 => 2))  # Illegible Cantrip
		{
		quest::say("And the winning spell is...  Here, you do the honors.");
		quest::summonitem(quest::ChooseRandom(23516, 15291, 15080, 15338));  #low level spell
		}

	else 
		{
	quest::say("I have no need for that.");
	plugin::return_items(\%itemcount);
		}

	}

#END of FILE Zone:highkeep  ID:6029 -- Lozani 

