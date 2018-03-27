//
//  StaticList.m
//  线性表
//
//  Created by pro on 2018/3/26.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import "StaticList.h"
//数组的第一个元素，即下标为0的那个元素的cur就存放备用链表的第一个结点的下标

//数组的最后一个元素，即下标为MAXSIZE-1的cur则存放第一个有数值的元素的下
Status initStaticLinkList(StaticLinkList list){
    for (int i = 0; i < MaxSize-1; i++) {
        list[i].cur = i+1;
    }
    
    list[MaxSize-1].cur = 0;
    
    return OK;
}

int malloc_SLL(StaticLinkList list){
    
    int cur = list[0].cur;
    if (cur) {
        list[0].cur = list[cur].cur;
    }
    return cur;
}
