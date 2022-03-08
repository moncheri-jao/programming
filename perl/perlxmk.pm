#!/usr/bin/perl
use v5.34;
use strict;
use warnings;

sub latexmk ($$) {
	my @args = @_;
	my @path = `$args[0]`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	if (scalar(@tex) == 0) {
		die "ERROR: no .tex file found!";
	}
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		if($args[1] == 1) {
			system("cd ../ && latexmk -lualatex $tex[$i]"); # latexmk all files
		} else {
			system("latexmk -lualatex $tex[$i]"); # latexmk all files
		}
	}
	return;
}
sub lualatex ($$) {
	my @args = @_;
	my @path = `$args[0]`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	if (scalar(@tex) == 0) {
		die "ERROR: no .tex file found!";
	}
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		if($args[1] == 1) {
			system("cd ../ && latexmk -lualatex $tex[$i]"); # latexmk all files
		} else {
			system("lualatex $tex[$i]"); # latexmk all files
		}
	}
	return;
}
sub pdflatex ($$) {
	my @args = @_;
	my @path = `$args[0]`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	if (scalar(@tex) == 0) {
		die "ERROR: no .tex file found!";
	}
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		if($args[1] == 1) {
			system("cd ../ && latexmk -lualatex $tex[$i]"); # latexmk all files
		} else {
			system("pdflatex $tex[$i]"); # latexmk all files
		}
	}
	return;
}
sub xelatex ($$) {
	my @args = @_;
	my @path = `$args[0]`; # get filenames
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @path; # grep out the .tex files
	if (scalar(@tex) == 0) {
		die "ERROR: no .tex file found!";
	}
	my $texscope = @tex; # how long is the list?
	for(my $i=0;$i<$texscope;$i++) {
		if($args[1] == 1) {
			system("cd ../ && latexmk -lualatex $tex[$i]"); # latexmk all files
		} else {
			system("xelatex $tex[$i]"); # latexmk all files
		}
	}
	return;
}
sub help () {
	say "Welcome to the Perlxmk LaTeX compiler helper. It can compile MULTIPLE .tex files with your chosen compilator.";
	say "Usage:\t -d LaTeXm -lualatex";
	say "      \t -l LuaLaTeX";
	say "      \t -x XeLaTeX";
	say "      \t -p pdfLaTeX";
	say "      \t --subfile compile from subfile (as second arg obv)";
	say "      \t -h print this help";
	print "\n";
	say "Completed testing 04/03/2022 1748Z, Rome, Perl People's Programming Republic";
	say "Author, tester and self appointed Supreme Leader of the PPPR:";
	say "-MC";
	return;
}

my $arg = $ARGV[0];
my $command = "ls -d \$(pwd)/*";
my $sub = 0;
if( ! length $ARGV[0] ) {
	die "ERROR: no compiler chosen";
} elsif( length $ARGV[0] && ! length $ARGV[1]) {
	$arg = $ARGV[0];
} elsif( length $ARGV[0] && $ARGV[1] eq "--subfile") {
	$arg = $ARGV[0];
	$command = "ls -d \$(dirname \$(pwd))/*";
	$sub = 1;
} else {
	say "PANIC: what????";
	help();
	exit 1;
}
if($arg eq "-d") {
	latexmk($command,$sub);
} elsif($arg eq "-l") {
	lualatex($command,$sub);
} elsif($arg eq "-x") {
	xelatex($command,$sub);
} elsif($arg eq "-p") {
	pdflatex($command,$sub);
} elsif($arg eq "-h") {
	help();
} else {
	say "WARNING: incorrect usage! Check the help here below (it's the same that pops out with -h)";
	help();
}
exit 0;
