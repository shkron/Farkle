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

@property NSMutableArray *allDieLabelsCopy;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (DieLabel *label in self.allDieLabels)
    {
        label.delegate = self; //setting the VC as the delegate of label
    }
    self.dice = [@[]mutableCopy];
    [self resetGame];
}

-(void)selectDieLabel:(DieLabel *)label
{
    if (![label.text isEqualToString:@"*"])
    {
        [self.dice addObject:label];
        label.backgroundColor = [UIColor redColor];
    }
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
//    for (int i = 0; i < self.allDieLabels.count; i++ )
    [self checkSelectedDice];

    //if dice is empty, roll all of them
    if (self.allDieLabelsCopy.count == 6)
    {
        for (DieLabel *label in self.allDieLabels)
        {
            [label roll];
        }
    }

    else if (self.allDieLabelsCopy.count == 0)
    {
        for (DieLabel *label in self.allDieLabels)
        {
            [label roll];
            //STOP THE GAME HERE
        }
    }

    else
    {
        for (DieLabel *label in self.allDieLabelsCopy)
        {
            [label roll];
        }
    }

}

- (void)checkSelectedDice
{
    for (DieLabel *label in self.dice)
    {
        [self.allDieLabelsCopy removeObject:label]; //remove chosen die from the copy array
    }

}


-(void) resetGame
{
    for (DieLabel *label in self.allDieLabels)
    {
        label.text = @"*";
        label.backgroundColor = [UIColor blueColor];
        self.allDieLabelsCopy = [NSMutableArray arrayWithArray:self.allDieLabels];
    }
}









@end
