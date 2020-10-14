sub EVENT_SIGNAL 
{
	quest::say("You said it, boss!  Stay clear of taking sides and you should be just fine, young one.");
}

sub EVENT_SAY 
{
	if($text=~/Hail/i)
		{
		quest::say("How ya doin', bub? Seein' as how you just joined the conversation, I think you need to buy us a round!");
		}
	elsif($text=~/Lenka/i)
		{
		quest::say("Lenka Stoutheart is my friend. She is of barbarian blood. If it were not for her, I would never have survived [Guk]. After Guk, we made a quick alliance and have traveled the world of Norrath aboard the [Blue Beast].");
		}
	elsif($text=~/Guk/i)
		{
		quest::say("In the swamps of Innothule, you will find the kingdom of the frogloks, Guk. It was in Guk that Lenka and I met. Side by side, we fought the hordes of living frogloks to find a world of undead frogloks and much treasure.");
		}
	elsif($text=~/Blue Beast/i)
		{
		quest::say("The Blue Beast is our ship. It is most likely the fastest ship sailing the seas of Norrath. It is a design all my own. Lenka says it is best to anchor it far from shore to keep the rogues from it.");
		}
}

