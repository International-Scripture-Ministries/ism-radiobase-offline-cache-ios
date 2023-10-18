var exec = require('cordova/exec');


module.exports = {
    initBibleDataFromDBPlugin: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "BibleDataFromDBPlugin", "initBibleDataFromDBPlugin", [input]);
    },
    getAllBooks: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "BibleDataFromDBPlugin", "getAllBooks", [input]);
    },
    getBibleData: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "BibleDataFromDBPlugin", "getBibleData", [input]);
    },
    getBookTeaching: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "BibleDataFromDBPlugin", "getBookTeaching", [input]);
    },
    getTeaching: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "BibleDataFromDBPlugin", "getTeaching", [input]);
    }
};
