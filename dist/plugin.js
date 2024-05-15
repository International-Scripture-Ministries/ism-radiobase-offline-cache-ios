var capacitorOfflineDB = (function (exports, core) {
    'use strict';

    const OfflineDB = core.registerPlugin('OfflineDB', {
        web: () => Promise.resolve().then(function () { return web; }).then(m => new m.OfflineDBWeb()),
    });

    class OfflineDBWeb extends core.WebPlugin {
        async echo(options) {
            console.log('ECHO', options);
            return options;
        }
        async getAllBooks() {
            return { result: "" };
        }
        async getVerses(obj) {
            console.log(obj);
            return { result: "" };
        }
        async getBookTeaching(obj) {
            console.log(obj);
            return { result: "" };
        }
        async getTeachings(obj) {
            console.log(obj);
            return { result: "" };
        }
        async getTeaching(obj) {
            console.log(obj);
            return { result: "" };
        }
        async getTotalDownloads() {
            return { result: "" };
        }
        async getDownloadList(obj) {
            console.log(obj);
            return { result: "" };
        }
        async getPercentage(obj) {
            console.log(obj);
            return { result: "" };
        }
        async getBookPercentage(obj) {
            console.log(obj);
            return { result: "" };
        }
        async updateDownload(obj) {
            console.log(obj);
            return { result: "" };
        }
        async deleteDownloads(obj) {
            console.log(obj);
            return { result: "" };
        }
        async delete(obj) {
            console.log(obj);
            return { result: "" };
        }
        async getBookDownloads(obj) {
            console.log(obj);
            return { result: "" };
        }
    }

    var web = /*#__PURE__*/Object.freeze({
        __proto__: null,
        OfflineDBWeb: OfflineDBWeb
    });

    exports.OfflineDB = OfflineDB;

    Object.defineProperty(exports, '__esModule', { value: true });

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
