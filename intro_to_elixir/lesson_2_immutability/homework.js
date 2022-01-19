// A

let info = { name: "john", career: "programmer", city: "vancouver" }
let info1 = info;

info = { name: "John", career: "Programmer", city: "Vancouver" }
// console.log(info.name)
// console.log(info1.name)

// B

// immutable 
let string = "wjekrhkwejrhkwejhrkwejhr"

let capitalizeString = (string) => {

  let newString = '';
  for (let i = 0; i < string.length; i++) {
    if ((i % 3) == 0) {
      newString += string.charAt(i).toUpperCase()
    } else newString += string[i]
  }
  console.log(newString)

}

capitalizeString(string)
console.log(string)

