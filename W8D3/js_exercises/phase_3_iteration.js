function bubbleSort(arr) {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        let temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        sorted = false;
      }
    }
  }
  return arr;
}

function substrings(str) {
  let new_arr = [];
  for (let i = 0; i < str.length; i++) {
    for (let j = i; j < str.length; j++){
      if (i === j){
        new_arr.push(str[i]);
      } else {
        new_arr.push(str.slice(i, j + 1));
      }
    }
  }
  return new_arr;
}

