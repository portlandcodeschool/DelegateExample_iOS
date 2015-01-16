//
//  ViewController.h
//  DelegateExample
//
//  Created by Erick Bennett on 1/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrinkingView.h"

@interface ViewController : UIViewController <DrinkingViewDelegate>

@property DrinkingView *drink;

@property UIButton *drinkButton;

@end

