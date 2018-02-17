VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "关于face the wall"
   ClientHeight    =   4515
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5655
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   4515
   ScaleWidth      =   5655
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command1 
      Caption         =   "确定"
      Height          =   375
      Left            =   1080
      TabIndex        =   0
      Top             =   4080
      Width           =   3735
   End
   Begin VB.Label Label1 
      Caption         =   "Copyright(C) 2016 Malachite. All Rights Reserved."
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   480
      Width           =   5055
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Form2

End Sub

