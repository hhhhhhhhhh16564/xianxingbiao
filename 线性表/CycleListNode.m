//
//  CycleListNode.m
//  线性表
//
//  Created by yanbo on 2018/3/28.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import "CycleListNode.h"

//获得第i个元素的值
Status GetCycleElement(LinkList L, int i, ElementType *e){
    
    if (i < 1) {
        return errno;
    }
    
    Node *node = L;
    for (int j = 0; j < i; j++) {
        
        node = L->next;
        
        if (!node || node == L) {
            return errno;
        }
    }
    
    *e = node->data;
    return OK;
    
}

// 插入一个元素
Status CycleListInsert(LinkList L, int i , ElementType e){
    int length = cycleListGetLenth(L);

    if (i < 1 || i > length + 1) {
        return errno;
    }
    
    Node *node = L;

    for (int j = 0; j < length; j++) {
        node = node->next;
    }

    return OK;
    
}

// 获得循环链表的长度
int cycleListGetLenth(LinkList L){
    
    Node *node = L;
    
    if (L->next == L) {
        return 0;
    }
 
    
    int length = 0;
    
    while (node->next != L) {
        
        node = node->next;
        
        length++;
    }
    return length;
 
}

//删除元素
Status CyclelistDeleteElement(LinkList L, int i, ElementType *e);

//创建单链表
LinkList CreateCycleListTail(LinkList p, int n);

// 清除链表
Status clearCycleList(LinkList *L);

void LogCycleListNode(LinkList p);

