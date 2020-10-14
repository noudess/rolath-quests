# begin -- quests/qeynos/Brin_Stolunger.pl

# Updated for Steel Warrior Initiation Quest by BatCountry
# Original header missing.  Somebody credit somebody else for the rest please.

sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("What?  What?!!  Are we a [young steel warrior]..  Or another [spectator] for the Arena?");
}
if($text=~/young steel warrior/i)
	{
	if($faction >= 6)
		{
		quest::say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		}
	elsif($faction == 5) 
		{
		quest::say("The Steel Warriors have no cause to dislike you, but you still have yet to prove yopur worth to this guild.");
		}
	elsif($faction <= 4) 
		{
		quest::say("I say!! Good show!! I see the look of the warrior in you. Some day you may be as great as Brin Stolunger. Ha!! Still, you are surely wet behind the ears. You will need to polish your skills. Take this sack. Return it to me when you have filled it with 5 bat wings and 5 snake scales. Be sure you combine the contents of the bag before you give it back to me. Now, be off!!");
		quest::summonitem(17935); # Empty Arena Sack
		}
	}

if($text=~/i am a spectator/i)
	{
	quest::say("As I thought!!  You shall be better off upon the ramparts of the arena.  It would be dreadful to see a fine citizen injured in the arena."); 
	}
}

sub EVENT_ITEM {
   if($faction < 5)
   {
      # stage 1, hand in full arena sack
      if(plugin::check_handin(\%itemcount, 13399 => 1)) # Full Arena Sack
      {
         quest::say("Jolly good!! You are clearly on your way to being a fine addition to the Steel Warriors. Now you must take this message to the person noted. All shall be explained.");
         quest::summonitem(18893); # A Sealed Letter - lore: Note to Axe Broadsmith
		 # verified
         quest::faction(311,10);     # Steel Warriors better
         quest::faction(262,2);     # Guards of Qeynos better
         quest::faction(230,-1);     # Corrupt Qeynos Guards worse
         quest::faction(330,-1);    # Freeport Militia worse
         quest::faction(281,2);     # Knights of Truth better
         quest::exp(200);
		 quest::ding();
      }

      # stage 2, have handed in the letter of recommendation from Axe Broadsmith
      if(plugin::check_handin(\%itemcount, 18895 => 1)) # Letter of Recommendation - lore: Letter of Recommendation from Axe
      {
         quest::say("So I see you have performed the test of undead. Good show. Now it is time you truly tested your mettle. Take this note to Grahan Rothkar. He can be found beneath the arena in the pens. May you live to join our brotherhood.");
         quest::summonitem(18894); # A Sealed Letter - lore: Letter to Grahan Rothkar
		 # Verified
         quest::faction(311,10);     # Steel Warriors better
         quest::faction(262,2);     # Guards of Qeynos better
         quest::faction(230,-1);     # Corrupt Qeynos Guards worse
         quest::faction(330,-1);    # Freeport Militia worse
         quest::faction(281,2);     # Knights of Truth better
         quest::exp(1500);
		 quest::ding();
         quest::givecash(7,0,0,0);
      }
   }

   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
   plugin::return_items(\%itemcount);
}

# end -- quests/qeynos/Brin_Stolunger.pl 
