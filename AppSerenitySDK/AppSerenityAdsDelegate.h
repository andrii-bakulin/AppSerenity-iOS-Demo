//
//  AppSerenityAdsDelegate.h
//  AppSerenitySDK
//
//  Copyright (c) 2012 Duksel Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AppSerenityAdsDelegate
@optional
- (void)AppSerenityAdsRequireShowBannerView:(UIView*)bannerBox byNetwork:(NSString*)networkId;
- (void)AppSerenityAdsRequireHideBannerView:(UIView*)bannerBox byNetwork:(NSString*)networkId;
- (void)AppSerenityAdsBannerDidRefresh:(UIView*)bannerBox byNetwork:(NSString*)networkId;
- (void)AppSerenityAdsFailedLoadBannerWithError:(NSString*)error byNetwork:(NSString*)networkId;

- (void)AppSerenityAdsUserActionShouldBegin:(UIView*)bannerBox byNetwork:(NSString*)networkId;
- (void)AppSerenityAdsUserActionDidFinish:(UIView*)bannerBox byNetwork:(NSString*)networkId;
@end
