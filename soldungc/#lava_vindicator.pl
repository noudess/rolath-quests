sub EVENT_SPAWN {
quest::settimer("vindicator",1);
  }
     
sub EVENT_TIMER { #depop doesn't work well with sub EVENT_SPAWN
$elemrest = $entity_list->GetMobByNpcTypeID(278124);
$furiousmagma = $entity_list->GetMobByNpcTypeID(278123);
$inflamedchamp = $entity_list->GetMobByNpcTypeID(278122);
$protectorfire = $entity_list->GetMobByNpcTypeID(278109);

if ($timer eq "vindicator") {
if ($elemrest || $furiousmagma || $inflamedchamp || $protectorfire) {
  quest::stoptimer("vindicator");
  quest::depop();
  } 
   }
    }
   
sub EVENT_DEATH {
  quest::signalwith(278125,90,0);
  }
