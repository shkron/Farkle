//
//  ViewController.m
//  Farkle
//
//  Created by Alex on 10/29/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import "RootViewController.h"
#import "DieLabel.h"

@interface RootViewController ()
@property IBOutletCollection(DieLabel) NSArray *allDieLabels;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
//    for (int i = 0; i < self.allDieLabels.count; i++ )
    for (DieLabel *label in self.allDieLabels)
    {
        [label roll];
    }
}

@end
