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
@property int userScore2;
@property int bankScore;
@property NSDictionary *winningNumbers;
@property BOOL isPlayerOne;

@property (weak, nonatomic) IBOutlet UILabel *userScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *userScoreLabel2;


@end

@implementation RootViewController

#pragma mark View Controller Life Cycle

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
    self.userScoreLabel.backgroundColor = [UIColor greenColor];
    self.userScoreLabel2.backgroundColor = [UIColor whiteColor];
    self.isPlayerOne = YES;

    self.winningNumbers = @{@"1": @100,
                           @"5": @50,
                           @"11":@200,
                           @"55":@100,
                           @"111" : @1000 ,
                           @"222" : @200 ,
                           @"333" : @300 ,
                           @"444" : @400 ,
                           @"555" : @500 ,
                           @"666" : @600,
                           @"1111" : @1100,
                           @"5555" : @550,
                           @"55555" : @600,
                            @"11111" : @1200,
                           @"111111" : @1000 ,
                           @"222222" : @1000 ,
                           @"333333" : @1000 ,
                           @"444444" : @1000 ,
                           @"555555" : @1000 ,
                           @"666666" : @1000,
                           @"123456" : @1000,
                           @"112233" : @1000,
                           @"112244" : @1000,
                           @"112255" : @1000,
                           @"112266" : @1000,
                           @"113344" : @1000,
                           @"113355" : @1000,
                           @"113366" : @1000,
                           @"114455" : @1000,
                           @"114466" : @1000,
                           @"115566" : @1000,
                           @"223344" : @1000,
                           @"223355" : @1000,
                           @"223366" : @1000,
                           @"224455" : @1000,
                           @"224466" : @1000,
                           @"225566" : @1000,
                           @"334455" : @1000,
                           @"334466" : @1000,
                           @"335566" : @1000,
                           @"123456" : @1000,
                           };

}

#pragma mark Dice


//adding all the selected dice into the ones that will be calculated for score
-(void)selectDieLabel:(DieLabel *)label
{
    if (![label.text isEqualToString:@"*"])
    {
        [self.allDieForScore addObject:label];
        label.backgroundColor = [UIColor redColor];
        [self checkForScore:self.allDieForScore];

    }

}

//remove chosen die from the copy array
- (void)checkSelectedDice
{
    for (DieLabel *label in self.dice)
    {
        [self.allDieLabelsCopy removeObject:label];
    }

}

//allDieLabelsCopy only the unselected Dice
- (void)rollAllDice
{
    for (DieLabel *label in self.allDieLabelsCopy)
    {
        [label roll];
    }
}


#pragma mark Score checking

- (void)checkForScore: (NSMutableArray *)labelsArray
{
    self.bankScore = 0;

    NSMutableString *ones = [[NSMutableString alloc]init];
    NSMutableString *twos = [[NSMutableString alloc]init];
    NSMutableString *threes = [[NSMutableString alloc]init];
    NSMutableString *fours = [[NSMutableString alloc]init];
    NSMutableString *fives = [[NSMutableString alloc]init];
    NSMutableString *sixes = [[NSMutableString alloc]init];
    NSMutableString *all = [[NSMutableString alloc]init];
    NSMutableArray *array = [@[ones, twos, threes, fours, fives, sixes] mutableCopy];

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

//        [all appendString:ones];
//        [all appendString:twos];
//        [all appendString:threes];
//        [all appendString:fours];
//        [all appendString:fives];
//        [all appendString:sixes];
//
//        if (all.length == 6)
//        {
//            [array addObject:all];
//        }

    }

    for (NSString *string in array)
    {
        self.bankScore = self.bankScore + [[self.winningNumbers valueForKey:string] intValue];
        NSLog(@"the key is %@", string );
    }

    self.bankScoreLabel.text = [NSString stringWithFormat:@"%d",self.bankScore];

}


- (void) resetGame
{
    for (DieLabel *label in self.allDieLabels)
    {
        label.text = @"*";
        label.backgroundColor = [UIColor blueColor];
        self.allDieLabelsCopy = [NSMutableArray arrayWithArray:self.allDieLabels];
    }
    self.allDieForScore = [@[]mutableCopy];
//    self.bankScore = 0;
}


#pragma mark Button Presses

- (IBAction)onStartOverButtonPressed:(id)sender
{
    [self resetGame];
    self.userScore = 0;
    self.userScore2 = 0;
    self.userScoreLabel.text = @"Score";
    self.userScoreLabel2.text = @"Score2";

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


- (IBAction)onBankScoreButtonPressed:(UIButton *)sender
{
//    [self checkForScore:self.allDieForScore];


    if (self.isPlayerOne)
    {
    self.userScore = self.userScore + self.bankScore;
    self.userScoreLabel.text = [NSString stringWithFormat:@"%d",self.userScore];
    self.bankScore = 0;
    self.bankScoreLabel.text = @"";
    }

    else
    {
        self.userScore2 = self.userScore2 + self.bankScore;
        self.userScoreLabel2.text = [NSString stringWithFormat:@"%d",self.userScore2];
        self.bankScore = 0;
        self.bankScoreLabel.text = @"";
    }

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

    else
    {
        self.userScoreLabel2.backgroundColor = [UIColor whiteColor];
        self.userScoreLabel.backgroundColor = [UIColor greenColor];
    }
}






@end
