//
//  DieLabel.h
//  Farkle
//
//  Created by Alex on 10/29/14.
//  Copyright (c) 2014 Alexey Emelyanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject>
//- (void)dieRolledWithValue:(int)value;
- (void)isLabelTapped: (BOOL)isTapped;

@end

@interface DieLabel : UILabel
@property (nonatomic, weak) id <DieLabelDelegate> delegate;

@property BOOL isSelected;

- (void)roll;

@end
