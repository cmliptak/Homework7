//
//  PREViewController.h
//  Homework7
//
//  Created by Maclab03 on 6/1/15.
//  Copyright (c) 2015 LiptakLask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PREViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIStepper *stepperOutlet;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
- (IBAction)stepperAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)nextBtn:(id)sender;

@end
