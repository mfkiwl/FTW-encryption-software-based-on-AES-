VERSION 5.00
Begin VB.Form main 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3255
   ClientLeft      =   10995
   ClientTop       =   3915
   ClientWidth     =   4815
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   217
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   321
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      ForeColor       =   &H80000008&
      Height          =   2775
      Left            =   0
      ScaleHeight     =   2745
      ScaleWidth      =   4785
      TabIndex        =   2
      Top             =   480
      Width           =   4815
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "http://www.littlegaga.cn/web_FTW/index.html"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   1800
         Width           =   4095
      End
      Begin VB.Label Label8 
         BackStyle       =   0  'Transparent
         Caption         =   "Webside _______________________________________"
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   1560
         Width           =   4335
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Copyright 2016 Littlegaga.rights reserved."
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   1320
         Width           =   3975
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "FTW 1.1.0"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   1080
         Width           =   3495
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "Core Version __________________________________"
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   840
         Width           =   4335
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "_____________________________"
         Height          =   255
         Left            =   1800
         TabIndex        =   6
         Top             =   120
         Width           =   2775
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Copyright 2017 Littlegaga.rights reserved."
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   600
         Width           =   4215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Face the wall 3.0.0 "
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   3975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Face the wall Version   "
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   120
         Width           =   4215
      End
   End
   Begin VB.Timer TimMouseM 
      Interval        =   5
      Left            =   13725
      Top             =   990
   End
   Begin VB.Timer TimLoad 
      Interval        =   10
      Left            =   14580
      Top             =   540
   End
   Begin VB.PictureBox Start 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4860
      Left            =   4845
      ScaleHeight     =   4860
      ScaleWidth      =   8670
      TabIndex        =   1
      Top             =   3390
      Width           =   8670
   End
   Begin VB.PictureBox Head 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      CausesValidation=   0   'False
      ForeColor       =   &H80000008&
      Height          =   555
      Left            =   0
      ScaleHeight     =   37
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   910
      TabIndex        =   0
      Top             =   0
      Width           =   13650
      Begin VB.TextBox Text1 
         BackColor       =   &H009C9EF4&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   270
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   12
         Text            =   "About Face the wall"
         Top             =   120
         Width           =   1815
      End
   End
End
Attribute VB_Name = "main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Option Explicit
Dim FormG As Long, BKpen As Long '画边框用
Dim HeadG As Long, Penx As Long, brushx As Long, brushMin As Long '画标题栏用
Dim MyCur As POINTAPI '用于获取鼠标位置判断是否画阴影
Dim Color As Integer '随机一个标题栏颜色


Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

Private Declare Function ReleaseCapture Lib "user32" () As Long

Private Const WM_NCLBUTTONDOWN = &HA1

Private Const HTCAPTION = 2

Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
'用于获取鼠标位置判断是否画阴影
Private Type POINTAPI
        X As Long
        Y As Long
End Type
'用于获取鼠标位置判断是否画阴影
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
'这个暂时没有用处



Private Sub Form_Load()

Randomize
Color = 3 '随机颜色

Head.Width = main.Width \ 15 - 2 '调整标题栏

Start.Left = 2
Start.Top = Head.Height + 2
Start.Height = main.Height \ 15 - Head.Height - 4
Start.Width = main.Width \ 15 - 4

InitGDIPlus
'创建一大堆要用 不同的画板画笔
GdipCreateFromHDC Me.hdc, FormG
GdipCreatePen1 &HFF808080, 1, UnitPixel, BKpen
GdipCreateFromHDC Head.hdc, HeadG
'GdipSetSmoothingMode HeadG, SmoothingModeAntiAlias
GdipCreatePen1 &HFFFFFFFF, 2, UnitPixel, Penx
GdipCreateSolidFill &HDDDD0000, brushx
GdipCreateSolidFill &H90808080, brushMin

'画标题栏
DrawBk FormG, BKpen, main
DrawX 0, HeadG, Penx, brushx, brushMin, Me.Head

End Sub

Private Sub Head_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'操作层

ReleaseCapture
SendMessage Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
'移动

If X > main.Head.Width - 35 And X < main.Head.Width And Y > 0 And Y < 35 Then '关闭
main.Hide
b.Show
ElseIf X > main.Head.Width - 75 And X < main.Head.Width - 35 And Y > 0 And Y < 35 Then '最小化
 Me.WindowState = vbMinimized
End If
End Sub

Private Sub DrawX(MouseState As Integer, G As Long, p As Long, RB As Long, BB As Long, Obj As Object)
'绘制层 重画标题栏及按钮
Select Case Color
 Case Is = 1
   GdipGraphicsClear G, &HFFA8D59D
 Case Is = 2
   GdipGraphicsClear G, &HFFAF88B8
 Case Is = 3
   GdipGraphicsClear G, &HFFF49E9C
 Case Is = 4
   GdipGraphicsClear G, &HFFFACD8A
 Case Is = 5
   GdipGraphicsClear G, &HFF808080
 Case Is = 6
   GdipGraphicsClear G, &HFF8CCCCA
 End Select

'鼠标停留时的按钮阴影
Select Case MouseState
  Case Is = 1 '指在关闭键上
   GdipFillRectangleI G, RB, Obj.Width - 33, -1, 35, 32
  Case Is = 2 '指在缩小键上
   GdipFillRectangleI G, BB, Obj.Width - 70, -1, 35, 32
End Select
  GdipDrawLineI G, p, Obj.Width - 27, 7, Obj.Width - 8, 25
  GdipDrawLineI G, p, Obj.Width - 27, 25, Obj.Width - 8, 7

  GdipDrawLineI G, p, Obj.Width - 65, 22, Obj.Width - 40, 22
Obj.Refresh
End Sub

Private Sub DrawBk(G As Long, pen As Long, Obj As Object)
'画边框
GdipDrawRectangleI G, pen, 0, 0, Obj.Width \ 15 - 1, Obj.Height \ 15 - 1
Me.Refresh
End Sub

Private Sub Form_Unload(Cancel As Integer)
'删除画板画笔
GdipDeleteGraphics FormG
GdipDeletePen BKpen
GdipDeletePen Penx
GdipDeleteBrush brushx
GdipDeleteBrush brushMin
GdipDeleteGraphics HeadG
TerminateGDIPlus
End Sub

















Private Sub Label9_Click()
Shell "explorer http://www.littlegaga.cn/web_FTW/index.html"
End Sub


Private Sub TimMouseM_Timer()
'判断鼠标位置啊
Dim X As Long, Y As Long
GetCursorPos MyCur
X = MyCur.X - main.Left \ 15
Y = MyCur.Y - main.Top \ 15
If X > Head.Width - 35 And X < Head.Width And Y > 0 And Y < 35 Then
  DrawX 1, HeadG, Penx, brushx, brushMin, Me.Head
ElseIf X > main.Head.Width - 75 And X < main.Head.Width - 35 And Y > 0 And Y < 35 Then
  DrawX 2, HeadG, Penx, brushx, brushMin, Me.Head
Else
  DrawX 0, HeadG, Penx, brushx, brushMin, Me.Head
End If
End Sub
