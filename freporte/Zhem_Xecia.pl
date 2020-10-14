sub EVENT_SAY
	{ 

	if($text=~/Hail/i)
		{
		quest::say("What is it maggot? I have only time for new clerics who have chosen to [serve the Dismal Rage]. If you are looking for meaningless banter. than I suggest you find a bar wench.");
		}

	if($text=~/serve the dismal rage/i)
		{
		quest::say("The clerics of the Dismal Rage must be strong and familiar with battle. There are many beings across Norrath who oppose our deity and our dogma. Take this note to Jerra Renlock and she will aid you in obtaining a suit of armor to protect you from the physical threats of our enemies and the creatures of the wild.  Once you have been properly outfitted return to me and will offer you [further instruction].");
		# Note to Jerra Renlock ID-19844
		quest::summonitem("19844");
		}

	if($text=~/further instruction/i)
		{
		quest::say("So you think you are ready to face the enemies of the Dismal Rage? Be careful to not be blinded by your arrogance or anger. You must focus the rage in your soul and refine it into patient and insidious hatred. A cleric of the Sentries of Passion. Ulia Yovar. has been attempting to uncover our allies among the citizens of Freeport and is believed to be in hiding in the sewer tunnels under the western quarter of Freeport. Seek this enemy of the Dismal Rage and bring me her head.");
		}

	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 19933 =>1 )) 
		{
		quest::say("I see your mission was a success. Take this Rough Dismal Flail and refine it in forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done take the Refined Dismal Flail and a Giant Rattlesnake Skin to Jerra Renlock. She will put the finishing touches on your new weapon.");
		quest::summonitem(19922);  # Rough weapon
		quest::exp(100);
		quest::ding();
		quest::faction(271,10);
		quest::faction(281,-1);
		quest::faction(286,2);
		} 
	}
#END of FILE Zone:freporte  ID:10095 -- Zhem_Xecia

 
