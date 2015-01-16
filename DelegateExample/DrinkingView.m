//
//  DrinkingView.m
//  DelegateExample
//
//  Created by Erick Bennett on 1/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import "DrinkingView.h"

@implementation DrinkingView

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //Set initial fluid level
        self.fluidLevel = 64;
        
        //set this views background color to purple
        self.backgroundColor = [UIColor purpleColor];
        
        //Create the label to show how many ounces are remaining
        self.fluidRemainingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        
        self.fluidRemainingLabel.center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
        
        self.fluidRemainingLabel.backgroundColor = [UIColor whiteColor];
        
        self.fluidRemainingLabel.textColor = [UIColor orangeColor];
        
        self.fluidRemainingLabel.font = [UIFont systemFontOfSize:20];
        
        self.fluidRemainingLabel.numberOfLines = 2;
        
        self.fluidRemainingLabel.textAlignment = NSTextAlignmentCenter;
        
        self.fluidRemainingLabel.text = [NSString stringWithFormat:@"%i ounces", self.fluidLevel];
        
        //Add this label to our view
        [self addSubview:self.fluidRemainingLabel];
     
        //This just keeps out view centered in case rotation happens
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
   
    }
    return self;
}

-(void) takeDrink {
    
    //This is a random number generator set to give a random number between 1 and 10
    int amountDrank = arc4random()%10+1;
    
    //Subract the randomly generated value from our fluid level total
    self.fluidLevel -= amountDrank;
    
    //Update our label with the amount of ounces remaining
    self.fluidRemainingLabel.text = [NSString stringWithFormat:@"%i ounces", self.fluidLevel];
    
    //Logice check to see if fluid level is 0 or below.
    if (self.fluidLevel <= 0) {
        
        //Update our labels text
        self.fluidRemainingLabel.text = @"Gone!";
        
        if ([self.delegate respondsToSelector:@selector(didFinishDrinking:)]) {
            //Call the class delegate
            [self.delegate didFinishDrinking:self];
            
        }
    }
    
}
@end
