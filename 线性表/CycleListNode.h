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
//循环链表 获得第i个元素的值
Status GetCycleElement(LinkList L, int i, ElementType *e);

//循环链表 插入一个元素
Status CycleListInsert(LinkList L, int i , ElementType e);

//循环链表 删除节点(获得该节点的前一个节点的值）
LinkList CyclelistDeleteElement(LinkList L, Node *deleteNode);

//循环链表  创建单链表
LinkList CreateCycleListTail(LinkList * p);

 
//循环链表  打印节点
void LogCycleListNode(LinkList p);

//循环链表   得到链表的长度
int cycleListGetLenth(LinkList L);


// 约瑟夫问题

void JosephusProblem(LinkList L , int length, int n);













