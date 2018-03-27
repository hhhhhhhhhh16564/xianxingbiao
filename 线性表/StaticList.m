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

//空闲的下标
int malloc_SLL(StaticLinkList list){
    
    int cur = list[0].cur;
    if (cur) {
        list[0].cur = list[cur].cur;
        
    }
    
    return cur;
}
//获得长度
int ListLength(StaticLinkList list){
    int k = list[MaxSize-1].cur;
    int j = 0;
    
    while (k) {
        k = list[k].cur;
        j++;
    }

    return j;
}


//插入
Status staticListInsert(StaticLinkList L, int i, ElementType e){
    if (i <1 || i > ListLength(L)+1 || i > MaxSize-2) {
        return errno;
    }
 
    //tag是要i的前一个元素的下标值
    int tag = MaxSize-1;
    int cur = malloc_SLL(L);

    if (cur) {
        
        for (int j = 1; j < i ; j++) {
            tag = L[tag].cur;
        }
        L[cur].data = e;
        L[cur].cur = L[tag].cur;
        L[tag].cur = cur;
    }
 
    return OK;
}
