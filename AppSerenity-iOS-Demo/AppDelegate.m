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
    [AppSerenity startSessionWithAppId:@"10002" appSecret:@"12345678901234567890123456789012"];
    [AppSerenity setCustomUserId:@"DemoUserId"];
    return YES;
}

@end
