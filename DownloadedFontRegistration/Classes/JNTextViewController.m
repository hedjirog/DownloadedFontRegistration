//
//  JNTextViewController.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNTextViewController.h"

#import "JNFont.h"

#import "UIFont+Additions.h"

@interface JNTextViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation JNTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = self.font.displayName;

    if ([UIFont fontExistsOfName:self.font.name]) {
        self.textView.font = [UIFont fontWithName:self.font.name size:16];
    }
    else {
        // Download a font
    }
}

@end
