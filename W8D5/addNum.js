const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCb){
  if (numsLeft === 0){
    completionCb(sum);
  }else{
    let currentsum = sum;
    reader.question("please enter a number ", function (answer) {
      currentsum += parseInt(answer);
      console.log(`${currentsum}`);
      return addNumbers(currentsum, numsLeft - 1, completionCb);
    });
    
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


