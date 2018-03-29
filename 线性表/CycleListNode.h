//
//  CycleListNode.h
//  线性表
//
//  Created by yanbo on 2018/3/28.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Error -1
#define OK   1
typedef int Status;

typedef int ElementType;

typedef struct Node{
    
    ElementType data;
    struct Node * next;
}Node, * LinkList;
//获得第i个元素的值
Status GetCycleElement(LinkList L, int i, ElementType *e);

// 插入一个元素
Status CycleListInsert(LinkList L, int i , ElementType e);

//删除元素
LinkList CyclelistDeleteElement(LinkList L, Node *deleteNode);



//创建单链表
LinkList CreateCycleListTail(LinkList * p);

 

void LogCycleListNode(LinkList p);


int cycleListGetLenth(LinkList L);
