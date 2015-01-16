//
//  ViewController.m
//  DelegateExample
//
//  Created by Erick Bennett on 1/15/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create the drink object
    self.drink = [[DrinkingView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    
    //place the drink view in the center of the screen
    self.drink.center = self.view.center;
    
    
    //Set this viewcontroller to be the delegate for the instance of our drink object
    self.drink.delegate = self;
    
    //Add the drink object instance to our view
    [self.view addSubview:self.drink];
    
    
    
    //Create a button for users to press
    self.drinkButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.drinkButton addTarget:self action:@selector(drinkButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.drinkButton setTitle:@"Drink" forState:UIControlStateNormal];
    
    [self.drinkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.drinkButton setBackgroundColor:[UIColor darkGrayColor]];
    
    self.drinkButton.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width/2, 46.0);
    
    self.drinkButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - 50);
    
    //Set autoresixing masks to handle an orientation change
    self.drinkButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    
    //Add this button to our view
    [self.view addSubview:self.drinkButton];

}

-(void) drinkButtonPressed {
    
    //Since our button was pressed, send a message (call the method) in our self.drink instance
    [self.drink takeDrink];
}


#pragma DrinkingViewDelegate
-(void)didFinishDrinking:(DrinkingView *)drink {
    
    //When this delegate method is called, do an animation to show this has happend
    [UIView animateWithDuration:1.5 animations:^{
        
        //Animate the alpha (transparency) of our drink objects view and button to 0
        drink.alpha = 0.0;
        self.drinkButton.alpha = 0.0;
        
        //Animate our background color to purple
        self.view.backgroundColor = [UIColor purpleColor];
        
    } completion:^(BOOL finished) {

        //Show an alert style alertController that it is all gone
        UIAlertController *uac = [UIAlertController alertControllerWithTitle:@"Finished!" message:@"You drank it all" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:uac animated:YES completion:nil];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
