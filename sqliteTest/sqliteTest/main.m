//
//  main.m
//  sqliteTest
//
//  Created by loveuu on 22/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "sqlite3.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [path objectAtIndex:0];
        NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"sqliteTest.sqlite"];
        FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
        if(![db open])
        {
            NSLog(@"db cannot open ..");
            return -1;
        }
        [db executeUpdate:@"CREATE TABLE PersonList (Name text, Age integer, Sex integer, Phone text, Address text, Photo blob)"];
    }
    return 0;
}

