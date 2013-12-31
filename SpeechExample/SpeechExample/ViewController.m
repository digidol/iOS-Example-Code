//
//  ViewController.m
//  SpeechExample
//
//  Created by Neil Taylor on 30/12/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UITextField *textToRead;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *pitchSlider;
@property (weak, nonatomic) IBOutlet UIPickerView *languagePicker;

@end

@implementation ViewController

- (void) setLanguageInPicker
{
    NSString *currentLanguageCode = [AVSpeechSynthesisVoice currentLanguageCode];
    
    NSInteger index = [[AVSpeechSynthesisVoice speechVoices] indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        
        AVSpeechSynthesisVoice *voice = (AVSpeechSynthesisVoice *)obj;
        
        if([[voice language] isEqualToString: currentLanguageCode]) {
            return YES;
        }
        
        return NO;
        
    }];
    
    [self.languagePicker selectRow: index inComponent: 0 animated: NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setLanguageInPicker];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* 
 * Speak the text that is shown in the text field. If it is empty, the
 * method will return without speaking anything. If there is text to read, 
 * a new AVSpeechUtterance is created. It is configured with the values 
 * set in the GUI.
 */
- (void) speakText {
   
    [self.textToRead resignFirstResponder];
    
    if([[[self.textToRead text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return;
    }
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    
    AVSpeechUtterance *utterance =
    [AVSpeechUtterance speechUtteranceWithString: [self.textToRead text]];
    utterance.rate = [self.rateSlider value]; // 0 to 1.0
    utterance.volume = [self.volumeSlider value]; // 0 to 1.0
    utterance.pitchMultiplier = [self.pitchSlider value]; // 0.5 to 2.0
    utterance.voice = [[AVSpeechSynthesisVoice speechVoices] objectAtIndex: [self.languagePicker selectedRowInComponent: 0] ];
    
    [synthesizer speakUtterance:utterance];
}

- (IBAction)sayIt: (id)sender {
    [self speakText];
}

#pragma mark - UIPickerViewDelegate

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[AVSpeechSynthesisVoice speechVoices] count];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[AVSpeechSynthesisVoice speechVoices][row] language];
}

#pragma mark - UITextFieldDelegate 

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self speakText];
    return YES;
}

@end
