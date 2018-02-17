VERSION 5.00
Begin VB.Form Form2 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   3255
   ClientLeft      =   4395
   ClientTop       =   645
   ClientWidth     =   4815
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   217
   ScaleMode       =   0  'User
   ScaleWidth      =   271.161
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text1 
      BackColor       =   &H009C9EF4&
      BorderStyle     =   0  'None
      Height          =   270
      Left            =   0
      Locked          =   -1  'True
      TabIndex        =   13
      Text            =   "关于Face the wall"
      Top             =   0
      Width           =   1815
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFFF&
      ForeColor       =   &H80000008&
      Height          =   2775
      Left            =   0
      ScaleHeight     =   2745
      ScaleWidth      =   4785
      TabIndex        =   0
      Top             =   480
      Width           =   4815
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Face the wall 版本   "
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   120
         Width           =   4215
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Face the wall 2.0.0 完整版"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   3975
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Copyright 2016 Malachite.rights reserved."
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   600
         Width           =   4215
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "_____________________________"
         Height          =   255
         Left            =   1800
         TabIndex        =   9
         Top             =   120
         Width           =   2775
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "内核版本 _______________________________________"
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   840
         Width           =   4335
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "FTW 1.1.0"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   1080
         Width           =   3495
      End
      Begin VB.Label Label7 
         BackStyle       =   0  'Transparent
         Caption         =   "Copyright 2016 Littlegaga.rights reserved."
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1320
         Width           =   3975
      End
      Begin VB.Label Label8 
         BackStyle       =   0  'Transparent
         Caption         =   "官方网站 _______________________________________"
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   4335
      End
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "www.littlegaga.top"
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
         TabIndex        =   4
         Top             =   1800
         Width           =   1935
      End
      Begin VB.Label Label10 
         BackStyle       =   0  'Transparent
         Caption         =   "littlegaga.16mb.com"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2400
         TabIndex        =   3
         Top             =   1800
         Width           =   2055
      End
      Begin VB.Label Label11 
         BackStyle       =   0  'Transparent
         Caption         =   "官方论坛 _______________________________________"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   2040
         Width           =   4455
      End
      Begin VB.Label Label12 
         BackStyle       =   0  'Transparent
         Caption         =   "malachite.moreforum.com"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   2280
         Width           =   2295
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Label10_Click()
 Shell "explorer.exe http://littlegaga.16mb.com"
 
Unload Me
End Sub

Private Sub Label12_Click()
 Shell "explorer.exe http://malachite.moreforum.com"
 
Unload Me
End Sub

Private Sub Label9_Click()
 Shell "explorer.exe http://www.littlegaga.top"
 
Unload Me
End Sub

