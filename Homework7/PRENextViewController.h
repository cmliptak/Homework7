//
//  PRENextViewController.h
//  Homework7
//
//  Created by Maclab03 on 6/7/15.
//  Copyright (c) 2015 LiptakLask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRENextViewController : UIViewController <UIActionSheetDelegate>

- (IBAction)textFieldDoneEditing:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nText;
@property (weak, nonatomic) IBOutlet UITextField *pText;
@property (weak, nonatomic) IBOutlet UILabel *nError;
@property (weak, nonatomic) IBOutlet UILabel *pError;
@property (weak, nonatomic) IBOutlet UILabel *sLabel;
@property (weak, nonatomic) IBOutlet UISwitch *s1;
@property (weak, nonatomic) IBOutlet UISwitch *s2;
@property (weak, nonatomic) IBOutlet UIButton *activate;
@property (weak, nonatomic) IBOutlet UILabel *greenL;
@property (weak, nonatomic) IBOutlet UILabel *blueL;
@property (weak, nonatomic) IBOutlet UISlider *redS;
@property (weak, nonatomic) IBOutlet UISlider *greenS;
@property (weak, nonatomic) IBOutlet UISlider *blueS;

@end
