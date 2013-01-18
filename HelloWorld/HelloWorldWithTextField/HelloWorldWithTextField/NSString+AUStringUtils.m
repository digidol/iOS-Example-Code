//
//  NSString+AUStringUtils.m
//  HelloWorldWithTextField
//
//  Created by Neil Taylor on 18/01/2013.
//  Copyright (c) 2013 Aberystwyth University. All rights reserved.
//

#import "NSString+AUStringUtils.h"

@implementation NSString (AUStringUtils)

- (NSString *) trimWhitespace {

    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
