const fs = require('fs');
const path = require('path');

const input = fs.readFileSync(path.join(__dirname, './input.txt'))
  .toString()
  .trim()
  .split('\r\n');

const getUniqueCharacters = arr =>
  arr
    .split('')
    .filter((item, pos) => arr.indexOf(item) == pos);

const containsValueNTimes = (str, value, n) => 
  str
    .match(new RegExp(value, 'g'))
    .length === n;

const getReducer = n => (acc, curr) => {
  let found = false;
  const uniqueCharacters = getUniqueCharacters(curr);
  uniqueCharacters.forEach(character => {
    if (containsValueNTimes(curr, character, n)) {
      found = true;
    }
  });
  return found ? acc + 1 : acc;
}

const pairs = input.reduce(getReducer(2), 0);
const triples = input.reduce(getReducer(3), 0);

console.log(pairs * triples);
