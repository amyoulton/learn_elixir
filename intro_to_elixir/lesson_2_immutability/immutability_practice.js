a = { name: amy, city: vancouver }
b = a; // b points to the same spot in memory

a.name = "John"
console.log(b.name) // because this was pointing to the same spot in memory, it will be "John".