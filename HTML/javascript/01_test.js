let now = new Date();
console.log(`현재 시각은 ${now.toLocaleString()}`);

let arr1 = new Array();
let arr2 = new Array(4);
let arr3 = ["one", "two", "three", "four"];
let arr4 = Array("one", "two", "three", "four");

let numbers = ["one", "two", "three", "four"];
for( let i = 0 ; i < numbers.length ; i++){
    console.log(`${numbers[i]}`);
}

let nums = [1, 2, 3];
let chars = ['a', 'b', 'c', 'd'];

let numsChars = nums.concat(chars);
let charsNums = chars.concat(nums);

console.log(`concat() 매서드 : ${numsChars}`);
console.log(`concat() 매서드 : ${charsNums}`);

let string1 = nums.join();
console.log(`join() 매서드 : ${string1}`);
let string2 = chars.join('/');
console.log(`join() 메서드 : ${string2}`);

let push1 = nums.push(4,5);
console.log(`push() 메서드 : length - ${nums.length}/배열- ${nums}`);

let unshift1 = nums.unshift(0);
console.log(`unshift() 매서드 : length - ${nums.length}/배열 - ${nums}`);

let pop1 = chars.pop();
console.log(`pop() 메서드의 반환값 : ${pop1}`);
console.log(`pop() 메서드 : length - ${chars.length}/배열 - ${chars}`);

let shift1 = chars.shift();
console.log(`shift() 메서드의 반환값: ${shift1}`);
console.log(`shift() 메서드 : length - ${chars.length}/배열 - ${chars}`);