#import "BackgroundTask.h"
#import <UIKit/UIKit.h>

@implementation BackgroundTask {
    UIBackgroundTaskIdentifier backgroundTask;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(startBackgroundTask:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    backgroundTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:self->backgroundTask];
        self->backgroundTask = UIBackgroundTaskInvalid;
    }];

    resolve(@(backgroundTask));
}

RCT_EXPORT_METHOD(endBackgroundTask:(nonnull NSNumber *)taskId
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if ([taskId integerValue] != UIBackgroundTaskInvalid) {
        [[UIApplication sharedApplication] endBackgroundTask:[taskId integerValue]];
    }
    resolve(nil);
}

@end
