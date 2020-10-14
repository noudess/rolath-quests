#NPC:    Miranda
#NPC ID: #100143
#Zone: Stonebrunt
#Quest by Dave

sub EVENT_SAY
{
 if($faction > 6)
 {
 quest::say("You have done much to anger the spirits thus you are not accepted by our people.");
 }
 elsif($text =~ /hail/i)
 {
  quest::say("I'm not supposed to talk to strangers but if my parents let you in here I guess it's ok. Do you like [candy]? I could give you some [candy] to play a game with me but my [dice] are gone now.");
 }
 elsif($text =~ /candy/i)
 {
  quest::say("Khonza Ayssla went away one time and came back with chocolate covered cherries and pixie powder cinnesticks for my sister and I. I like the chocolates the best.");
 }
 elsif($text =~ /dice/i)
 {
  quest::say("I had my dice in a little bag and lost it outside the walls of the village. I think the kobolds must have found it.");
 }
}

sub EVENT_ITEM
{
 if($faction <= 6 && $itemcount{19992} == 1)
 {
  quest::emote("claps her hands with excitement.");
  quest::say("Chocolate cherries!! My favorite!! Here try some of this!!");
  quest::exp(50);
  quest::ding();
  quest::summonitem(20115);
  quest::faction(473,5);
  quest::faction(298,2);
 }
 if($faction <= 6 && $itemcount{2088} == 1)
 {
  quest::summonitem(20116);
  quest::say("You found my dice!!! Thank you!!");
  quest::exp(120);
  quest::ding();
  quest::faction(473,2);
  quest::faction(298,1);
 }
} 
