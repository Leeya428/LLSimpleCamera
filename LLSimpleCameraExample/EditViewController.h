//
//  EditViewController.h
//  LLSimpleCameraExample
//
//  Created by Ya
//  Copyright © 2018 Ömer Faruk Gül. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property(nonatomic,copy)void(^down)(void);
@property(nonatomic,retain)UIImage *image;
@end
