sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("Hail, $name.  You had best keep moving.  One who stands around too long in Qeynos Hills tends to get surprised by [vicious creatures].");
		}
	if($text=~/vicious creatures/i)
		{
		quest::say("The city is not sure what is going on.  I know this, if they are talking to [Talym] then the problem must be serious.  I don't trust that barbarian.");
		}
	if($text=~/Talym/i)
		{
		quest::say("Yeah.. he says he is a sportsman, but I think he is nothing but a lousy poacher.  I know Holly doesn't trust him either.  But, Kane has everyone convinced that we need him,  Naybe you should check up on him for me.  Ask him about the wild animals. I understand he's taken up in a local hut to the East as a base of operations.");
		}
  if($text=~/donate to the temple of thunder/i) {
    quest::say("Why, yes!  I would love to donate to the Temple of Thunder.  My father was a brave and noble member of that order.  Here you are.  You should ask Guard Cheslin also.  His father and mine are both members of Tunder.  Now, move along!");
	quest::summonitem(13294);
  }
	}

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 2) {
	plugin::DoAnim(29);
	}
}




sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}
