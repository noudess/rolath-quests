sub EVENT_SAY {
  if($faction > 7){plugin::reject_say();}
  elsif ($text=~/hail/i) {
    quest::say("Hello, hairrrrless one.  Welcome to the ourrrrr island. As you browse my wares please tell me if you would like to see my [shiny tings] that I have gathered from all over the world.");
  }
  elsif ($text=~/shiny tings/i) {
    quest::say("I thought you looked like one who is would be interested in them.  I have a [dull ring], a [kinda shiny ring] and a [really shiny ring].  These are just a few of the items that I have collected in my jourrrrneies, but I would be willing to parrrrt with them for a prrrrice");
  }
  elsif ($text=~/dull ring/i) {
    quest::say("Rrrrrow, I see that you are looking at my dull ring.  I will give it to you if you can bring me a bracket mildew");
  }
  elsif ($text=~/kinda shiny ring/i) {
    quest::say("So it is the kinda shiny ring that you want.  So be it, but you must brrrring me faerix spores before I will give it to you");
  }
  elsif ($text=~/really shiny ring/i) {
    quest::say("Ah, my favorite one, if I am to part with this one you must get me some degenerated guk weed");
  }
}

sub EVENT_ITEM {
if ($faction < 8 && plugin::check_handin(\%itemcount, 14042 =>1 )) {
quest::say("Thank you for this item, here is the dull ring");
quest::summonitem(13733);
}  
if ($faction < 8 && plugin::check_handin(\%itemcount, 14043 => 1)) {
quest::say("You have gotten the spores that I asked for, very well, here is the ring as agreed");
quest::summonitem(13731);
}
if ($faction < 8 && plugin::check_handin(\%itemcount, 14044 => 1)) {
quest::say("Excellent, I will gladly give you the ring for this weed that you have brought me");
quest::summonitem(13732);
}
}

#EOF - The text is not accurate, if anyone has the correct text please feel free to update the file accordingly
