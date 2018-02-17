VERSION 5.00
Begin VB.Form Form3 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Face the wall"
   ClientHeight    =   2655
   ClientLeft      =   -60
   ClientTop       =   -15
   ClientWidth     =   6015
   FillColor       =   &H00FFFFFF&
   Icon            =   "Form3.frx":0000
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2655
   ScaleWidth      =   6015
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.PictureBox Picture1 
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   0
      ScaleHeight     =   2655
      ScaleWidth      =   6375
      TabIndex        =   0
      Top             =   0
      Width           =   6375
      Begin VB.Line Line27 
         X1              =   5640
         X2              =   5640
         Y1              =   0
         Y2              =   360
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Caption         =   "关于Face the wall加密系统"
         BeginProperty Font 
            Name            =   "新宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1320
         TabIndex        =   12
         Top             =   2280
         Width           =   3495
      End
      Begin VB.Line Line26 
         X1              =   6000
         X2              =   6000
         Y1              =   2040
         Y2              =   2640
      End
      Begin VB.Line Line25 
         X1              =   6000
         X2              =   0
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Line Line24 
         X1              =   6000
         X2              =   0
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Line Line6 
         X1              =   0
         X2              =   0
         Y1              =   2640
         Y2              =   2040
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Height          =   615
         Left            =   0
         TabIndex        =   11
         Top             =   2040
         Width           =   6015
      End
      Begin VB.Line Line23 
         X1              =   120
         X2              =   2280
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Label Label12 
         BackColor       =   &H0000C000&
         Caption         =   "Face the wall加密系统"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   120
         Width           =   2055
      End
      Begin VB.Line Line22 
         X1              =   6000
         X2              =   6000
         Y1              =   0
         Y2              =   360
      End
      Begin VB.Line Line21 
         X1              =   5520
         X2              =   6000
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line20 
         X1              =   5520
         X2              =   6000
         Y1              =   0
         Y2              =   0
      End
      Begin VB.Label Label11 
         BackColor       =   &H0000C000&
         Height          =   375
         Left            =   5640
         TabIndex        =   9
         Top             =   0
         Width           =   375
      End
      Begin VB.Line Line19 
         X1              =   5640
         X2              =   6000
         Y1              =   0
         Y2              =   0
      End
      Begin VB.Line Line18 
         X1              =   6000
         X2              =   6000
         Y1              =   720
         Y2              =   240
      End
      Begin VB.Line Line17 
         X1              =   3720
         X2              =   0
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Line Line14 
         X1              =   0
         X2              =   0
         Y1              =   600
         Y2              =   2160
      End
      Begin VB.Line Line8 
         X1              =   0
         X2              =   6000
         Y1              =   2640
         Y2              =   2640
      End
      Begin VB.Line Line5 
         X1              =   6000
         X2              =   6000
         Y1              =   1440
         Y2              =   2160
      End
      Begin VB.Line Line15 
         X1              =   0
         X2              =   0
         Y1              =   1320
         Y2              =   2040
      End
      Begin VB.Line Line16 
         X1              =   6000
         X2              =   6000
         Y1              =   600
         Y2              =   1440
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Caption         =   "解密文件"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3720
         TabIndex        =   8
         Top             =   1560
         Width           =   1335
      End
      Begin VB.Label Label9 
         BackColor       =   &H00C0FFFF&
         Caption         =   "加密文件"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   960
         TabIndex        =   7
         Top             =   1560
         Width           =   1095
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "解密文本"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3600
         TabIndex        =   6
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Caption         =   "加密文本"
         BeginProperty Font 
            Name            =   "楷体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   840
         TabIndex        =   5
         Top             =   720
         Width           =   1335
      End
      Begin VB.Line Line7 
         X1              =   6000
         X2              =   0
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line3 
         X1              =   120
         X2              =   6120
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Line Line2 
         X1              =   0
         X2              =   6000
         Y1              =   1200
         Y2              =   1200
      End
      Begin VB.Line Line1 
         X1              =   3000
         X2              =   3000
         Y1              =   2040
         Y2              =   360
      End
      Begin VB.Label Label6 
         BackColor       =   &H00C0FFFF&
         Height          =   975
         Left            =   3000
         TabIndex        =   4
         Top             =   1080
         Width           =   3015
      End
      Begin VB.Label Label5 
         BackColor       =   &H00C0FFFF&
         Height          =   975
         Left            =   0
         TabIndex        =   3
         Top             =   1080
         Width           =   3015
      End
      Begin VB.Label Label4 
         BackColor       =   &H00C0FFFF&
         Height          =   735
         Left            =   3000
         TabIndex        =   2
         Top             =   360
         Width           =   3015
      End
      Begin VB.Line Line13 
         X1              =   6000
         X2              =   6000
         Y1              =   0
         Y2              =   3120
      End
      Begin VB.Line Line12 
         X1              =   0
         X2              =   6000
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Line Line11 
         X1              =   0
         X2              =   6000
         Y1              =   3120
         Y2              =   3120
      End
      Begin VB.Line Line10 
         X1              =   6000
         X2              =   0
         Y1              =   0
         Y2              =   0
      End
      Begin VB.Line Line9 
         X1              =   0
         X2              =   0
         Y1              =   3120
         Y2              =   0
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00C0FFFF&
         Height          =   735
         Left            =   0
         TabIndex        =   1
         Top             =   360
         Width           =   3015
      End
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   0
      Y1              =   720
      Y2              =   0
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Private Sub Label1_Click()
form1.Show
form1.cmdFileEncrypt.Visible = False
form1.cmdFileDecrypt.Visible = False
form1.cmdDecrypt.Visible = False
Unload Me
End Sub

Private Sub Label10_Click()
form1.Show
form1.cmdFileEncrypt.Visible = False
form1.cmdDecrypt.Visible = False
form1.cmdEncrypt.Visible = False
form1.Text1.Visible = False
form1.Frame1.Visible = False
Unload Me
End Sub

Private Sub Label11_Click()
Unload Me
End Sub

Private Sub Label2_Click()
Form2.Show
End Sub

Private Sub Label3_Click()
Form2.Show
End Sub

Private Sub Label4_Click()
form1.Show
form1.cmdFileEncrypt.Visible = False
form1.cmdFileDecrypt.Visible = False
form1.cmdEncrypt.Visible = False
Unload Me
End Sub

Private Sub Label5_Click()
form1.Show
form1.cmdEncrypt.Visible = False
form1.cmdFileDecrypt.Visible = False
form1.cmdDecrypt.Visible = False
form1.Text1.Visible = False
form1.Frame1.Visible = False

Unload Me
End Sub





Private Sub Label6_Click()
form1.Show
form1.cmdFileEncrypt.Visible = False
form1.cmdDecrypt.Visible = False
form1.cmdEncrypt.Visible = False
form1.Text1.Visible = False
form1.Frame1.Visible = False
Unload Me
End Sub

Private Sub Label7_Click()
form1.Show
form1.cmdFileEncrypt.Visible = False
form1.cmdFileDecrypt.Visible = False
form1.cmdDecrypt.Visible = False
Unload Me
End Sub

Private Sub Label8_Click()
form1.Show
form1.cmdFileEncrypt.Visible = False
form1.cmdFileDecrypt.Visible = False
form1.cmdEncrypt.Visible = False
Unload Me
End Sub

Private Sub Label9_Click()
form1.Show
form1.cmdEncrypt.Visible = False
form1.cmdFileDecrypt.Visible = False
form1.cmdDecrypt.Visible = False
form1.Text1.Visible = False
form1.Frame1.Visible = False

Unload Me
End Sub


