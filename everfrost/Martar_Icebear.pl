# Martar Icebear
# Location:everfrost - Everfrost Peaks


sub EVENT_SPAWN {
     quest::settimer(1,28800);
}

# I assume this means gives a chance for the other guy to pop?
# I changed the above to be 8 hours like original EQ
sub EVENT_TIMER {
     quest::stoptimer(1);
     $npc->depop(1);
}

# End of Martar_Icebear
