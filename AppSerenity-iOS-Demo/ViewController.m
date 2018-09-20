//
//  ViewController.m
//  AppSerenity-iOS-Demo
//
//  Created by Andrii Bakulin on 9/7/18.
//  Copyright © 2018 Duksel. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)dealloc
{
    if( adsInstance )
    {
        [adsInstance stopRequestAds];
    }
}

//----------------------------------------------------------------------------------------------------------------------
#pragma mark - Banners

- (IBAction)clickOnBannerShow
{
    if( adsInstance != nil )
        return;

    adsInstance = [AppSerenityAds new];
    [adsInstance startRequestAdsWithDelegate:self];

    // UI changed
    [activityBannerIndicator startAnimating];
    [buttonBannerShow setEnabled:NO];
    [buttonBannerHide setEnabled:YES];
}

- (IBAction)clickOnBannerHide
{
    if( adsInstance == nil )
        return;

    [adsInstance stopRequestAds];
    adsInstance = nil;

    // UI changed
    [activityBannerIndicator stopAnimating];
    [buttonBannerShow setEnabled:YES];
    [buttonBannerHide setEnabled:NO];
}

//----------------------------------------------------------------------------------------------------------------------
#pragma mark - Banners : Delegate : required

- (void)AppSerenityAdsRequireShowBannerView:(UIView*)bannerBox
{
    [self debugMessage:@"Banner loaded & RequireShowBannerView"];

    // Add bannerBox-view to somewhere..
    [placeholderForBanner addSubview:bannerBox];
    
    // Set position of banner where you want..
    [bannerBox setCenter:CGPointMake( placeholderForBanner.frame.size.width/2.f, placeholderForBanner.frame.size.height/2.f )];
}

- (void)AppSerenityAdsRequireHideBannerView:(UIView*)bannerBox
{
    [self debugMessage:@"Banner unloaded & RequireHideBannerView"];

    // Require remove banner from view where it was showed before
    [bannerBox removeFromSuperview];
}

//----------------------------------------------------------------------------------------------------------------------
#pragma mark - Banners : Delegate : optional

- (void)AppSerenityAdsBannerDidRefresh:(UIView*)bannerBox
{
    [self debugMessage:@"Banner did refresh"];
}

- (void)AppSerenityAdsFailedLoadBannerWithError:(NSString*)error
{
    [self debugMessage:[NSString stringWithFormat:@"Banner - Failed to load (Error: %@)",error]];
}

//----------------------------------------------------------------------------------------------------------------------
#pragma mark - Interstitial

- (IBAction)clickOnIntestitialIsReady
{
    BOOL isReady = [AppSerenityInterstitial isReady];
    [self showMessage:(isReady ? @"Ready" : @"Not ready")
                title:@"Intestitial"];
}

- (IBAction)clickOnIntestitialShow
{
    BOOL isInterstitialShowed = [AppSerenityInterstitial showAdWithCallback:^{
        [self showMessage:@"Interstitial did closed"
                    title:@"Intestitial"];
    }];
    
    if( isInterstitialShowed == NO )
    {
        [self showMessage:@"Interstitial not showed/not ready (ps: callback will not be call)"
                    title:@"Intestitial"];
    }
}

//----------------------------------------------------------------------------------------------------------------------
#pragma mark - Interstitial : Forcecd

- (IBAction)clickOnIntestitialIsReadyForced
{
    BOOL isReady = [AppSerenityInterstitial isReadyForced];
    [self showMessage:(isReady ? @"Ready" : @"Not ready")
                title:@"Intestitial (forced)"];
}

- (IBAction)clickOnIntestitialShowForced
{
    BOOL isInterstitialShowed = [AppSerenityInterstitial showAdForcedWithCallback:^{
        [self showMessage:@"Interstitial did closed"
                    title:@"Intestitial (forced)"];
    }];
    
    if( isInterstitialShowed == NO )
    {
        [self showMessage:@"Interstitial not showed/not ready (ps: callback will not be call)"
                    title:@"Intestitial (forced)"];
    }
}

//----------------------------------------------------------------------------------------------------------------------
#pragma mark - Rewarded Video

- (IBAction)clickOnRewardedVideoIsReady
{
    BOOL isReady = [AppSerenityRewardedVideo isReady];
    [self showMessage:(isReady ? @"Ready" : @"Not ready")
                title:@"Rewarded Video"];
}

- (IBAction)clickOnRewardedVideoPlay
{
    [AppSerenityRewardedVideo playInViewController:self
                                      withCallback:^(BOOL success)
     {
         [self showMessage:(success ? @"Successfully completed! Give reward for user" : @"Ups.. Not completed! No rewards")
                     title:@"Rewarded Video"];
     }];
}

//----------------------------------------------------------------------------------------------------------------------
#pragma mark - Rewarded Video

- (void)debugMessage:(NSString*)message
{
    NSLog(@"AppSerenity: DebugMessage: %@", message);
}

- (void)showMessage:(NSString*)message title:(NSString*)title
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

@end
