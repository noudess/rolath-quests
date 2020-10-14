sub EVENT_SIGNAL 
	{
	quest::say("Find somebody to go see what he wants. I don't like the idea of making Hanns mad at us, but I also don't like the idea of looking over my shoulder for Stanos. He is not somebody I would care to dance with, and I DO owe him.");
	}

sub EVENT_SAY 
	{
	if($fatestealer >= 1) 
		{
		if($text=~/hail/i) 
			{
			quest::say("So there you are, $name. You are, of course, preceded by your reputation. I was wondering when I would have the pleasure of receiving your company. Word has it that you're looking for information, and I'm afraid you've come to the wrong bar, friend. The drinks are downstairs and the information is strictly off limits. That is, unless you can take care of a [small job] for me. I might be willing to entertain the notion of overlooking your stature if you can assist me with a special problem.");
			}
		if ($text=~/small job/i) 
			{
			quest::say("One of my girls stumbled across a beverage that should bring in crowds to the Fool's Gold. It's fantastic stuff, really. I am expecting folks to travel all the way from Freeport. But without having even tasted a drop of the stuff, Mayor Gubbin has outlawed it in Rivervale. He won't let me bring in a shipment of ingredients, and my shippers have refused to deliver here anymore after being turned away at the gate so many times - rudely I might add! If you were to brew a bottle of the stuff and convince Gubbin to take a drink, I think he might appreciate it enough to change his mind. Here's the recipe. I'm counting on you, $name");
			quest::summonitem(52333); #Jumjum Twist Recipe
			}
		}
	else 
		{
		if($text=~/hail/i) 
			{
			quest::say("Its nice to meet you $name. Allow me to introduce myself. I am Lendel Deeppockets Master Assassin of Rivervale. If you are interested in training as a new apprentice, go see my brother Wendel.");
			}
		if($text=~/wendel/i) 
			{
			quest::say("Wendel is my brother and is in charge of training all the new recruits.  If you are interested in joining our organization, I suggest you report to him immediately.");
			}
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 22693 => 1, 22694 => 1)) 
		{
		quest::summonitem(22695);
		quest::exp(200);
		quest::ding();
		}
	elsif(plugin::check_handin(\%itemcount, 13588 => 1)) #Rogue 1.5 handin
		{
		quest::say("Well done, $name. With the Mayor's blessing to sell this liqueur in the Fool's Gold we'll make a mint, and there's almost nothing illegitimate about it. Now that we have the formalities taken care of, allow me to tell you something. What I know is fundamental to the idea of creating a perfect blade. It's my pleasure to pass that knowledge on to you. Many people are hung up on the shape and size of a weapon. I'm here to tell you that it's not about size, but overall weight and balance.' Lendel holds out his dagger and balances the point on the tip of his finger. 'You see what I mean, $name? Perfect. In the heat of combat, when every precision strike counts, you can't afford to be wielding an unbalanced bulky blade. I have some notes I've written up on the topic. Here, I'll jot them down in your journal.");
		quest::emote("You have coerced Lendel into revealing his secret");
		}
	elsif(plugin::check_handin(\%itemcount, 18732 => 1))  #Tattered Note
		{
		quest::say("HA!  I asked that fool Denry to send me a professional, and this is what I get?!?  Oh diddlepicks!  That crotchety old coot never liked me anyway.  And after all I've done for him!  Hrrmf!   Ah well, let's get you started and see what ya got, huh, kid?  Here, wear this.  Maybe I'll have Toelia break you in, huh?  Yeah, that'll work!  Go find her, and she'll put you to work.  Just remember, we all earn our keep around here, or else it's back to the hay farm for you!   Oh yeah, tell her you're the [new dishwasher] so she knows you are on the level.Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks."); 
		quest::summonitem(13539); #Old Brown Vest - as per Live
		#Factions verified on Live
		quest::faction(241,100);	#Deeppockets
		quest::faction(223,5); 	#Circle of Unseen Hands
		quest::faction(292,-5);	#Merchants of Rivervale
		quest::faction(336,5);	#Coalition of Tradefolk Underground
		quest::faction(329,5);	#Carson McCabe
		quest::exp(100);
		quest::ding();
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:rivervale  ID:19066 -- Lendel_Deeppockets
