sub EVENT_SPAWN
	{
	my $num = plugin::NormInv(rand(1), 4, 2.5);
	my $silks = int($num);
	for ($i=0; $i < $silks; $i++)
		{
		quest::addloot(13041, 1, 0);
		}
	}
