// get two numbers, swap first digit and subtract them
// NOONERIZE: ---
// 1) check that two elements of input are numbers and != NaN
// 2) convert object to string array [x,y] ---> ['x','y']
// 3) split string into 2 numbers, save first char and rest in new array [x[0],x[n-1]], [y[0].y[n-1]
// 4) recompose string with previous elements swapping the elements ['x1','y1'] = [y[0]+x[n-1],x[0]+y[n-1]]
// 5) convert string elements to numbers [x1,y1] = ['x1','y1']
// 6) check which is bigger and subtract && return x1>y1 ? x1-y1 : y1-x1
function noonerize(numbers) {
        //console.log(typeof numbers[0]+" "+typeof numbers[1]);
        if (!typeof numbers[0] === 'number' || !typeof numbers[1] === 'number' || !isNaN(numbers[0]) || !isNaN(numbers[1])) {
                return "Invalid array";
        }
        let str = String(numbers);
        //console.log(numbers);
        let [n1,n2] = str.split(",");
        let [pren1,postn1] = [n1.substr(0,1), n1.substr(1,n1.length)];
        let [pren2,postn2] = [n2.substr(0,1),n2.substr(1,n2.length)];
        str = [pren2+postn1,pren1+postn2];
        let nnumbers = [0,0];
        nnumbers[0] = Number(str[0]);
        nnumbers[1] = Number(str[1]);
        //console.log(nnumbers);
        return nnumbers[0] > nnumbers[1] ? nnumbers[0] - nnumbers[1] : nnumbers[1] - nnumbers[0];
}
var num = prompt("insert an array of two numbers");
console.log(noonerize(num));
