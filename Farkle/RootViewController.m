//
//  ViewController.m
//  Farkle
//
//  Created by Alex on 10/29/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import "RootViewController.h"
#import "DieLabel.h"

@interface RootViewController () <DieLabelDelegate>
@property IBOutletCollection(DieLabel) NSArray *allDieLabels;
@property NSMutableArray *dice;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (DieLabel *label in self.allDieLabels)
    {
        label.delegate = self; //setting the VC as the delegate of label
    }

}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
//    for (int i = 0; i < self.allDieLabels.count; i++ )
    for (DieLabel *label in self.allDieLabels)
    {
        [label roll];
    }
}

#pragma mark Die Label TAP Handlers
- (IBAction)onDieLabelOnePressed:(UITapGestureRecognizer *)sender
{
    //need to call delegate method
}

- (IBAction)onDieLabelTwoPressed:(UITapGestureRecognizer *)sender
{

}

- (IBAction)onDieLabelThreePressed:(UITapGestureRecognizer *)sender
{

}
- (IBAction)onDieLabelFourPressed:(UITapGestureRecognizer *)sender
{

}
- (IBAction)onDieLabelFivePressed:(UITapGestureRecognizer *)sender
{

}
- (IBAction)onDieLabelSixPressed:(UITapGestureRecognizer *)sender
{

}













@end
