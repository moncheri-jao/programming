# QUICK PERL MD 
## STORAGE
Perl has 3 storage types:
- Scalar
- Array
- Hash
Arrays && Hashes are more complex scalars
### SCALARS
Variables defined with "$" at the beginning. They can be:
- strings
- ints or floats
- refs
- filehandles
*PERL HAS TYPE INFERENCE*
N.B. Without "use strict" && "my" perl creates one and intializes it to "" or 0, autovivifying it.
N.N.B. AUTOVIVIFICATION CAN FUCK YOU UP:
Imagine doing this:
my $circumference = $pie * $diameter;
$pie doesn't exist, so it's 0 for perl and nulls everything.
### SCALAR STRINGS
PERL AUTO GETS THE LENGTH OF THE STRING!!
#### STRING LITERALS
- Double or single quotes
You can create a list with qw!!
my ($first,$last) = qw(John Doe);
QUOTES:
1. Single quotes: you see what you get
2. Double quotes: some interpolation, e.g. "\n" is the newline
#### STRING OPERATORS AND FUNCTIONS
CHOMP: Remove ONE newline at the end chomping the string;

CONCATENATION: '.' operator
my $fullname = 'firstname' . 'secondname';

REPETITION: 'x' operator. Write number of reps after it (int)
my $line = '-' x 80;

LENGTH: gives length of string
my $l = length($line); # 80

SUBSTR: substr(STRING_EXP, OFFSET, LENGTH);
spin, fold, mutilate strings with it. gets substrings (offset from beginning, for length). Can be used to replace pieces of string;

SPLIT: split(/PATTERN/, STRING_EXP, LIM);
break a string into components using a regexp pattern;

JOIN: join('SEP STRING', STRING1, STRING2);
Stitch a list of string into a single one;

QW: qw(WORDS);
Quotes WORDS for you;
### SCALAR NUMBERS
Perl uses floats for storing numbers. Auto infers ints.
#### NUMBER LITERALS
Beginning of numbers for literals:
BIN:
- '0b'
HEX:
- '0x'
OCT:
- '0'
OTHER:
- base 10
#### NUMBER FUNCTIONS
- abs(x); |x|
- int(x); float -> int
- sin(x), cos(x), tan(x); TRIG functions, in radians
- **; exponentiation operator;
-sqrt

