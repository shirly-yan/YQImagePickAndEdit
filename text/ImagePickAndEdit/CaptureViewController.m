//
//  CaptureViewController.m
//  ImagePickerDemo
//
//  Created by Ryan Tang on 13-1-5.
//  Copyright (c) 2013年 Ericsson Labs. All rights reserved.
//

#import "CaptureViewController.h"

@interface CaptureViewController ()
{
    AGSimpleImageEditorView *editorView;
}
@end

@implementation CaptureViewController
@synthesize delegate;
@synthesize image;

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-170)/2, self.view.frame.size.height-50, 170, 30)];
    [self.view addSubview:bgV];
    
    UIButton *saveB = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgV addSubview:saveB];
    saveB.frame = CGRectMake(60, 0, 50, 30);
    [saveB setTitle:@"Save" forState:UIControlStateNormal];
    [saveB addTarget:self action:@selector(saveButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *leftB = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgV addSubview:leftB];
    leftB.frame = CGRectMake(0,0, 50, 30);
    [leftB setTitle:@"Left" forState:UIControlStateNormal];
    [leftB addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightB = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgV addSubview:rightB];
    rightB.frame = CGRectMake(120, 0, 50, 30);
    [rightB setTitle:@"Right" forState:UIControlStateNormal];
    [rightB addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //image为上一个界面传过来的图片资源
    editorView = [[AGSimpleImageEditorView alloc] initWithImage:self.image];
    editorView.frame = CGRectMake(0, 0, self.view.frame.size.width ,  self.view.frame.size.width);
    editorView.center = self.view.center;
    
    //外边框的宽度及颜色
    editorView.borderWidth = 1.f;
    editorView.borderColor = [UIColor blackColor];
    
    //截取框的宽度及颜色
    editorView.ratioViewBorderWidth = 5.f;
    editorView.ratioViewBorderColor = [UIColor orangeColor];
    
    //截取比例，我这里按正方形1:1截取（可以写成 3./2. 16./9. 4./3.）
    editorView.ratio = _ratio;
    
    [self.view addSubview:editorView];
}

//完成截取
-(void)saveButton
{
    //output为截取后的图片，UIImage类型
    UIImage *resultImage = editorView.output;
    
    //通过代理回传给上一个界面显示
    [self.delegate passImage:resultImage];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)leftButtonAction {
    
    [editorView rotateLeft];
}
- (void)rightButtonAction {
    
    [editorView rotateRight];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
