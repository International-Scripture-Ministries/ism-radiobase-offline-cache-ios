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
    },
    getTotalDownloads: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getTotalDownloads", [input]);
    },
    getDownloadList: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getDownloadList", [input]);
    },
    getPercentage: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getPercentage", [input]);
    },
    getBookPercentage: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getBookPercentage", [input]);
    },
    updateDownload: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "updateDownload", [input]);
    },
    deleteDownloads: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "deleteDownloads", [input]);
    },
    delete: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "delete", [input]);
    },
    getBookDownloads: function (input, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "OfflineFromDBPlugin", "getBookDownloads", [input]);
    }
};
