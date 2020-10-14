#Kinloc Flamepaw Magician Guildmaster
sub EVENT_SAY 
	{ 
	if ($text=~/Hail/i)
		{
		quest::say("Hello.  Welcome to the house of the Order of Three."); 
		}
	}
sub EVENT_ITEM 
	{ 
	if ($item1=="18719"){quest::say("Welcome to the Order of Three. I am Kinloc, Guild Master of the Magicians. This tunic of the Order is for you, wear it with honour. Study hard and master your skills, and you will become an important part of our Order. Yestura shall help introduce you to the ways of magic.  Before you venture too far from the city, be sure to go see Juegile Sohgohm.  He will instruct you on how to create armor to help protect you.  And be sure to visit the Herb Jar, they are always in need of recruits to help restock supplies.");
	quest::summonitem("13508");
	# Verified on live
	quest::faction(342, 100); #Order of Three
	quest::faction(262, 15); #Guards of Qeynos
	quest::faction(296, -15); #Opal Dark Briar
	quest::faction(221, -25); #Bloodsabers
	quest::exp("100"); }
quest::ding();
	}
#END of FILE Zone:qeynos  ID:1130 -- Kinloc_Flamepaw 

