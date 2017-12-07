#! usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my ($file_name) = @ARGV;
my @input;


open (my $fh, '<', $file_name);

while (my $row = <$fh>) {
	chomp $row;
	push @input, $row;
}

my $length = scalar @input;
my $count = 0;
my $index = 0;


# Turns out my computer can't handle deep recursion. A while loop worked much better.

while ($index >= 0 && $index < $length) {
	$count++;
	my $next_index = $index + $input[$index];
	if ($input[$index] > 2) {$input[$index]--;}
	else {$input[$index]++;}
	$index = $next_index;
}
print $count . "\n";


# print steps(\@input) . "\n";
# print Dumper(@input) . "\n";

# sub steps {
#     my $input = shift;
#     my $starting_index = 0;
#     my $count = 0;

#     return steps_r($starting_index, $input, $count);
# }

# sub steps_r {
#     my ($index, $input, $count) = @_;

#     return $count if (!defined $input[$index]);
#     return "Killed after 5 million iterations" if $count == 5000000;

#     $count++;
#     my $next_index = $index + $input[$index];
#     if ($input[$index] > 2) {$input[$index]--;}
#     else {$input[$index]++;}

#     return steps_r($next_index, $input, $count);
# }



