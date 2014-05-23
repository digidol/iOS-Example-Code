//
//  DataAccess.m
//  SQLiteTable
//
//  Created by Neil Taylor on 23/05/2014.
//  Copyright (c) 2014 Aberystwyth University. All rights reserved.
//

#import "DataAccess.h"
#import <sqlite3.h>
#import "Event.h"

@implementation DataAccess {
    sqlite3 *db;
}

- (BOOL) startup {
   NSString *path =
    [[NSBundle mainBundle] pathForResource:@"events" ofType: @"sqlite"];
    
    if(sqlite3_open([path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        return NO;
    }
       
    return YES;
}

- (NSArray *) loadEvents {
    NSString *query =
    @"SELECT title, description FROM event;";
    
    sqlite3_stmt *statement;
    NSMutableArray *events = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2( db, [query UTF8String], -1, &statement, nil )
        == SQLITE_OK) {
        
        while(sqlite3_step(statement) == SQLITE_ROW) {
            
            Event *event = [[Event alloc] init];
            
            char *item = (char *) sqlite3_column_text(statement, 0);
            
            event.title = [[NSString alloc] initWithUTF8String: item];
            
            item = (char *) sqlite3_column_text(statement, 1);
            event.detail = [[NSString alloc] initWithUTF8String: item];
            
            [events addObject: event];
        }
    }
    sqlite3_finalize(statement);
    return events;
}

@end
