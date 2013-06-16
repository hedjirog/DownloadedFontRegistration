//
//  JNDownloadRequestOperation.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNDownloadRequestOperation.h"

@implementation JNDownloadRequestOperation

- (id)initWithRequest:(NSURLRequest *)urlRequest
{
    self = [super initWithRequest:urlRequest];
    if (self) {
        NSString *fileName = [[urlRequest URL] lastPathComponent];
        _tempPath = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];

        self.outputStream = [NSOutputStream outputStreamToFileAtPath:_tempPath append:NO];
    }
    return self;
}

@end
