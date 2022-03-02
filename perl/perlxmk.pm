#!/usr/bin/perl
use v5.34;
use strict;
use warnings;

my @path = `ls -d \$(pwd))/*`; # get filenames
my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
my $texscope = @tex; # how long is the list?
for(my $i=0;$i<$texscope;$i++) {
	print $tex[$i]; # print current tex file
	system("latexmk -lualatex $tex[$i]"); # latexmk all files
}

