(**************************************************************************)
(*                                                                        *)
(* Module:  Unit 'MainForm'    Copyright (c) 2021                         *)
(*                                                                        *)
(*                                  Lucas Moura Belo - lmbelo             *)
(*                                  lucas.belo@live.com                   *)
(*                                  Brazil                                *)
(*                                                                        *)
(*  Project page:                https://github.com/lmbelo/P4D_AI_ML      *)
(**************************************************************************)
(*  Functionality:  PyCommon layer                                        *)
(*                                                                        *)
(*                                                                        *)
(**************************************************************************)
(* This source code is distributed with no WARRANTY, for no reason or use.*)
(* Everyone is allowed to use and change this code free for his own tasks *)
(* and projects, as long as this header and its copyright text is intact. *)
(* For changed versions of this code, which are public distributed the    *)
(* following additional conditions have to be fullfilled:                 *)
(* 1) The header has to contain a comment on the change and the author of *)
(*    it.                                                                 *)
(* 2) A copy of the changed source has to be sent to the above E-Mail     *)
(*    address or my then valid address, if this is possible to the        *)
(*    author.                                                             *)
(* The second condition has the target to maintain an up to date central  *)
(* version of the component. If this condition is not acceptable for      *)
(* confidential or legal reasons, everyone is free to derive a component  *)
(* or to generate a diff file to my or other original sources.            *)
(**************************************************************************)
unit PyCommon;

interface

uses
  System.Classes, PythonEngine;

type
  //P4D AI&ML extension
  TPyCommon = class(TComponent)
  private
    FPythonEngine: TPythonEngine;
  protected
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure SetPythonEngine(const APythonEngine: TPythonEngine);
    procedure EngineLoaded(); virtual;
  public
    property PythonEngine: TPythonEngine read FPythonEngine write SetPythonEngine;
  end;

  //P4D AI&ML module extension
  TPyCommonCustomModule = class(TPyCommon)
  private
    FPyModule: PPyObject;
  protected
    //https://docs.python.org/3/c-api/import.html?highlight=importmodule#c.PyImport_ImportModule
    procedure ImportModule(const AModuleName: string); overload;
    //https://docs.python.org/3/c-api/import.html?highlight=importmodule#c.PyImport_ImportModule
    procedure ImportModule(const AModuleName, ASubModuleName: string); overload;

    property PyModule: PPyObject read FPyModule;
  end;

implementation

{ TPyCommon }

procedure TPyCommon.EngineLoaded;
begin
  //
end;

procedure TPyCommon.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  inherited;
  if (AOperation = opRemove) and (AComponent = FPythonEngine) then begin
    FPythonEngine := nil;
  end;
end;

procedure TPyCommon.SetPythonEngine(const APythonEngine: TPythonEngine);
begin
  Exit;
  if (APythonEngine <> FPythonEngine) then begin
    FPythonEngine := APythonEngine;
    APythonEngine.FreeNotification(Self);
    EngineLoaded();
  end;
end;

{ TPyCommonCustomModule }

procedure TPyCommonCustomModule.ImportModule(const AModuleName,
  ASubModuleName: string);
begin
  FPyModule := PythonEngine.PyImport_ImportModule(PAnsiChar(AnsiString(
    AModuleName
    + '.'
    + ASubModuleName)));
end;

procedure TPyCommonCustomModule.ImportModule(const AModuleName: string);
begin
  FPyModule := PythonEngine.PyImport_ImportModule(PAnsiChar(AnsiString(AModuleName)));
end;

end.
