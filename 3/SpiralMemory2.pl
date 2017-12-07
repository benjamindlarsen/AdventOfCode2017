#! usr/bin/perl5

use strict;
use warnings;

my ($goal) = @ARGV;

print get_largest($goal) . "\n";

sub get_largest {
	my $goal = shift;
	my $curr = 1;

	my $x = 0;
	my $y = 0;
	my $level = 0;

	my @grid;
	$grid[cart($x)][cart($y)] = $curr;

	while ($curr <= $goal) {
		$level++;
		$x++;
		$curr = calc_curr(\@grid, $x, $y);
		return $curr if ($curr > $goal);
		$grid[cart($x)][cart($y)] = $curr;
		for (my $i = 0; $i < $level * 2 - 1; $i++) {
			$curr++;
			$y++;
			$curr = calc_curr(\@grid, $x, $y);
			return $curr if ($curr > $goal);
			$grid[cart($x)][cart($y)] = $curr;
		}
		for (my $i = 0; $i < $level * 2; $i++) {
			$curr++;
			$x--;
			$curr = calc_curr(\@grid, $x, $y);
			return $curr if ($curr > $goal);
			$grid[cart($x)][cart($y)] = $curr;
		}
		for (my $i = 0; $i < $level * 2; $i++) {
			$curr++;
			$y--;
			$curr = calc_curr(\@grid, $x, $y);
			return $curr if ($curr > $goal);
			$grid[cart($x)][cart($y)] = $curr;
		}
		for (my $i = 0; $i < $level * 2; $i++) {
			$curr++;
			$x++;
			$curr = calc_curr(\@grid, $x, $y);
			return $curr if ($curr > $goal);
			$grid[cart($x)][cart($y)] = $curr;
		}
	}
}

sub calc_curr {
	my ($grid, $x, $y) = @_;
	my $total = 0;
	if (defined $$grid[cart($x - 1)][cart($y - 1)]) {
		$total += $$grid[cart($x - 1)][cart($y - 1)];
	}
	if (defined $$grid[cart($x - 1)][cart($y)]) {
		$total += $$grid[cart($x - 1)][cart($y)];
	}
	if (defined $$grid[cart($x -1)][cart($y + 1)]) {
		$total += $$grid[cart($x - 1)][cart($y + 1)];
	}
	if (defined $$grid[cart($x)][cart($y - 1)]) {
		$total += $$grid[cart($x)][cart($y - 1)];
	}
	if (defined $$grid[cart($x)][cart($y + 1)]) {
		$total += $$grid[cart($x)][cart($y + 1)];
	}
	if (defined $$grid[cart($x + 1)][cart($y - 1)]) {
		$total += $$grid[cart($x + 1)][cart($y - 1)];
	}
	if (defined $$grid[cart($x + 1)][cart($y)]) {
		$total += $$grid[cart($x + 1)][cart($y)];
	}
	if (defined $$grid[cart($x + 1)][cart($y + 1)]) {
		$total += $$grid[cart($x + 1)][cart($y + 1)];
	}
	return $total;
}

sub cart {
	my $index = shift;
	return ($index < 0) ? -$index * 2 + 1 : $index * 2;
}
