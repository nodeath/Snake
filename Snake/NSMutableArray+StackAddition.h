//
//  NSMutableArray+StackAddition.h
//  Snake
//
//  Created by Shawn Hung on 8/28/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (StackAddition)

- (void) push: (id)item;
- (id) pop;
- (id) peek;

@end
