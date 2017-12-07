#! usr/bin/perl5

use strict;
use warnings;
use Data::Dumper;

# my ($goal) = @ARGV;
my $goal = 347991;

my $xy = get_xy($goal);
print Dumper($xy);

my $dist = abs($xy->{'x'}) + abs($xy->{'y'});

print $dist . "\n";

sub get_xy {
	my $goal = shift;
	my $curr = 1;

	my $x = 0;
	my $y = 0;
	my $level = 0;

	while ($curr < $goal) {
		$curr++;
		$level++;
		$x++;
		return {x => $x, y => $y} if ($curr == $goal);
		for (my $i = 0; $i < $level * 2 - 1; $i++) {
			$curr++;
			$y++;
			return {x => $x, y => $y} if ($curr == $goal);
		}
		for (my $i = 0; $i < $level * 2; $i++) {
			$curr++;
			$x--;
			return {x => $x, y => $y} if ($curr == $goal);
		}
		for (my $i = 0; $i < $level * 2; $i++) {
			$curr++;
			$y--;
			return {x => $x, y => $y} if ($curr == $goal);
		}
		for (my $i = 0; $i < $level * 2; $i++) {
			$curr++;
			$x++;
			return {x => $x, y => $y} if ($curr == $goal);
		}
	}
}
			
		
			

