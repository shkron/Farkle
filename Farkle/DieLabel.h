//
//  DieLabel.h
//  Farkle
//
//  Created by Alex on 10/29/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DieLabel; //if you know the class exists, just add it at the beginning

@protocol DieLabelDelegate <NSObject>

- (void)selectDieLabel:(DieLabel*)label;

@end


@interface DieLabel : UILabel

@property (nonatomic, weak) id <DieLabelDelegate> delegate;
@property BOOL isSelected;
@property NSInteger diceValue;

- (void)roll;


@end
