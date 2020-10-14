sub EVENT_SPAWN {
  my $RandInt = 0;   #Random integer variable
  my $LoopCount = 0; #Loop integer variable
}

sub EVENT_SAY {
  if($text=~/open a portal/i) {
	quest::movepc(111, 200, 120, -2.25);	
  }
  elsif($faction > 6) {
	quest::say("You have done much to anger the spirits thus you are not accepted by our people.");
  }
  elsif($text=~/hail/i) {
    quest::say("Welcome to Kejek friend. I am the seer of this village for I have been gifted by the spirits with an affinity for their realm. The barrier between the spirit and physical realms is thin in these lands. The heretics know this and must be prevented from committing [atrocities] similar to those that have been committed in the past.");
  }
  elsif($text=~/atrocities/i) {
    quest::say("Long ago when our noble ancestors the Vah Shir were destroyed by an explosion that devastated the warring Heretic and Erudin armies an evil creature by the name of Tserrina Syl'Tor was attracted to the sudden abundance of new spirits in these lands. Tserrina was capable of capturing these spirits before they were able to cross over beyond the mortal realm and through her dark magic transformed them into a [crystalline shadow] substance.");
  }
  elsif($text=~/crystalline shadow/i) {
    quest::say("The crystalline shadow substance was used as building blocks for Tserrina's [tower] on an Island near the frozen lands to the south as well as fashioned into armor and weapons for her mindless servants. Emylie Steelclaws has developed a means to purify the armor and weapons using the special properties of our Kejek forge and a smithy hammer blessed by the Titan Spirits. The purifying process transfers the imprisoned spirits into [soul orbs]. Ask Emylie about the purification process.");
  }
  elsif($text=~/soul orbs/i) {
    quest::say("I have perfected a ritual that will free the imprisoned spirits within the soul orbs. I simply require some kejek [spirit powder] to scrawl the proper sigils and a soul orb upon which to perform the ceremony. My apprentice will perform the ceremony on fading soul orbs. Simply bring him a fading soul orb and some kejek spirit powder.");
  }
  elsif($text=~/spirit powder/i) {
    quest::say("The spirit power of which I speak is composed of ground spiritling stones. I will grind some powder for you if you would bring me a Valley Spiritling Stone, a Jungle Spiritling Stone, and a Mountain Spiritling Stone. Collecting the stones does not truly harm the spiritlings for when slain in this realm their essence simply disperses until it eventually reforms into a new spiritling.");
  }
  elsif($text=~/tower/i) {
	quest::say("Her temple is a dangerous place, but it is the only place to acquire the shadow substance in its natural form, or bound to magical weapons and armor.  Mrowro and I have found a way to reach this tower but we have not the cat power available to go and retrieve some.  If you, or you and yourrr friends wish to go there, ask me to [open a portal] and send you there.");
  }
}

sub EVENT_ITEM 
	{
	if($faction <= 6 && plugin::check_handin(\%itemcount, 6970 => 1, 6971 => 1, 6972 => 1)) 
		{ #Valley Spiritling Stone, Jungle Spiritling Stone, Mountain Spiritling Stone
		quest::emote("grinds the spiritling stones in a mortar and pestle with foreign runes scratched into the ceramic. 'This powder will assist in matters concerning the contacting or freeing of spirits.'");
		$RandInt = int(rand(3)) + 1;
		for ($LoopCount = 1; $LoopCount <= $RandInt; $LoopCount++) {
		quest::summonitem(6980); #Kejek Spirit Powder x 1 to 3 (Random)
		# Faction verified on live.
		}
		quest::faction(473,1); #Kejek Village
		quest::faction(298,1); #Peace Keepers
		quest::exp(5000);
		quest::ding();
		}
	elsif($faction <= 6 && plugin::check_handin(\%itemcount, 6980 => 1, 6977 => 1)) 
		{ #Kejek Spirit Powder, Soul Orb

		# Count how many souls freed..
		$varname="FreedSouls$charid";
		if (!defined($qglobals{$varname}))
			{
			$spiritcount=1;
			}
		else
			{
			$spiritcount=$qglobals{$varname} + 1;
			}
		quest::setglobal($varname,$spiritcount,1,"F");

		quest::emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
		quest::summonitem(2576); #Shattered Soul Orb

		# See if the Elder Vah`Shir took notice.
		$chance = 5 * $spiritcount;
		$chance = $chance >= 20 ? 20 : $chance;

		# For now, disable Elder
		$chance=0;
		$roll=plugin::RandomRange(0,100);	

		quest::say("chance: $chance, roll: $roll");
		if ($roll > $chance)
			{
			quest::spawn2(quest::ChooseRandom(100225, 100226),328,0,$x+5, $y+5, $z+5, $h); #Apparitions
			}
		else
			{
			# Spawn special Elder Vah Shir
			quest::spawn2(110231,328,0,$x+5, $y+5, $z+5, $h);
			}

		# Faction verified on live.
		quest::faction(473,1); #Kejek Village
		quest::faction(298,1); #Peace Keepers
		quest::exp(50000);
		quest::ding();
		}
	else {
	quest::say("I do not need this.");
	plugin::return_items(\%itemcount);
	}
	}

sub EVENT_SIGNAL
	{
	quest::say("Why should tonight be any different than the earrly days?  I'll make sure we have an ample supply.");
	if (plugin::zoneClientCount() > 0)
		{
		quest::signal(100130, 2000);
		}
	}
