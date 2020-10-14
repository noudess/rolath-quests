sub EVENT_AGGRO {
  quest::say("${race}s like you are better left dead than alive.");
  quest::say("You ssssshall know the horror of Cazic-Thule!");
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Do you [know fear]?");
  }
if($text=~/i know fear/i) {
    quest::say("That's great!");
  }
if($text=~/I know no fear/i) {
    quest::attack($name);
}
if($text=~/bless my hay/i) {
    quest::say("I require 66 gold coin and the hay in order to bless it.");
}
if($text=~/curse my hay/i) {
    quest::say("I require 66 gold coin and the hay in order to curse it.");
  }
}

sub EVENT_ITEM
	{
	if (($itemcount{13990} == 1) && ($gold + (10*$platinum) >= 66))
		{
		quest::say("Here is your cursed hay.");
    	quest::summonitem(14320);
		quest::faction(344, 10);
		}
	}
