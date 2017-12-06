#! usr/bin/perl

use Data::Dumper;

my ($file_name) = @ARGV;
open(my $fh, "<", $file_name) or die "Can't open $file_name: $!";
my $passphrases;
my $valid = 0;
while (my $row = <$fh>) {
	my @words = split /\s/, $row;
	if (!has_repeats(@words)) {
		$valid++;
	}
}
print "Number of valid passphrases: " . $valid . "\n";

sub has_repeats {
	my @words = @_;
	my $length = scalar @words;
	for (my $i = 0; $i < $length - 1; $i++) {
		for (my $j = $i + 1; $j < $length; $j++) {
			if (@words[$i] eq @words[$j]) {
				return 1;}
		}
	}
	return 0;
}
