//
//  PREViewController.m
//  Homework7
//
//  Created by Maclab03 on 6/1/15.
//  Copyright (c) 2015 LiptakLask. All rights reserved.
//

#import "PREViewController.h"

@interface PREViewController ()

@end

@implementation PREViewController

@synthesize stepperOutlet,infoLabel;
@import UIKit;

//variables
NSString *label;
NSString *title;
int i;
double deg;
double rad;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //onLoad default
    i = 5;
    [self setString:i];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//***********************************************************************
//  specifies which orientations to accept
//***********************************************************************
- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait |
            UIInterfaceOrientationMaskLandscapeLeft);
}
//***********************************************************************
//  Action for the UIStepper
//***********************************************************************
- (IBAction)stepperAction:(id)sender {
    
    i = stepperOutlet.value;
    
    [self setString:i];
    
    
}//endStepperAction

//***********************************************************************
// Set the label for each shape; set the image view to draw the shape
//***********************************************************************
-(void)setString:(int)i{
    deg = (180 *(i-2)/i);
    rad = (deg * M_PI/180);
    [self setShape:i];
    
    //create string; append to label
    label = [NSString stringWithFormat: @"%@\n\nSides: %i\nDegrees: %.02f\nRadians: %.06f", title, i, deg, rad];
    infoLabel.Text = label;
    
    //call shape
    CGFloat lineWidth    = 5.0;
    UIBezierPath *path   = [self roundedPolygonPathWithRect:self.imageView.bounds
                                                       line:lineWidth
                                                      sides:i
                                                       cRad:0.0];
    //imageView Layer
    CAShapeLayer *mask   = [CAShapeLayer layer];
    mask.path            = path.CGPath;
    mask.lineWidth       = lineWidth;
    mask.strokeColor     = [UIColor whiteColor].CGColor;
    mask.fillColor       = [UIColor whiteColor].CGColor;
    self.imageView.layer.mask = mask;
    
    //draw shape
    CAShapeLayer *border = [CAShapeLayer layer];
    border.path          = path.CGPath;
    border.lineWidth     = lineWidth;
    border.strokeColor   = [UIColor blackColor].CGColor;
    border.fillColor     = [UIColor whiteColor].CGColor;
    [self.imageView.layer addSublayer:border];
    
    
    
    
}//endSetString

//***********************************************************************
//  Determine which shape
//***********************************************************************
-(void)setShape:(int)i{
    switch (i) {
        case 3:
            title = @"Triangle";
            break;
        case 4:
            title = @"Quadrilateral";
            break;
        case 5:
            title = @"Pentagon";
            break;
        case 6:
            title = @"Hexagon";
            break;
        case 7:
            title = @"Heptagon";
            break;
        case 8:
            title = @"Octagon";
            break;
        case 9:
            title = @"Nonagon";
            break;
        case 10:
            title = @"Decagon";
            break;
        case 11:
            title = @"Hendecagon";
            break;
        case 12:
            title = @"Dodecagon";
            break;
        default:
            break;
    }//endSwitch
    
}//endSetShape

//***********************************************************************
//  BezierPath; create shape
//***********************************************************************
- (UIBezierPath *)roundedPolygonPathWithRect:(CGRect)square
                                        line:(CGFloat)line
                                       sides:(NSInteger)sides
                                        cRad:(CGFloat)corner
{
    //variables
    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    CGFloat degree       = 2.0 * M_PI / sides;                      // angle of corners
    CGFloat offset      = corner * tanf(degree / 2.0);
    CGFloat sWidth = MIN(square.size.width, square.size.height);    // square width
    
    // calculate the length of the sides of the polygon
    CGFloat len = sWidth - line;
    if (sides % 4 != 0) {                                          // if not dealing with polygon
        len = len * cosf(degree / 2.0) + offset/2.0;               // offset it inside a circle inside the square
    }//endif
    
    CGFloat sLength = len * tanf(degree / 2.0);
    
    // start drawing at pt in lower right corner
    CGPoint pt = CGPointMake(sWidth / 2.0 + sLength / 2.0 - offset, sWidth - (sWidth - len) / 2.0);
    CGFloat angle = M_PI;
    [path moveToPoint:pt];
    
    // draw the sides
    for (NSInteger side = 0; side < sides; side++) {
        pt = CGPointMake(pt.x + (sLength - offset * 2.0) * cosf(angle), pt.y + (sLength - offset * 2.0) * sinf(angle));
        [path addLineToPoint:pt];
        
        CGPoint center = CGPointMake(pt.x + corner * cosf(angle + M_PI_2), pt.y + corner * sinf(angle + M_PI_2));
        [path addArcWithCenter:center radius:corner startAngle:angle - M_PI_2 endAngle:angle + degree - M_PI_2 clockwise:YES];
        
        pt = path.currentPoint;
        angle += degree;
    }
    
    [path closePath];
    
    return path;
    
}//end BezierPath


- (IBAction)nextBtn:(id)sender {


}
@end
