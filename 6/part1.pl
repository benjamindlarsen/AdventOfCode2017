#! user/bin/perl

use Data::Dumper;
use Clone 'clone';
my ($file_name) = @ARGV;

open (my $fh, "<", $file_name) or die("Can't open $file_name: $!");

my $row = <$fh>;
my @arr = split /\s/, $row;
my @hist;
my $count = 0;

while (!hasBeenSeen(\@arr)) {
	my $arr_cpy = clone(\@arr);
	push @hist, $arr_cpy;
	redist(\@arr);
	$count++;
}

print $count . "\n";


sub hasBeenSeen {
	my $curr = shift;
	for (my $i = 0; $i < scalar @hist; $i++) {
		my $a = $hist[$i];
		if (sameArray($a, $curr)) {
			return 1;
		}
	}
	return 0;
}

sub sameArray {
	my ($a, $b) = @_;
	return false if (scalar @$a != scalar @$b);
	for (my $i = 0; $i < scalar @$a; $i++) {
		return 0 if ($a->[$i] != $b->[$i]);
	}
	return 1;
}

sub redist {
	my $curr = shift;
	my $index = largestIndex($curr);
	my $bucket = $curr->[$index];
	$curr->[$index] = 0;
	for (my $i = 1; $i <= $bucket; $i++) {
		my $cirIndex = ($index + $i) % scalar @$curr;
		$curr->[$cirIndex]++;
	}
}

sub largestIndex {
	my $curr = shift;
	my $largestVal = $curr->[0];
	my $largestIndex = 0;
	for (my $i = 1; $i < scalar @$curr; $i++) {
		if ($curr->[$i] > $largestVal) {
			$largestVal = $curr->[$i];
			$largestIndex = $i;
		}
	}
	return $largestIndex;
}
