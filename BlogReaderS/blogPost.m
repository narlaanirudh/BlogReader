//
//  blogPost.m
//  BlogReaderS
//
//  Created by Anirudh narla on 11/4/13.
//  Copyright (c) 2013 Anirudh Narla. All rights reserved.
//

#import "blogPost.h"

@implementation blogPost


-(id) initWithTitle:(NSString*) title
{
    
    self= [super init];
    
    if(self)
    {
        self.title = title;
        
    }
    
    return self;
    
    
    
}

-(void) formattedDate:(NSString*) dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc ] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tmpDate = [dateFormatter dateFromString:dateStr];
    
    [dateFormatter setDateFormat:@"EEE-dd-MMM"];
    
    self.date = [dateFormatter stringFromDate:tmpDate];
   
    
}

+(id) blogPostWithTitle:(NSString *) title
{
    return [[self alloc] initWithTitle:title];
}






@end
