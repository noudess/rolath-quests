# Gathering Grain - fixed formatting, updated factions
sub EVENT_SAY 
{
	if($text=~/Hail/i)  
		{   
		quest::say("Greetings, $name. Welcome to the Miller Farmstead. [My husband] and I have lived out here on the plains of Karana for thirty years now. We grow the finest grains in all of Norrath. Admire the [grains] all you like, but steer clear of those [scarecrows]."); 
		}
	if($text=~/husband/i) 
		{   
		quest::say("Cleet is my husband. He is a hard worker and provides for the [kids] and me"); 
		}
	if($text=~/What scarecrows/i)  
		{     
		quest::say("Yep, those scarecrows are snarky. I've told Cleet more than a few times that I'd like to cook their heads into a pie, but he won't let me get near them. Oh, there was a recipe book that the Hutchison's gave us as a gift that described how to bake five different wisp lightstones into a scarecrow head to make it glow. Ah well."); 
		}
	if($text=~/grains/i)  
		{     
		quest::say("We grow wheat, barley, and rye here on the farm.  There is a type of straw that grows all over the Plains of Karana that we bale here as well.  If we didn't chop it and bale it that dang straw would overrun our crops.  We sure could use some [help dragging the bales of hay] out of the field."); 
		}
	if($text=~/help dragging the bales of hay/i)  
		{     
		quest::say("Oh, good.  We can always use help gathering hay.  Bring me any hay bales you find in the fields to me and I will pay you for your time."); 
		}
	if($text=~/kids/i)  
		{     
		quest::say("We have five children.  [Cleet Junior] is our youngest and the only one born of my womb.  [Furball] is second youngest.  [Chanda] is a little bit older than him and [Baobob] is a few years older than her.  [Tiny] is our oldest.");
		}
	if($text=~/cleet junior/i)  
		{     
		quest::say("Cleet Junior is a bit of a problem.  He just was not meant to be a farmer.  Cleet wants the boy, being our only child to actually have Miller blood, to take over the farm when he is gone but Cleet Junior is more interested in adventure.");
		}
	if($text=~/furball/i)  
		{     
		quest::say("We adopted Furball after [Tiny] found him dying in our field.  We couldn't very well send him back to that awful Blackburrow place!  Those gnolls kill their young who come back to the clan after being defeated in battle.  Furball doesn't even remember that place and his home is here now.");
		}
	if($text=~/chanda/i || $text=~/baobob/i)  
		{     
		quest::say("We adopted Chanda and Baobob at the same time.  They're blood kin, ya know!  Tiny found them sleeping in the field one day.  Baobob told us how their folks had been killed, so we took them in as part of our growing family.  They have left the farm, though, to pursue careers as tanners.  I miss them sometimes.  They don't visit often enough.");
		}
	if($text=~/tiny/i)  
		{     
		quest::say("Tiny is our adopted son.  [My husband Cleet] rescued him from a bunch of hooligans who were trying to kill him like they did his momma.  Cleet is quite a heroic man.  We took Tiny in and raised him as a Miller.  We are quite proud of him.  I just wish folks would not pester him like they do.  It is not his fault he was born an ogre.");
		}
}

sub EVENT_ITEM 
{
	if(plugin::check_handin(\%itemcount, 13990 => 1))  #Sack of Hay 
	{
	quest::say("Thank you so much. Tiny gets quite tired doing this by himself. Here you go.");   
	quest::exp(70);   
	quest::ding();
	#Factions verified on live, confirmed can do quest at apprehensive
	quest::givecash(4,0,0,0);  #Verified on live 
	quest::faction(345,1); #KaranasResidents   
	quest::faction(262,1); #GuardsOfQeynos   
	quest::faction(341,1); #PriestsOfLife   
	quest::faction(280,1); #KnightsOfThunder 
	}
plugin::return_items(\%itemcount);
}
#END of FILE zone: ID:12026 -- Henina_Miller.pl 
