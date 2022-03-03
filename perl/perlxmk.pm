#!/usr/bin/perl
use v5.34;
use strict;
use warnings;

sub latexmk {
my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("latexmk -lualatex $tex[$i]"); # latexmk all files
	}
}
sub lualatex {
my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("lualatex $tex[$i]"); # latexmk all files
	}
}
sub pdflatex {
my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("pdflatex $tex[$i]"); # latexmk all files
	}
}
sub xelatex {
my @path = `$command`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		print $tex[$i]; # print current tex file
		system("xelatex $tex[$i]"); # latexmk all files
	}
}
sub help {
	say "Welcome to the Perlxmk LaTeX compiler. It can compile MULTIPLE .tex files with your chosen compilator."
	say "Usage:\t -d LaTeXm -lualatex"
	say "      \t -l LuaLaTeX"
	say "      \t -x XeLaTeX"
	say "      \t -p pdfLaTeX"
	say "      \t --subfile compile from subfile (as second arg obv)"
	say "      \t -h print this help"
}

my $arg = $ARGV[0];
if($ARGV[0] eq "") {
	say "ERROR: no compiler chosen"
	help();
	exit 1;
} elsif($ARGV[0] neq "" and $ARGV[1] eq "") {
	my $arg = $ARGV[0];
	my $command = "ls -d \$(pwd)/*";

} elsif($ARGV[0] neq "" and $ARGV[1] eq "--subfile") {
	my $arg = $ARGV[0];
	my $command = "ls -d \$(dirname \$(pwd)/*)";
} else {
	say "PANIC: what????"
	help();
	exit 1;
}
if($arg eq "-d") {
	latexmk();
} elsif($arg eq "-l") {
	lualatex();
} elsif($arg eq "-x") {
	xelatex();
} elsif($arg eq "-p") {
	pdflatex();
} else {
	help();
}
exit 0;
