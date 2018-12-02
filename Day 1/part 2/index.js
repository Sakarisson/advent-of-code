const fs = require('fs');
const path = require('path');

const input = fs.readFileSync(path.join(__dirname, './input.txt'))
  .toString()
  .trim()
  .split('\r\n');

const reachedValues = [0];
const length = input.length;

for (let i = 0; ; i = (i + 1) % length) {
  const lastValue = reachedValues[reachedValues.length - 1];
  const nextValue = parseInt(input[i]) + lastValue;
  if (reachedValues.includes(nextValue)) {
    console.log(nextValue);
    break;
  }
  reachedValues.push(nextValue);
}
