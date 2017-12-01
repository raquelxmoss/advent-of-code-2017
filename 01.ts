// The captcha requires you to review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list. The list is circular, so the digit after the last digit is the first digit in the list.

// For example:

//     1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
//     1111 produces 4 because each digit (all 1) matches the next.
//     1234 produces 0 because no digit matches the next.
//     91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

function solve (input : number) : number {
  const numerals : number[] = input.toString().split('').map(char => parseInt(char));

  return numerals.reduce((acc : number, curr : number, index : number) : number => {
    const next = numerals[(index + 1) % numerals.length];

    if (curr === next) {
      return acc + curr;
    } else {
      return acc;
    }
  }, 0);
}

console.log(solve(1122) === 3)
console.log(solve(1111) === 4)
console.log(solve(1234) === 0)
console.log(solve(91212129) === 9)
