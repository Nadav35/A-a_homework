function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`);
}

function isSubstring(searchString, subString) {
  console.log(searchString.includes(subString));

}

function fizzBuzz(array) {
  let arr = [];
  array.forEach (fn => {
    if ((fn % 3 === 0) ^ (fn % 5 === 0)) {
      arr.push(fn);
    }
  });
  return arr;
}

function isPrime(num) {
  let i = 2;
  while (i < num) {
    if (num % i === 0){
      return false;
    }
    i++;
  }
  return true;
}

function sumOfNPrimes(num) {
  let sum = 0;
  let counter = 0;
  let primes = 2;
  while (counter < num) {
    if (isPrime(primes)) {
      sum += primes;
      counter++;
    }

    primes++;
  }
  return sum;
}

function titleize(array, callback) {
  let newNames = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(newNames);
}

titleize(["Nadav", "Dani", "ella"], (cb) => {
  cb.forEach(name => console.log(name));
});

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumper = function () {
  console.log(`${this.name} the elephant goes 'phrRRR!!!`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (trick){
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  let random = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[random]}!`);
};

Elephant.prototype.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(elephant => elephant.paradeHelper(elephant));

function dinerBreakfast() {
  let order = "I'd like some shakshuka please";
  console.log(order);

  return function (addFood) {
    order = `${order.slice(0, order.length - 8)} and ${addFood} please.`;
    console.log(order);
  };
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
