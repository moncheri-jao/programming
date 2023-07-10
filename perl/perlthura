#!/usr/bin/perl
use v5.34;
use strict;
use warnings;

sub help () {
	say "This Perl script launches zathura pdf reader from a nested folder or from the same folder, depending on what argument is given.";
	say "Usage:\t -s open from subfolder";
	say "      \t -f open from folder";
	say "      \t -h print this help";
	say "Its usage comes from being too lazy to open it myself while using ViM writing notes, enjoy, -MC";
	return;
}
my $arg = $ARGV[0];
if( ! length $ARGV[0] ) {
	help();
	die "ERROR: no arguments given";
} else {
	my $arg = $ARGV[0];
}
if($arg eq "-h") {
	help();
	exit 0;
}
if($arg eq "-s") {
	my @fnames = `ls -d \$(dirname \$(pwd))/*`;
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @fnames;
	my @book = grep { grep { s/\.(tex)/\.pdf/g } $_ } @tex;
	if (scalar(@book) == 0){
		die "No .pdf found!";
	}
	exec("zathura $book[0]");
	exit 0;
} elsif($arg eq "-f") {
	my @fnames = `ls -d \$(pwd)/*`;
	my @tex = grep { grep { /(\w.+)\.(tex)/g } $_ } @fnames;
	my @book = grep { grep { s/\.(tex)/\.pdf/g } $_ } @tex;
	if (scalar(@book) == 0){
		die "No .pdf found!";
	}
	exec("zathura $book[0]");
	exit 0;
}
