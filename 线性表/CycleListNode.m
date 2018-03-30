//
//  CycleListNode.m
//  线性表
//
//  Created by yanbo on 2018/3/28.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import "CycleListNode.h"

//循环链表 获得第i个元素的值
Status GetCycleElement(LinkList L, int i, ElementType *e){
    
    if (i < 1) {
        return errno;
    }
    
    Node *node = L;
    for (int j = 0; j < i; j++) {
        
        node = node->next;
        
        if (!node || node == L) {
            return errno;
        }
    }
    *e = node->data;
    return OK;
    
}

//循环链表 插入一个元素
Status CycleListInsert(LinkList L, int i , ElementType e){
    int length = cycleListGetLenth(L);

    if (i < 1 || i > length + 1) {
        return errno;
    }

    Node *node = L;

    for (int j = 1; j < i; j++) {
        node = node->next;
    }

    Node *inserNode = (Node *)malloc(sizeof(Node));
    inserNode->data = e;
    inserNode->next = node->next;



    node->next = inserNode;



    return OK;
    
}

// //循环链表   得到链表的长度
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

//循环链表 删除节点(获得该节点的前一个节点的值）
LinkList CyclelistDeleteElement(LinkList L, Node *deleteNode){
    int length = cycleListGetLenth(L);
    
    Node *tempNode = L;
 
    for (int i = 0 ; i < length; i++) {
        
        if (tempNode->next == deleteNode) {
            break;
        }
        tempNode = tempNode->next;
    }
  
    tempNode->next = deleteNode->next;
    
    free(deleteNode);
    
    return tempNode;
    
}

//循环链表  创建单链表
LinkList CreateCycleListTail(LinkList  * p){

    Node *headNode = (Node *)malloc(sizeof(Node));
    headNode->next = headNode;
    headNode->data = 1111;
    *p = headNode;
    return headNode;
 
}

 
//循环链表  打印节点
void LogCycleListNode(LinkList p){
    
    int length = cycleListGetLenth(p);
    
    Node *node = p;
    for (int i = 0; i < length; i++) {
        node = node->next;
        printf("--%d--", node->data);
        
    }

     printf("---  \n");
    
    
}

// 约瑟夫问题
//据说著名犹太历史学家 Josephus有过以下的故事：在罗马人占领乔塔帕特后，39 个犹太人与Josephus及他的朋友躲到一个洞中，39个犹太人决定宁愿死也不要被敌人抓到，于是决定了一个自杀方式，41个人排成一个圆圈，由第1个人开始报数，每报数到第3人该人就必须自杀，然后再由下一个重新报数，直到所有人都自杀身亡为止。然而Josephus 和他的朋友并不想遵从。首先从一个人开始，越过k-2个人（因为第一个人已经被越过），并杀掉第k个人。接着，再越过k-1个人，并杀掉第k个人。这个过程沿着圆圈一直进行，直到最终只剩下一个人留下，这个人就可以继续活着。问题是，给定了和，一开始要站在什么地方才能避免被处决？Josephus要他的朋友先假装遵从，他将朋友与自己安排在第16个与第31个位置，于是逃过了这场死亡游戏

// L 链表（带有头结点）
// length 总共几个人
// n 第几个死亡

void JosephusProblem(LinkList p , int length, int n){
    
    for (int i = 1; i <= length; i++) {
        
        CycleListInsert(p, i, i);
    }
    int j = 0;
    int k = length;
    
    Node *tempNode = p;
    while (k) {
        j++;
        tempNode = tempNode->next;
        
        //如果是头指针，指向下一个
        if (tempNode == p) {
            tempNode = tempNode->next;
        }
        if (j == n) {
            printf(" %d", tempNode->data);
            // 删除节点，并将节点指向被删除的节点的前一个节点
            tempNode =  CyclelistDeleteElement(p, tempNode);
            k--;
            j = 0;
        }
        
    }
    
}
