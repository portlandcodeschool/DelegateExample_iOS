//
//  DrinkingView.h
//  DelegateExample
//
//  Created by Erick Bennett on 1/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//
#import <UIKit/UIKit.h>

//At this point our viewController does not know what the DrinkingView class is. If we declare it here, although the class has been created yet, we can use the class name in our delegate implementation.
@class DrinkingView;

//Create a protocol to handle the delegate
@protocol DrinkingViewDelegate <NSObject>

//This is the delegate callback method we are creating. We plan on passing back to whoever is our delegate, the reference to ourselves. This is why we have the (DrinkingView *)drink code here.
-(void)didFinishDrinking:(DrinkingView *)drink;

//End the protocal decleration
@end

@interface DrinkingView : UIView

//Here we create our delegate property
@property (nonatomic, assign) id<DrinkingViewDelegate> delegate;

@property UILabel *fluidRemainingLabel;

@property int fluidLevel;


-(void) takeDrink;
@end
