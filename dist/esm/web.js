import { WebPlugin } from '@capacitor/core';
export class OfflineDBWeb extends WebPlugin {
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
//# sourceMappingURL=web.js.map