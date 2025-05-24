import { registerPlugin } from '@capacitor/core';
const OfflineDB = registerPlugin('OfflineDB', {
    web: () => import('./web').then(m => new m.OfflineDBWeb()),
});
export * from './definitions';
export { OfflineDB };
//# sourceMappingURL=index.js.map