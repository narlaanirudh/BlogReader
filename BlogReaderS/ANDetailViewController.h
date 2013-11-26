//
//  ANDetailViewController.h
//  BlogReaderS
//
//  Created by Anirudh narla on 11/5/13.
//  Copyright (c) 2013 Anirudh Narla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(strong,nonatomic) NSURL *webURL;

@end
