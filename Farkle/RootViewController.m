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
@property NSMutableArray *allDieForScore;
@property NSInteger *finalScore;
@property NSInteger *boardScore;
@property NSArray *winningThrees;

@property (weak, nonatomic) IBOutlet UILabel *userScore;


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

    self.winningThrees = @[@"111",@"222",@"333",@"444",@"555",@"666"];
}

-(void)selectDieLabel:(DieLabel *)label
{
    if (![label.text isEqualToString:@"*"])
    {
        [self.allDieForScore addObject:label];
        label.backgroundColor = [UIColor redColor];
    }
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
//    for (int i = 0; i < self.allDieLabels.count; i++ )
    //calculations


    [self.dice addObjectsFromArray:self.allDieForScore];

    [self checkSelectedDice];
    [self rollAllDice];



//    //if dice is empty, roll all of them
//    if (self.allDieLabelsCopy.count == 6)
//    {
//        [self rollAllDice];
//
//    }
//
//    else if (self.allDieLabelsCopy.count == 0)
//    {
//        [self rollAllDice];
//
//    }
//
//    else
//    {
//        [self rollAllDice];
//    }

}

- (void)checkSelectedDice
{
    for (DieLabel *label in self.dice)
    {
        [self.allDieLabelsCopy removeObject:label]; //remove chosen die from the copy array

    }

}

- (NSInteger*)checkForScore: (NSMutableArray *)labelsArray
{
    NSString *ones = [[NSString alloc]init];
    NSString *twos = [[NSString alloc]init];
    NSString *threes = [[NSString alloc]init];
    NSString *fours = [[NSString alloc]init];
    NSString *fives = [[NSString alloc]init];
    NSString *sixes = [[NSString alloc]init];

    for (DieLabel *label in labelsArray)
    {
        switch (label.diceValue)
        {
            case 1:
            {
                ones = [ones stringByAppendingString:label.text];
                break;
            }

            case 2:
            {
                twos = [twos stringByAppendingString:label.text];
                break;
            }

            case 3:
            {
                threes = [threes stringByAppendingString:label.text];
                break;
            }

            case 4:
            {
                fours = [fours stringByAppendingString:label.text];
                break;
            }

            case 5:
            {
                fives = [fives stringByAppendingString:label.text];
                break;
            }

            case 6:
            {
                sixes = [sixes stringByAppendingString:label.text];
                break;
            }

            default:
                break;
        }
    }


    }


}

    return nil;
}

- (void)rollAllDice
{
    for (DieLabel *label in self.allDieLabelsCopy)
    {
        [label roll];
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
