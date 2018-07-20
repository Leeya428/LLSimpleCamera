//
//  EditViewController.m
//  LLSimpleCameraExample
//
//  Created by Ya
//  Copyright © 2018 Ömer Faruk Gül. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [self.view addGestureRecognizer:tapGesture];
    
    self.imgView.image = self.image;
}

-(void)tapGesture{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];

}

- (IBAction)downAction:(id)sender {
   
    [self dismissViewControllerAnimated:NO completion:^{
        if (self.down) {
            self.down();
        }
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
