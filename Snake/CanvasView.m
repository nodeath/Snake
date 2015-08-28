//
//  CanvasView.m
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import "CanvasView.h"
#import "Fruit.h"

static CGFloat BlockSize = 5.0f;

@implementation CanvasView {
    CGPoint startPoint;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects perforsmance during animation.

-(void)awakeFromNib{
    [super awakeFromNib];
    startPoint = CGPointMake(0, 0);
}

- (void)drawRect:(CGRect)rect {
    Snake *snake = self.dataSource.snake;
    if(self.dataSource && snake){
        UIBezierPath *boundryPath = [UIBezierPath bezierPathWithRect:CGRectMake(startPoint.x, startPoint.y, snake.boundry.x*BlockSize + startPoint.x, snake.boundry.x*BlockSize + startPoint.y)];
        boundryPath.lineWidth = BlockSize;
        
        [boundryPath stroke];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path setLineWidth:BlockSize];
        [path moveToPoint:CGPointMake([snake tail].x*BlockSize + startPoint.x, [snake tail].y*BlockSize + startPoint.y)];
        
        [[snake body] enumerateObjectsUsingBlock:^(IntegerPoint *point, NSUInteger idx, BOOL *stop) {
            if(idx > 0){
                //[path addLineToPoint:CGPointMake(point.x*BlockSize + startPoint.x, point.y*BlockSize + startPoint.y)];
                UIBezierPath *pointPath = [UIBezierPath bezierPathWithRect:CGRectMake(point.x*BlockSize, point.y*BlockSize, BlockSize, BlockSize)];
                [[UIColor blueColor] setFill];
                [pointPath fill];
            }
        }];
        
        [path stroke];
    }
    
    NSArray *fruits = [self.dataSource fruits];
    if(self.dataSource && fruits){
        [fruits enumerateObjectsUsingBlock:^(Fruit *fruit, NSUInteger idx, BOOL *stop) {
            UIBezierPath *fruitPoint = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(fruit.position.x*BlockSize, fruit.position.y*BlockSize, BlockSize, BlockSize)];
            [[UIColor redColor] setFill];

            [fruitPoint fill];
        }];
    }
}


@end
