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
        async getVerses(bookId, bibleId, chapterNumber) {
            console.log(bookId);
            console.log(bibleId);
            console.log(chapterNumber);
            return { result: "" };
        }
        async getBookTeaching(book_id) {
            console.log(book_id);
            return { result: "" };
        }
        async getTeachings(bible_book) {
            console.log(bible_book);
            return { result: "" };
        }
        async getTeaching(book_id, teaching_uuid) {
            console.log(book_id);
            console.log(teaching_uuid);
            return { result: "" };
        }
        async getTotalDownloads() {
            return { result: "" };
        }
        async getDownloadList(book_id, file_type) {
            console.log(book_id);
            console.log(file_type);
            return { result: "" };
        }
        async getPercentage(book_id, file_type) {
            console.log(book_id);
            console.log(file_type);
            return { result: "" };
        }
        async getBookPercentage(file_type) {
            console.log(file_type);
            return { result: "" };
        }
        async updateDownload(file_name, local_path) {
            console.log(file_name);
            console.log(local_path);
            return { result: "" };
        }
        async deleteDownloads(book_id, file_type, chapterDownloads, studyDownloads) {
            console.log(book_id);
            console.log(file_type);
            console.log(chapterDownloads);
            console.log(studyDownloads);
            return { result: "" };
        }
        async delete(book_id, file_type, chapter_number, uuid) {
            console.log(book_id);
            console.log(file_type);
            console.log(chapter_number);
            console.log(uuid);
            return { result: "" };
        }
        async getBookDownloads(book_id) {
            console.log(book_id);
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
