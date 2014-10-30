//
//  DieLabel.m
//  Farkle
//
//  Created by Alex on 10/29/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import "DieLabel.h"


@implementation DieLabel

- (void)roll
{
    int randomNumber = arc4random_uniform(6)+1;
        //    DieLabel *label = [[DieLabel alloc] init];
    self.text = [NSString stringWithFormat:@"%d", randomNumber];
    self.diceValue = randomNumber;

    switch (randomNumber)
    {
        case 1:
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dice1"]];
            break;
        }
        case 2:
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dice2"]];
            break;
        }
        case 3:
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dice3"]];
            break;
        }
        case 4:
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dice4"]];
            break;
        }

        case 5:
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dice5"]];
            break;
        }

        case 6:
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dice6"]];
            break;
        }

        default:
            break;
    }


    //this method is supposed to set the label's text
    
}

-(IBAction)onTapped:(UITapGestureRecognizer *)sender
{
     NSLog(@"Hey label got tapped!");
    [self.delegate selectDieLabel:self];
    self.isSelected = !self.isSelected;
}






@end
