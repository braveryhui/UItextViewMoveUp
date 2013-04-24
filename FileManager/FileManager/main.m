//
//  main.m
//  FileManager
//
//  Created by loveuu on 23/4/13.
//  Copyright (c) 2013年 loveuu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //创建文件管理器
        NSFileManager *fm = [NSFileManager defaultManager];
        //定义文档类型和目录 
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        //NSLog(@"%@,%d",documentDirectroy,[paths count]);
        // ouput:/Users/loveuu/Documents,1
        //管理目录定义为documentDirectory的目录
        [fm changeCurrentDirectoryPath:[documentDirectory stringByExpandingTildeInPath]];
        //创建文件一个braveryhui.txt的再documentDirectory下
        //创建文件fileName文件名称，contents文件的内容，如果开始没有内容可以设置为nil，attributes文件的属性，初始为nil
        [fm createFileAtPath:@"braveryhui.txt" contents:nil attributes:nil];
        //删除braveryhui.txt
        //[fm removeItemAtPath:@"braveryhui.txt" error:nil];
        
         NSString *getFilePath = [documentDirectory stringByAppendingPathComponent:@"braveryhui.txt"];
        
        //|--写入数据
        NSString *str = @"braveryhui gogogogooog";
        int data = 1000;
        float data1 = 30.05f;
        //创建数据缓冲
        NSMutableData *write = [[NSMutableData alloc]init];
        //将要加入的数据写入缓冲区 
        [write appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
        [write appendBytes:&data length:sizeof(data)];
        [write appendBytes:&data1 length:sizeof(data1)];
        //将缓冲区的数据写入到braveryhui.txt
        [write writeToFile:getFilePath atomically:YES];
        [write release];
        //|--读取数据e
        NSString *getStr;
        int getData;
        float getData1;
        NSData *reader = [NSData dataWithContentsOfFile:getFilePath];
        getStr = [[NSString alloc]initWithData:[reader subdataWithRange:NSMakeRange(0, [str length])] encoding:NSUTF8StringEncoding];
        [reader getBytes:&getData range:NSMakeRange([str length], sizeof(data))];
        [reader getBytes:&getData1 range:NSMakeRange([str length]+sizeof(data), sizeof(data1))];
        NSLog(@"getstr =%@,getData=%d,getData1=%f",getStr,getData,getData1);
        
        
        uint8 b = 0;
        NSBundle *bundle = [NSBundle bundleWithPath:@"/Users/loveuu/Documents/"];
        NSString *getBundle = [bundle pathForResource:@"braveryhui" ofType:@"txt"];
        NSLog(@"bundlStr = %@",getBundle);
        //output bundlStr = /Users/loveuu/Documents/braveryhui.txt
        NSData  *getBundleData = [NSData dataWithContentsOfFile:getBundle];
        NSUInteger length = [getBundleData length];
        NSLog(@"getDemoLenght=%ld",length);
        
        for (int i=0; i<length; i++) {
            [getBundleData getBytes:&b range:NSMakeRange(i, sizeof(b))];
            NSLog(@"datai=%d:b=%d",i,b);
        }
    }
    return 0;
}

