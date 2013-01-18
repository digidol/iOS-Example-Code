//
//  ViewController.m
//  HelloWorldWithTextField
//
//  Created by Neil Taylor on 18/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "HelloWorldWithTextFieldViewController.h"
#import "NSString+AUStringUtils.h"

@interface HelloWorldWithTextFieldViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) IBOutlet UITextField *helloText;

@end

@implementation HelloWorldWithTextFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sayHello:(id)sender {
    
    [self.helloText resignFirstResponder];
    if([[self.helloText.text trimWhitespace] length] == 0) {
       self.outputLabel.text = @"Hello, World";
    }
    else {
        self.outputLabel.text = [@"Hello, " stringByAppendingString: [self.helloText.text trimWhitespace]];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self sayHello: nil];
    return YES;
}

@end
