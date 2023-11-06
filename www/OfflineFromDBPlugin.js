var exec = require('cordova/exec');


module.exports = {
    initOfflineFromDBPlugin: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "initOfflineFromDBPlugin", [input]);
    },
    getAllBooks: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getAllBooks", [input]);
    },
    getVerses: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getVerses", [input]);
    },
    getBookTeaching: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getBookTeaching", [input]);
    },
    getTeachings: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getTeachings", [input]);
    },
    getTeaching: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getTeaching", [input]);
    }
};
