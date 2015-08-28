//
//  Fruit.h
//  Snake
//
//  Created by Shawn Hung on 8/28/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntegerPoint.h"

@interface Fruit : NSObject

- (instancetype)initWithPosition:(IntegerPoint *)position;

+ (instancetype)fruitWithPosition:(IntegerPoint *)position;

@property (readonly, strong, nonatomic) IntegerPoint *position;

@end
