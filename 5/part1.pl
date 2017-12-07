#! usr/bin/perl

my ($file_name) = @ARGV;
my @input;

open (my $fh, '<', $file_name);

while (my $row = <$fh>) {
	chomp $row;
	push @input, $row;
}

print steps(\@input) . "\n";

sub steps {
	my $input = shift;
	my $starting_index = 0;
	my $count = 0;

	return steps_r($starting_index, $input, $count);
}

sub steps_r {
	my ($index, $input, $count) = @_;

	return $count if (!defined $input[$index]);

	$count++;
	my $next_index = $index + $input[$index];
	$input[$index]++;

	return steps_r($next_index, $input, $count);
}


	
