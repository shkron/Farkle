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
@property int userScore;
@property int bankScore;
@property NSDictionary *winningThrees;
@property BOOL isPlayerOne;

@property (weak, nonatomic) IBOutlet UILabel *userScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *userScoreLabel2;


@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    for (DieLabel *label in self.allDieLabels)
    {
        label.delegate = self; //setting the VC as the delegate of label
    }
    self.dice = [@[]mutableCopy];
    self.allDieForScore = [@[]mutableCopy];

    [self resetGame];


    self.winningThrees = @{@"1": @100,
                           @"5": @50,
                           @"111" : @1000 ,
                           @"222" : @200 ,
                           @"333" : @300 ,
                           @"444" : @400 ,
                           @"555" : @500 ,
                           @"666" : @600};

}

-(void)selectDieLabel:(DieLabel *)label
{
    if (![label.text isEqualToString:@"*"])
    {
        [self.allDieForScore addObject:label];
//        [self.dice addObject:label];
        label.backgroundColor = [UIColor redColor];
        [self checkForScore:self.allDieForScore];

    }

}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{

    [self.dice addObjectsFromArray:self.allDieForScore];
    [self checkSelectedDice];
    [self rollAllDice];
    [self checkForScore:self.allDieForScore];

    self.allDieForScore =[@[]mutableCopy];
    self.bankScoreLabel.text = @"";


}

- (void)checkSelectedDice
{
    for (DieLabel *label in self.dice)
    {
        [self.allDieLabelsCopy removeObject:label]; //remove chosen die from the copy array
    }

}

- (void)checkForScore: (NSMutableArray *)labelsArray
{
    self.bankScore = 0;

    NSMutableString *ones = [[NSMutableString alloc]init];
    NSMutableString *twos = [[NSMutableString alloc]init];
    NSMutableString *threes = [[NSMutableString alloc]init];
    NSMutableString *fours = [[NSMutableString alloc]init];
    NSMutableString *fives = [[NSMutableString alloc]init];
    NSMutableString *sixes = [[NSMutableString alloc]init];
    NSArray *array = @[ones, twos, threes, fours, fives, sixes];

    for (DieLabel *label in labelsArray)
    {
        switch (label.diceValue)
        {
            case 1:
            {
                [ones appendString:label.text];
                break;
            }

            case 2:
            {
                [twos appendString:label.text];
                break;
            }

            case 3:
            {
                [threes appendString:label.text];
                break;
            }

            case 4:
            {
                [fours appendString:label.text];
                break;
            }

            case 5:
            {
                [fives appendString:label.text];
                break;
            }

            case 6:
            {
                [sixes appendString:label.text];
                break;
            }

            default:
                break;
        }
    }

    for (NSString *string in array)
    {
        self.bankScore = self.bankScore + [[self.winningThrees valueForKey:string] intValue];
    }

    self.bankScoreLabel.text = [NSString stringWithFormat:@"%d",self.bankScore];

//    self.allDieForScore =[@[]mutableCopy];

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
    self.userScoreLabel.backgroundColor = [UIColor greenColor];
    self.userScoreLabel2.backgroundColor = [UIColor whiteColor];
    self.isPlayerOne = YES;

    for (DieLabel *label in self.allDieLabels)
    {
        label.text = @"*";
        label.backgroundColor = [UIColor blueColor];
        self.allDieLabelsCopy = [NSMutableArray arrayWithArray:self.allDieLabels];
    }
}

- (IBAction)onBankScoreButtonPressed:(UIButton *)sender
{
//    [self checkForScore:self.allDieForScore];

    self.userScore = self.userScore + self.bankScore;
    self.userScoreLabel.text = [NSString stringWithFormat:@"%d",self.userScore];
    self.bankScore = 0;
    self.bankScoreLabel.text = @"";

}

- (IBAction)onEndTurnButtonPressed:(UIButton *)sender
{
    self.isPlayerOne = !self.isPlayerOne;
    [self resetGame];
    if (self.isPlayerOne == NO)
    {
        self.userScoreLabel2.backgroundColor = [UIColor greenColor];
        self.userScoreLabel.backgroundColor = [UIColor whiteColor];
    }

}








@end
