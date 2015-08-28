//
//  IntegerPoint.m
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import "IntegerPoint.h"

@interface IntegerPoint ()

@end

@implementation IntegerPoint

+ (id)pointWithX:(NSInteger)x
               Y:(NSInteger)y{
    return [[IntegerPoint alloc] initWithX:x y:y];
}

+ (instancetype)pointWithCGPoint:(CGPoint)point{
    return [IntegerPoint pointWithX:point.x Y:point.y];
}

- (instancetype)initWithX:(NSInteger)x
                        y:(NSInteger)y {
    if(self = [super init]){
        self.x = x;
        self.y = y;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    IntegerPoint *newPoint = [IntegerPoint pointWithX:self.x Y:self.y];
    return newPoint;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"IntegerPoint[%ld, %ld]", self.x, self.y];
}

- (NSUInteger)hash{
    return self.x + self.y * 1000;
}

- (BOOL)isEqual:(id)object{
    if(![object isKindOfClass:[IntegerPoint class]]){
        return NO;
    }
    
    IntegerPoint *point = (IntegerPoint *)object;
    
    return (self.x == point.x) && (self.y == point.y);
}

@end