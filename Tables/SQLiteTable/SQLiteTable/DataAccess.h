//
//  DataAccess.h
//  SQLiteTable
//
//  Created by Neil Taylor on 23/05/2014.
//  Copyright (c) 2014 Aberystwyth University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAccess : NSObject

- (BOOL) startup;
- (NSArray *) loadEvents;

@end
