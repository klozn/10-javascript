class Person {
	constructor(firstName, lastName) {
		this.firstName = firstName;
		this.lastName = lastName;
	}

	talk() {
		console.log(`Hi! My name is ${this.firstName}`);
	}

	delayedTalk() {
		setTimeout(() => this.talk(), 500);
	}
}

new Person('Gilliam', 'Flebus').delayedTalk();