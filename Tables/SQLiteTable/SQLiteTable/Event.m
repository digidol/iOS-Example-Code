//
//  Event.m
//  SQLiteTable
//
//  Created by Neil Taylor on 23/05/2014.
//  Copyright (c) 2014 Aberystwyth University. All rights reserved.
//

#import "Event.h"

@implementation Event

- (NSString *) description {
    return [NSString stringWithFormat: @"%@, %@", self.title, self.detail];
}

@end
