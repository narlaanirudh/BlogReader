//
//  blogPost.h
//  BlogReaderS
//
//  Created by Anirudh narla on 11/4/13.
//  Copyright (c) 2013 Anirudh Narla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface blogPost : NSObject

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *author;
@property(nonatomic,strong) UIImage *img;
@property(nonatomic,strong) NSString *date;
@property(nonatomic,strong) NSURL *url;

-(id) initWithTitle:(NSString*) title;
-(void) formattedDate:(NSString*) dateStr;

+(id) blogPostWithTitle:(NSString *) title;

@end
