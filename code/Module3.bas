Attribute VB_Name = "Module3"
Option Explicit

Private Declare Function DrawIcon Lib "user32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal hIcon As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconA" (ByVal hInst As Long, ByVal lpszExeFileName As String, ByVal nIconIndex As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Const WM_SETICON = &H80
Private Const ICON_SMALL = 0
Private Const ICON_BIG = 1


Public Sub SetWindowIcon(hWnd As Long, Optional FileName As String, Optional IconIndex As Integer)
Dim m_Icon As Long
Dim hmodule As Long
If Len(FileName) = 0 Or Len(Dir(FileName, vbHidden)) = 0 Then
    Dim MyPath As String
    MyPath = App.Path
    If Right(MyPath, 1) <> "\" Then MyPath = MyPath & "\"
    FileName = MyPath & App.EXEName & ".exe"
End If
hmodule = GetModuleHandle(FileName)
m_Icon = ExtractIcon(hmodule, FileName, IconIndex)
SendMessage hWnd, WM_SETICON, 0, ByVal m_Icon
End Sub


