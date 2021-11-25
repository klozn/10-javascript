function printProperties(object) {
    const propertyKeys = Object.keys(object);
    console.log(`This object has ${propertyKeys.length} properties: ${appendKeys(propertyKeys)}`);
}

function appendKeys(keyArray) {
    let appended = '';
    for (let i = 0; i < keyArray.length - 1; i++) {
        appended += (keyArray[i] + ', ');
    }
    return appended + `and ${keyArray[keyArray.length - 1]}.`;
}

printProperties({id: 1, name: 'Timon', species: 'Meerkat', friend: 'Pumba' });