//
//  ViewController.m
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import "ViewController.h"
#import "Snake.h"
#import "IntegerPoint.h"

@interface ViewController ()

@property (strong, nonatomic) Snake *snake;
@property (strong, nonatomic) NSMutableArray *fruits;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) UISwipeGestureRecognizer *swipeRightRecognizer;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeUpRecognizer;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeDownRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.canvas.dataSource = self;
    [self setupSnackContext];
    [self setupRecognizers];
}

- (void)setupSnackContext{
    self.snake = [[Snake alloc] initWithBody:@[[IntegerPoint pointWithX:10 Y:10],
                                               [IntegerPoint pointWithX:11 Y:10],
                                               [IntegerPoint pointWithX:12 Y:10],
                                               [IntegerPoint pointWithX:13 Y:10],
                                               [IntegerPoint pointWithX:14 Y:10],
                                               [IntegerPoint pointWithX:15 Y:10],
                                               [IntegerPoint pointWithX:16 Y:10],
                                               [IntegerPoint pointWithX:17 Y:10],
                                               [IntegerPoint pointWithX:18 Y:10]]];
    
    
    
    self.snake.boundry = [IntegerPoint pointWithX:50 Y:50];
}

- (void)setupRecognizers {
    self.swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeOnView:)];
    self.swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    self.swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeOnView:)];
    self.swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    self.swipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeOnView:)];
    self.swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    
    self.swipeDownRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeOnView:)];
    self.swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:self.swipeRightRecognizer];
    [self.view addGestureRecognizer:self.swipeLeftRecognizer];
    [self.view addGestureRecognizer:self.swipeUpRecognizer];
    [self.view addGestureRecognizer:self.swipeDownRecognizer];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.canvas setNeedsDisplay];
}

- (IBAction)didClickStartButton:(id)sender{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refreshCanvas) userInfo:nil repeats:YES];
}

- (void)swipeOnView:(UISwipeGestureRecognizer *)recognizer{
    if((recognizer.direction == UISwipeGestureRecognizerDirectionRight && self.snake.direction == DirectionUp) ||
       (recognizer.direction == UISwipeGestureRecognizerDirectionDown && self.snake.direction == DirectionRight) ||
       (recognizer.direction == UISwipeGestureRecognizerDirectionLeft && self.snake.direction == DirectionDown) ||
       (recognizer.direction == UISwipeGestureRecognizerDirectionUp && self.snake.direction == DirectionLeft)){
        
        self.snake.turningDirection = TurningDirectionClockwise;
        
    } else if((recognizer.direction == UISwipeGestureRecognizerDirectionLeft && self.snake.direction == DirectionUp) ||
              (recognizer.direction == UISwipeGestureRecognizerDirectionDown && self.snake.direction == DirectionLeft) ||
              (recognizer.direction == UISwipeGestureRecognizerDirectionRight && self.snake.direction == DirectionDown) ||
              (recognizer.direction == UISwipeGestureRecognizerDirectionUp && self.snake.direction == DirectionRight)){
        
        self.snake.turningDirection = TurningDirectionCounterClockwise;
        
    }
}

- (void)refreshCanvas{
    if(![self.snake move]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        [self.timer invalidate];
    } else {
        [self.canvas setNeedsDisplay];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    self.timer = nil;
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
