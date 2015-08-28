//
//  Fruit.m
//  Snake
//
//  Created by Shawn Hung on 8/28/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import "Fruit.h"

@interface Fruit ()

@property (strong, nonatomic) IntegerPoint *position;

@end

@implementation Fruit

- (instancetype)initWithPosition:(IntegerPoint *)position{
    if(self = [super init]){
        self.position = position;
    }
    
    return self;
}

+ (instancetype)fruitWithPosition:(IntegerPoint *)position{
    return [[self alloc] initWithPosition:position];
}

@end
