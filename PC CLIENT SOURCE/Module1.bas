Attribute VB_Name = "Module1"
Public Declare Function timeGetTime Lib "winmm.dll" () As Long '�������õ�ϵͳ���������ڵ�ʱ��(��λ������)

Public Function Sleep2(T As Long)
    Dim Savetime As Long
    Savetime = timeGetTime '���¿�ʼʱ��ʱ��
    While timeGetTime < Savetime + T 'ѭ���ȴ�
        DoEvents 'ת�ÿ���Ȩ
    Wend
End Function
