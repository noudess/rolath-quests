sub EVENT_SAY 
	{
	# verified on live
	if ($faction >= 7)
		{
		quest::say("You have done much to anger the spirits thus you are not accepted by our people.");
		}
	elsif($text =~ /Hail/i) 
		{
		quest::say("Shalom, $name! I welcome you to our humble village in these [trying times].");
		}
	elsif($text =~ /trying times/i) 
		{
		quest::say("There are many threats currently facing this village. The kobolds of Clan Kolbok are becoming bolder in pushing the boundaries of the territory in which they usually hunt. A few of the kobolds now hunt recklessly, killing for pleasure instead of sustenance. [Rognarog] the Infuriated is the most murderous of such kobolds. Then there are the [heretics] that have been invading both Clan Kolbok and Kejek territories alike, practicing their dark sorceries as a show of devotion to their faceless god.");
		}
	elsif($text =~ /heretics that have softened/i)
		{
		quest::say("Where did you hear of this.....  Yes, some members of the heretic faction have softened.  Two priestesses, both from the pits of Paineel, have aided with the establishment of a link to the Erudin city.  Both have some to the aid of Postmaster Korvik.  Wickai and Hagatha be their named I think.  Perrrrhaps even they begin to see their own folly.");
		}
	elsif($text =~ /heretics/i) 
		{
		quest::say("The heretics have not only corrupted their own spirits but they defile the spirits of the dead with their evil sorceries. Fill this satchel with the heads of invading heretics and I shall reward you for your allegiance to Kejek.");
		quest::summonitem(17883);
		}
	elsif($text =~ /rognarog/i) 
		{
		quest::say("Rognarog the Infuriated was once a mighty warrior for Clan Kolbok until his devotion to the kobold god Rolfron Zek devoured his spirit and drove him mad with anguish. Now he wanders the mountains and valleys of Stonebrunt shedding the blood of whatever creatures cross his path. Should you face Rognarog and release him from this life I will reward you for his severed head.");
		}
	}

sub EVENT_ITEM {
  if($faction <= 6 && $itemcount{6969} == 1) {
    quest::say("Less heretics to defile the lands and spirits. You have the gratitude of Kejek for your assistance in repelling the heretic threat.");
	# Validated on live
	quest::faction(473,8);
	quest::faction(298,1);
	quest::givecash(8,0,7,3);

	# Make chance of the sash 8% + (faction/10) with a max of 50.
	my $reward=6955; # Default to the lesser reward

	# Give a bonus to sash for better factions
	my $bonus = (5 - $faction) * 10;
	if ($bonus < 0)
		{
		$bonus = 0;
		}

	my $sashchance = 8 + $bonus;
	
	my $roll=plugin::RandomRange(1,100);
	if ($roll <= $sashchance)
		{
		$reward=6953;
		}
	
    quest::summonitem($reward);
	quest::exp(10000);
	quest::ding();
  }
  if($faction <= 6 && $itemcount{6968} == 1) {
    quest::say("By slaying Rognarog you have spared the lives of those who would have crossed his path. I thank you $name for your assistance, the spirits have noticed your actions and are pleased.");
    quest::summonitem(quest::ChooseRandom(6982,6983,6984));
	quest::exp(1000);
	quest::ding();
	# Validated on live
	quest::faction(473,3);
	quest::faction(298,1);
  }
}

sub EVENT_SIGNAL
	{
	quest::emote("bows to the venerable elder of the Kejek");
	quest::say("Very well sirrrr.  Many have come to do the work of expulsing the evil heretics, and to errrrrradicate the threat of the rabid dogs from the warrrens and those that have taken up homes in the snow. There have even been [heretics that have softened] and lended aid to our cause of alignment with the Erudin city.");
	}
