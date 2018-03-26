//
//  ListNode.h
//  线性表
//
//  Created by pro on 2018/3/25.
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
Status GetElement(LinkList L, int i, ElementType *e);

// 插入一个元素
Status ListInsert(LinkList L, int i , ElementType e);

//删除元素
Status listDeleteElement(LinkList L, int i, ElementType *e);

//创建单链表
LinkList CreateListTail(LinkList p, int n);

// 清除链表
Status clearList(LinkList *L);

void LogListNode(LinkList p);











