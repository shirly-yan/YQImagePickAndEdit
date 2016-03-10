//
//  ViewController.m
//  text
//
//  Created by shirly on 16/3/10.
//  Copyright © 2016年 shirly. All rights reserved.
//

#import "ViewController.h"

#import "YQImagePickAndEditButton.h"

@interface ViewController ()<YQImagePickAndEditButtonDelegate>



@property (weak, nonatomic) IBOutlet YQImagePickAndEditButton *imageB;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _imageB.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
