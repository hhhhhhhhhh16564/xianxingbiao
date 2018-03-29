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
        
   

        

        for (int i = 1; i <= 41; i++) {

             CycleListInsert(p, i, i);
         }
  
//        LogCycleListNode(p);
        
 
        int i = 0;
        int j = 0;
        int k = 41;
        
        Node *tempNode = p;
        while (k) {
     
            i++;
            j++;
            
    
            tempNode = tempNode->next;

            if (j == 3) {

             tempNode =  CyclelistDeleteElement(p, tempNode);
                k--;
                j = 0;
            }
  
        }
        

         return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
    }
}
