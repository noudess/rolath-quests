#####################################
#Quests: Zombie Flesh, Convert Fishermen
#NPC: Dleria Mausrel
#Zone: erudnext
#Author: RealityIncarnate
#####################################

sub EVENT_SAY 
	{   
	if ($text=~/Hail/i) 
		{
		quest::say("Hail! You appear to be a [new priest]. Ah, I so enjoy the presence of youth within Deepwater Temple. I am sure Prexus is smiling upon us as we speak.");
		}
	elsif ($faction <= 4) # Tested at Indiff
		{
		if ($text=~/new priest/i) 
			{
			quest::say("As I suspected. I shall assist you with your training and you shall assist the temple with your service. A young priest can help out by asking to [convert fishermen in Qeynos] or maybe even something truly great such as requesting to [protect the depths].");
			}
		elsif($text=~/protect the depths/i) 
			{ 
			quest::say("We have heard of zombies inhabiting the depths of Erud's Crossing. Go and seek them out. Destroy them. This evil should not exist within the realm of the Ocean Lord. Take this bag. Fill it with their rotting flesh. combine it and return it to me. May Prexus guide you."); 
			quest::summonitem(17939);
			}
		elsif ($text=~/convert fishermen in Qeynos/i) 
			{
			quest::say("So you wish to journey to Qeynos? So be it. Go to Qeynos and find me a willing convert. Ask them if they wish the blessing of Prexus. If so, they should snap their pole in two and you will return it to me. Do this and be rewarded.");
			}
		}
	else
		{
		quest::say("There is no reason to dislike you, but we of the Deepwater Knights mist see more done for our cause before we truly accept you.");
		}
	}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13922 => 1)) {
    quest::say("Good work, young priest. Soon you shall carry the word of the Ocean Lord to distant lands. For now, continue your training. As for your reward, I have this which has been sitting in our vault. I hope it can be of use to a young priest such as yourself.");
	# Factions verified on live
    quest::faction(242, 5);
    quest::faction(266, 1);
    quest::faction(265, -1);
    quest::exp(100);
	quest::ding();
    quest::summonitem(quest::ChooseRandom(10018, 17005, 17002, 15207, 15201, 15208, 15209, 2137, 2138, 2139, 2140, 2141, 2142, 2143, 2144, 2145, 2146, 2147, 2148));
    quest::givecash(0,14,5,0);
  }
  
  if (plugin::check_handin(\%itemcount, 13880 => 1)) {
    quest::say("Peeuww!! That most certainly is zombie flesh!! Here is your reward. You have done a fine service in the name of Prexus. Soon you shall advance and we may tell you of greater dangers lurking in the depths.");
	# Factions verified on live.
    quest::faction(242, 10);
    quest::faction(266, 1);
    quest::faction(265, -1);
    quest::exp(100);
	quest::ding();
    quest::summonitem(quest::ChooseRandom(10018, 17005, 17002, 15207, 15201, 15208, 15209, 2137, 2138, 2139, 2140, 2141, 2142, 2143, 2144, 2145, 2146, 2147, 2148));
    quest::givecash(0,12,4,0);
  }
  else {
    #Text made up
    quest::say("You have my thanks, but I have no need for this.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:erudnext  ID:24050 -- Dleria_Mausrel
