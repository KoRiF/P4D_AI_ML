object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object PythonEngine1: TPythonEngine
    DllPath = 'c:\ProgramData\Anaconda3\envs\Python36_Delphi_AI_ML_Ecosystem\'
    OnBeforeLoad = PythonEngine1BeforeLoad
    IO = PythonGUIInputOutput1
    Left = 429
    Top = 8
  end
  object NumPy1: TNumPy
    PythonEngine = PythonEngine1
    ManagerKind = pip
    Left = 544
    Top = 64
  end
  object PythonGUIInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = Memo1
    Left = 544
    Top = 8
  end
end
