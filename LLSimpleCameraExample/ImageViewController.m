//
//  ImageViewController.m
//  LLSimpleCameraExample
//
//  Created by Ömer Faruk Gül on 15/11/14.
//  Copyright (c) 2014 Ömer Faruk Gül. All rights reserved.
//

#import "ImageViewController.h"
#import "ViewUtils.h"
#import "UIImage+Crop.h"
#import "EditViewController.h"
@interface ImageViewController ()
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIButton *cancelButton;
@end

@implementation ImageViewController

- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithNibName:nil bundle:nil];
    if(self) {
        _image = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.backgroundColor = [UIColor blackColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height-50)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.image = self.image;
    [self.view addSubview:self.imageView];
    
    //NSString *info = [NSString stringWithFormat:@"Size: %@  -  Orientation: %ld", NSStringFromCGSize(self.image.size), (long)self.image.imageOrientation];
    
//    self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//    self.infoLabel.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.7];
//    self.infoLabel.textColor = [UIColor whiteColor];
//    self.infoLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
//    self.infoLabel.textAlignment = NSTextAlignmentCenter;
//    self.infoLabel.text = info;
//    [self.view addSubview:self.infoLabel];
//
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
//    [self.view addGestureRecognizer:tapGesture];
    
    UIView *bottmView = [[UIView alloc] initWithFrame:CGRectMake(0,0, screenRect.size.width, 50)];
    bottmView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.7];
    [self.view addSubview:bottmView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(40, 0, 100, 50);
    [backButton setTitle:@"返回" forState:UIControlStateNormal];

    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottmView addSubview:backButton];
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    editButton.frame = CGRectMake(backButton.right, 0, 100, 50);
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];

    [editButton addTarget:self action:@selector(editButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottmView addSubview:editButton];
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(editButton.right, 0, 100, 50);
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [bottmView addSubview:sureButton];
    
}

-(void)backButtonPressed{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)editButtonPressed{
    EditViewController *imageVC = [EditViewController new] ;
    imageVC.image = self.image;
    __weak typeof(self) weak = self;
    [imageVC setDown:^{
        [weak dismissViewControllerAnimated:NO completion:nil];
    }];
    [self presentViewController:imageVC animated:NO completion:nil];
}
-(void)sureButtonPressed{
    
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.imageView.frame = self.view.contentBounds;
    
    [self.infoLabel sizeToFit];
    self.infoLabel.width = self.view.contentBounds.size.width;
    self.infoLabel.top = 0;
    self.infoLabel.left = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
