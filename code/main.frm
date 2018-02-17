VERSION 5.00
Begin VB.Form b 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Face The Wall"
   ClientHeight    =   3255
   ClientLeft      =   4395
   ClientTop       =   645
   ClientWidth     =   4815
   ForeColor       =   &H80000008&
   Icon            =   "main.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   217
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   321
   Begin VB.PictureBox Picture5 
      Appearance      =   0  'Flat
      BackColor       =   &H00B888AF&
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   0
      ScaleHeight     =   705
      ScaleWidth      =   4785
      TabIndex        =   11
      Top             =   2520
      Width           =   4815
      Begin VB.Label Label5 
         BackColor       =   &H00B888AF&
         Caption         =   "About Face the wall"
         Height          =   255
         Left            =   1440
         TabIndex        =   12
         Top             =   240
         Width           =   1935
      End
   End
   Begin VB.PictureBox Picture4 
      Appearance      =   0  'Flat
      BackColor       =   &H00B888AF&
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   2400
      ScaleHeight     =   945
      ScaleWidth      =   2385
      TabIndex        =   8
      Top             =   1560
      Width           =   2415
      Begin VB.Label Label4 
         BackColor       =   &H00B888AF&
         Caption         =   "Decrypted file"
         Height          =   255
         Left            =   480
         TabIndex        =   10
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.PictureBox Picture3 
      Appearance      =   0  'Flat
      BackColor       =   &H00B888AF&
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   0
      ScaleHeight     =   945
      ScaleWidth      =   2385
      TabIndex        =   7
      Top             =   1560
      Width           =   2415
      Begin VB.Label Label3 
         BackColor       =   &H00B888AF&
         Caption         =   "Encrypted file"
         Height          =   255
         Left            =   480
         TabIndex        =   9
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      BackColor       =   &H00B888AF&
      ForeColor       =   &H80000008&
      Height          =   1095
      Left            =   2400
      ScaleHeight     =   1065
      ScaleWidth      =   2385
      TabIndex        =   5
      Top             =   480
      Width           =   2415
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00B888AF&
         Caption         =   "Decrypted text"
         ForeColor       =   &H80000008&
         Height          =   375
         Left            =   480
         TabIndex        =   6
         Top             =   480
         Width           =   1335
      End
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00B888AF&
      ForeColor       =   &H80000008&
      Height          =   1095
      Left            =   0
      ScaleHeight     =   1065
      ScaleWidth      =   2385
      TabIndex        =   3
      Top             =   480
      Width           =   2415
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00B888AF&
         Caption         =   "Encrypted text"
         ForeColor       =   &H80000008&
         Height          =   375
         Left            =   480
         TabIndex        =   4
         Top             =   480
         Width           =   1575
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
      Left            =   15
      ScaleHeight     =   37
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   910
      TabIndex        =   0
      Top             =   15
      Width           =   13650
      Begin VB.TextBox Text1 
         BackColor       =   &H00CACC8C&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   270
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   2
         Text            =   "Face The Wall encryption system"
         Top             =   120
         Width           =   3615
      End
   End
End
Attribute VB_Name = "b"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
Dim MyPath As String
MyPath = App.Path
If Right(MyPath, 1) <> "\" Then MyPath = MyPath & "\"

'使用外部的文件作为图标，支持的文件类型有 *.ico;*.exe;*.dll 或者图标库文件

SetWindowIcon Me.hWnd, MyPath & "4.ico", 0
'显示真彩色图标
SetWindowIcon Me.hWnd
Randomize
Color = 6 '随机颜色

Head.Width = b.Width \ 15 - 2 '调整标题栏

Start.Left = 2
Start.Top = Head.Height + 2
Start.Height = b.Height \ 15 - Head.Height - 4
Start.Width = b.Width \ 15 - 4

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

If X > b.Head.Width - 35 And X < b.Head.Width And Y > 0 And Y < 35 Then '关闭
Unload Me

ElseIf X > b.Head.Width - 75 And X < b.Head.Width - 35 And Y > 0 And Y < 35 Then '最小化

 WindowState = 1
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
End
End Sub


Private Sub Label1_Click()



c.Show
c.cmdFileEncrypt.Visible = False
c.cmdFileDecrypt.Visible = False
c.cmdDecrypt.Visible = False
c.cmdEncrypt.Visible = True
c.Text1.Visible = True
c.Frame1.Visible = True
c.Text1.Text = ""


c.Frame1.Caption = "Please enter the text you want to encrypt."
End Sub

Private Sub Label2_Click()

c.Show
c.cmdFileEncrypt.Visible = False
c.cmdFileDecrypt.Visible = False
c.cmdEncrypt.Visible = False
c.cmdDecrypt.Visible = True
c.Text1.Visible = True
c.Frame1.Visible = True
c.Text1.Text = ""


c.Frame1.Caption = "Please enter the text you want to decrypt."
End Sub

Private Sub Label3_Click()
c.Show
c.cmdEncrypt.Visible = False
c.cmdFileDecrypt.Visible = False
c.cmdDecrypt.Visible = False
c.Text1.Visible = False
c.Frame1.Visible = False
c.cmdFileEncrypt.Visible = True

End Sub

Private Sub Label4_Click()
c.Show
c.cmdFileEncrypt.Visible = False
c.cmdDecrypt.Visible = False
c.cmdEncrypt.Visible = False
c.cmdFileDecrypt.Visible = True
c.Text1.Visible = False
c.Frame1.Visible = False


End Sub

Private Sub Label5_Click()

main.Show
End Sub

Private Sub Picture1_Click()
c.Show
c.cmdFileEncrypt.Visible = False
c.cmdFileDecrypt.Visible = False
c.cmdDecrypt.Visible = False
c.cmdEncrypt.Visible = True
c.Text1.Visible = True
c.Frame1.Visible = True
c.Text1.Text = ""


c.Frame1.Caption = "Please enter the text you want to encrypt"
End Sub

Private Sub Picture2_Click()
c.Show
c.cmdFileEncrypt.Visible = False
c.cmdFileDecrypt.Visible = False
c.cmdEncrypt.Visible = False
c.cmdDecrypt.Visible = True
c.Text1.Visible = True
c.Frame1.Visible = True
c.Text1.Text = ""


c.Frame1.Caption = "Please enter the text you want to decrypt."

End Sub

Private Sub Picture3_Click()
c.Show
c.cmdEncrypt.Visible = False
c.cmdFileDecrypt.Visible = False
c.cmdDecrypt.Visible = False
c.Text1.Visible = False
c.Frame1.Visible = False
c.cmdFileEncrypt.Visible = True

End Sub

Private Sub Picture4_Click()
c.Show
c.cmdFileEncrypt.Visible = False
c.cmdDecrypt.Visible = False
c.cmdEncrypt.Visible = False
c.cmdFileDecrypt.Visible = True
c.Text1.Visible = False
c.Frame1.Visible = False

End Sub

Private Sub Picture5_Click()
main.Show

End Sub



Private Sub TimMouseM_Timer()
'判断鼠标位置
Dim X As Long, Y As Long
GetCursorPos MyCur
X = MyCur.X - main.Left \ 15
Y = MyCur.Y - main.Top \ 15
If X > b.Head.Width - 35 And X < b.Head.Width And Y > 0 And Y < 35 Then
  DrawX 1, HeadG, Penx, brushx, brushMin, Me.Head
ElseIf X > b.Head.Width - 75 And X < b.Head.Width - 35 And Y > 0 And Y < 35 Then
  DrawX 2, HeadG, Penx, brushx, brushMin, Me.Head
Else
  DrawX 0, HeadG, Penx, brushx, brushMin, Me.Head
End If
End Sub
