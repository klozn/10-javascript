const person = {
  name: "Stan",
  address: {
    street: "Route 66",
    number: 666,
    area: {
      city: "Chicago",
      country: "US"
    }
  }
};

const address = { ...person.address, number: 777};
console.log(address);

person.address.area.country = 'BE';
console.log(address);

console.log(person);