package main

import (
	"fmt"
	"math"
);

// rand.Seed() seeds the random function

func main() {
	N, M, NGENI := 200, 20, 18;
	var cgen = [...][...]int{0};
	var model = [...]int{0};
	var i, j int;
	rand.seed(time.Now().UnixNano());
	fmt.Println("genes:");
	for i := 0; i < 200; i++ {
		for j = 0; j < 18; j++ {
			fmt.Printf("%d",[i][j]cgen);
		}
		fmt.Printf("\n");
	}
	fmt.Printf("\nmodel:");
	for var k int = 0; k < 18; k++ {
		fmt.Printf("%d",[k]model);
	}
	fmt.Printf("\n");

}

func genDNA([][]cgen int,[]model int) {
	for var i int = 0; i < 200; i++ {
		for var j int = 0; j < 18; j++ {
			[i][j]cgen = rand.Intn(4);
		}
	}
	for var k int = 0; k < 18; k++ {
		[k]model = rand.Intn(4);
	}
}
