VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "���ⷴ����ά���ܶ�λϵͳ�ͻ��� -�й���ҵ��ѧ���繤��ѧԺ"
   ClientHeight    =   8535
   ClientLeft      =   5565
   ClientTop       =   3450
   ClientWidth     =   12270
   Icon            =   "main.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   8535
   ScaleWidth      =   12270
   Begin MSCommLib.MSComm MSComm1 
      Left            =   11640
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Timer timer_comm 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   7560
      Top             =   7200
   End
   Begin VB.Frame Frame4 
      Caption         =   "ͨѶ���"
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   240
      TabIndex        =   43
      Top             =   6960
      Width           =   6915
      Begin VB.CommandButton Command1 
         Caption         =   "��λ"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2040
         TabIndex        =   53
         Top             =   840
         Width           =   855
      End
      Begin VB.CommandButton button_mcu1_discomm 
         Caption         =   "����"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1080
         TabIndex        =   51
         Top             =   840
         Width           =   855
      End
      Begin VB.CommandButton button_mcu1_comm 
         Caption         =   "����"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   46
         Top             =   840
         Width           =   855
      End
      Begin VB.Label label_mcu3 
         Caption         =   "OFF"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   495
         Left            =   6120
         TabIndex        =   50
         Top             =   360
         Width           =   855
      End
      Begin VB.Label label_mcu2 
         Caption         =   "OFF"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   495
         Left            =   4320
         TabIndex        =   49
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label22 
         Caption         =   "�ֻ�2"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5280
         TabIndex        =   48
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label21 
         Caption         =   "�ֻ�1"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3480
         TabIndex        =   47
         Top             =   360
         Width           =   855
      End
      Begin VB.Label label_mcu1 
         Caption         =   "OFF"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   495
         Left            =   1920
         TabIndex        =   45
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label19 
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1080
         TabIndex        =   44
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "���ⷴ��"
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   7200
      TabIndex        =   33
      Top             =   4080
      Width           =   4935
      Begin VB.Label Label18 
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2040
         TabIndex        =   40
         Top             =   1680
         Width           =   1455
      End
      Begin VB.Label Label17 
         Caption         =   "����ʱ�䣺"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   39
         Top             =   1680
         Width           =   1215
      End
      Begin VB.Label Label16 
         Caption         =   "δ����"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2040
         TabIndex        =   38
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label15 
         Caption         =   "Y������"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   37
         Top             =   1080
         Width           =   1215
      End
      Begin VB.Label Label14 
         Caption         =   "δ����"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2040
         TabIndex        =   36
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label Label13 
         Caption         =   "X������"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   35
         Top             =   480
         Width           =   1575
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "ƽ̨����"
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   240
      TabIndex        =   19
      Top             =   4080
      Width           =   6915
      Begin VB.CommandButton button_clear_cord 
         Caption         =   "���"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5400
         TabIndex        =   41
         Top             =   2160
         Width           =   1095
      End
      Begin VB.CommandButton button_check 
         Caption         =   "���λ��"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1080
         TabIndex        =   32
         Top             =   2160
         Width           =   1095
      End
      Begin VB.CommandButton button_stop 
         Caption         =   "ֹͣ��λ"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3960
         TabIndex        =   31
         Top             =   2160
         Width           =   1095
      End
      Begin VB.CommandButton button_cord_help 
         Caption         =   "?"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   26
         Top             =   2160
         Width           =   495
      End
      Begin VB.TextBox text_cord_y 
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1680
         TabIndex        =   25
         Top             =   1320
         Width           =   1455
      End
      Begin VB.CommandButton button_start 
         Caption         =   "������λ"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2520
         TabIndex        =   21
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox text_cord_x 
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1680
         TabIndex        =   20
         Top             =   600
         Width           =   1455
      End
      Begin VB.Label Label12 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5160
         TabIndex        =   30
         Top             =   1320
         Width           =   1455
      End
      Begin VB.Label Label11 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5160
         TabIndex        =   29
         Top             =   600
         Width           =   1455
      End
      Begin VB.Label Label10 
         Caption         =   "��ǰY����(mm)"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3480
         TabIndex        =   28
         Top             =   1320
         Width           =   1575
      End
      Begin VB.Label Label9 
         Caption         =   "��ǰX����(mm)"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3480
         TabIndex        =   27
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label Label8 
         Caption         =   "ָ��Y����(mm)"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   24
         Top             =   1320
         Width           =   1575
      End
      Begin VB.Label Label7 
         Caption         =   "ָ��X����(mm)"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   23
         Top             =   720
         Width           =   1575
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "��Ϣ���"
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3975
      Left            =   3600
      TabIndex        =   17
      Top             =   120
      Width           =   8535
      Begin VB.CommandButton Command4 
         Caption         =   "���Խ���"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   3720
         TabIndex        =   42
         Top             =   3360
         Width           =   1095
      End
      Begin VB.CommandButton button_monitor_clear 
         Caption         =   "��ռ�¼"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2160
         TabIndex        =   22
         Top             =   3360
         Width           =   1095
      End
      Begin VB.TextBox text_monitor 
         Height          =   2895
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         Top             =   360
         Width           =   8295
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   11640
      Top             =   5880
   End
   Begin VB.Frame Frame_bus 
      Caption         =   "����ͨѶ������"
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3975
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   3320
      Begin VB.ComboBox Combo_stopbit 
         Height          =   300
         ItemData        =   "main.frx":324A
         Left            =   960
         List            =   "main.frx":3257
         TabIndex        =   16
         Text            =   "1"
         Top             =   2400
         Width           =   1935
      End
      Begin VB.CommandButton button_bus_close 
         Caption         =   "�رմ���"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2040
         TabIndex        =   13
         Top             =   3360
         Width           =   1095
      End
      Begin VB.CommandButton button_bus_open 
         Caption         =   "��������"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   840
         TabIndex        =   12
         Top             =   3360
         Width           =   1095
      End
      Begin VB.CommandButton button_bus_help 
         Caption         =   "��"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   11
         Top             =   3360
         Width           =   495
      End
      Begin VB.ComboBox Combo_databit 
         Height          =   300
         ItemData        =   "main.frx":3266
         Left            =   960
         List            =   "main.frx":3276
         TabIndex        =   8
         Text            =   "8"
         Top             =   1920
         Width           =   1935
      End
      Begin VB.ComboBox Combo_checkbit 
         Height          =   300
         ItemData        =   "main.frx":3286
         Left            =   960
         List            =   "main.frx":3299
         TabIndex        =   6
         Text            =   "N"
         Top             =   1440
         Width           =   1935
      End
      Begin VB.ComboBox Combo_baudrate 
         Height          =   300
         ItemData        =   "main.frx":32AC
         Left            =   960
         List            =   "main.frx":32BC
         TabIndex        =   4
         Text            =   "9600"
         Top             =   960
         Width           =   1935
      End
      Begin VB.ComboBox Combo_port_number 
         Height          =   300
         ItemData        =   "main.frx":32DA
         Left            =   960
         List            =   "main.frx":32E4
         TabIndex        =   2
         Text            =   "COM3"
         Top             =   480
         Width           =   1935
      End
      Begin VB.Label Label6 
         Caption         =   "ֹͣλ"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   15
         Top             =   2400
         Width           =   855
      End
      Begin VB.Label label_bus_state 
         Caption         =   "           OFF"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   1200
         TabIndex        =   10
         Top             =   2880
         Width           =   1575
      End
      Begin VB.Label Label5 
         Caption         =   "����״̬"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   2880
         Width           =   855
      End
      Begin VB.Label Label4 
         Caption         =   "����λ"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   1920
         Width           =   855
      End
      Begin VB.Label Label3 
         Caption         =   "У��λ"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   5
         Top             =   1440
         Width           =   735
      End
      Begin VB.Label Label2 
         Caption         =   "������"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   960
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "�˿ں�"
         BeginProperty Font 
            Name            =   "΢���ź�"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   480
         Width           =   735
      End
   End
   Begin VB.Label Label20 
      Caption         =   "        ��д���� Visual Basic 6.0                           ���� ���Ͻ�  "
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   8640
      TabIndex        =   52
      Top             =   7080
      Width           =   3375
   End
   Begin VB.Label label_state_system 
      Caption         =   "״̬��"
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7320
      TabIndex        =   34
      Top             =   7920
      Width           =   1695
   End
   Begin VB.Label label_time 
      Caption         =   "ϵͳʱ�䣺"
      BeginProperty Font 
         Name            =   "΢���ź�"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9120
      TabIndex        =   14
      Top             =   7920
      Width           =   3015
   End
   Begin VB.Menu about 
      Caption         =   "����"
      Index           =   0
   End
   Begin VB.Menu exit 
      Caption         =   "�˳�"
      Index           =   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public send_data As String
Public j As Integer
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Sub about_Click(Index As Integer)
Form2.Show  '�򿪹��ڴ���
End Sub




Private Sub button_clear_cord_Click()
text_cord_x = ""
text_cord_y = ""
text_cord_x.SetFocus
If MSComm1.PortOpen = True Then
MSComm1.Output = "X0000000"
Sleep 200
MSComm1.Output = "Y0000000"
Sleep 200
End If
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   �����Ŀ������"

End Sub

Private Sub button_mcu1_comm_Click()
Dim send_request As String

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ����������(MCU1)��������...."
send_request = "A001rr00" '����������λ����"
send_data = send_request

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ͨ���˿�" & Combo_port_number.Text & "   ����������������  �������" & send_data
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   �ȴ�����Ӧ��...."

MSComm1.Output = send_request

timer_comm.Enabled = True
End Sub

Private Sub button_mcu1_discomm_Click()
Dim send_request As String

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ����������(MCU1)��������...."
send_request = "A002rr00" ' �����ж�ͨ������
send_data = send_request

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ͨ���˿�" & Combo_port_number.Text & "   ����������������  �������" & send_data
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   �ȴ�����Ӧ��...."
label_mcu2.Caption = "OFF"
label_mcu2.ForeColor = vbRed
label_mcu3.Caption = "OFF"
label_mcu3.ForeColor = vbRed
label_state_system.Caption = "״̬��  δ����"
MSComm1.Output = send_request
End Sub

Private Sub button_monitor_clear_Click()
text_monitor.Text = ""
End Sub

Private Sub button_start_Click()
Dim send_request As String

If (text_cord_x = "") Or (text_cord_y = "") Then
MsgBox "����ֵ��д����ȷ"
Exit Sub
End If

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ����������(MCU1)��������...."
send_request = "A003rr00" ' ����������λ����
send_data = send_request
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ͨ���˿�" & Combo_port_number.Text & "   ����������������  �������" & send_data

MSComm1.Output = send_request


End Sub

Private Sub button_stop_Click()
Dim send_request As String

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ����������(MCU1)��������...."
send_request = "A004rr00" ' ����ֹͣ��λ����
send_data = send_request
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ͨ���˿�" & Combo_port_number.Text & "   ����������������  �������" & send_data

MSComm1.Output = send_request

End Sub

Private Sub exit_Click(Index As Integer)
Unload Me  'ж�ش���
End Sub

Private Sub Form_Load()
Timer1.Enabled = True '����ϵͳʱ��ʱ��
label_state_system.Caption = "״̬��  δ����"
End Sub

Private Sub Form_Unload(Cancel As Integer)  '�رճ�����ʾ
Dim RESPONSE

RESPONSE = MsgBox("ȷ��Ҫ�˳�������", vbYesNoCancel)

Select Case RESPONSE
    Case vbYes
        End
    Case vbNo
        Cancel = -1
    Case vbCancel
        Cancel = -1
End Select

End Sub
Private Sub button_bus_open_Click()
i = 0
On Error GoTo error1
Dim brate, cbit, dbit, sbit  '����ͨѶ��������
brate = Val(Combo_baudrate.Text)  '��ֵ����
cbit = Combo_checkbit.Text
dbit = Val(Combo_databit.Text)
sbit = Val(Combo_stopbit.Text)

If Combo_port_number.Text = "COM3" Then  '����ͨѶ�˿�
    MSComm1.CommPort = 3
Else
If Combo_port_number.Text = "COM4" Then
    MSComm1.CommPort = 4
End If
End If

MSComm1.Settings = Str(brate) + cbit + Str(dbit) + Str(sbit) '�������ݴ����ʺͷ����ַ���ʽ
MSComm1.InBufferSize = 1024         '���ý��ջ�����1024Byte
MSComm1.InputLen = 0                '���û򷵻�һ�δӽ��ջ������ж�ȡ�ֽ���,0��ʾһ�ζ�ȡ��������
MSComm1.RThreshold = 8
If MSComm1.PortOpen = False Then     '�򿪴���
   MSComm1.PortOpen = True
   button_bus_open.Enabled = False
   button_bus_close.Enabled = True
   button_mcu1_comm.Enabled = True
   label_bus_state.Caption = "  " + Combo_port_number.Text + "    ON"
   label_bus_state.ForeColor = vbGreen
   text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   �򿪶˿�" & Combo_port_number.Text
End If
Exit Sub
error1:
MsgBox "�޷���ָ���˿ڡ�" & vbCrLf & "�˿��Ѿ��򿪻��߶˿ڲ����ڡ�"
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   �Ҳ���ָ���˿ڻ��߶˿��Ѿ��򿪣��˿ڴ�ʧ�ܡ�"
End Sub
Private Sub button_bus_close_Click()
MSComm1.PortOpen = False

If MSComm1.PortOpen = False Then
    timer_comm.Enabled = False
    button_bus_open.Enabled = True
    button_bus_close.Enabled = False
    button_check.Enabled = False
    button_start.Enabled = False
    button_stop.Enabled = False
    button_mcu1_discomm.Enabled = False
    button_mcu1_comm.Enabled = False
    label_bus_state.Caption = "           OFF"
    label_mcu1.Caption = "OFF"
    label_mcu1.ForeColor = vbRed
    label_bus_state.ForeColor = vbRed
    label_state_system.Caption = "״̬��  δ����"
    button_clear_cord_Click
    text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   �رն˿�" & Combo_port_number.Text
    text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ����ͨ���Ѿ��Ͽ�" & Combo_port_number.Text
End If

End Sub


Private Sub MSComm1_OnComm()

Dim buffer As Variant
Dim coordinate(0 To 1) As String
Dim i As Integer

Select Case MSComm1.CommEvent

Case comEvReceive
    
    buffer = MSComm1.Input  '�����ʮ������ģʽ�������buffer�����һ�����飬��0��ʼһֱ�洢ʮ���������ݡ������textģʽ����ʵbufferҲ�Ǹ����飬ֻ����ֱ��д���֣����Ա�ʾ�����ַ���
    Select Case buffer
        
        Case "B0000000"
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ���������Ѿ���λ"
        
        Case "B001rr11"
        timer_comm.Enabled = False
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ������������   Ӧ�����" & " " & buffer & "    PC-������ʼ����"
        label_mcu1.Caption = "ON"
        label_mcu1.ForeColor = vbGreen
        button_check.Enabled = True
        button_start.Enabled = True
        button_mcu1_comm.Enabled = False
        button_mcu1_discomm.Enabled = True
        
        Case "B002rr11"
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ������������   Ӧ�����" & " " & buffer & "    PC-�����ѶϿ�"
        label_mcu1.Caption = "OFF"
        label_mcu1.ForeColor = vbRed
        button_check.Enabled = False
        button_start.Enabled = False
        button_stop.Enabled = False
        button_mcu1_comm.Enabled = True
        button_mcu1_discomm.Enabled = False
        
        Case "B003rr11"
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ����������"
        If text_cord_x = "1000.000" Then
        coordinate(0) = "X1000000"
        Else
        coordinate(0) = "X" & Mid(text_cord_x, 1, 4) & Mid(text_cord_x, 6, 3)
        End If
        coordinate(1) = "Y0" & Mid(text_cord_y, 1, 3) & Mid(text_cord_y, 5, 3)
        For i = 0 To 1
        send_data = coordinate(i)
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   ͨ���˿�" & Combo_port_number.Text & "   ��������������" & send_data
        MSComm1.Output = send_data
        Sleep (200)
        Next i
        label_state_system.Caption = "״̬��  ������"
        label_mcu2.Caption = "ON"
        label_mcu3.Caption = "ON"
        label_mcu2.ForeColor = vbGreen
        label_mcu3.ForeColor = vbGreen
        'button_start.Enabled = False
        button_stop.Enabled = True
    End Select
End Select

End Sub


Private Sub timer_comm_Timer()
Static i As Integer

i = i + 1
button_mcu1_comm_Click

If i = 5 Then
timer_comm.Enabled = False
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   Զ������û��Ӧ��"
End If
End Sub


Private Sub Timer1_Timer()
label_time.Caption = "ϵͳʱ�䣺" & Date & " " & Time
End Sub
