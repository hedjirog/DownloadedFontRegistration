//
//  JNDownloadRequestOperation.h
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "AFHTTPRequestOperation.h"

@interface JNDownloadRequestOperation : AFHTTPRequestOperation

@property (nonatomic, readonly, copy) NSString *tempPath;

- (id)initWithRequest:(NSURLRequest *)urlRequest;

@end
