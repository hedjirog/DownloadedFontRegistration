//
//  JNTextViewController.m
//  DownloadedFontRegistration
//
//  Created by Jiro Nagashima on 6/16/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "JNTextViewController.h"

@interface JNTextViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation JNTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = self.fontDisplayName;
    self.textView.font = [UIFont fontWithName:self.fontName size:16];
}

@end
