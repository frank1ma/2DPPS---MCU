/* 
========================分机程序说明===========================
项目名称：基于激光反馈的二维精密定位系统
程序名称：分机处理程序（MCU1）
程序作用：完成控制系统中分单片机的通讯与数据处理
程序语言：C51
程序作者：马上捷，机电工程学院2012级，中国矿业大学
程序注释：马上捷，机电工程学院2012级，中国矿业大学
创建时间：2016年5月5日
修改时间；2016年5月15日
注释修改：2016年5月20日
===============================================================
*/
#include <reg52.h>    //包含AT89C52头文件内容
#include <string.h>   //包含字符串处理头文件内容
#include <intrins.h>
#include <stdlib.h>

//定义参数
bdata unsigned char SBUF1;   //定义一个位操作变量
unsigned char code LedChar[] = { 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D,0x07,0x7F,0x6F}; //共阴极数码管数字段选码
const unsigned char step_table[]={0x04,0x0c,0x08,0x18,0x10,0x30,0x20,0x24};
unsigned char sdrq_buff[9]; // 定义接收主机请求代码区
unsigned char x[9];   // x坐标存储
unsigned char xx[9];  //数码管数组
unsigned int i = 0;
sbit TXD1 = P3^4;	//定义模拟输出脚
sbit RXD1 = P3^5;   //定义模拟输入脚
sbit SBUF1_bit0 = SBUF1^0;
sbit SBUF1_bit1 = SBUF1^1;
sbit SBUF1_bit2 = SBUF1^2;
sbit SBUF1_bit3 = SBUF1^3;
sbit SBUF1_bit4 = SBUF1^4;
sbit SBUF1_bit5 = SBUF1^5;
sbit SBUF1_bit6 = SBUF1^6;
sbit SBUF1_bit7 = SBUF1^7;


//函数原型声明
void num_disp(char *);
void delay(void);
void delay2(unsigned int);
void delay_bps();
unsigned char getchar2();
void putchar2(unsigned char input);
/*
======================主函数===================================
函数名称：main
函数参数：无（void）
函数返回值：无（void）
函数作用：主程序入口函数
创建时间：2016年5月5日
修改时间；2016年5月15日
注释修改：2016年5月20日
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
======================数码管显示函数==========================
函数名称：num_disp
函数参数：处理数组arr
函数作用：将X坐标和Y坐标显示出来
创建时间：2016年5月2日
修改时间；2016年5月15日
注释修改：2016年5月20日
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
======================延时函数=================================
函数名称：delay
函数作用：软件模拟延时
创建时间：2016年5月4日
修改时间；2016年5月4日
注释修改：2016年5月4日
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
   } //波特率9600 模拟一个9600波特率

void delay2(unsigned int a)
{
while(a--);
}

/*
======================模拟串口接受和发送函数=====================
函数名称：getchar2,putchar2
函数作用：模拟串口发送和接受数据
创建时间：2016年5月8日
修改时间；2016年5月11日
注释修改：2016年5月11日
===============================================================
*/
unsigned char getchar2()	//模拟接收一个字节数据
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
    return(SBUF1) ;      //返回读取的数据
}

void putchar2(unsigned char input)    //模拟发送一个字节数据
{
    SBUF1 = input;
    TXD1 = 0;  //起始位
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
    TXD1 = 1;       //停止位
    delay_bps();    
}
 

