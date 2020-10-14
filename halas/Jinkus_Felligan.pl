###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Jinkus Felligan
## ID: 29023
## ZONE: halas
##
############################################

sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice], then, eh?");
		}
	if ($faction > 5) #Verified
		{
		quest::say("The scales o' the Shamans o' Justice dinnae tip in yer favor.  Ye'd best flee while ye still have the chance.");
		}
	elsif ($faction > 4)
		{
		quest::say("Ye're no criminal to the Shamans o' Justice, but ye're yet to prove yer devotion to justice.");
		}
	elsif($text=~/new to the shamans/i) 
		{
		quest::say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye willing to [contribute to our church] or did ye just come to [meditate] within our walls?");
		}
	elsif($text=~/meditate/i) 
		{
		quest::say("Then find yerself a spot out o' the way. Please dinnae obstruct the paths of others who wish to pay tribute to the righteousness o' the Tribunal.");
		}
	elsif($text=~/contribute/i) 
		{
		quest::say("Well then, ye best be off ta find Holana Oleary, she organises our monthly Karan Clover shipments, just tell her Jinkus sent you to assist her. Or, I can have you [make a delivery] for me.");
		}
	elsif($text=~/make a delivery/i) 
		{
		quest::say("The Church of the Tribunal works with the Qeynos Guards to apprehend fugitives. There's a new criminal on the loose, so we must send a wanted poster to Qeynos for them to display on the walls of their bank. Speak with Cindl about a piece o' mammoth hide parchment and with Greta Terrilon about some ink and I'll prepare the bounty poster.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction <= 4) # Need Amiable
		{
		if (plugin::check_handin(\%itemcount, 12621 => 1, 12619 => 1)) 
			{ #Mammoth Hide Parchment, Vial of Datura Ink
			# Verified
			quest::say("Here is th' bounty poster. Take it to a bank guard in Qeynos, immediately!");
			quest::summonitem(12620); #Wanted Poster
			quest::faction(328,1);  #Merchants of Halas
			quest::faction(327,1);  #Shamen of Justice
			quest::faction(223,-1);  #Circle of Unseen Hands
			quest::faction(336,-1);  #Coalition of Tradefolk Underground
			quest::faction(244,-1);	#Ebon Mask
			quest::exp(5);
			quest::ding();
			}

		if (plugin::check_handin(\%itemcount, 12622 => 1))
			{ #List of Qeynos Most Wanted
			quest::say("Ye're learnin' to serve the church well, young Initiate Kinky. I grant ye yer holy symbol and the blessing o' the Tribunal that They may grant ye wisdom in serving Their will.");
			quest::summonitem(1376); #Initiate Symbol of the Tribunal
			# Verifed
			quest::faction(328,3);  #Merchants of Halas
			quest::faction(327,25);  #Shamen of Justice
			quest::faction(223,-3);  #Circle of Unseen Hands
			quest::faction(336,-3);  #Coalition of Tradefolk Underground
			quest::faction(244,-5); #Ebon Mask
			quest::exp(20);
			}
		}

	plugin::return_items(\%itemcount);
	}
