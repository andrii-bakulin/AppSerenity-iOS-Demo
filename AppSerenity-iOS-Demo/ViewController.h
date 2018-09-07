//
//  ViewController.h
//  AppSerenity-iOS-Demo
//
//  Created by Andrii Bakulin on 9/7/18.
//  Copyright © 2018 Duksel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppSerenityAds.h"
#import "AppSerenityInterstitial.h"
#import "AppSerenityRewardedVideo.h"

@interface ViewController : UIViewController <AppSerenityAdsDelegate>
{
    AppSerenityAds* adsInstance;

    IBOutlet UIButton* buttonBannerShow;
    IBOutlet UIButton* buttonBannerHide;
    IBOutlet UIActivityIndicatorView* activityBannerIndicator;
    IBOutlet UIView*   placeholderForBanner;
}

@end
