#line 1 "E:/pic18f4550/SeminarProject.c"

sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD2_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD2_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;










volatile int temh,temm,tems,temyear,temmonth,temday;
volatile int cTime,cMode,cSet,cUp,cDown,cBlink;
volatile int fMode,fSet,fUp,fDown;
volatile int hour,minute,second;
volatile int year,month,day;
volatile int pos;
volatile int mode= 0 ;
volatile int setmode= 0 ;
volatile int fsync;
volatile int fsyncDone;
int i;
int j;
char uart_rd;
int lcdp=0;
int flagInfo= 0 ;
int flagDone= 0 ;
volatile char txt[]="          ";
int sync_time[]={0,0,0,0,0,0};

void DisplayClock(int th,int tm,int ts)
{
 Lcd_Chr(2,3,' ');
 Lcd_Chr_Cp('0'+(th/10));
 Lcd_Chr_Cp('0'+(th%10));
 Lcd_Chr_Cp(':');
 Lcd_Chr_Cp('0'+(tm/10));
 Lcd_Chr_Cp('0'+(tm%10));
 Lcd_Chr_Cp(':');
 Lcd_Chr_Cp('0'+(ts/10));
 Lcd_Chr_Cp('0'+(ts%10));
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(' ');
}

void DisplayCalendar(int tyear,int tmonth,int tday)
{
 Lcd_Chr(2,3,' ');
 Lcd_Chr_Cp('0'+tyear/1000);
 Lcd_Chr_Cp('0'+(tyear/100)%10);
 Lcd_Chr_Cp('0'+(tyear/10)%10);
 Lcd_Chr_Cp('0'+tyear%10);
 Lcd_Chr_Cp('/');
 Lcd_Chr_Cp('0'+tmonth/10);
 Lcd_Chr_Cp('0'+tmonth%10);
 Lcd_Chr_Cp('/');
 Lcd_Chr_Cp('0'+tday/10);
 Lcd_Chr_Cp('0'+tday%10);
}

void Display(int CurrentPosition,int displayData)
{
 if(mode== 0 )
 {
 switch(CurrentPosition)
 {
 case 0:
 {
 Lcd_Chr(2,3,' ');
 break;
 }
 case 1:
 {
 Lcd_Chr(2,6,':');
 break;
 }
 case 2:
 {
 Lcd_Chr(2,9,':');
 break;
 }
 default: break;
 }
 if(displayData>=0)
 {
 Lcd_Chr_Cp('0'+(displayData/10));
 Lcd_Chr_Cp('0'+(displayData%10));
 }
 else
 {
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(' ');
 }
 }
 else
 {
 switch(CurrentPosition)
 {
 case 0:
 {
 Lcd_Chr(2,3,' ');
 if(displayData>=0)
 {
 Lcd_Chr_Cp('0'+displayData/1000);
 Lcd_Chr_Cp('0'+(displayData/100)%10);
 Lcd_Chr_Cp('0'+(displayData/10)%10);
 Lcd_Chr_Cp('0'+displayData%10);
 }
 else
 {
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(' ');
 }
 break;
 }
 case 1:
 {
 Lcd_Chr(2,8,'/');
 if(displayData>=0)
 {
 Lcd_Chr_Cp('0'+displayData/10);
 Lcd_Chr_Cp('0'+displayData%10);
 }
 else
 {
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(' ');
 }
 break;
 }
 case 2:
 {
 Lcd_Chr(2,11,'/');
 if(displayData>=0)
 {
 Lcd_Chr_Cp('0'+displayData/10);
 Lcd_Chr_Cp('0'+displayData%10);
 }
 else
 {
 Lcd_Chr_Cp(' ');
 Lcd_Chr_Cp(' ');
 }
 break;
 }
 default: break;
 }
 }
}

int DayMax(int yr,int mth)
{
 if(mth==1||mth==3||mth==5||mth==7||
 mth==8||mth==10||mth==12)
 return 31;
 if(mth==4||mth==6||mth==9||mth==11)
 return 30;
 if(mth==2&&((yr%4==0&&yr%100!=0)||yr%400==0))
 return 29;
 else return 28;
}

void Timming(void)
{
 second=second+1;
 if(second==60)
 {
 second=0;
 minute=minute+1;
 if(minute==60)
 {
 minute=0;
 hour=hour+1;
 if(hour==24)
 {
 hour=0;
 day=day+1;
 if(day==(DayMax(year,month)+1))
 {
 day=1;
 month=month+1;
 if(month==13)
 {
 month=1;
 year=year+1;
 }
 }
 }
 }
 }
}

void TimeTracking(void)
{
 if(cTime<=0)
 {
 cTime=200;
 Timming();
 if(setmode== 0 )
 {
 if(mode== 0 ) DisplayClock(hour,minute,second);
 else DisplayCalendar(year,month,day);
 }
 }
}

void BlinkCreate(void)
{
 int blinkData;
 switch(pos)
 {
 case 0:
 {
 blinkData=(mode== 0 )?temh:temyear;
 break;
 }
 case 1:
 {
 blinkData=(mode== 0 )?temm:temmonth;
 break;
 }
 case 2:
 {
 blinkData=(mode== 0 )?tems:temday;
 break;
 }
 default:break;
 }
 if(cBlink<=0)
 {
 cBlink=200;
 Display(pos,-1);
 }
 if(cBlink==100)
 {
 Display(pos,blinkData);
 }
}

int power(int a, int n)
{
 if(n==0) return 1;
 else if(n==1) return a;
 else if(n==2) return a*a;
 else if(n==3) return a*a*a;
 else return 0;
}



int PortValue;
void CheckKey(void)
{
 PortValue=PORTB;
 if(PortValue!=0xef&&PortValue!=0xfb&&PortValue!=0xbf&&PortValue!=0x7f&&PortValue!=0xff)
 {
 cMode=100;cSet=400;cUp=100;cDown=100;
 fMode=fSet=fUp=fDown= 0 ;
 return;
 }
 if(PortValue==0xef) cMode--;
 if(PortValue==0xfb) cSet--;
 if(PortValue==0xbf&&setmode== -1 )
 {
 if(--cUp<=0) fUp= 2 ;
 }
 if(PortValue==0x7f&&setmode== -1 )
 {
 if(--cDown<=0) fDown= 2 ;
 }
 if((cMode!=100||cSet!=400||cUp!=100||cDown!=100)&&PortValue==0xff)
 {
 if(cMode>0&&cMode<=95) fMode= 1 ;
 if(cSet>0&&cSet<=395) fSet= 1 ;
 if(cUp>0&&cUp<=95) fUp= 1 ;
 else fUp= 0 ;
 if(cDown>0&&cDown<=95) fDown= 1 ;
 else fDown= 0 ;
 cMode=100;cSet=400;cUp=100;cDown=100;
 }
}

void KeyMode(void)
{
 fMode= 0 ;
 if(setmode== 0 )
 {
 mode=~mode;
 if(mode== 0 ) DisplayClock(hour,minute,second);
 else DisplayCalendar(year,month,day);
 }
 else
 {
 pos=0;
 cBlink=200;
 if(mode== 0 ) DisplayClock(hour,minute,second);
 else DisplayCalendar(year,month,day);
 setmode= 0 ;
 }
}

void KeySet(void)
{
 fSet= 0 ;
 if(setmode== 0 )
 {
 cBlink=0;
 setmode= -1 ;
 if(mode== 0 ) {tems=second;temm=minute;temh=hour;}
 else {temday=day;temmonth=month;temyear=year;}

 }
 else
 {
 cBlink=0;
 pos++;
 if(pos<3)
 {
 int d;
 if(mode== 0 ) d=(pos==1)?temh:temm;
 else d=(pos==1)?temyear:temmonth;
 Display(pos-1,d);
 }
 else
 {
 pos=0;
 cBlink=200;
 Lcd_Chr(1,3,' ');
 Lcd_Out_Cp("         ");
 if(mode ==  0 )
 {
 second=tems;minute=temm;hour=temh;
 DisplayClock(hour,minute,second);
 }
 else
 {
 day=temday;month=temmonth;year=temyear;
 DisplayCalendar(year,month,day);
 }
 setmode= 0 ;
 }
 }
}
void KeyUp(void)
{
 if(fUp== 2 )
 {
 if(cUp<=-20) cUp=0;
 else return;
 }
 switch(pos)
 {
 case 0:
 {
 if(mode== 0 )
 {
 if(++(temh)==24) temh=0;
 }
 else temyear++;
 break;
 }
 case 1:
 {
 if(mode== 0 )
 {
 if(++(temm)==60) temm=0;
 }
 else
 if(++(temmonth)==13) temmonth=1;
 break;
 }
 case 2:
 {
 if(mode== 0 )
 {
 if(++(tems)==60) tems=0;
 }
 else
 if(++(temday)==DayMax(temyear,temmonth)+1) temday=1;
 break;
 }
 default:break;
 }
 if(mode== 0 ) DisplayClock(temh,temm,tems);
 else DisplayCalendar(temyear,temmonth,temday);
 fUp= 0 ;
}
void KeyDown(void)
{
 if(fDown== 2 )
 {
 if(cDown==-20) cDown=0;
 else return;
 }
 switch(pos)
 {
 case 0:
 {
 if(mode== 0 )
 {
 if(--(temh)==-1) temh=23;
 }
 else temyear--;
 break;
 }
 case 1:
 {
 if(mode== 0 )
 {
 if(--(temm)==-1) temm=59;
 }
 else
 if(--(temmonth)==0) temmonth=12;
 break;
 }
 case 2:
 {
 if(mode== 0 )
 {
 if(--(tems)==-1) tems=59;
 }
 else
 if(--(temday)==0) temday=DayMax(temyear,temmonth);
 break;
 }
 default:break;
 }
 if(mode== 0 ) DisplayClock(temh,temm,tems);
 else DisplayCalendar(temyear,temmonth,temday);
 fDown= 0 ;
}




void timer0_init()
{
 INTCON.GIE=1;
 INTCON.TMR0IE=1;
 INTCON.TMR0IF=0;

 T0CON=0x02;
 TMR0L=0xcb;
 TMR0H=0xf3;
 cTime=200;
}

void interrupt()
{
 if(INTCON.TMR0IF)
 {
 INTCON.TMR0IF=0;
 TMR0L=0xcb;
 TMR0H=0xf3;
 cTime--;
 CheckKey();
 if(setmode== -1 ) cBlink--;

 }
}

int test =0;
int oldtest;
void main()
{
 INTCON2.RBPU=0;
 TRISB=0xff;
 TRISA=0x00;
 cMode=100;cSet=400;cUp=100;cDown=100;
 hour=0;minute=0;second=0;
 year=2000;month=1;day=1;
 pos=0;
 mode= 0 ;
 setmode= 0 ;
 fMode= 0 ; fSet= 0 ; fUp= 0 ; fDown= 0 ;
 fsync= 0 ;
 fsyncDone= -1 ;
 i=0;j=0;
 lcdp=0;
 flagInfo= 0 ;
 flagDone= 0 ;


 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 UART1_Init(9600);
 Delay_ms(100);

 DisplayClock(hour,minute,second);
 timer0_init();
 T0CON.TMR0ON=1;

 while(1)
 {
 if(fsync== 0 )
 {
 TimeTracking();
 if(fMode== 1 ) KeyMode();
 if(fSet== 1 ) KeySet();
 if(setmode== -1 )
 {
 if(fUp!= 0 ) KeyUp();
 if(fDown!= 0 ) KeyDown();
 BlinkCreate();
 }
 }
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 if(i<6)
 {
 if(uart_rd!='-' && uart_rd!=':' && uart_rd!=' ' &&uart_rd!='/')
 sync_time[i]+=(uart_rd-'0')*power(10,j++);
 else
 {
 if((++i)==6)
 {
 fsync= -1 ;
 }
 j=0;
 }
 }

 if(uart_rd=='/')
 {
 if(flagInfo== 0 ) flagInfo= -1 ;
 else
 {
 flagInfo= 0 ;
 flagDone= -1 ;
 }
 }
 if(flagInfo== -1 &&uart_rd!='/')
 txt[lcdp++]=uart_rd;
 }
 if(fsync== -1 )
 {
 second=sync_time[0];
 minute=sync_time[1];
 hour=sync_time[2];
 day=sync_time[3];
 month=sync_time[4];
 year=sync_time[5];
 for(i=0;i<6;i++)
 sync_time[i]=0;

 fsync= 0 ;
 }
 if(flagDone== -1 )
 {

 while(lcdp<10)
 {

 if(lcdp==9) txt[lcdp]='\0';
 else txt[lcdp]=' ';
 lcdp++;
 }

 Lcd_Chr(1,3,' ');
 Lcd_Out_Cp(txt);
 i=0;
 lcdp=0;
 flagDone= 0 ;
 }
 }
}
