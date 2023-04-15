use POSIX;

sub EVENT_SCALE_CALC
	{
	my $robestatus = "LoamRobe$charid";  
	my $epoc = time();
	my $degraded_seconds = 0;

	if (!defined $qglobals{$robestatus}) 
		{
		# 1st time logging in since this patch, set variable with time.
		quest::setglobal($robestatus,$epoc,5,"F");
		$questitem->ItemSay("Your loam encrusted robe has begun to decay.");
		}
	else
		{
		$degraded_seconds = $epoc - $qglobals{$robestatus}
		}
	
	# Worst we can get is 30% value for now
	# We rot at a rate of 2.77% per month over 18 months;

	my $seconds_to_worst = 18.0 * 30.0 * 24.0 * 60.0 * 60.0;
	my $rotted_perc = $degraded_seconds / $seconds_to_worst / 2.0;
	my $current_scale = .3 + (.5 - $rotted_perc);

	my $disc_perc = $current_scale * 100.0;
	
	my $oldpower = $client->GetEntityVariable("LoamRobe");
	my $newpower = floor($disc_perc);

	if ($newpower != $oldpower)
		{
		$questitem->ItemSay("Your loam encrusted robe has decayed to $newpower %%.");
		}

	$client->SetEntityVariable("LoamRobe", $newpower);

	# Scale from .5 to 1
	$questitem->SetScale($current_scale);
	}
