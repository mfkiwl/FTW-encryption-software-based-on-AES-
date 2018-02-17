VERSION 5.00
Begin VB.Form c 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Face The Wall"
   ClientHeight    =   3615
   ClientLeft      =   4395
   ClientTop       =   645
   ClientWidth     =   4815
   ForeColor       =   &H80000008&
   Icon            =   "c.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   241
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   321
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   3135
      Left            =   0
      ScaleHeight     =   3105
      ScaleWidth      =   4785
      TabIndex        =   3
      Top             =   480
      Width           =   4815
      Begin VB.Frame Frame1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Text Encrypt And Decrypt"
         ForeColor       =   &H80000008&
         Height          =   1215
         Left            =   120
         TabIndex        =   13
         Top             =   120
         Width           =   4335
         Begin VB.TextBox Text1 
            Height          =   855
            Left            =   240
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   14
            Top             =   240
            Width           =   3735
         End
      End
      Begin VB.CommandButton cmdFileDecrypt 
         Caption         =   "Decrypt"
         Height          =   495
         Left            =   1080
         TabIndex        =   12
         Top             =   2520
         Width           =   3255
      End
      Begin VB.CommandButton cmdFileEncrypt 
         Caption         =   "Encrypt"
         Height          =   495
         Left            =   1080
         TabIndex        =   11
         Top             =   2520
         Width           =   3255
      End
      Begin VB.CommandButton cmdDecrypt 
         Caption         =   "Decrypt"
         Height          =   495
         Left            =   1080
         TabIndex        =   10
         Top             =   2520
         Width           =   3255
      End
      Begin VB.CommandButton cmdEncrypt 
         Caption         =   "Encrypt"
         Height          =   495
         Left            =   1080
         TabIndex        =   9
         Top             =   2520
         Width           =   3015
      End
      Begin VB.CheckBox chkTerminal 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Terminal font"
         Height          =   255
         Left            =   3240
         MaskColor       =   &H00FFFFFF&
         TabIndex        =   8
         Top             =   1920
         Width           =   1575
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Hexadecimal"
         Height          =   180
         Left            =   3240
         TabIndex        =   7
         Top             =   1440
         Width           =   1575
      End
      Begin VB.ComboBox cboBlockSize 
         Height          =   300
         Left            =   120
         TabIndex        =   6
         Text            =   "cboBlockSize"
         Top             =   2760
         Visible         =   0   'False
         Width           =   1935
      End
      Begin VB.ComboBox cboKeySize 
         Height          =   300
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   1920
         Width           =   1935
      End
      Begin VB.TextBox txtPassword 
         Height          =   270
         Left            =   1080
         TabIndex        =   4
         Text            =   "My Password"
         Top             =   1440
         Width           =   1935
      End
      Begin VB.Image Image1 
         Height          =   1365
         Left            =   120
         Picture         =   "c.frx":4072
         Top             =   0
         Width           =   4830
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Key Length："
         Height          =   255
         Left            =   0
         TabIndex        =   16
         Top             =   1920
         Width           =   1575
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Password："
         Height          =   255
         Left            =   0
         TabIndex        =   15
         Top             =   1440
         Width           =   855
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
      Top             =   0
      Width           =   13650
      Begin VB.TextBox Text2 
         BackColor       =   &H00808080&
         BorderStyle     =   0  'None
         BeginProperty DataFormat 
            Type            =   1
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   2052
            SubFormatType   =   0
         EndProperty
         Enabled         =   0   'False
         Height          =   375
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   2
         Text            =   "Face The Wall encryption system"
         Top             =   120
         Width           =   2895
      End
   End
End
Attribute VB_Name = "c"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Option Explicit


#Const SUPPORT_LEVEL = 0     'Default=0

Private m_Rijndael As New ftw




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
Color = 5 '随机颜色

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

    cboBlockSize.AddItem "128 Bit"
    cboBlockSize.ItemData(cboBlockSize.NewIndex) = 128
#If SUPPORT_LEVEL = 0 Then
    cboBlockSize.Enabled = False
#Else
#If SUPPORT_LEVEL = 2 Then
    cboBlockSize.AddItem "160 Bit"
    cboBlockSize.ItemData(cboBlockSize.NewIndex) = 160
    cmdSizeTest.Visible = True
#End If
    cboBlockSize.AddItem "192 Bit"
    cboBlockSize.ItemData(cboBlockSize.NewIndex) = 192
#If SUPPORT_LEVEL = 2 Then
    cboBlockSize.AddItem "224 Bit"
    cboBlockSize.ItemData(cboBlockSize.NewIndex) = 224
#End If
    cboBlockSize.AddItem "256 Bit"
    cboBlockSize.ItemData(cboBlockSize.NewIndex) = 256
#End If
    cboKeySize.AddItem "128 Bit"
    cboKeySize.ItemData(cboKeySize.NewIndex) = 128
#If SUPPORT_LEVEL = 2 Then
    cboKeySize.AddItem "160 Bit"
    cboKeySize.ItemData(cboKeySize.NewIndex) = 160
#End If
    cboKeySize.AddItem "192 Bit"
    cboKeySize.ItemData(cboKeySize.NewIndex) = 192
#If SUPPORT_LEVEL = 2 Then
    cboKeySize.AddItem "224 Bit"
    cboKeySize.ItemData(cboKeySize.NewIndex) = 224
#End If
    cboKeySize.AddItem "256 Bit"
    cboKeySize.ItemData(cboKeySize.NewIndex) = 256
    cboBlockSize.ListIndex = 0
    cboKeySize.ListIndex = 0
    txtPassword = "My Password"
End Sub

Private Sub Head_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'操作层

ReleaseCapture
SendMessage Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
'移动

If X > c.Head.Width - 35 And X < c.Head.Width And Y > 0 And Y < 35 Then '关闭

c.Hide
b.Show
ElseIf X > c.Head.Width - 75 And X < c.Head.Width - 35 And Y > 0 And Y < 35 Then '最小化
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
b.Show
End Sub




















Private Sub cmdEncrypt_Click()
    Dim pass()        As Byte
    Dim plaintext()   As Byte
    Dim ciphertext()  As Byte
    Dim KeyBits       As Long
    Dim BlockBits     As Long

    If Len(Text1.Text) = 0 Then
        MsgBox "Please input text", vbOKOnly, "Face the wall"
    Else
        If Len(txtPassword.Text) = 0 Then
        MsgBox "Please input password", vbOKOnly, "Face the wall"
          
        Else
            KeyBits = cboKeySize.ItemData(cboKeySize.ListIndex)
            BlockBits = cboBlockSize.ItemData(cboBlockSize.ListIndex)
            pass = GetPassword

           
            If Check1.value = 0 Then
                plaintext = StrConv(Text1.Text, vbFromUnicode)
            Else
                If HexDisplayRev(Text1.Text, plaintext) = 0 Then
                    MsgBox "Text is not hexadecimal data", vbOKOnly, "Face the wall"
                    
                    Exit Sub
                End If
            End If

       
#If SUPPORT_LEVEL Then
            m_Rijndael.SetCipherKey pass, KeyBits, BlockBits
            m_Rijndael.ArrayEncrypt plaintext, ciphertext, 0, BlockBits
#Else
            m_Rijndael.SetCipherKey pass, KeyBits
            m_Rijndael.ArrayEncrypt plaintext, ciphertext, 0
#End If
           
           
            DisplayString Text1, HexDisplay(ciphertext, UBound(ciphertext) + 1, BlockBits \ 8)
           
        End If
    End If
End Sub
Private Sub cmdDecrypt_Click()
    Dim pass()        As Byte
    Dim plaintext()   As Byte
    Dim ciphertext()  As Byte
    Dim KeyBits       As Long
    Dim BlockBits     As Long

    If Len(Text1.Text) = 0 Then
        MsgBox "Please input password", vbOKOnly, "Face the wall"
    Else
        If Len(txtPassword.Text) = 0 Then
            MsgBox "Please input password", vbOKOnly, "Face the wall"
        Else
            KeyBits = cboKeySize.ItemData(cboKeySize.ListIndex)
            BlockBits = cboBlockSize.ItemData(cboBlockSize.ListIndex)
            pass = GetPassword

         If Len(Text1.Text) <= 2 Then
            MsgBox "Text is not hexadecimal data", vbOKOnly, "Face the wall"
            Exit Sub
            End If
            If HexDisplayRev(Text1.Text, ciphertext) = 0 Then
                MsgBox "Text is not hexadecimal data", vbOKOnly, "Face the wall"
              
                Exit Sub
            End If

           
#If SUPPORT_LEVEL Then
            m_Rijndael.SetCipherKey pass, KeyBits, BlockBits
            If m_Rijndael.ArrayDecrypt(plaintext, ciphertext, 0, BlockBits) <> 0 Then
                
                Exit Sub
            End If
#Else
            m_Rijndael.SetCipherKey pass, KeyBits
            If m_Rijndael.ArrayDecrypt(plaintext, ciphertext, 0) <> 0 Then
               
                Exit Sub
            End If
#End If
           
            If Check1.value = 0 Then
                DisplayString Text1, StrConv(plaintext, vbUnicode)
            Else
                DisplayString Text1, HexDisplay(plaintext, UBound(plaintext) + 1, BlockBits \ 8)
            End If
         
        End If
    End If
End Sub


Private Sub cmdFileEncrypt_Click()
    Dim FileName  As String
    Dim FileName2 As String
    Dim pass()    As Byte
    Dim KeyBits   As Long
    Dim BlockBits As Long

    If Len(txtPassword.Text) = 0 Then
        MsgBox "Please input password", vbOKOnly, "Face the wall"
    Else
        FileName = FileDialog(Me, False, "Please select the file you want to encrypt.  ----Face the wall", "*.*|*.*")
        If Len(FileName) <> 0 Then
            FileName2 = FileDialog(Me, True, "Save the encrypted file in ...  ----Face the wall", "*.ftw|*.ftw|*.*|*.*", FileName & ".ftw")
            If Len(FileName2) <> 0 Then
                RidFile FileName2
                KeyBits = cboKeySize.ItemData(cboKeySize.ListIndex)
                BlockBits = cboBlockSize.ItemData(cboBlockSize.ListIndex)
                pass = GetPassword

                
#If SUPPORT_LEVEL Then
                m_Rijndael.SetCipherKey pass, KeyBits, BlockBits
                m_Rijndael.FileEncrypt FileName, FileName2, BlockBits
#Else
Image1.Picture = LoadPicture(App.Path + "\images\3.jpg")
c.Refresh
                m_Rijndael.SetCipherKey pass, KeyBits
                m_Rijndael.FileEncrypt FileName, FileName2
                Image1.Picture = LoadPicture(App.Path + "\images\logo.jpg")
                MsgBox "File encryption completed", vbOKOnly, "Face the wall"
#End If
                
            End If
        End If
    End If
End Sub
Private Sub cmdFileDecrypt_Click()
    Dim FileName  As String
    Dim FileName2 As String
    Dim pass()    As Byte
    Dim KeyBits   As Long
    Dim BlockBits As Long

    If Len(txtPassword.Text) = 0 Then
        MsgBox "Please input password", vbOKOnly, "Face the wall"
    Else
        FileName = FileDialog(Me, False, "Please select the file you are going to decrypt  ----Face the wall", "*.ftw|*.ftw|*.*|*.*")
        If Len(FileName) <> 0 Then
            If InStrRev(FileName, ".ftw") = Len(FileName) - 3 Then FileName2 = Left$(FileName, Len(FileName) - 4)
            FileName2 = FileDialog(Me, True, "Save the decrypted file in ...  ----Face the wall", "*.*|*.*", FileName2)
            If Len(FileName2) <> 0 Then
                RidFile FileName2
                KeyBits = cboKeySize.ItemData(cboKeySize.ListIndex)
                BlockBits = cboBlockSize.ItemData(cboBlockSize.ListIndex)
                pass = GetPassword

               
#If SUPPORT_LEVEL Then
                m_Rijndael.SetCipherKey pass, KeyBits, BlockBits
                m_Rijndael.FileDecrypt FileName2, FileName, BlockBits
                    
#Else
Image1.Picture = LoadPicture(App.Path + "\images\2.jpg")
c.Refresh
                m_Rijndael.SetCipherKey pass, KeyBits
                m_Rijndael.FileDecrypt FileName2, FileName
              Image1.Picture = LoadPicture(App.Path + "\images\logo.jpg")
                     MsgBox "File decryption complete", vbOKOnly, "Face the wall"
#End If
               
            End If
        End If
    End If
End Sub

Private Sub chkTerminal_Click()
    Static Text1FontName As String
    Static Text1FontBold As Boolean
    Static Text1FontSize As Long

    If chkTerminal.value = 0 Then
        Text1.FontName = Text1FontName
        Text1.FontBold = Text1FontBold
        Text1.FontSize = Text1FontSize
    Else
        Text1FontName = Text1.FontName
        Text1FontBold = Text1.FontBold
        Text1FontSize = Text1.FontSize
        Text1.FontName = "Terminal"
    End If
End Sub









#If SUPPORT_LEVEL = 2 Then
Private Sub TestStuff(plaintext As String, passtext As String, ciphertext As String)
    Dim k As Long
    Dim p1() As Byte
    Dim c1() As Byte
    Dim cdata() As Byte
    Dim pData() As Byte
    Dim pass() As Byte
    Dim Nk As Long
    Dim Nb As Long
    Dim n As Long

    k = HexDisplayRev(passtext, pass)
    Nk = k \ 4
    If Nk * 4 <> k Or Nk < 4 Or Nk > 8 Then Exit Sub

    n = HexDisplayRev(plaintext, pData)
    Nb = n \ 4
    If Nb * 4 <> n Or Nb < 4 Or Nb > 8 Then Exit Sub

    If n <> HexDisplayRev(ciphertext, cdata) Then Exit Sub

    m_Rijndael.SetCipherKey pass, Nk * 32, Nb * 32
    m_Rijndael.ArrayEncrypt pData, c1, 0, Nb * 32
    m_Rijndael.ArrayDecrypt p1, cdata, 0, Nb * 32

    Text1.Text = Text1.Text & vbCrLf & "ENCRYPT TEST  " & CStr(Nb * 4) & " byte block, " & CStr(Nk * 4) & " byte key" & vbCrLf
    Text1.Text = Text1.Text & "KEY:          " & passtext & IIf(UCase$(passtext) = HexDisplay(pass, Nk * 4, Nk * 4), " = ", "<>") & vbCrLf & String(14, 32) & HexDisplay(pass, Nk * 4, Nk * 4) & vbCrLf
    Text1.Text = Text1.Text & "PLAINTEXT:    " & plaintext & IIf(UCase$(plaintext) = HexDisplay(p1, Nb * 4, Nb * 4), " = ", "<>") & vbCrLf & String(14, 32) & HexDisplay(p1, Nb * 4, Nb * 4) & vbCrLf
    Text1.Text = Text1.Text & "CIPHERTEXT:   " & ciphertext & IIf(UCase$(ciphertext) = HexDisplay(c1, Nb * 4, Nb * 4), " = ", "<>") & vbCrLf & String(14, 32) & HexDisplay(c1, Nb * 4, Nb * 4) & vbCrLf

End Sub
Private Sub cmdSizeTest_Click()
    Text1.Text = ""
    chkTerminal.value = 1

    TestStuff "3243f6a8885a308d313198a2e0370734", "2b7e151628aed2a6abf7158809cf4f3c", "3925841d02dc09fbdc118597196a0b32"
    TestStuff "3243f6a8885a308d313198a2e0370734", "2b7e151628aed2a6abf7158809cf4f3c762e7160", "231d844639b31b412211cfe93712b880"
    TestStuff "3243f6a8885a308d313198a2e0370734", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da5", "f9fb29aefc384a250340d833b87ebc00"
    TestStuff "3243f6a8885a308d313198a2e0370734", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d90", "8faa8fe4dee9eb17caa4797502fc9d3f"
    TestStuff "3243f6a8885a308d313198a2e0370734", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d9045190cfe", "1a6e6c2c662e7da6501ffb62bc9e93f3"

    TestStuff "3243f6a8885a308d313198a2e03707344a409382", "2b7e151628aed2a6abf7158809cf4f3c", "16e73aec921314c29df905432bc8968ab64b1f51"
    TestStuff "3243f6a8885a308d313198a2e03707344a409382", "2b7e151628aed2a6abf7158809cf4f3c762e7160", "0553eb691670dd8a5a5b5addf1aa7450f7a0e587"
    TestStuff "3243f6a8885a308d313198a2e03707344a409382", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da5", "73cd6f3423036790463aa9e19cfcde894ea16623"
    TestStuff "3243f6a8885a308d313198a2e03707344a409382", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d90", "601b5dcd1cf4ece954c740445340bf0afdc048df"
    TestStuff "3243f6a8885a308d313198a2e03707344a409382", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d9045190cfe", "579e930b36c1529aa3e86628bacfe146942882cf"

    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d", "2b7e151628aed2a6abf7158809cf4f3c", "b24d275489e82bb8f7375e0d5fcdb1f481757c538b65148a"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d", "2b7e151628aed2a6abf7158809cf4f3c762e7160", "738dae25620d3d3beff4a037a04290d73eb33521a63ea568"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da5", "725ae43b5f3161de806a7c93e0bca93c967ec1ae1b71e1cf"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d90", "bbfc14180afbf6a36382a061843f0b63e769acdc98769130"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d9045190cfe", "0ebacf199e3315c2e34b24fcc7c46ef4388aa475d66c194c"

    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa9", "2b7e151628aed2a6abf7158809cf4f3c", "b0a8f78f6b3c66213f792ffd2a61631f79331407a5e5c8d3793aceb1"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa9", "2b7e151628aed2a6abf7158809cf4f3c762e7160", "08b99944edfce33a2acb131183ab0168446b2d15e958480010f545e3"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa9", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da5", "be4c597d8f7efe22a2f7e5b1938e2564d452a5bfe72399c7af1101e2"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa9", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d90", "ef529598ecbce297811b49bbed2c33bbe1241d6e1a833dbe119569e8"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa9", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d9045190cfe", "02fafc200176ed05deb8edb82a3555b0b10d47a388dfd59cab2f6c11"

    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa98ec4e6c8", "2b7e151628aed2a6abf7158809cf4f3c", "7d15479076b69a46ffb3b3beae97ad8313f622f67fedb487de9f06b9ed9c8f19"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa98ec4e6c8", "2b7e151628aed2a6abf7158809cf4f3c762e7160", "514f93fb296b5ad16aa7df8b577abcbd484decacccc7fb1f18dc567309ceeffd"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa98ec4e6c8", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da5", "5d7101727bb25781bf6715b0e6955282b9610e23a43c2eb062699f0ebf5887b2"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa98ec4e6c8", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d90", "d56c5a63627432579e1dd308b2c8f157b40a4bfb56fea1377b25d3ed3d6dbf80"
    TestStuff "3243f6a8885a308d313198a2e03707344a4093822299f31d0082efa98ec4e6c8", "2b7e151628aed2a6abf7158809cf4f3c762e7160f38b4da56a784d9045190cfe", "a49406115dfb30a40418aafa4869b7c6a886ff31602a7dd19c889dc64f7e4e7a"

End Sub
#End If
















Private Sub DisplayString(TheTextBox As TextBox, ByVal TheString As String)
    If Len(TheString) < 65536 Then
        TheTextBox.Text = TheString
    Else
     MsgBox "String length cannot over 64K", vbOKOnly, "Face the wall"
    End If
End Sub



Private Function HexDisplay(data() As Byte, n As Long, k As Long) As String
    Dim i As Long
    Dim j As Long
    Dim c As Long
    Dim Data2() As Byte

    If LBound(data) = 0 Then
        ReDim Data2(n * 4 - 1 + ((n - 1) \ k) * 4)
        j = 0
        For i = 0 To n - 1
            If i Mod k = 0 Then
                If i <> 0 Then
                    Data2(j) = 32
                    Data2(j + 2) = 32
                    j = j + 4
                End If
            End If
            c = data(i) \ 16&
            If c < 10 Then
                Data2(j) = c + 48     ' "0"..."9"
            Else
                Data2(j) = c + 55     ' "A"..."F"
            End If
            c = data(i) And 15&
            If c < 10 Then
                Data2(j + 2) = c + 48 ' "0"..."9"
            Else
                Data2(j + 2) = c + 55 ' "A"..."F"
            End If
            j = j + 4
        Next i
Debug.Assert j = UBound(Data2) + 1
        HexDisplay = Data2
    End If

End Function


Private Function HexDisplayRev(TheString As String, data() As Byte) As Long
    Dim i As Long
    Dim j As Long
    Dim c As Long
    Dim d As Long
    Dim n As Long
    Dim Data2() As Byte

    n = 2 * Len(TheString)
    Data2 = TheString

    ReDim data(n \ 4 - 1)

    d = 0
    i = 0
    j = 0
    Do While j < n
        c = Data2(j)
        Select Case c
        Case 48 To 57    '"0" ... "9"
            If d = 0 Then   'high
                d = c
            Else            'low
                data(i) = (c - 48) Or ((d - 48) * 16&)
                i = i + 1
                d = 0
            End If
        Case 65 To 70   '"A" ... "F"
            If d = 0 Then   'high
                d = c - 7
            Else            'low
                data(i) = (c - 55) Or ((d - 48) * 16&)
                i = i + 1
                d = 0
            End If
        Case 97 To 102  '"a" ... "f"
            If d = 0 Then   'high
                d = c - 39
            Else            'low
                data(i) = (c - 87) Or ((d - 48) * 16&)
                i = i + 1
                d = 0
            End If
        End Select
        j = j + 2
    Loop
    n = i
    If n = 0 Then
        Erase data
    Else
        ReDim Preserve data(n - 1)
    End If
    HexDisplayRev = n

End Function



Private Function GetPassword() As Byte()
    Dim data() As Byte

    If Check1.value = 0 Then
        data = StrConv(txtPassword.Text, vbFromUnicode)
        ReDim Preserve data(31)
    Else
        If HexDisplayRev(txtPassword.Text, data) <> (cboKeySize.ItemData(cboKeySize.ListIndex) \ 8) Then
            data = StrConv(txtPassword.Text, vbFromUnicode)
            ReDim Preserve data(31)
        End If
    End If
    GetPassword = data
End Function





Private Sub Image1_Click()
Shell "explorer http://www.littlegaga.top/web_FTW/index.html"
End Sub

Private Sub TimMouseM_Timer()
'判断鼠标位置啊
Dim X As Long, Y As Long
GetCursorPos MyCur
X = MyCur.X - c.Left \ 15
Y = MyCur.Y - c.Top \ 15
If X > c.Head.Width - 35 And X < c.Head.Width And Y > 0 And Y < 35 Then
  DrawX 1, HeadG, Penx, brushx, brushMin, Me.Head
ElseIf X > c.Head.Width - 75 And X < c.Head.Width - 35 And Y > 0 And Y < 35 Then
  DrawX 2, HeadG, Penx, brushx, brushMin, Me.Head
Else
  DrawX 0, HeadG, Penx, brushx, brushMin, Me.Head
End If
End Sub
