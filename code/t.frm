VERSION 5.00
Begin VB.Form t 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1125
   ClientLeft      =   4395
   ClientTop       =   645
   ClientWidth     =   4815
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   78.75
   ScaleMode       =   0  'User
   ScaleWidth      =   321
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00F0F0F0&
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   0
      ScaleHeight     =   465
      ScaleWidth      =   4785
      TabIndex        =   2
      Top             =   600
      Width           =   4815
      Begin VB.Label Label1 
         Caption         =   "Label1"
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   0
         Width           =   4335
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
         BackColor       =   &H009DD5A8&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   495
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   3
         Text            =   "��ʾ��Ϣ"
         Top             =   120
         Width           =   1815
      End
   End
End
Attribute VB_Name = "t"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Option Explicit
Dim FormG As Long, BKpen As Long '���߿���
Dim HeadG As Long, Penx As Long, brushx As Long, brushMin As Long '����������
Dim MyCur As POINTAPI '���ڻ�ȡ���λ���ж��Ƿ���Ӱ
Dim Color As Integer '���һ����������ɫ


Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

Private Declare Function ReleaseCapture Lib "user32" () As Long

Private Const WM_NCLBUTTONDOWN = &HA1

Private Const HTCAPTION = 2

Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
'���ڻ�ȡ���λ���ж��Ƿ���Ӱ
Private Type POINTAPI
        X As Long
        Y As Long
End Type
'���ڻ�ȡ���λ���ж��Ƿ���Ӱ
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
'�����ʱû���ô�

Private Sub Command1_Click()
c.Show
End Sub

Private Sub Form_Load()

Randomize
Color = 1 '�����ɫ

Head.Width = t.Width \ 15 - 2 '����������

Start.Left = 2
Start.Top = Head.Height + 2
Start.Height = t.Height \ 15 - Head.Height - 4
Start.Width = t.Width \ 15 - 4

InitGDIPlus
'����һ���Ҫ�� ��ͬ�Ļ��廭��
GdipCreateFromHDC Me.hdc, FormG
GdipCreatePen1 &HFF808080, 1, UnitPixel, BKpen
GdipCreateFromHDC Head.hdc, HeadG
'GdipSetSmoothingMode HeadG, SmoothingModeAntiAlias
GdipCreatePen1 &HFFFFFFFF, 2, UnitPixel, Penx
GdipCreateSolidFill &HDDDD0000, brushx
GdipCreateSolidFill &H90808080, brushMin

'��������
DrawBk FormG, BKpen, main
DrawX 0, HeadG, Penx, brushx, brushMin, Me.Head

End Sub

Private Sub Head_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'������

ReleaseCapture
SendMessage Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
'�ƶ�


End Sub

Private Sub DrawX(MouseState As Integer, G As Long, p As Long, RB As Long, BB As Long, Obj As Object)
'���Ʋ� �ػ�����������ť
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

'���ͣ��ʱ�İ�ť��Ӱ
Select Case MouseState
  Case Is = 1 'ָ�ڹرռ���
   GdipFillRectangleI G, RB, Obj.Width - 33, -1, 35, 32
  Case Is = 2 'ָ����С����
   GdipFillRectangleI G, BB, Obj.Width - 70, -1, 35, 32
End Select
  GdipDrawLineI G, p, Obj.Width - 27, 7, Obj.Width - 8, 25
  GdipDrawLineI G, p, Obj.Width - 27, 25, Obj.Width - 8, 7

  GdipDrawLineI G, p, Obj.Width - 65, 22, Obj.Width - 40, 22
Obj.Refresh
End Sub

Private Sub DrawBk(G As Long, pen As Long, Obj As Object)
'���߿�
GdipDrawRectangleI G, pen, 0, 0, Obj.Width \ 15 - 1, Obj.Height \ 15 - 1
Me.Refresh
End Sub

Private Sub Form_Unload(Cancel As Integer)
'ɾ�����廭��
GdipDeleteGraphics FormG
GdipDeletePen BKpen
GdipDeletePen Penx
GdipDeleteBrush brushx
GdipDeleteBrush brushMin
GdipDeleteGraphics HeadG
TerminateGDIPlus
End Sub





















Private Sub TimMouseM_Timer()
'�ж����λ�ð�
Dim X As Long, Y As Long
GetCursorPos MyCur
X = MyCur.X - main.Left \ 15
Y = MyCur.Y - main.Top \ 15
If X > Head.Width - 35 And X < Head.Width And Y > 0 And Y < 35 Then
  DrawX 1, HeadG, Penx, brushx, brushMin, Me.Head
ElseIf X > Head.Width - 75 And X < Head.Width - 35 And Y > 0 And Y < 35 Then
  DrawX 2, HeadG, Penx, brushx, brushMin, Me.Head
Else
  DrawX 0, HeadG, Penx, brushx, brushMin, Me.Head
End If
End Sub
