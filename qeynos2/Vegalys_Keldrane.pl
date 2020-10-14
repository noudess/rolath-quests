#BeginFile qeynos2\Vegalys_Keldrane.pl (2051)
#Quest file for North Qeynos - Vegalys Keldrane: Investigators Badge (Badge #1)

sub EVENT_SAY {

  my $Mezmer = quest::saylink("Mezmer", 1);
    
  if($text=~/hail/i) {
	if ($name eq "Mezmer")
		{
		plugin::DoAnim("salute");
		quest::say("Welcome back Plague Ender Mezmer, I am please to see you again.  We are still seeking many of the indivudals [responsible] for unleashing the plague you helped end.");
		}
	if (plugin::check_hasitem($client, 2386) || plugin::check_hasitem($client, 2387))
		{
		quest::say("$name, you have served us well and it is time to round up some more of those responsible for the crimes against nature.  Will you [advance further] in rank by continuing to help?");
		}
	elsif (plugin::check_hasitem($client, 2583))
		{
		quest::say("$name, you have truly served Qeynos well and we are quite pleased.  Once again we ask your help, we now have information we believe may lead us to the [individual that unleashed this plague] in the first place.");
		}
	else
		{
    	quest::say("Greetings to you, citizen. By order of the Antonius Bayle I have been given the duty of apprehending the individuals [responsible] for unleashing the Three-fold Plague of Bertoxxlous upon the people and the lands of Antonius Bayle. I give thanks to Karana and to Rodcet Nife that the Priests of Life with the help of the Erudite $Mezmer were finally successful and ended that terrible plague.");
		}
  }
  if($text=~/mezmer/i) {
	quest::say("Ahh yes Mezmer is an Erudite who studies the art of Enchantment.  He visited out city and when he learned of the terrible plague unleashed by the Bloodsabers, he offered his considerable talents to help end it.  His efforts were key in unlocking a piece of information that lead us to the culprits.  We consider him an honary son of Qeynos and will forever be known as the Plague Ender.");
  }
  if($text=~/responsible/i) {
    quest::say("The plague unleashed upon the Plains of Karana was the work of the followers of Bertoxxulous. Those responsible belong to group known as the Bloodsabers though there were others involved as well. Some time back, they launched a plot to overthrow Antonius Bayle and our ruling council. Their [plan] failed.");
  }
  if($text=~/plan/i) {
    quest::say("Their plan was to unleash a plague so deadly and virulent that it would wipe out all life from here to Highpass Hold. They planned to brand themselves and their foul allies with a rune that would have rendered them immune to the effects of this plague. From that point they would have been able to simply walk in, easily defeat the weakened stragglers and declare themselves the rulers of this kingdom by default. But they were [careless].");
  }
  if($text=~/careless/i) {
    quest::say("The sudden influx of scoundrels and loathsome individuals was our first tip off. They required a rather enormous number of supplies, materials and manpower to construct the ornate altars, craft and enchant their runed branding irons and supply their armies with the weapons needed for the cleanup work afterward. They needed to rely upon [outside help].");
  }
  if($text=~/outside help/i) {
    quest::say("They mostly chose to hire bandits and brigands who are foolishly more concerned with immediate profits than the long-term effects of their actions. But once they knew we were on to them they even started hiring some of the more 'civil' gnolls, if there is such a thing. Gnolls tend to be easy to push around, stupid, and they work very cheaply. They knew their time was short and they were desperate. Choosing to work with untrustworthy, lazy scoundrels caused the whole thing to begin to [unravel], praise Rodcet!");
  }
  if($text=~/unravel/i) {
    quest::say("Their workers were careless. Aside from noticing the unsavory element in our city, our citizens began to run across many of the strange items and materials that were being trafficked into our city en masse. It was at that point that the citizens began to [complain] quite loudly about all of this.");
  }
  if($text=~/complain/i) {
    quest::say("Obviously, they questioned the meaning behind these events and rightfully so. They were frightened much as they are now. I admit, I was remiss in my duties for not noticing it sooner. One of the biggest complainers during this time was a man by the name of [Earron Huntlan], proprieter of the famed Lion's Mane tavern. Though he is just a simple merchant, he did us a great service.");
  }
  if($text=~/Earron Huntlan/i) {
    quest::say("Earron is quite a character. He gets all kinds of travelers stopping by his inn for a drink or whatever other business. His patrons started telling stories of being mugged and harassed by these loathsome individuals in the very streets of our fair city. Of course, he was concerned. So he became a kind of advocate for this cause, ringing the [alarm] bell as it were. I admit, at first I did not believe the conspiracy. I simply could not believe it was all happening under our nose.");
  }
  if($text=~/alarm/i) {
    quest::say("Well, he succeeded in whipping the populace into a frenzy. He even got the famous wizard Al'Kabor to help him out by determining the nature of the strange items many of our citizens were finding. Getting that man to do anything not directly related to his research is not an easy thing to accomplish either. Needless to say, at that point I saw the truth and the Prime Healer forgive me for not seeing it sooner. Were it not for the investigations and general outcry of [concerned citizens], we might not be standing here talking today.");
  }
  if($text=~/concerned citizens/i) {
    quest::say("Yes, it was citizens like you that helped to save Qeynos that day. We uncovered their plot, captured the man who was in charge and put him to death. Of course, the Bloodsabers retaliated and using their incomplete research still managed to unleash the plague that was finally eradicated with the help of the Priests of Life and citizens like you. Though it was devastating in its own right, you must admit it is rather mild compared to what it might have been. I thank you for your interest. Perhaps you would be willing to [help me]?");
  }
  if($text=~/help you/i) {
    quest::say("Excellent! The more I learn from my investigators the more I find that these Bloodsabers have stretched their tendrils of influence all throughout our beloved city. Nevertheless, we are committed to exposing these fiends once and for all. Perhaps you would like to become an [investigator]?");
  }
  if($text=~/investigator/i) {
    quest::say("Very well then, $name. We will not allow just anyone to wear the official Investigator's Badge and please forgive me. . . But it is hard to tell where one's loyalties lie these days. If you are truly [serious] then there is a duty you must perform first to show you are on the side of Antonius Bayle, the council and the good people Qeynos.");
  }
  if($text=~/serious/i) {
    quest::say("There is a guard by the name of Robbie Shilster that patrols the Northern Plains of Karana. He is allied with our enemies and completely corrupt. He is flagrant in his trafficking of contraband goods. His orders are to guard the great wooden bridge to stave off the insect swarms. But our investigators report that he simply stands to the side and watches as the swarm rolls through. You are to execute this man for his treason and bring me his helm. Then, we will talk.");
  }
  if($text=~/advance further/i) {
    quest::say("Interested in helping us further. We continue to gather valuable information. We still require [interrogators] that are able to pry the information we require out of those less then willing to talk. Also, Velarte Selire at the Temple of Life is continuing his [research] so you may wish to talk with him. Lastly, we now have information we believe may lead us to the [individual that unleashed this plague] in the first place.."); 
  }
  if($text=~/interrogators/i) {
    quest::say("If you are interested in joining the ranks of our interrogators and helping Qeynos further as we bring these fiends and murderers to justice, turn in your investigator's Badge and I will give you the briefing document you need. I already know I can trust my investigators, so there is no need to further test you.");
  }
  if($text=~/research/i) {
    quest::say("Ask Velarte Selire at the Temple of Life about his [research].");
  }
  if($text=~/individual that unleashed/i) {
    quest::say("A woman named Azibelle Spavin unleashed the plague. She was the bodyguard and some say concubine of Mordavin Telase. He was put to death for his long list of crimes against Qeynos, which included murder, treason and attempted genocide.  The plague was apparently her revenge. I sent one of my investigators and one of the best guardsmen we have to try and find her and bring her to justice. They are [still missing].");
  }
  if($text=~/still missing/i) {
    quest::say("Kane recommended Guard Helminth personally as one of his best. They must have run into serious trouble. These were two of Qeynos' finest. I am only willing to send those with both strength and intelligence down there to complete this mission and find our people's whereabouts. Give me your Researcher's Badge should you wish to accept this mission.");
  }
}

sub EVENT_ITEM 
	{
	  if(plugin::check_handin(\%itemcount, 2173 => 1)) #Cracked Corrupt Guard Helm
		{
		quest::say("Thank you for bringing this person to justice. Please read this manual very, VERY carefully. Commit it to memory. We do everything strictly by the book. We are a people of law and order and I simply won't tolerate a breach of protocol. Investigators are expected to accurately report findings, are authorized to issue warrants and to notarize official documents for all lands under the jurisdiction of Antonius Bayle and the council. I sincerely hope you can earn your Investigator's Badge.");
		quest::summonitem(18289); #Investigator's Briefing
		# Factions verified on live
		quest::faction(219,1);    #Antonius Bayle
		quest::faction(262,1);  #Guards of Qeynos
		quest::faction(304,-1); #Ring of Scale
		quest::faction(273,-1); #Kane Bayle
		quest::faction(291,1);  #Merchants of Qeynos
		quest::exp(2000);
		quest::ding();
	  }

	  elsif(plugin::check_handin(\%itemcount, 2386 => 1)) #Investigator's Badge
		{
		quest::say("Very well, here is the briefing document. Please read it very carefully. I wish you luck friend, this mission could prove to be dangerous.");
		quest::summonitem(18292); #Interrogator's Briefing
		}

	  elsif(plugin::check_handin(\%itemcount, 2583 => 1)) #Researchers's Badge
		{
		quest::say("Here is my personal seal. Go to the sewers and locate my investigator and show him this seal if he yet lives. Find out what happened to he and guard Helminth. Then if at all possible, complete this operation by finding Azibelle Spavin and execute her. Bring me her head and return me my seal and you shall be rewarded.");
		quest::summonitem(2694); #Vegalys Seal
		}

	  elsif(plugin::check_handin(\%itemcount, 2694 => 1, 2392 => 1)) #Vegaly's Seal & Azibelle's Head
		{
		quest::say("Good work $name! So Guard Helminth was corrupt? So crafty are these black hearted souls that they can fool even the righteous Kane Bayle himself! I'm sure he will be saddened to hear of this. I too am saddenned by the loss of one of my best investigators. At least we've served justice this day by sending Azibelle Spavin to her dark master. May she rot with her god. Take this Badge of Honor and wear it with pride and distinction.");
		quest::summonitem(2388); #Qeynos Badge of Honor
		quest::shout("All hail $name");
		# Factions verified on live
		quest::faction(219,5);    #Antonius Bayle
		quest::faction(262,5);  #Guards of Qeynos
		quest::faction(304,-2); #Ring of Scale
		quest::faction(273,-5); #Kane Bayle
		quest::faction(291,5);  #Merchants of Qeynos
		quest::exp(5000);
		quest::ding();
		}

	  else {
		quest::say("I have no use for this, $name.");
		plugin::return_items(\%itemcount);
	  }
	}
#EndFile qeynos2\Vegalys_Keldrane.pl (2051)
