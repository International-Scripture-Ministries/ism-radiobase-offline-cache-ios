export interface OfflineDBPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    getAllBooks(): Promise<{
        result: any;
    }>;
    getVerses(bookId: string, bibleId: String, chapterNumber: Number): Promise<{
        result: any;
    }>;
    getBookTeaching(book_id: string): Promise<{
        result: any;
    }>;
    getTeachings(bible_book: string): Promise<{
        result: any;
    }>;
    getTeaching(book_id: string, teaching_uuid: string): Promise<{
        result: any;
    }>;
    getTotalDownloads(): Promise<{
        result: any;
    }>;
    getDownloadList(book_id: string, file_type: string): Promise<{
        result: any;
    }>;
    getPercentage(book_id: string, file_type: string): Promise<{
        result: any;
    }>;
    getBookPercentage(file_type: string): Promise<{
        result: any;
    }>;
    updateDownload(file_name: string, local_path: String): Promise<{
        result: any;
    }>;
    deleteDownloads(book_id: string, file_type: String, chapterDownloads: Boolean, studyDownloads: Boolean): Promise<{
        result: any;
    }>;
    delete(book_id: string, file_type: String, chapter_number: String, uuid: String): Promise<{
        result: any;
    }>;
    getBookDownloads(book_id: string): Promise<{
        result: any;
    }>;
}
