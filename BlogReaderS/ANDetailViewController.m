//
//  ANDetailViewController.m
//  BlogReaderS
//
//  Created by Anirudh narla on 11/5/13.
//  Copyright (c) 2013 Anirudh Narla. All rights reserved.
//

#import "ANDetailViewController.h"

@interface ANDetailViewController ()

@end

@implementation ANDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *webURL = self.webURL;
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:webURL];
	
    [self.webView loadRequest:urlRequest];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
