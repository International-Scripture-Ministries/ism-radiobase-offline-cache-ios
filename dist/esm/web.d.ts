import { WebPlugin } from '@capacitor/core';
import type { OfflineDBPlugin } from './definitions';
export declare class OfflineDBWeb extends WebPlugin implements OfflineDBPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    getAllBooks(): Promise<{
        result: any;
    }>;
    getVerses(obj: any): Promise<{
        result: any;
    }>;
    getBookTeaching(obj: any): Promise<{
        result: any;
    }>;
    getTeachings(obj: any): Promise<{
        result: any;
    }>;
    getTeaching(obj: any): Promise<{
        result: any;
    }>;
    getTotalDownloads(): Promise<{
        result: any;
    }>;
    getDownloadList(obj: any): Promise<{
        result: any;
    }>;
    getPercentage(obj: any): Promise<{
        result: any;
    }>;
    getBookPercentage(obj: any): Promise<{
        result: any;
    }>;
    updateDownload(obj: any): Promise<{
        result: any;
    }>;
    deleteDownloads(obj: any): Promise<{
        result: any;
    }>;
    delete(obj: any): Promise<{
        result: any;
    }>;
    getBookDownloads(obj: any): Promise<{
        result: any;
    }>;
}
