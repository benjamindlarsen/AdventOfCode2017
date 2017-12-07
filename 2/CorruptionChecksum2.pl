#!usr/bin/perl5
use strict;
use warnings;
use Data::Dumper;


my $file_name = 'input.txt';

open (my $fh, '<:encoding(UTF-8)', $file_name)
	or die ("Can't open $file_name: $!");

my $total = 0;
while (my $row = <$fh>) {
	chomp $row;
	my @nums = split( /\s/, $row );
	my $diff;
	for (my $i = 0; $i < scalar @nums - 1; $i++) {
		for (my $j = $i + 1; $j < scalar @nums; $j++) {
			my $valI = $nums[$i];
			my $valJ = $nums[$j];
			if ($valI % $valJ == 0 ||
				$valJ % $valI == 0) {
				$diff = ($valI > $valJ)? $valI / $valJ : $valJ / $valI; 
			}
		}
	}
	$total += $diff;
}
print $total . "\n";

