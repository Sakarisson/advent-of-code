const fs = require('fs');
const path = require('path');

const data = fs.readFileSync(path.join(__dirname, './input.txt'))
  .toString()
  .trim()
  .split('\r\n');

const reducer = (acc, curr) => parseInt(acc) + parseInt(curr);

console.log(data.reduce(reducer, 0));
