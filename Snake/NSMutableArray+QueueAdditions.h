//
//  NSMutableArray+QueueAdditions.h
//  Snack
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (QueueAdditions)

- (id)dequeue;
- (void)enqueue:(id)obj;

@end
