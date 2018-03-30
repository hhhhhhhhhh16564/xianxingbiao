//
//  main.m
//  线性表
//
//  Created by pro on 2018/3/25.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CycleListNode.h"
//#import "ListNode.h"
#import "StaticList.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        LinkList p = NULL;
 
        
        
        
        
        
        
        CreateCycleListTail(&p);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
    }
}
