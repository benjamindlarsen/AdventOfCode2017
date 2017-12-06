#! usr/bin/perl

use Data::Dumper;

my ($file_name) = @ARGV;
open(my $fh, "<", $file_name) or die "Can't open $file_name: $!";
my $passphrases;
my $valid = 0;
while (my $row = <$fh>) {
	chomp $row;
	my @words = split /\s/, $row;
	if (!has_anagrams(@words)) {
		$valid++;
	}
}
print "Number of valid passphrases: " . $valid . "\n";

sub has_anagrams {
	my @words = @_;
	my $length = scalar @words;
	for (my $i = 0; $i < $length - 1; $i++) {
		for (my $j = $i + 1; $j < $length; $j++) {
			if ( are_anagrams(@words[$i], @words[$j]) ) {
				return 1;
			}
		}
	}
	return 0;
}

sub are_anagrams {
	my ($word1, $word2) = @_;
	return 0 if (scalar $word1 != scalar $word2);
	my @word1_arr = sort(split //, $word1);
	my @word2_arr = sort(split //, $word2);
	for (my $i = 0; $i < scalar @word1_arr; $i++) {
		if ($word1_arr[$i] ne $word2_arr[$i]) {
			return 0;
		}
	}
	return 1;	
}
