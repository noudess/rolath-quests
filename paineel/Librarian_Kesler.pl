sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hello. researcher!  There are many things to be found here.  Our selection grows daily.  Would you [care for any books]?");
		if($faction < 5)
			{
			quest::emote("studies you for a moment.");
			quest::say("Perhaps you would be willing to add to my collection... something more [flavorful]?");
			}
		}
	if($faction < 5 && $text=~/flavorful/i)
		{
		quest::say("The food here is so bland and I cannot find a decent cookbook.  I have heard of a chef named Sorin who has a couple of cookbooks, you look well traveled, find and bring me these books.");
		}
	if($text=~/care for any books/i)
		{
		quest::say("Excellent!  I love to see the young so interested in knowledge.  What subject would you like to research? My most interesting topics today would have to be the Hole. old Paineel. the Underfoot. and the history of Paineel.");
		}
	if($text=~/tell me about the history of paineel/i)
		{
		quest::say("Tis an excellent topic. $name.  Much can be learned of a civilization if one first understands its history.  I hope you enjoy the book.");
		}
	if($text=~/tell me about the hole/i)
		{
		quest::say("Here you are. $name.  The book has old bindings and is worthless to most. but the value of knowledge is priceless.");
		}
	if($text=~/tell me about the underfoot/i)
		{
		quest::say("Excellent choice. $name.  The Underfoot is a mysterious place.  I hope you get as much from the book as I did.");
		}
	if($text=~/tell me about the old paineel/i)
		{
		quest::say("Take this book. $name.  It contains the history of the ancient city from which we came."); 
		}
	}

sub EVENT_ITEM
	{
	if ($faction > 4)
        {
        plugin::reject_say();
        }
    elsif (plugin::check_handin(\%itemcount, 18128 => 1, 18129 =>1))
        { 
        quest::say("Yes these will make a fine addition to my collection.  I cannot leave my books but I wish a delicious meal now.  You bring me some hot spicy toelings, gator rolls, beer braised mammoth and some delicious pound cake for dessert and I will reward you with one of these dusty old scrolls or a few coins if I cannot find something appropriate for you.");
        quest::faction(265, 1);  #Heretics
		quest::ding();
		}
    elsif (plugin::check_handin(\%itemcount, 13461 => 1, 13476 => 1, 13448 => 1, 13495 => 1))
        { 
        quest::say("Ahhh my mouth is watering, I cannot wait to savor this meal.  Here take this and get out before I have you turned into a meal for someone else!");
        quest::ding();
		quest::exp(200);
		if ($class eq "Cleric")
			{
			quest::summonitem(26963);
			}
		elsif ($class eq "Necromancer")
			{
			quest::summonitem(15858);
			}
		elsif ($class eq "Shadowknight")
			{
			quest::summonitem(30457);
			}
		else 
			{
			quest::givecash("0","0","0","5");
			}
		}
	}

#END of FILE Zone:paineel  ID:75076 -- Librarian_Kesler 

