//
//  YQImagePickAndEditButton.h
//  text
//
//  Created by shirly on 16/3/10.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YQImagePickAndEditButtonDelegate <NSObject>



@end

@interface YQImagePickAndEditButton : UIButton

@property (nonatomic, assign) UIViewController<YQImagePickAndEditButtonDelegate>* delegate;


@end
