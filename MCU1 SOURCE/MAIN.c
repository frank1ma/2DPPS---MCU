/* 
========================主机程序说明===========================
项目名称：基于激光反馈的二维精密定位系统
程序名称：主机处理程序（MCU1）
程序作用：完成控制系统中主单片机的通讯与数据处理
程序语言：C51
程序作者：马上捷，机电工程学院2012级，中国矿业大学
程序注释：马上捷，机电工程学院2012级，中国矿业大学
创建时间：2016年5月1日
修改时间；2016年5月15日
注释修改：2016年5月20日
===============================================================
*/
#include <reg52.h>    //包含AT89C52头文件内容
#include <string.h>   //包含字符串处理头文件内容
#include <intrins.h>  //51单片机专用头文件

//定义参数
unsigned char code LedChar[] = { 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D,0x07,0x7F,0x6F}; //共阴极数码管数字段选码
unsigned char sdrq_buff[9]; // 定义接收PC请求代码区
unsigned char x[9];   // x坐标
unsigned char y[9];   // y坐标
unsigned char sim_serial[5]; //模拟串口代码存储区
bdata unsigned char SBUF1;   //定义一个位操作变量
bit rec_flag,sd_flag,sdrq_flag,save_flag; //定义接收标志，发送标志，PC机发送坐标请求标志
sbit TXD1 = P3^4;	//定义模拟输出脚
sbit RXD1 = P3^5;   //定义模拟输入脚
sbit TXD2 = P3^2;	//定义模拟输出脚
sbit RXD2 = P3^3;   //定义模拟输入脚
sbit SBUF1_bit0 = SBUF1^0;
sbit SBUF1_bit1 = SBUF1^1;
sbit SBUF1_bit2 = SBUF1^2;
sbit SBUF1_bit3 = SBUF1^3;
sbit SBUF1_bit4 = SBUF1^4;
sbit SBUF1_bit5 = SBUF1^5;
sbit SBUF1_bit6 = SBUF1^6;
sbit SBUF1_bit7 = SBUF1^7;



//函数原型声明
void initial_ptr(void);
void res_mcu1(char *,int,int);
void num_disp(char *,char *);
void trans_dic(char *);
void delay(void);
void delay_bps();
unsigned char getchar2();
void putchar2(unsigned char input);
unsigned char getchar1();
void putchar1(unsigned char input);

/*
======================主函数===================================
函数名称：main
函数参数：无（void）
函数返回值：无（void）
函数作用：主程序入口函数
创建时间：2016年5月1日
修改时间；2016年5月2日
注释修改：2016年5月20日
===============================================================
*/
void main(void)
{
  unsigned int i = 0;

 //设置定时器1 
 TMOD=0x20;          //T1，不受INT1控制(0)，定时(0)，工作模式(10）即模式2
 TH1=0xFD;           // 保存波特率初值9600
 TL1=0xFD;           // 8位计数器，自动装载初值
 
 //设置串口
 SCON=0x50;          // 工作方式1，允许接收
	
 //开启定时器
 TR1=1;
 
	//开启中断
 EA=1;               // 总中断开启
 ES=1;               // 串口通讯中断开启
 
 initial_ptr();      //初始化参数
 
 while(1){
	 
		while(sdrq_flag==0);//等待PC机请求
	  num_disp(x,y);
	 

	  //A001rr00  PC机请求建立通信
	 
	  while((!strcmp(sdrq_buff,"A001rr00"))&&(rec_flag==1 && sd_flag==1)) {
				     
				res_mcu1(sdrq_buff,6,0);              //转至应答处理函数                     
			}
		
		//A002rr00  PC机请求断开通信
			
     while((!strcmp(sdrq_buff,"A002rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);	
        sdrq_flag=0;             //关闭主机与PC通信，主机进入待机状态					
			}
		
			 
     //A003rr00 PC机请求发送坐标
			
     while((!strcmp(sdrq_buff,"A003rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
		
		 //A004rr00 PC机请求停止定位
			
     while((!strcmp(sdrq_buff,"A004rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
			
	   //A005rr00 PC机请求通信分机1
			
     while((!strcmp(sdrq_buff,"A005rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
		 //A006rr00 PC机请求通信分机2
			
     while((!strcmp(sdrq_buff,"A006rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
			 
     //X坐标 PC机请求发送坐标

		while((sdrq_buff[0]=='X')&& (rec_flag==1 && sd_flag==1)) {
			if(save_flag==0){
			   trans_dic(x);        //将x坐标转换至x数组
				 save_flag=1;
				for(i=0;i<8;i++) putchar2(sdrq_buff[i]);		
      }
			  res_mcu1(sdrq_buff,8,1); 
			}
			
			//Y坐标 PC机请求发送坐标
    while((sdrq_buff[0]=='Y')&& (rec_flag==1 && sd_flag==1)) {
			  if(save_flag==0){
			   trans_dic(y);        //将y坐标转换至y数组
				 save_flag=1;      
					for(i=0;i<8;i++) putchar1(sdrq_buff[i]);

				 }
			  res_mcu1(sdrq_buff,8,1);  
			}

   
}
		 
}



/*
======================串口通讯中断服务函数======================
函数名称：serial_int
函数参数：无（void）
函数作用：处理串口通讯中断服务内容
创建时间：2016年5月1日
修改时间；2016年5月2日
注释修改：2016年5月2日
===============================================================
*/
void serial_int(void) interrupt 4
{
	static unsigned int buff_cnt;     // 为读取buff提供计数
	
  //SBUF接受到内容产生中断
	if(RI==1){
		if(rec_flag==1) return;         //如果还有信息未处理，则跳出中断
		RI=0;                           //清除中断接收标志
		sdrq_buff[buff_cnt]= SBUF;			//读取一位PC请求代码
	  buff_cnt++;                     //接收计数加1，准备下一位读取
		
		if(buff_cnt==8){                //读满8位位代码
			if(sdrq_flag==0){				//如果PC机尚未发送启动请求
				
				if(!strcmp(sdrq_buff,"A001rr00")){ //判断是否为启动请求
					rec_flag=1;      //接收完毕标志
					sdrq_flag=1;
					buff_cnt=0;      //计数清零
				}
				else 
					buff_cnt=0;	     //计数清零
			
	    }
			else if(sdrq_buff[0]=='A'|| sdrq_buff[0]=='C' ||sdrq_buff[0]=='D'||sdrq_buff[0]=='X'||sdrq_buff[0]=='Y'){	   
				  rec_flag=1;
			    buff_cnt=0;
			}	
	  }
		
  }
	//SBUF发送了内容产生中断
	else{
		
	  TI=0;            //请除发送中断标志
		sd_flag=1;       //发送完毕标志
	}
}

/*
======================初始化参数函数============================
函数名称：initial_ptr
函数参数：无（void）
函数作用：初始化各使用参数
创建时间：2016年5月1日
修改时间；2016年5月2日
注释修改：2016年5月2日
===============================================================
*/
void initial_ptr(void)
{
 unsigned int i = 0;
 
 //初始化接收代码区
 for(i=0;i<8;i++) sdrq_buff[i]=0;
 //初始化标志
 rec_flag=0;       //已接收完毕的标志清空
 sd_flag=1;        //已发送完毕的标志置位
 sdrq_flag=0;      //已接收请求代码的标志清空
 save_flag=0;
 
}

/*
======================主机应答处理函数==========================
函数名称：res_mcu1
函数参数：应答数组名 res, 截取位数n,完整标志i
函数作用：处理来自PC的请求，生成应答。
创建时间：2016年5月1日
修改时间；2016年5月2日
注释修改：2016年5月20日
===============================================================
*/
void res_mcu1(char* res,int n,int i)
{	
	static unsigned int cnt=1;
	    if(cnt==1){
	    SBUF = 'B';		//表明来自主机的通讯
      while(!TI); }
     SBUF = res[cnt];
			while(!TI);       //这句话太关键了，SBUF发送需要时间，一定要等TI清0才能确定SBUF已经发送完毕
			cnt++;            //发送计数
			if(cnt==n && i==0){       		     
		   rec_flag= 0;    //接收处理完毕 
		   sd_flag=0;      //重置发送标志
			 cnt=1;          //重置计数
       SBUF = '1';		//结尾加上1代表同意
       while(!TI); 
       SBUF = '1'; 
       while(!TI);				
      }
			else if(cnt==n && i==1){       		     
		   rec_flag= 0;    //接收处理完毕
			 save_flag=0;
			 cnt=1;  
      }                //重置计数  
}



/*
======================数码管显示函数==========================
函数名称：num_disp
函数参数：处理数组arr
函数作用：将X坐标和Y坐标显示出来
创建时间：2016年5月2日
修改时间；2016年5月3日
注释修改：2016年5月20日
===============================================================
*/
void num_disp(char *arr1,char *arr2)
{
 P0=LedChar[arr1[1]];  //数码管选段
 P2=LedChar[arr2[1]];	
 P1=0x01;              //数码管选位
 delay();
 P0=0x00;              //消隐
 P2=0x00;
	 
 P0=LedChar[arr1[2]];
 P2=LedChar[arr2[2]];
 P1=0x01<<1;
 delay();
 P0=0x00;
 P2=0x00;
 
 P0=LedChar[arr1[3]];
 P2=LedChar[arr2[3]];
 P1=0x01<<2;
 delay();
 P0=0x00;
 P2=0x00;
	
 P0=LedChar[arr1[4]]+0x80;  //0x80为小数点
 P2=LedChar[arr2[4]]+0x80;
 P1=0x01<<3;
 delay();
 P0=0x00;
 P2=0x00;;
 
 P0=LedChar[arr1[5]];
 P2=LedChar[arr2[5]];
 P1=0x01<<4;
 delay();
 P0=0x00;
 P2=0x00;
 
 P0=LedChar[arr1[6]];
 P2=LedChar[arr2[6]];
 P1=0x01<<5;
 delay();
 P0=0x00;
 P2=0x00;
 
 P0=LedChar[arr1[7]];
 P2=LedChar[arr2[7]];
 P1=0x01<<6;
 delay();
 P0=0x00;
 P2=0x00;

}
/*
======================字典函数=================================
函数名称：trans_dic
函数参数：转换数组arr
函数作用：将X坐标和Y坐标从sdrq_buff中转换至对应数组中
创建时间：2016年5月4日
修改时间；2016年5月4日
注释修改：2016年5月20日
===============================================================
*/
void trans_dic(char *arr)
{
 unsigned int i;
 unsigned char k;	
	for(i=0;i<8;i++)
	{
   k=sdrq_buff[i];
	 
	switch(k){
		case 'X':
			arr[i]='X';
		  break;
		case 'Y':
			arr[i]='Y';
		  break;
		case '0':
			arr[i]=0;
		  break;
		case '1':
			arr[i]=1;
		  break;
		case '2':
			arr[i]=2;
		  break;
		case '3':
			arr[i]=3;
		  break;
		case '4':
			arr[i]=4;
		  break;
		case '5':
			arr[i]=5;
		  break;
		case '6':
			arr[i]=6;
		  break;
		case '7':
			arr[i]=7;
		  break;
		case '8':
			arr[i]=8;
		  break;
		case '9':
			arr[i]=9;
		  break;
	}

	}
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
/*
======================I/0模拟串口函数=================================
函数名称：getchar2()和 putchar2()
函数作用：模拟I/O发送串口数据
创建时间：2016年5月4日
修改时间；2016年5月10日
注释修改：2016年5月20日
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

unsigned char getchar1()	//模拟接收一个字节数据
{
	while (RXD2);
    _nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();_nop_();
    delay_bps();
    SBUF1_bit0 = RXD2; //0       
    delay_bps();
    SBUF1_bit1 = RXD2; //1       
    delay_bps();
    SBUF1_bit2 = RXD2; //2       
    delay_bps();
    SBUF1_bit3 = RXD2; //3       
    delay_bps();
    SBUF1_bit4 = RXD2; //4       
    delay_bps();
    SBUF1_bit5 = RXD2; //5       
    delay_bps();
    SBUF1_bit6 = RXD2; //6       
    delay_bps();
    SBUF1_bit7 = RXD2; //7       
	delay_bps();
    return(SBUF1) ;      //返回读取的数据
}

void putchar1(unsigned char input)    //模拟发送一个字节数据
{
    SBUF1 = input;
    TXD2 = 0;  //起始位
    delay_bps();    
    TXD2 = SBUF1_bit0;  //0
    delay_bps();    
    TXD2 = SBUF1_bit1;  //1
    delay_bps();    
    TXD2 = SBUF1_bit2;  //2
    delay_bps();    
    TXD2 = SBUF1_bit3;  //3
    delay_bps();    
    TXD2 = SBUF1_bit4;  //4
    delay_bps();    
    TXD2 = SBUF1_bit5;  //5
    delay_bps();    
    TXD2 = SBUF1_bit6;  //6
    delay_bps();    
    TXD2 = SBUF1_bit7;  //7
    delay_bps();    
    TXD2 = 1;       //停止位
    delay_bps();    
}
 
void delay_bps() {
   unsigned char i; 
   for (i = 0; i < 29; i++); 
      _nop_();
      _nop_();
   } //波特率9600 模拟一个9600波特率


