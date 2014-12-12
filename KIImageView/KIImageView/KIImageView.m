//
//  KIImageView.m
//  KIImageViewDemo
//
//  Created by Rahul Shettigar on 09/12/14.
//  Copyright (c) 2014 Creative Capsule Infotech. All rights reserved.
//

#import "KIImageView.h"
#import "SDWebImageManager.h"

@interface KIImageView (){
    MBProgressHUD *progressHUD;
}

@property (copy) void(^completionCallback)(BOOL);

@end

@implementation KIImageView
@synthesize URL,progressHUD;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    [self initializeProgressBar];
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self initializeProgressBar];
    return self;
}

- (void)initializeProgressBar {
    progressHUD = [[MBProgressHUD alloc]initWithView:self];
    [self addSubview:progressHUD];
}

- (void)loadInBackgroundWithCallback:(void (^)(BOOL))callBack {
    self.completionCallback = callBack;
    progressHUD.mode = MBProgressHUDModeIndeterminate;
    [progressHUD show:YES];
    if (self.URL && ![self.URL isEqualToString:@""]) {
        //download image with SDWebImage
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager downloadImageWithURL:[NSURL URLWithString:self.URL] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            //progress
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            //done
            if (image) {
                [self setImage:image];
                callBack(YES);
            }
            else{
                callBack(NO);
            }
            [self.progressHUD hide:YES];
            
        }];
    }
    
    
}

- (void)setAlpha:(CGFloat)alpha {
    [super setAlpha:alpha];
}

@end
