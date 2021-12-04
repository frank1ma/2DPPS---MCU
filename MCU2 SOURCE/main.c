/* 
========================�ֻ�����˵��===========================
��Ŀ���ƣ����ڼ��ⷴ���Ķ�ά���ܶ�λϵͳ
�������ƣ��ֻ��������MCU1��
�������ã���ɿ���ϵͳ�зֵ�Ƭ����ͨѶ�����ݴ���
�������ԣ�C51
�������ߣ����Ͻݣ����繤��ѧԺ2012�����й���ҵ��ѧ
����ע�ͣ����Ͻݣ����繤��ѧԺ2012�����й���ҵ��ѧ
����ʱ�䣺2016��5��5��
�޸�ʱ�䣻2016��5��15��
ע���޸ģ�2016��5��20��
===============================================================
*/
#include <reg52.h>    //����AT89C52ͷ�ļ�����
#include <string.h>   //�����ַ�������ͷ�ļ�����
#include <intrins.h>
#include <stdlib.h>

//�������
bdata unsigned char SBUF1;   //����һ��λ��������
unsigned char code LedChar[] = { 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D,0x07,0x7F,0x6F}; //��������������ֶ�ѡ��
const unsigned char step_table[]={0x04,0x0c,0x08,0x18,0x10,0x30,0x20,0x24};
unsigned char sdrq_buff[9]; // ��������������������
unsigned char x[9];   // x����洢
unsigned char xx[9];  //���������
unsigned int i = 0;
sbit TXD1 = P3^4;	//����ģ�������
sbit RXD1 = P3^5;   //����ģ�������
sbit SBUF1_bit0 = SBUF1^0;
sbit SBUF1_bit1 = SBUF1^1;
sbit SBUF1_bit2 = SBUF1^2;
sbit SBUF1_bit3 = SBUF1^3;
sbit SBUF1_bit4 = SBUF1^4;
sbit SBUF1_bit5 = SBUF1^5;
sbit SBUF1_bit6 = SBUF1^6;
sbit SBUF1_bit7 = SBUF1^7;


//����ԭ������
void num_disp(char *);
void delay(void);
void delay2(unsigned int);
void delay_bps();
unsigned char getchar2();
void putchar2(unsigned char input);
/*
======================������===================================
�������ƣ�main
�����������ޣ�void��
��������ֵ���ޣ�void��
�������ã���������ں���
����ʱ�䣺2016��5��5��
�޸�ʱ�䣻2016��5��15��
ע���޸ģ�2016��5��20��
===============================================================
*/
void main(void)
{
unsigned int a,c,flag;
	unsigned long b;
	
  while(1){
 	   num_disp(xx); 
   while(i<8 ){
    x[i]=getchar2()-48;
		xx[i]=x[i];
		i++;
	 }
	 c=2000;
	 b=3000;
	 if(flag==0)
	 {
		 while(b--)
    {
        for(a=0;a<8;a++)
        {
            P1=step_table[a];
           delay2(c);
        }
			if(c>100) c=c-10;
    }
		flag=1;
  }
}
}
/*
======================�������ʾ����==========================
�������ƣ�num_disp
������������������arr
�������ã���X�����Y������ʾ����
����ʱ�䣺2016��5��2��
�޸�ʱ�䣻2016��5��15��
ע���޸ģ�2016��5��20��
===============================================================
*/
void num_disp(char *arr1)
{
 if(arr1[0]!=40) return;
 P0=LedChar[arr1[1]];	
 P2=0x01;
 delay();
 P0=0x00;
	 
 P0=LedChar[arr1[2]];	
 P2=0x01<<1;
 delay();
 P0=0x00;
 
 P0=LedChar[arr1[3]];	
 P2=0x01<<2;
 delay();
 P0=0x00;
	 
 P0=LedChar[arr1[4]]+0x80;	
 P2=0x01<<3;
 delay();
 P0=0x00;
 
 P0=LedChar[arr1[5]];	
 P2=0x01<<4;
 delay();
 P0=0x00;
	 
 P0=LedChar[arr1[6]];	
 P2=0x01<<5;
 delay();
 P0=0x00;

 P0=LedChar[arr1[7]];
 P2=0x01<<6;
 delay();
 P0=0x00;

}


/*
======================��ʱ����=================================
�������ƣ�delay
�������ã����ģ����ʱ
����ʱ�䣺2016��5��4��
�޸�ʱ�䣻2016��5��4��
ע���޸ģ�2016��5��4��
===============================================================
*/
void delay(void)

{
        unsigned int i,j;
	i=1;
  while(i--){
		
         for(j=0;j<125;j++);
  }

}

void delay_bps() {
   unsigned char i; 
   for (i = 0; i < 29; i++); 
      _nop_();
      _nop_();
   } //������9600 ģ��һ��9600������

void delay2(unsigned int a)
{
while(a--);
}

/*
======================ģ�⴮�ڽ��ܺͷ��ͺ���=====================
�������ƣ�getchar2,putchar2
�������ã�ģ�⴮�ڷ��ͺͽ�������
����ʱ�䣺2016��5��8��
�޸�ʱ�䣻2016��5��11��
ע���޸ģ�2016��5��11��
===============================================================
*/
unsigned char getchar2()	//ģ�����һ���ֽ�����
{
	while (RXD1);
    _nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();
    delay_bps();
    SBUF1_bit0 = RXD1; //0       
    delay_bps();
    SBUF1_bit1 = RXD1; //1       
    delay_bps();
    SBUF1_bit2 = RXD1; //2       
    delay_bps();
    SBUF1_bit3 = RXD1; //3       
    delay_bps();
    SBUF1_bit4 = RXD1; //4       
    delay_bps();
    SBUF1_bit5 = RXD1; //5       
    delay_bps();
    SBUF1_bit6 = RXD1; //6       
    delay_bps();
    SBUF1_bit7 = RXD1; //7       
	  delay_bps();
    return(SBUF1) ;      //���ض�ȡ������
}

void putchar2(unsigned char input)    //ģ�ⷢ��һ���ֽ�����
{
    SBUF1 = input;
    TXD1 = 0;  //��ʼλ
    delay_bps();    
    TXD1 = SBUF1_bit0;  //0
    delay_bps();    
    TXD1 = SBUF1_bit1;  //1
    delay_bps();    
    TXD1 = SBUF1_bit2;  //2
    delay_bps();    
    TXD1 = SBUF1_bit3;  //3
    delay_bps();    
    TXD1 = SBUF1_bit4;  //4
    delay_bps();    
    TXD1 = SBUF1_bit5;  //5
    delay_bps();    
    TXD1 = SBUF1_bit6;  //6
    delay_bps();    
    TXD1 = SBUF1_bit7;  //7
    delay_bps();    
    TXD1 = 1;       //ֹͣλ
    delay_bps();    
}
 

