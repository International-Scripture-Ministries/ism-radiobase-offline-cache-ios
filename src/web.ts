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
  async getVerses(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async getBookTeaching(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async getTeachings(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async getTeaching(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async getTotalDownloads(): Promise<{ result: any }> {
    return { result: "" };
  }
  async getDownloadList(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async getPercentage(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async getBookPercentage(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async updateDownload(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async deleteDownloads(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async delete(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
  async getBookDownloads(obj: any): Promise<{ result: any }> {
    console.log(obj);
    return { result: "" };
  }
}
