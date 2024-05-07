import { registerPlugin } from '@capacitor/core';

import type { OfflineDBPlugin } from './definitions';

const OfflineDB = registerPlugin<OfflineDBPlugin>('OfflineDB', {
  web: () => import('./web').then(m => new m.OfflineDBWeb()),
});

export * from './definitions';
export { OfflineDB };
