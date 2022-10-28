const functions = require("firebase-functions");

exports.toUpperCase = functions.https.onCall((data, _) => {
    return data.toString().toUpperCase();
});
