sub EVENT_SPAWN {
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,205,-508,-27,506);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,203,-479,-27,252);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,220,-493,-27,390);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,147,-517,-27,76);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,153,-466,-27,162);
}

sub EVENT_AGGRO {
  quest::shout("What?! How in the name of Trushar did you get to this cursed place? From the smug look on your face I can only imagine you think you can destroy us . . . We are already doomed, knaves!");
}

sub EVENT_DEATH {
  quest::spawn2(296030,0,0,-274,-531,-52,250);
  quest::spawn2(296033,0,0,-557,-237,-2,126);
  quest::spawn2(296035,0,0,-406,-552,-77,124);
  quest::spawn2(296036,0,0,-355,-554,-77,380);
  my $instid = quest::GetInstanceID("inktuta",0);
  quest::setglobal($instid.'_inktuta_status',3,3,"H6");
}
