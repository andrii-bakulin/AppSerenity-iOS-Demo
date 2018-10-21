//
//  AppDelegate.m
//  AppSerenity-iOS-Demo
//
//  Created by Andrii Bakulin on 9/7/18.
//  Copyright © 2018 Duksel. All rights reserved.
//

#import "AppDelegate.h"

#import "AppSerenity.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"AppSerenitySDK = %@",[AppSerenity getSdkVersion]);

    [AppSerenity setLogLevel:kAppSerenityLogLevel_Warning]; // @notice: for RELEASE version recommended to use 'kAppSerenityLogLevel_None'
    
    [AppSerenity startSessionWithAppId:@"10002" appSecret:@"12345678901234567890123456789012"];
    [AppSerenity setCustomUserId:@"DemoUserId"];
    return YES;
}

@end
