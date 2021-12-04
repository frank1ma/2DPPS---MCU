VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "激光反馈二维精密定位系统客户端 -中国矿业大学机电工程学院"
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
      Caption         =   "通讯情况"
      BeginProperty Font 
         Name            =   "微软雅黑"
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
         Caption         =   "复位"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "断线"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "联机"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
         Caption         =   "分机2"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "分机1"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
         Caption         =   "主机"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
      Caption         =   "激光反馈"
      BeginProperty Font 
         Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
         Caption         =   "运行时间："
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "未计算"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "Y坐标误差："
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "未计算"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "X坐标误差："
         BeginProperty Font 
            Name            =   "微软雅黑"
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
      Caption         =   "平台坐标"
      BeginProperty Font 
         Name            =   "微软雅黑"
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
         Caption         =   "清空"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "检测位置"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "停止定位"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
         Caption         =   "启动定位"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
         Caption         =   "当前Y坐标(mm)"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "当前X坐标(mm)"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "指定Y坐标(mm)"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "指定X坐标(mm)"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
      Caption         =   "消息监测"
      BeginProperty Font 
         Name            =   "微软雅黑"
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
         Caption         =   "调试接收"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "清空记录"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
      Caption         =   "串口通讯控制区"
      BeginProperty Font 
         Name            =   "微软雅黑"
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
         Caption         =   "关闭串口"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "开启串口"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "？"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "停止位"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
            Name            =   "微软雅黑"
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
         Caption         =   "串口状态"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "数据位"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "校验位"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "波特率"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
         Caption         =   "端口号"
         BeginProperty Font 
            Name            =   "微软雅黑"
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
      Caption         =   "        编写语言 Visual Basic 6.0                           作者 马上捷  "
      BeginProperty Font 
         Name            =   "微软雅黑"
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
      Caption         =   "状态："
      BeginProperty Font 
         Name            =   "微软雅黑"
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
      Caption         =   "系统时间："
      BeginProperty Font 
         Name            =   "微软雅黑"
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
      Caption         =   "关于"
      Index           =   0
   End
   Begin VB.Menu exit 
      Caption         =   "退出"
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
Form2.Show  '打开关于窗口
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
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   已清空目标坐标"

End Sub

Private Sub button_mcu1_comm_Click()
Dim send_request As String

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   正在向主机(MCU1)发送请求...."
send_request = "A001rr00" '发送启动定位请求"
send_data = send_request

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   通过端口" & Combo_port_number.Text & "   向主机发送了请求  请求代码" & send_data
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   等待主机应答...."

MSComm1.Output = send_request

timer_comm.Enabled = True
End Sub

Private Sub button_mcu1_discomm_Click()
Dim send_request As String

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   正在向主机(MCU1)发送请求...."
send_request = "A002rr00" ' 发送中断通信请求
send_data = send_request

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   通过端口" & Combo_port_number.Text & "   向主机发送了请求  请求代码" & send_data
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   等待主机应答...."
label_mcu2.Caption = "OFF"
label_mcu2.ForeColor = vbRed
label_mcu3.Caption = "OFF"
label_mcu3.ForeColor = vbRed
label_state_system.Caption = "状态：  未启动"
MSComm1.Output = send_request
End Sub

Private Sub button_monitor_clear_Click()
text_monitor.Text = ""
End Sub

Private Sub button_start_Click()
Dim send_request As String

If (text_cord_x = "") Or (text_cord_y = "") Then
MsgBox "坐标值填写不正确"
Exit Sub
End If

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   正在向主机(MCU1)发送请求...."
send_request = "A003rr00" ' 发送启动定位请求
send_data = send_request
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   通过端口" & Combo_port_number.Text & "   向主机发送了请求  请求代码" & send_data

MSComm1.Output = send_request


End Sub

Private Sub button_stop_Click()
Dim send_request As String

text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   正在向主机(MCU1)发送请求...."
send_request = "A004rr00" ' 发送停止定位请求
send_data = send_request
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   通过端口" & Combo_port_number.Text & "   向主机发送了请求  请求代码" & send_data

MSComm1.Output = send_request

End Sub

Private Sub exit_Click(Index As Integer)
Unload Me  '卸载窗口
End Sub

Private Sub Form_Load()
Timer1.Enabled = True '启动系统时间时钟
label_state_system.Caption = "状态：  未启动"
End Sub

Private Sub Form_Unload(Cancel As Integer)  '关闭程序提示
Dim RESPONSE

RESPONSE = MsgBox("确定要退出程序吗？", vbYesNoCancel)

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
Dim brate, cbit, dbit, sbit  '定义通讯参数变量
brate = Val(Combo_baudrate.Text)  '赋值变量
cbit = Combo_checkbit.Text
dbit = Val(Combo_databit.Text)
sbit = Val(Combo_stopbit.Text)

If Combo_port_number.Text = "COM3" Then  '设置通讯端口
    MSComm1.CommPort = 3
Else
If Combo_port_number.Text = "COM4" Then
    MSComm1.CommPort = 4
End If
End If

MSComm1.Settings = Str(brate) + cbit + Str(dbit) + Str(sbit) '设置数据传输率和发送字符格式
MSComm1.InBufferSize = 1024         '设置接收缓冲区1024Byte
MSComm1.InputLen = 0                '设置或返回一次从接收缓冲区中读取字节数,0表示一次读取所有数据
MSComm1.RThreshold = 8
If MSComm1.PortOpen = False Then     '打开串口
   MSComm1.PortOpen = True
   button_bus_open.Enabled = False
   button_bus_close.Enabled = True
   button_mcu1_comm.Enabled = True
   label_bus_state.Caption = "  " + Combo_port_number.Text + "    ON"
   label_bus_state.ForeColor = vbGreen
   text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   打开端口" & Combo_port_number.Text
End If
Exit Sub
error1:
MsgBox "无法打开指定端口。" & vbCrLf & "端口已经打开或者端口不存在。"
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   找不到指定端口或者端口已经打开，端口打开失败。"
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
    label_state_system.Caption = "状态：  未启动"
    button_clear_cord_Click
    text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   关闭端口" & Combo_port_number.Text
    text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   所有通信已经断开" & Combo_port_number.Text
End If

End Sub


Private Sub MSComm1_OnComm()

Dim buffer As Variant
Dim coordinate(0 To 1) As String
Dim i As Integer

Select Case MSComm1.CommEvent

Case comEvReceive
    
    buffer = MSComm1.Input  '如果是十六进制模式，这里的buffer变成了一个数组，从0开始一直存储十六进制数据。如果是text模式，其实buffer也是个数组，只不过直接写名字，可以表示整个字符串
    Select Case buffer
        
        Case "B0000000"
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   主机程序已经复位"
        
        Case "B001rr11"
        timer_comm.Enabled = False
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   主机接受请求   应答代码" & " " & buffer & "    PC-主机开始联机"
        label_mcu1.Caption = "ON"
        label_mcu1.ForeColor = vbGreen
        button_check.Enabled = True
        button_start.Enabled = True
        button_mcu1_comm.Enabled = False
        button_mcu1_discomm.Enabled = True
        
        Case "B002rr11"
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   主机接受请求   应答代码" & " " & buffer & "    PC-主机已断开"
        label_mcu1.Caption = "OFF"
        label_mcu1.ForeColor = vbRed
        button_check.Enabled = False
        button_start.Enabled = False
        button_stop.Enabled = False
        button_mcu1_comm.Enabled = True
        button_mcu1_discomm.Enabled = False
        
        Case "B003rr11"
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   主机允许发送"
        If text_cord_x = "1000.000" Then
        coordinate(0) = "X1000000"
        Else
        coordinate(0) = "X" & Mid(text_cord_x, 1, 4) & Mid(text_cord_x, 6, 3)
        End If
        coordinate(1) = "Y0" & Mid(text_cord_y, 1, 3) & Mid(text_cord_y, 5, 3)
        For i = 0 To 1
        send_data = coordinate(i)
        text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   通过端口" & Combo_port_number.Text & "   发送了坐标数据" & send_data
        MSComm1.Output = send_data
        Sleep (200)
        Next i
        label_state_system.Caption = "状态：  已启动"
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
text_monitor.Text = text_monitor.Text & vbCrLf & "[" & Date & " " & Time & "]" & "   远程主机没有应答"
End If
End Sub


Private Sub Timer1_Timer()
label_time.Caption = "系统时间：" & Date & " " & Time
End Sub
