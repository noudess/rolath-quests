#This version of Shei is a simple non-aggro merchant. When killed, the true version of Shei will spawn.

sub EVENT_DEATH {
 quest::spawn2(179032,0,0,-1736,1082,22.6,126);
}

#Submitted by Jim Mills
#Modified by Reno
