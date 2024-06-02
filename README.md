# express_deli

### A Food application that:

- Allows you to retrieve and display a list of food items from the Spoonacular
API (https://spoonacular.com/food-api)
- Allows you to select multiple food items and store them in a shopping
basket that they can check out at the end

### Requirements:

- When the app is first launched, fetch the food data from the API and store it in
the app DB. On subsequent launches, use the data from the local DB. Ensure to
check for data from your local device.
- Show the food items to the user as per the JSON.
- When a user has selected a product for purchase, persist it to their cart on the
local device
- Once they are done, show a success screen at the checkout and make a
POST request to a dummy endpoint to complete the process

### Considerations

- Use the Flutter `MobX` state management framework to develop the solution
- Use the `hive` database for when you need to store auth data locally
- Use `Isar` where you need to store items in table/collection format on the
device
- Where you need to perform any JSON serialisation, use `freezed` .
- Bonus points if you can set up a Workflow on GitHub to send the APK to
Firebase App Distribution