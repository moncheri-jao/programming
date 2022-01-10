function spinWords(string) {
	let morethanfive = ' ';
	morethanfive = string.split(" ").map( word => { 
		word.length > 4 ? word = word.split("").reverse().join("") : word = word;
		return word;
	}).join(" ");
	return morethanfive;
}
let b = spinWords("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum");
console.log(b);
