# ZONE: East Freeport (freporte)

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("Begone lest you seek instruction. I am very busy. I teach those who [follow the path of rage] as a Shadowknight. the leaders of the Dismal Rage.");
   }

   if($text=~/follow the path of rage/i)
   {
   quest::say("As the leaders of the Dismal Rage we Shadowknights forefront of our struggles. We use the spiritual guidance of our Clerics. the Dark Arts of our Necromancers. and the tactics of our Warriors to advance the causes and secure the needs of our followers. If you aspire to be of importance to your colleagues you must first obtain a suit of armor to defend you from the aggressions of our enemies. Take this note to Quan Nektogo here in the eastern quarter of Freeport. He will aid you in the construction of your armor. When you are properly outfitted return to me and I will present you with an [important task].");
   # Note to Quan Nektogo ID-19845
   quest::summonitem("19845");
   }

   if($text=~/important task/i)
   {
   quest::say("It has come to our attention that a paladin of the Sentries of Passion, Raenna Griff, has been aiding sympathizers and wanted members of the Sentries of Passion and the Knights of Truth in the sewer tunnels beneath the western quarter of Freeport. The incompetent Freeport Militia has yet to capture these wanted followers of the Mar twins. We will wait for their capture no longer. Seek this Raenna Griff individual and slay her. I want her head presented to me this very night!");
   }

}

sub EVENT_ITEM
	{

	if(plugin::check_handin(\%itemcount, 19934 => 1)) #Raenna Griff's Head
		{
		quest::say("It took you long enough. I wonder if the Militia will be able to identify the body minus its head. Take this Dull Dismal Long Sword and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is accomplished deliver the Sharpened Dismal Long Sword and a Giant Rattlesnake Skin to Quan Nektogo. He will make the final preparations on your weapon.");
		quest::exp("100");
		quest::ding();
		# Dull Dismal Longsword ID-19923
		quest::summonitem("19923");
		#factions verified on ZAM
		quest::faction(271,"10"); #Dismal Rage
		quest::faction(296,"2"); #Opal Darkbriar
		quest::faction(281,"-1"); #Knights of Truth
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:freporte  ID:10099 -- Gunex_Eklar
