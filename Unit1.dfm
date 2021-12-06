object Form1: TForm1
  Left = 216
  Top = 179
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Screen recorder'
  ClientHeight = 162
  ClientWidth = 176
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMain: TPageControl
    Left = 0
    Top = 0
    Width = 177
    Height = 145
    ActivePage = ts1
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'Main'
      object FPSLabel: TLabel
        Left = 8
        Top = 64
        Width = 38
        Height = 13
        Caption = 'FPS: 30'
      end
      object btnRecBtn: TButton
        Left = 6
        Top = 84
        Width = 75
        Height = 25
        Caption = 'Record'
        TabOrder = 0
        OnClick = btnRecBtnClick
      end
      object chk1: TCheckBox
        Left = 8
        Top = 8
        Width = 145
        Height = 17
        Caption = 'Record Cursor'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object trackbar: TTrackBar
        Left = 3
        Top = 28
        Width = 150
        Height = 33
        Max = 60
        Min = 1
        Frequency = 5
        Position = 30
        TabOrder = 2
        OnChange = TrackBar1Change
      end
      object btnStopBtn: TButton
        Left = 86
        Top = 84
        Width = 75
        Height = 25
        Caption = 'Stop'
        TabOrder = 3
        OnClick = btnStopBtnClick
      end
    end
    object ts2: TTabSheet
      Caption = 'Options'
      ImageIndex = 1
      object Label1: TLabel
        Left = 9
        Top = 8
        Width = 64
        Height = 13
        Caption = 'Video Codec:'
      end
      object cbbvcodec: TComboBox
        Left = 8
        Top = 24
        Width = 153
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'libx264'
        Items.Strings = (
          'libx264'
          'hevc'
          'libvpx-vp9'
          'h264_nvenc'
          'h264_amf')
      end
    end
    object ts3: TTabSheet
      Caption = 'About'
      ImageIndex = 2
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 97
        Height = 13
        Caption = 'Created by TobyAdd'
      end
      object Label3: TLabel
        Left = 0
        Top = 16
        Width = 95
        Height = 13
        Caption = 'Thank you FFmpeg!'
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 143
    Width = 176
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'MP4 files|*.mp4'
    Filter = 'MP4 files|*.mp4'
    Left = 496
    Top = 120
  end
end
