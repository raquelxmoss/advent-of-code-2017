// The captcha requires you to review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list. The list is circular, so the digit after the last digit is the first digit in the list.

// For example:

//     1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
//     1111 produces 4 because each digit (all 1) matches the next.
//     1234 produces 0 because no digit matches the next.
//     91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

function solve (input : number[], offset: number) : number {
  return input.reduce((acc : number, curr : number, index : number) : number => {
    const next = input[(index + offset) % input.length];

    if (curr === next) {
      return acc + curr;
    } else {
      return acc;
    }
  }, 0);
}

function parseInput (input : string) : number[] {
  return input.toString().split('').map(char => parseInt(char));
}

console.log(solve(parseInput("1122"), 1) === 3)
console.log(solve(parseInput("1111"), 1) === 4)
console.log(solve(parseInput("1234"), 1) === 0)
console.log(solve(parseInput("91212129"), 1) === 9)
console.log(solve(parseInput("1212"), 2) === 6)
console.log(solve(parseInput("1221"), 2) === 0)
console.log(solve(parseInput("123425"), 3) === 4)
console.log(solve(parseInput("123123"), 3) === 12)
console.log(solve(parseInput("12131415"), 4) === 4)
