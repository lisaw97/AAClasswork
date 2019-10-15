// sum using arguments keyword
function sum() {
  let result = 0;
  let args = Array.from(arguments);
  for (let i = 0; i < args.length; i++) {
    result += args[i];
  }
  return result;
}

// sum using rest operator
function sum1(...args) {
  let result = 0;
  for (let i = 0; i < args.length; i++) {
    result += args[i];
  }
  return result;
}

//bind with args
Function.prototype.myBind = function() {
  let ctx = Array.from(arguments)[0];
  let rest = Array.from(arguments).slice(1);
  let that = this;
  return function () {
    let args = rest.concat(Array.from(arguments));
    return that.apply(ctx, args);
  };
};

//curriedSum
function curriedSum(numArgs) {
  let numbers = [];
  let result = 0;
  return function _curriedSum(num) {
    // let num = Array.from(arguments)[0];
    numbers.push(num);
    if (numbers.length === numArgs) {
      for (let i = 0; i < numbers.length; i++) {
        result += numbers[i];
      }
      return result;
    } else {
      return _curriedSum;
    }
  };
}

//Function.prototype.curry
Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let result = 0;
  return function curriedSum() {
    let num = Array.from(arguments)[0];
    numbers.push(num);
    if(numbers.length === numArgs) {
      for(let i = 0; i < numbers.length; i++){
        result += numbers[i];
      }
      return result;
    } else {
      return curriedSum;
    }
  };
};

//Function.prototype.curry using apply
Function.prototype.curry2 = function (numArgs) {
  let numbers = [];
  let that = this;

  return function curriedSum() {
    let num = Array.from(arguments)[0];
    numbers.push(num);
    if (numbers.length === numArgs) {
      return that.apply(numArgs, numbers);
    } else {
      return curriedSum;
    }
  };
};

//Function.prototype.curry using spread operator
Function.prototype.curry3 = function (numArgs) {
  let numbers = [];
  let that = this;

  return function curriedSum() {
    let num = Array.from(arguments)[0];
    numbers.push(num);
    if (numbers.length === numArgs) {
      return that.call(numArgs, ...numbers);
    } else {
      return curriedSum;
    }
  };
};
