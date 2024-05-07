import { WebPlugin } from '@capacitor/core';

import type { OfflineDBPlugin } from './definitions';

export class OfflineDBWeb extends WebPlugin implements OfflineDBPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
