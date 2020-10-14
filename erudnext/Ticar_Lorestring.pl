sub EVENT_SAY { 
if($text=~/Hail/i){
plugin::DiaWind("Hail, $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
}
if($text=~/mail/i){
plugin::DiaWind("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices.  Are you [interested]?");
}
if($text=~/interested/i){
plugin::DiaWind("I have messages that need to go to - well, right now I have one that needs to go to Qeynos.  Will you [deliver] mail to Qeynos for me?");
}
if($text=~/deliver/i){
plugin::DiaWind("Take this letter to Tralyn Marsinger in Qeynos.  You can find him at the bard guild hall.  I am sure he will compensate you for your troubles."); 
quest::summonitem("18151");}
}

sub EVENT_SIGNAL
	{
	if ($signal != 2)
		{
		my $facemob = $entity_list->GetMobByNpcTypeID(24308);
      	$npc->FaceTarget($facemob);

		quest::say("Yeah, keep dodging the work Korvik.  You'll be headed out soon enough, while I handle the cushy routes.");
		quest::signalwith(24308, 2);
		}
	else
		{
		$c = $entity_list->GetClientByAccID($signal);
      	$npc->FaceTarget($c);
		quest::say("So this is the person I have to thank for the additional man power!  I bet you're thankful, eh Buddy?");
		plugin::DoAnim("chuckle");
		quest::signalwith(24308, 1);
		}
	}
#END of FILE Zone:erudnext
