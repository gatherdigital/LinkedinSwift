//
//  LSLinkedinToken.m
//  LinkedinSwift
//
//  Created by Li Jiantang on 19/11/2015.
//  Copyright © 2015 Carma. All rights reserved.
//

#import "LSLinkedinToken.h"
#import <linkedin-sdk/LISDK.h>

@implementation LSLinkedinToken
@synthesize serializedToken, isFromMobileSDK;

- (instancetype)initWithAccessToken:(NSString*)_accessToken fromMobileSDK:(BOOL)_isFromMobileSDK {
    
    if (self = [super init]) {
        
        serializedToken = _accessToken;
        isFromMobileSDK = _isFromMobileSDK;
    }
    
    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"<LSLinkedinToken - serializedToken: %@, expireDate: %@>", serializedToken, [LISDKAccessToken LISDKAccessTokenWithSerializedString:serializedToken].expiration];
}

- (BOOL)isExpired {
  return [[LISDKAccessToken LISDKAccessTokenWithSerializedString:serializedToken].expiration timeIntervalSinceNow] < 0;
}

@end
