const fs = require('fs');
const path = require('path');
const { intersection } = require('ramda');

const input = fs.readFileSync(path.join(__dirname, './input.txt'))
  .toString()
  .trim()
  .split('\r\n');

const haveNDifferingCharacters = (a, b, n) => {
  let differingChars = 0;

  a.split('').forEach((char, i) => {
    if (b[i] !== char) {
      differingChars++;
    }
  });

  return differingChars === n;
}

for (let i = 0; i < input.length; i++) {
  for (let j = i + 1; j < input.length; j++) {
    if (haveNDifferingCharacters(input[i], input[j], 1)) {
      console.log({ a: input[i], b: input[j] });
      const result = intersection(
        input[i].slice(''),
        input[j].slice(''),
      ).join('');
      console.log(result);
      break;
    }
  }
}
