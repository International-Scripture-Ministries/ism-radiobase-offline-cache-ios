#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(OfflineDBPlugin, "OfflineDB",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getAllBooks, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getVerses, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getBookTeaching, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getTeachings, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getTeaching, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getTotalDownloads, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getDownloadList, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getPercentage, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getBookPercentage, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(updateDownload, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(deleteDownloads, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(delete, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getBookDownloads, CAPPluginReturnPromise);
)
