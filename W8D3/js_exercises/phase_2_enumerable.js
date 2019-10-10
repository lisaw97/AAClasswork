Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i ++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  let new_arr = [];
  this.myEach(function(el) {
    new_arr.push(callback(el));
  });
  return new_arr;
};

Array.prototype.myReduce = function(callback, initialValue) {
  let acc = 0;

  if (initialValue) {
    acc = initialValue;
  };


  this.myEach(function(el) {
    acc += el;
  });
  return acc;
};

console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}, 25));

