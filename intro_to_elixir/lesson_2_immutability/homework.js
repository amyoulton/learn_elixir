// A

let info = { name: "john", career: "programmer", city: "vancouver" }
let info1 = info;

info = { name: "John", career: "Programmer", city: "Vancouver" }
console.log(info.name)
console.log(info1.name)

// Tam's solution to exercise A

const info = { name: "john", career: "programmer", city: "vancouver" }

function capitalize(string) {
  return string[0].toUpperCase() + string.slice(1)
}

info.name = capitalize(info.name) // this type of code will mutate the object
info.career = capitalize(info.career)
info.city = capitalize(info.city)

const infoCap = { name: capitalize(info.name), career: capitalize(info.career), city: capitalize(info.city) } // makes a copy so it doesn't copy the initial code

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

