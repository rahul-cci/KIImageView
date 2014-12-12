//
//  KIImageView.h
//  KIImageViewDemo
//
//  Created by Rahul Shettigar on 09/12/14.
//  Copyright (c) 2014 Creative Capsule Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface KIImageView : UIImageView


/**
 *  Url for the Image
 **/
@property (nonatomic,strong) NSString *URL;

/**
 *  progressHUD
 **/
@property (nonatomic, strong) MBProgressHUD *progressHUD;



/**
 *  loads the image in background
 *  @param - callBack: completion block to be invoked when download completes.
 */
- (void)loadInBackgroundWithCallback:(void(^)(BOOL))callBack;
@end
