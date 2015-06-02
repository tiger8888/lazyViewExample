//
//  PSLazyViewRenderer.m
//  PSLazyViewExample
//
//  Created by Paweł Szymański on 11/6/13.
//  Copyright (c) 2013 Paweł Szymański. All rights reserved.
//

#import "PSLazyViewRenderer.h"
#import "PSLazyView.h"

@implementation PSLazyViewRenderer

+(PSLazyViewRenderer*)sharedInstance{
    static PSLazyViewRenderer* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PSLazyViewRenderer alloc] init];
        [instance setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
    });
    return instance;
}   

-(void)renderView:(PSLazyView*)lazyView{
    [self addOperationWithBlock:^{
        UIImage* image = [lazyView renderInImageOfSize:lazyView.frame.size];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [lazyView setImage:image];
        }];
    }];
}

@end
