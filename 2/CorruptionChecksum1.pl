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
	my $largest = $nums[0];
	my $smallest = $nums[0];
	foreach my $num (@nums) {
		if ($num >= $largest) {$largest = $num};
		if ($num <= $smallest) {$smallest = $num};
	}
	$total += $largest - $smallest;
}
print $total . "\n";

