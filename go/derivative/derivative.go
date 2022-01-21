package main

import (
	"fmt"
	"math" 
)

func f (x float64) float64 {
	return (math.Sqrt(x));
}

func derivative (f func (float64) float64, x float64, eps float64) float64 {
	return( (f(x+eps) - f(x))/eps );
}

func main () {
	var eps float64 = 1e-10;
	var rng float64 = 1;
	var x float64 = 1;
	fmt.Println("Insert a maximum value for x {[1,x)}");
	fmt.Scan(&rng);
	fmt.Println("x \t\t f'(x)");
	fmt.Println("----------------------------");
	for x < rng {
		fmt.Println(x,"|\t|",derivative(f, x, eps));
		x += 1;
	}
}
