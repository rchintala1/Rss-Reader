//
//  JSonParse.m
//  RssReader
//
//  Created by ramesh chandra on 6/18/15.
//  Copyright © 2015 ramesh chandra. All rights reserved.
//

#import "JSonParse.h"
@import UIKit;

@implementation JSonParse
-(NSMutableArray *)parse:(NSDictionary *)response{
    

   
    NSMutableArray *result = [[NSMutableArray alloc]init];
   
    if ([response[@"responseData"][@"results"] count ]>0) {
        
    for (int i = 0; i < [response[@"responseData"][@"results"] count ]; i++) {
        
        ;
        [result addObject:@{@"title": [self checkRSS:response[@"responseData"][@"results"][i][@"title"]] ,
                            @"description": [self checkRSS:response[@"responseData"][@"results"][i][@"content"]],
                          @"url":[self checkRSS: response[@"responseData"][@"results"][i][@"image"][@"originalContextUrl"]],
                          @"image": [self checkRSS:response[@"responseData"][@"results"][i][@"image"][@"url"]],
                          @"index":[self checkRSS: [NSString stringWithFormat:@"%i", i]]}
         ];
    }
    }else{
        result=nil;
    }
    
    return result ;
}

#pragma mark - Helper Methods

-(NSString *)checkRSS:(NSString *)string{
    if (string!=nil) {
        NSAttributedString * attrString = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        return attrString.string;
        
        
    }
   
    return @"";
    
}


@end
