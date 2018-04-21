// LCD module connections
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
    
#define  CANCEL 0
#define  ACCESS 1
#define  FASTACC 1
#define  SLOWACC 2
#define  CLOCK 0
#define  CALENDAR -1
#define  OFF 0
#define  ON -1

volatile int temh,temm,tems,temyear,temmonth,temday; //tempurature variable
volatile int cTime,cMode,cSet,cUp,cDown,cBlink;        //counter: cTime:clock cMode:btnmode cSet:btnset cUp:btnup cDown:btndown 
volatile int fMode,fSet,fUp,fDown;
volatile int hour,minute,second;                        //hour,minute,second
volatile int year,month,day;             //year,month,day
volatile int pos;                    //setting position
volatile int mode=CLOCK;                    //mode
volatile int setmode=OFF;                 //setmode
volatile int fsync;
volatile int fsyncDone;
int i;
int j;
char uart_rd;
int lcdp=0;
int flagInfo=OFF;
int flagDone=OFF;
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
  if(mode==CLOCK)
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
    if(setmode==OFF)
    {
      if(mode==CLOCK) DisplayClock(hour,minute,second);
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
      blinkData=(mode==CLOCK)?temh:temyear;
      break;
    }
    case 1:
    {
      blinkData=(mode==CLOCK)?temm:temmonth;
      break;
    }
    case 2:
    {
      blinkData=(mode==CLOCK)?tems:temday;
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

// //other function
// /////////////////////////////////////////////////
int PortValue;
void CheckKey(void)
{ 
  PortValue=PORTB;
  if(PortValue!=0xef&&PortValue!=0xfb&&PortValue!=0xbf&&PortValue!=0x7f&&PortValue!=0xff) //Press key together ?
  {
    cMode=100;cSet=400;cUp=100;cDown=100;   
    fMode=fSet=fUp=fDown=CANCEL;
    return;
  }
  if(PortValue==0xef) cMode--; //Press button mode  
  if(PortValue==0xfb) cSet--; // Press button set
  if(PortValue==0xbf&&setmode==ON) // Press button up
  {
    if(--cUp<=0) fUp=SLOWACC;
  }
  if(PortValue==0x7f&&setmode==ON) //Press button down
  {
    if(--cDown<=0) fDown=SLOWACC;
  }
  if((cMode!=100||cSet!=400||cUp!=100||cDown!=100)&&PortValue==0xff) //No key pressed and not default value
  {
    if(cMode>0&&cMode<=95) fMode=ACCESS;
    if(cSet>0&&cSet<=395) fSet=ACCESS;
    if(cUp>0&&cUp<=95) fUp=FASTACC;
    else fUp=CANCEL;
    if(cDown>0&&cDown<=95) fDown=FASTACC;
    else fDown=CANCEL;
    cMode=100;cSet=400;cUp=100;cDown=100;
  }
}

void KeyMode(void)
{
  fMode=CANCEL;
  if(setmode==OFF)
  {
    mode=~mode; 
    if(mode==CLOCK) DisplayClock(hour,minute,second);
    else DisplayCalendar(year,month,day);
  }
  else
  {
    pos=0;
    cBlink=200;
    if(mode==CLOCK) DisplayClock(hour,minute,second);
    else DisplayCalendar(year,month,day);
    setmode=OFF;  // cancel setmode
  }
}

void KeySet(void)
{
  fSet=CANCEL;
  if(setmode==OFF)
  {
    cBlink=0;
    setmode=ON;
    if(mode==CLOCK) {tems=second;temm=minute;temh=hour;}
    else {temday=day;temmonth=month;temyear=year;} 
    //save current data
  }
  else
  {
    cBlink=0;
    pos++;
    if(pos<3)
    {
      int d;
      if(mode==CLOCK) d=(pos==1)?temh:temm;
      else d=(pos==1)?temyear:temmonth;
      Display(pos-1,d);
    }
    else 
    {
      pos=0;
      cBlink=200;
      Lcd_Chr(1,3,' ');
      Lcd_Out_Cp("         ");
      if(mode == CLOCK)
      {
        second=tems;minute=temm;hour=temh; //save new data
        DisplayClock(hour,minute,second);
      }
      else
      {
        day=temday;month=temmonth;year=temyear; //save new data
        DisplayCalendar(year,month,day);
      }
      setmode=OFF;
    }
  }
}
void KeyUp(void)
{
  if(fUp==SLOWACC)
  {
    if(cUp<=-20) cUp=0;
    else return;
  }
  switch(pos)
  {
    case 0:
    {
      if(mode==CLOCK) 
      {
        if(++(temh)==24) temh=0;
      }
      else temyear++;
      break;
    }
    case 1:
    {
      if(mode==CLOCK) 
      {
        if(++(temm)==60) temm=0;
      }
      else 
        if(++(temmonth)==13) temmonth=1;
      break;
    }
    case 2:
    {
      if(mode==CLOCK) 
      {
        if(++(tems)==60) tems=0;
      }
      else 
        if(++(temday)==DayMax(temyear,temmonth)+1) temday=1;
      break;
    }
    default:break;
  }
  if(mode==CLOCK) DisplayClock(temh,temm,tems);
  else DisplayCalendar(temyear,temmonth,temday);
  fUp=CANCEL;
}
void KeyDown(void)
{
  if(fDown==SLOWACC)
  {
    if(cDown==-20) cDown=0;
    else return;
  }
  switch(pos)
  {
    case 0:
    {
      if(mode==CLOCK) 
      {
        if(--(temh)==-1) temh=23;
      }
      else temyear--;
      break;
    }
    case 1:
    {
      if(mode==CLOCK) 
      {
        if(--(temm)==-1) temm=59;
      }
      else 
        if(--(temmonth)==0) temmonth=12;
      break;
    }
    case 2:
    {
      if(mode==CLOCK) 
      {
        if(--(tems)==-1) tems=59;
      }
      else 
        if(--(temday)==0) temday=DayMax(temyear,temmonth);
      break;
    }
    default:break;
  }
  if(mode==CLOCK) DisplayClock(temh,temm,tems);
  else DisplayCalendar(temyear,temmonth,temday);
  fDown=CANCEL;
}

//button
////////////////////////////////////////////////

void timer0_init() // normal mode
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
    INTCON.TMR0IF=0; //clear interrupt flag
    TMR0L=0xcb;
    TMR0H=0xf3;
    cTime--;
    CheckKey();
    if(setmode==ON) cBlink--;

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
  hour=0;minute=0;second=0;                      //default hour,minute,second
  year=2000;month=1;day=1;          //default year,month,day
  pos=0;                    //default setting position
  mode=CLOCK;                 // default mode
  setmode=OFF;
  fMode=CANCEL; fSet=CANCEL; fUp=CANCEL; fDown=CANCEL;
  fsync=OFF;
  fsyncDone=ON;
  i=0;j=0;
  lcdp=0;
  flagInfo=OFF;
  flagDone=OFF;


  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  
  UART1_Init(9600);
  Delay_ms(100);

  DisplayClock(hour,minute,second);
  timer0_init();
  T0CON.TMR0ON=1;

  while(1)
  {
    if(fsync==OFF)
    {
      TimeTracking();
      if(fMode==ACCESS) KeyMode();
      if(fSet==ACCESS) KeySet();
      if(setmode==ON)
      {
        if(fUp!=CANCEL) KeyUp();
        if(fDown!=CANCEL) KeyDown();
        BlinkCreate();
      }
    }
    if (UART1_Data_Ready()) {     // If data is received,
      uart_rd = UART1_Read();     // read the received data,
      if(i<6)
      {          
        if(uart_rd!='-' && uart_rd!=':' && uart_rd!=' ' &&uart_rd!='/')
          sync_time[i]+=(uart_rd-'0')*power(10,j++);
        else
        {
          if((++i)==6) 
            {
              fsync=ON;
            }
          j=0;
        }
      }

      if(uart_rd=='/') 
      {
        if(flagInfo==OFF) flagInfo=ON;
        else 
        {
          flagInfo=OFF;
          flagDone=ON;
        }
      }
      if(flagInfo==ON&&uart_rd!='/') 
        txt[lcdp++]=uart_rd;
    }
    if(fsync==ON)
    {
      second=sync_time[0];
      minute=sync_time[1];
      hour=sync_time[2];
      day=sync_time[3];
      month=sync_time[4];
      year=sync_time[5];
      for(i=0;i<6;i++) 
        sync_time[i]=0;
      
      fsync=OFF;
    }
    if(flagDone==ON)
    {
      // txt[lcdp]='\0';
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
      flagDone=OFF;
    }
  }
}