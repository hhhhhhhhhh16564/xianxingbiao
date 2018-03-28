//
//  ViewController.m
//  线性表
//
//  Created by pro on 2018/3/25.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import "ViewController.h"
 
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"1"];
    
    [self sethh:array];
    
//    NSLog(@"%@", array);
}

-(void)sethh:(NSMutableArray *)jjj{
    
    [jjj addObject:@"22"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
