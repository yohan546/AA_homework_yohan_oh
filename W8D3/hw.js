function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
      var x = 'in block';  
      console.log(x);
    }
    console.log(x);
}

mysteryScoping1;
 
function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

mysteryScoping2;
 
function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

mysteryScoping3;
 
function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

mysteryScoping4;
 
function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

mysteryScoping5;

function madLib(verb, adj, noun) {
  console.log(`We shall ${verb} the ${adj} ${noun}.`)
}

madLib("cook", "best", "dinner");

function isSubstring(searchString, subString) {
  const words = searchString.split(" ");

  for (let i = 0; i < words.length; i++) {
    if (words[i] === subString) {
      return true

    }
  }
  
  return false 
}

console.log(isSubstring("time to program", "time"))
console.log(isSubstring("Jump for joy", "joys"))

function fizzBuzz(array) {
  const fizzed = [];

  for (let i = 0; i < array.length; i++) {
    const num = array[i];

    if ((num % 3 === 0 || num % 5 === 0) && num % 15 !== 0) {
      fizzed.push(num)
    }
  }

  return fizzed;
}

console.log(fizzBuzz([1,2,3,4,6,10,15]))
// [3,6,10]

function isPrime(num) {
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false
    }
  }

  return true 
}

console.log(isPrime(2))
//true
console.log(isPrime(10))
//false
console.log(isPrime(15485863))
//true
console.log(isPrime(3548563))
//false

function sumOfNPrimes(n) {
  let sum = 0
  let counter = 0;


  for (let i = 2; counter < n; i++) {
    if (isPrime(i)) {
      sum += i 
      counter += 1
    }
  }

  return sum
}

console.log(sumOfNPrimes(0))
//0
console.log(sumOfNPrimes(1))
//2
console.log(sumOfNPrimes(4))
//17
