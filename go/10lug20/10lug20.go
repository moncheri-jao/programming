package main

import (
	"fmt"
	"math/rand"
	"time"
);

func memorizza_in_array(n int, array [2]int) {
	var dec int;
	var unit int;
	dec = n/10;
	unit = n%10;
	array[0] = dec;
	array[1] = unit;
}

func verifica_numero(n int, array [2]int) bool {
	var exit bool = false;
	var sum, rev int;
	sum = array[0]+array[1];
	fmt.Printf("n = %d, c1c2 = %d%d, S =%d\n",n,array[0],array[1],sum);
	rev = array[1]*10+array[0];
	if (n+sum == rev) {
		fmt.Printf("Intero che soddisfa la condizione n = %d\n", n);
		exit = true;
	}
	return exit;
}

func main() {
	var n int;
	coeff := [2]int{0};
	rand.Seed(time.Now().UnixNano());
	for {
		n = rand.Intn(100);
		memorizza_in_array(n,coeff);
		if (verifica_numero(n,coeff)) {
			break;
		}
	}
	return;
}
