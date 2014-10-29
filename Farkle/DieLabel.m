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
    DieLabel *label = [[DieLabel alloc] init];
    label.text = [NSString stringWithFormat:@"%d", randomNumber];

    //this method is supposed to set the label's text
    
}

-(IBAction)onTapped:(UITapGestureRecognizer *)sender
{

}



@end
