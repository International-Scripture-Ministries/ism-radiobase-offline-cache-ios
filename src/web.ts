import { WebPlugin } from '@capacitor/core';

import type { OfflineDBPlugin } from './definitions';

export class OfflineDBWeb extends WebPlugin implements OfflineDBPlugin {

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async getAllBooks(): Promise<{ result: any }> {
    return { result: "" };
  }
  async getVerses(bookId: string, bibleId: String, chapterNumber: Number): Promise<{ result: any }> {
    console.log(bookId);
    console.log(bibleId);
    console.log(chapterNumber);
    return { result: "" };
  }
  async getBookTeaching(book_id: string): Promise<{ result: any }> {
    console.log(book_id);
    return { result: "" };
  }
  async getTeachings(bible_book: string): Promise<{ result: any }> {
    console.log(bible_book);
    return { result: "" };
  }
  async getTeaching(book_id: string, teaching_uuid: string): Promise<{ result: any }> {
    console.log(book_id);
    console.log(teaching_uuid);
    return { result: "" };
  }
  async getTotalDownloads(): Promise<{ result: any }> {
    return { result: "" };
  }
  async getDownloadList(book_id: string, file_type: string): Promise<{ result: any }> {
    console.log(book_id);
    console.log(file_type);
    return { result: "" };
  }
  async getPercentage(book_id: string, file_type: string): Promise<{ result: any }> {
    console.log(book_id);
    console.log(file_type);
    return { result: "" };
  }
  async getBookPercentage(file_type: string): Promise<{ result: any }> {
    console.log(file_type);
    return { result: "" };
  }
  async updateDownload(file_name: string, local_path: String): Promise<{ result: any }> {
    console.log(file_name);
    console.log(local_path);
    return { result: "" };
  }
  async deleteDownloads(book_id: string, file_type: String, chapterDownloads: Boolean, studyDownloads: Boolean): Promise<{ result: any }> {
    console.log(book_id);
    console.log(file_type);
    console.log(chapterDownloads);
    console.log(studyDownloads);
    return { result: "" };
  }
  async delete(book_id: string, file_type: String, chapter_number: String, uuid: String): Promise<{ result: any }> {
    console.log(book_id);
    console.log(file_type);
    console.log(chapter_number);
    console.log(uuid);
    return { result: "" };
  }
  async getBookDownloads(book_id: string): Promise<{ result: any }> {
    console.log(book_id);
    return { result: "" };
  }
}
