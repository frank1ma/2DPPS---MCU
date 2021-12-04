/* 
========================��������˵��===========================
��Ŀ���ƣ����ڼ��ⷴ���Ķ�ά���ܶ�λϵͳ
�������ƣ������������MCU1��
�������ã���ɿ���ϵͳ������Ƭ����ͨѶ�����ݴ���
�������ԣ�C51
�������ߣ����Ͻݣ����繤��ѧԺ2012�����й���ҵ��ѧ
����ע�ͣ����Ͻݣ����繤��ѧԺ2012�����й���ҵ��ѧ
����ʱ�䣺2016��5��1��
�޸�ʱ�䣻2016��5��15��
ע���޸ģ�2016��5��20��
===============================================================
*/
#include <reg52.h>    //����AT89C52ͷ�ļ�����
#include <string.h>   //�����ַ�������ͷ�ļ�����
#include <intrins.h>  //51��Ƭ��ר��ͷ�ļ�

//�������
unsigned char code LedChar[] = { 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D,0x07,0x7F,0x6F}; //��������������ֶ�ѡ��
unsigned char sdrq_buff[9]; // �������PC���������
unsigned char x[9];   // x����
unsigned char y[9];   // y����
unsigned char sim_serial[5]; //ģ�⴮�ڴ���洢��
bdata unsigned char SBUF1;   //����һ��λ��������
bit rec_flag,sd_flag,sdrq_flag,save_flag; //������ձ�־�����ͱ�־��PC���������������־
sbit TXD1 = P3^4;	//����ģ�������
sbit RXD1 = P3^5;   //����ģ�������
sbit TXD2 = P3^2;	//����ģ�������
sbit RXD2 = P3^3;   //����ģ�������
sbit SBUF1_bit0 = SBUF1^0;
sbit SBUF1_bit1 = SBUF1^1;
sbit SBUF1_bit2 = SBUF1^2;
sbit SBUF1_bit3 = SBUF1^3;
sbit SBUF1_bit4 = SBUF1^4;
sbit SBUF1_bit5 = SBUF1^5;
sbit SBUF1_bit6 = SBUF1^6;
sbit SBUF1_bit7 = SBUF1^7;



//����ԭ������
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
======================������===================================
�������ƣ�main
�����������ޣ�void��
��������ֵ���ޣ�void��
�������ã���������ں���
����ʱ�䣺2016��5��1��
�޸�ʱ�䣻2016��5��2��
ע���޸ģ�2016��5��20��
===============================================================
*/
void main(void)
{
  unsigned int i = 0;

 //���ö�ʱ��1 
 TMOD=0x20;          //T1������INT1����(0)����ʱ(0)������ģʽ(10����ģʽ2
 TH1=0xFD;           // ���沨���ʳ�ֵ9600
 TL1=0xFD;           // 8λ���������Զ�װ�س�ֵ
 
 //���ô���
 SCON=0x50;          // ������ʽ1���������
	
 //������ʱ��
 TR1=1;
 
	//�����ж�
 EA=1;               // ���жϿ���
 ES=1;               // ����ͨѶ�жϿ���
 
 initial_ptr();      //��ʼ������
 
 while(1){
	 
		while(sdrq_flag==0);//�ȴ�PC������
	  num_disp(x,y);
	 

	  //A001rr00  PC��������ͨ��
	 
	  while((!strcmp(sdrq_buff,"A001rr00"))&&(rec_flag==1 && sd_flag==1)) {
				     
				res_mcu1(sdrq_buff,6,0);              //ת��Ӧ������                     
			}
		
		//A002rr00  PC������Ͽ�ͨ��
			
     while((!strcmp(sdrq_buff,"A002rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);	
        sdrq_flag=0;             //�ر�������PCͨ�ţ������������״̬					
			}
		
			 
     //A003rr00 PC������������
			
     while((!strcmp(sdrq_buff,"A003rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
		
		 //A004rr00 PC������ֹͣ��λ
			
     while((!strcmp(sdrq_buff,"A004rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
			
	   //A005rr00 PC������ͨ�ŷֻ�1
			
     while((!strcmp(sdrq_buff,"A005rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
		 //A006rr00 PC������ͨ�ŷֻ�2
			
     while((!strcmp(sdrq_buff,"A006rr00"))&&(rec_flag==1 && sd_flag==1)) {

        res_mcu1(sdrq_buff,6,0);		
			}
			 
     //X���� PC������������

		while((sdrq_buff[0]=='X')&& (rec_flag==1 && sd_flag==1)) {
			if(save_flag==0){
			   trans_dic(x);        //��x����ת����x����
				 save_flag=1;
				for(i=0;i<8;i++) putchar2(sdrq_buff[i]);		
      }
			  res_mcu1(sdrq_buff,8,1); 
			}
			
			//Y���� PC������������
    while((sdrq_buff[0]=='Y')&& (rec_flag==1 && sd_flag==1)) {
			  if(save_flag==0){
			   trans_dic(y);        //��y����ת����y����
				 save_flag=1;      
					for(i=0;i<8;i++) putchar1(sdrq_buff[i]);

				 }
			  res_mcu1(sdrq_buff,8,1);  
			}

   
}
		 
}



/*
======================����ͨѶ�жϷ�����======================
�������ƣ�serial_int
�����������ޣ�void��
�������ã�������ͨѶ�жϷ�������
����ʱ�䣺2016��5��1��
�޸�ʱ�䣻2016��5��2��
ע���޸ģ�2016��5��2��
===============================================================
*/
void serial_int(void) interrupt 4
{
	static unsigned int buff_cnt;     // Ϊ��ȡbuff�ṩ����
	
  //SBUF���ܵ����ݲ����ж�
	if(RI==1){
		if(rec_flag==1) return;         //���������Ϣδ�����������ж�
		RI=0;                           //����жϽ��ձ�־
		sdrq_buff[buff_cnt]= SBUF;			//��ȡһλPC�������
	  buff_cnt++;                     //���ռ�����1��׼����һλ��ȡ
		
		if(buff_cnt==8){                //����8λλ����
			if(sdrq_flag==0){				//���PC����δ������������
				
				if(!strcmp(sdrq_buff,"A001rr00")){ //�ж��Ƿ�Ϊ��������
					rec_flag=1;      //������ϱ�־
					sdrq_flag=1;
					buff_cnt=0;      //��������
				}
				else 
					buff_cnt=0;	     //��������
			
	    }
			else if(sdrq_buff[0]=='A'|| sdrq_buff[0]=='C' ||sdrq_buff[0]=='D'||sdrq_buff[0]=='X'||sdrq_buff[0]=='Y'){	   
				  rec_flag=1;
			    buff_cnt=0;
			}	
	  }
		
  }
	//SBUF���������ݲ����ж�
	else{
		
	  TI=0;            //��������жϱ�־
		sd_flag=1;       //������ϱ�־
	}
}

/*
======================��ʼ����������============================
�������ƣ�initial_ptr
�����������ޣ�void��
�������ã���ʼ����ʹ�ò���
����ʱ�䣺2016��5��1��
�޸�ʱ�䣻2016��5��2��
ע���޸ģ�2016��5��2��
===============================================================
*/
void initial_ptr(void)
{
 unsigned int i = 0;
 
 //��ʼ�����մ�����
 for(i=0;i<8;i++) sdrq_buff[i]=0;
 //��ʼ����־
 rec_flag=0;       //�ѽ�����ϵı�־���
 sd_flag=1;        //�ѷ�����ϵı�־��λ
 sdrq_flag=0;      //�ѽ����������ı�־���
 save_flag=0;
 
}

/*
======================����Ӧ������==========================
�������ƣ�res_mcu1
����������Ӧ�������� res, ��ȡλ��n,������־i
�������ã���������PC����������Ӧ��
����ʱ�䣺2016��5��1��
�޸�ʱ�䣻2016��5��2��
ע���޸ģ�2016��5��20��
===============================================================
*/
void res_mcu1(char* res,int n,int i)
{	
	static unsigned int cnt=1;
	    if(cnt==1){
	    SBUF = 'B';		//��������������ͨѶ
      while(!TI); }
     SBUF = res[cnt];
			while(!TI);       //��仰̫�ؼ��ˣ�SBUF������Ҫʱ�䣬һ��Ҫ��TI��0����ȷ��SBUF�Ѿ��������
			cnt++;            //���ͼ���
			if(cnt==n && i==0){       		     
		   rec_flag= 0;    //���մ������ 
		   sd_flag=0;      //���÷��ͱ�־
			 cnt=1;          //���ü���
       SBUF = '1';		//��β����1����ͬ��
       while(!TI); 
       SBUF = '1'; 
       while(!TI);				
      }
			else if(cnt==n && i==1){       		     
		   rec_flag= 0;    //���մ������
			 save_flag=0;
			 cnt=1;  
      }                //���ü���  
}



/*
======================�������ʾ����==========================
�������ƣ�num_disp
������������������arr
�������ã���X�����Y������ʾ����
����ʱ�䣺2016��5��2��
�޸�ʱ�䣻2016��5��3��
ע���޸ģ�2016��5��20��
===============================================================
*/
void num_disp(char *arr1,char *arr2)
{
 P0=LedChar[arr1[1]];  //�����ѡ��
 P2=LedChar[arr2[1]];	
 P1=0x01;              //�����ѡλ
 delay();
 P0=0x00;              //����
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
	
 P0=LedChar[arr1[4]]+0x80;  //0x80ΪС����
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
======================�ֵ亯��=================================
�������ƣ�trans_dic
����������ת������arr
�������ã���X�����Y�����sdrq_buff��ת������Ӧ������
����ʱ�䣺2016��5��4��
�޸�ʱ�䣻2016��5��4��
ע���޸ģ�2016��5��20��
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
/*
======================I/0ģ�⴮�ں���=================================
�������ƣ�getchar2()�� putchar2()
�������ã�ģ��I/O���ʹ�������
����ʱ�䣺2016��5��4��
�޸�ʱ�䣻2016��5��10��
ע���޸ģ�2016��5��20��
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

unsigned char getchar1()	//ģ�����һ���ֽ�����
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
    return(SBUF1) ;      //���ض�ȡ������
}

void putchar1(unsigned char input)    //ģ�ⷢ��һ���ֽ�����
{
    SBUF1 = input;
    TXD2 = 0;  //��ʼλ
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
    TXD2 = 1;       //ֹͣλ
    delay_bps();    
}
 
void delay_bps() {
   unsigned char i; 
   for (i = 0; i < 29; i++); 
      _nop_();
      _nop_();
   } //������9600 ģ��һ��9600������


