sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
    	quest::say("Hello, Noreach.  My name is Imkar and I am kind of new at this job but I can give you some advice.  Be careful here in Qeynos.  There are many [dark forces] at work here that are best left undisturbed.");
  		}
	if ($text=~/dark forces/i)
		{
		quest::say("I really don't know yet.  I just know the chills shoot up and down my spine when I pass certain places on my patrol.  My mother was a gypsy and told me I had the 'gift of sense'.  I think the chills are part of that gift.  Just be careful.  Especially near the entrances to the aqueducts below the city.");
		}
	}
