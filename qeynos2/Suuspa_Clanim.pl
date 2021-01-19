sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Welcome to the Temple of Life, $name.  It is here that you may pay tribute to the [ Healer]. Does not your heart beat with the sound of life? It is He who makes it so. Do not let the hand of [Bertoxxulous] and his [new disease] lay upon your soul or, like so many, you shall meet your fate at the end of my sword!");
  }
  if($text=~/Bloodsabers/i){
  quest::say("If I knew where they were, there would be no reason to employ your talents.  They would be extinct!");
  }
  if($text=~/Prime Healer/i){
  quest::say("He is the sustainer of life.  The hand which supports us when we begin to slow down.  Rodcet Nife, the Prime Healer!  He is why we exist.");
  }
  if($text=~/Bertoxxulous/i){
  quest::say("The one who spawned all the diseases and imperfections of the lands of Norrath.  Do not seek his wisdom, for these is none.  Do not become part of his [new disease].");
  }
  if($text=~/new disease/i){
  quest::say("The new disease I speak of is called the [Bloodsabers]. They are the loyal followers of Bertoxxulous and as such have been condemned by our temple. Do you wish to [join the fight]?");
  }
  if($text=~/join the fight/i)
	{
	if ($faction <= 5)
		{
		quest::say("Then seek out those who worship the Plaguebringer. End their threat!! Each member has upon them the mark of the Bloodsabers, a rat-shaped ring. I shall reward all those who return such rings to me.");
		}
	else
		{
		quest::say("Your mere presence disgusts me.  Please remove yourself from my sight.  Until you change yourself and your ways, you are unwelcome in the temple of life.");
		}
	}
  if($text=~/Brother Trintle attacked Brother Estle/i){
    quest::say("Impossible!! What madness do you speak of!!? If he did he must have had a reason. Maybe Trintle had been tainted by the words of Bertoxxulous..?");
  }
}

sub EVENT_ITEM {
  if ($faction <= 5 && plugin::check_handin(\%itemcount, 13301 => 1)) {
    quest::say("You have cleansed Norrath of another follower of the Plaguebringer.  You have done well.  Take this reward and continue your search for others who wear this ring.");
	# Faction verified on Live
    quest::givecash(0,2,1,0); # Random from 20cp20sp
    quest::faction(219,"1"); #Antonius Bayle
    quest::faction(262,"2"); #Guards of Qeynos
    quest::faction(341,"5"); #Priests of Life
    quest::faction(280,"1"); #Knights of Thunder
    quest::faction(221,"-1"); #Bloodsabers
    quest::exp("500");
	quest::ding();
  }
  if ($faction <= 5 && plugin::check_handin(\%itemcount, 13908 => 1)) {
    my $suuspa_randomSP = int(rand(20));
    my $suuspa_randomCP = int(rand(20));
    quest::say("This is not good. Hmph. It appears they are shattered. For the first time one of our members has been swayed. I reward you for your deed. Also, if you have found anything upon Trintle, let me know.");
    quest::givecash("$suuspa_randomCP","$suuspa_randomSP","0","0"); # Random from 20cp20sp
	#Factions verified on live, inc needing at keast indiff to turn in
    quest::faction(219,"1"); #Antonius Bayle
    quest::faction(262,"2"); #Guards of Qeynos
    quest::faction(341,"5"); #Priests of Life
    quest::faction(280,"1"); #Knights of Thunder
    quest::faction(221,"-1"); #Bloodsabers
    quest::exp("1000");
	quest::ding();
  } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:qeynos2  ID:2048 -- Suuspa_Clanim
