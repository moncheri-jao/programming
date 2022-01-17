# FOR FUTURE SELF

This folder might be useful for playing with flags for gcc. For now remember

1. If a binary self-compiles at execution
	- make sure that there's some bootstrap code (Makefile)
	- check twice that the .exe doesn't recompile over the bootstrap code
2. If you don't want to use a Makefile
	- Use a bash script. Don't forget bootstrapping.
3. Properly parse file and system return values. Remember that, as for system(3) manpage:
	- int system(static char \*);
	- system() gets a static char pointer (string) and pops out a value, as follows:
	
	- !0 if there's a shell, 0 if there is no shell to call
	- -1 if it can't create a child process
	- 127 if the shell can't be executed in the child process
	- whatever the child shell gives back if it executes

## REMEMBER: int system(static char\*)
### SYSTEM() IS POSIX-2001, POSIX-2008, C89 AND C99 COMPLIANT.
