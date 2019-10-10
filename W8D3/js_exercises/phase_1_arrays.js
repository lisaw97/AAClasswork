Array.prototype.uniq = function() {
  let uniq_arr = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniq_arr.includes(this[i])) {
      uniq_arr.push(this[i]);
    }
  }
  return uniq_arr;
}

Array.prototype.twoSum = function() {
  let result = [];

  for (let i = 0; i < this.length - 1; i++){
    for(let j = i + 1; j < this.length; j++){
      if ((this[i] + this[j]) === 0) {
        result.push([i,j]);
      } 
    }
  }
  return result;
}

Array.prototype.transpose = function() {
  let result = [];

  for (let i = 0; i < this[0].length; i++){
    let row = [];
    for(let j = 0; j < this.length; j++){
      row.push(this[j][i]);
    }
    result.push(row);
  }
  return result;
}