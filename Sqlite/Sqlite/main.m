//
//  main.m
//  Sqlite
//
//  Created by loveuu on 23/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSFileManager *fm = [NSFileManager defaultManager];
        NSStringEncoding encoding = NSUTF8StringEncoding;
        NSString *filePath = @"/Users/loveuu/Documents/text2.txt";
        NSString *insertStr =@"id = 20090502137, name = Jack, socre1 = 89.00, score2 = 80.50, socre3 = 80.00 id = 20090502137, name = Jack, score1 = 89.00, score2 = 80.50, score3 = 80.00 id = 20090502138, name = Jack, score1 = 89.00, score2 = 80.50, score3 = 80.00 id = 20090502139, name = Jack, score1 = 89.00, score2 = 80.50, score3 = 80.00  id = 20090502140, name = Jack, score1 = 89.00, score2 = 80.50, score3 = 100.00";
        //如果没有改文件就创建 
        if([fm createFileAtPath:filePath contents:nil attributes:nil])
        {
            NSData *data = [insertStr dataUsingEncoding:encoding];
            [data writeToFile:filePath atomically:YES];
        }
        //拿到文件读取数据
        NSString *getFileContent = [[NSString alloc]initWithContentsOfFile:filePath encoding:encoding error:nil];
        //NSLog(@"%@",getFileContent);
        NSString *pattern  = @"id = (\\w+), name = (\\w+), score1 = (\\d+.\\d+), score2 = (\\d+.\\d+), score3 = (\\d+.\\d+)";
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
        NSArray *matches= [regex matchesInString:getFileContent options:0 range:NSMakeRange(0, [getFileContent length])];
        for (NSTextCheckingResult *match in matches) {
            NSRange firstRange = [match rangeAtIndex:0];
            NSRange secondRange = [match rangeAtIndex:2];
            NSString *id = [getFileContent substringWithRange:firstRange];
            NSString *name = [getFileContent substringWithRange:secondRange];
            NSLog(@"id=%@,name=%@",id,name);
        }
    }
    return 0;
}

