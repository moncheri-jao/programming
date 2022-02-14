package main

import (
	"fmt"
	"math"
	"os"
)

func f (x float64) float64 {
	return (math.Sqrt(x));
}

func derivative ( f func (x float64) float64 , x float64, eps float64) float64 {
	return( (f(x+eps) - f(x))/eps );
}

func main () {
	var eps float64 = 1e-10;
	var rng float64 = 1;
	var x float64 = 1;
	stream, err := os.Create("derivative.dat");
	if err != nil {
		fmt.Println("ERROR! Cannot create file");
		panic(err);
	}
	fmt.Println("Insert a maximum value for x {[1,x)}");
	fmt.Scan(&rng);
	fmt.Println("x \t\t f'(x)");
	fmt.Println("----------------------------");
	for x < rng {
		fmt.Println(x,"|\t|",derivative(f, x, eps));
		fmt.Fprintln(stream,derivative(f,x,eps)," ",x);
		x += 0.1;
	}
	fmt.Println("----------------------------");
}
