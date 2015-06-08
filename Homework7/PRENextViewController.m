//
//  PRENextViewController.m
//  Homework7
//
//  Created by Maclab03 on 6/7/15.
//  Copyright (c) 2015 LiptakLask. All rights reserved.
//

#import "PRENextViewController.h"

@interface PRENextViewController ()

@end

@implementation PRENextViewController

//variables
int red, green, blue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _pError.text = @"Enter a 10 digit number" ;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//***********************************************************************************
//  -Tell keyboard to go away; stop first responder status when Done is pressed; name field only
//***********************************************************************************

- (IBAction)textFieldDoneEditing:(id)sender {
    
    //auto-enable Return key checkbox is checked, so Done key is disabled until user types
    [sender resignFirstResponder];
    
    
}//end actionhandler

//***********************************************************************************
//  -Change the underlying class of View to UIControl, this allows the call of action methods to View
//
//  -Tell fields to stop first responder status
//***********************************************************************************

- (IBAction)backgroundTap:(id)sender {
    
    NSString * phone = _pText.text;
    
    // validate the name and phone fields
    
    if ([self valPhone:phone])
	{
        [self.nText resignFirstResponder];
        [self.pText resignFirstResponder];
        _pError.text = @""; //set label to empty
    }
    
}//end background


//*************************************************************************************
//  Validate if a number is entered
//*************************************************************************************

-(BOOL)valPhone:(NSString*)phone{
	NSError *error = NULL;
	
	NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error];
	NSRange inputRange = NSMakeRange(0, [phone length]);
	NSArray *matches = [detector matchesInString:phone options:0 range:inputRange];
	
    int len = [phone length];
	// no match at all
	if ([matches count] == 0|| len < 10 || len > 13)
	{
        
		_pError.text = @"Please use a valid number format."; //set error label
		return false;
	}
	
	// found match but we need to check if it matched the whole string
	NSTextCheckingResult *result = (NSTextCheckingResult *)[matches objectAtIndex:0];
	
	if ([result resultType] == NSTextCheckingTypePhoneNumber
		&& result.range.location == inputRange.location
		&& result.range.length == inputRange.length)
	{ // it matched the whole string
		return true;
		
	} else {
		_pError.text = @"Please use a valid number format."; //set error label
		return false;
	}
}//end valPhone

//***********************************************************************
//Slider action;
//***********************************************************************

- (IBAction)slider:(UISlider *)sender {
    int progress = lroundf(sender.value);
    
    //check which slider is active
    if (sender == _redS) {
        self.sLabel.text = [NSString stringWithFormat:@"%d", progress];
        red = _redS.value;
    }
    else
        if(sender == _greenS){
            self.greenL.text = [NSString stringWithFormat:@"%d", progress];
            green = _greenS.value;
        }
        else{
            self.blueL.text = [NSString stringWithFormat:@"%d", progress];
            blue = _blueS.value;
        }
    
    UIColor *thisColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    [self.view setBackgroundColor:(thisColor)];
    
}

//***********************************************************************
//  Segment control; determine whether
//  switches(index = 0) or button(index = 1)
//***********************************************************************

- (IBAction)toggleSeg:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        self.s1.hidden = NO;
        self.s2.hidden = NO;
        self.activate.hidden = YES;
    }
    else {
        self.s1.hidden = YES;
        self.s2.hidden = YES;
        self.activate.hidden = NO;
    }
}
//***********************************************************************
//  Switches action; handles both switches; determines if they are on
//***********************************************************************
- (IBAction)switched:(UISwitch *)sender {
    BOOL status = sender.isOn;
    
    [self.s1 setOn:status animated:YES];
    [self.s2 setOn:status animated:YES];
    
}

//***********************************************************************
//Button action;
//***********************************************************************
- (IBAction)clicked:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Continue?"
                                  delegate:self
                                  cancelButtonTitle:@"Go Back!"
                                  destructiveButtonTitle:@"Confirm!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}
//***********************************************************************
// action for pop-up dialog;
//***********************************************************************
- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        if ([self.nText.text length] > 0) {
            msg = [NSString stringWithFormat:
                   @"You can breathe easy, %@, everything went OK.",
                   self.nText.text];
        } else {
            msg = @"You can breathe easy, everything went OK.";
        }
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Phew!"
                              otherButtonTitles:nil];
        [alert show];
    }
}


@end
