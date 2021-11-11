(**************************************************************************)
(*                                                                        *)
(* Module:  Unit 'ScikitLearn'      Copyright (c) 2021                    *)
(*                                                                        *)
(*                                  Lucas Moura Belo - lmbelo             *)
(*                                  lucas.belo@live.com                   *)
(*                                  Brazil                                *)
(*                                                                        *)
(* Project page:                    https://github.com/lmbelo/P4D_AI_ML   *)
(**************************************************************************)
(*  Functionality:  ScikitLearn Components                                *)
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
unit ScikitLearn;

interface

uses
  System.Classes, PyPackage, PythonEngine;

type
  [ComponentPlatforms(pidAllPlatforms)]
  TScikitLearn = class(TPyPyPIPackage)
  private
    Fsklearn: variant;
    function Getsklean: variant;
    function GetTree: variant;
    function GetDataSets: variant;
    function GetDecomposition: variant;
    function GetMetrics: variant;
    function GetModelSelection: variant;
    function GetSvm: variant;
  protected
    procedure ImportModule; override;
  public
    property sklearn: variant read Getsklean;
    property tree: variant read GetTree;
    property model_selection: variant read GetModelSelection;
    property datasets: variant read GetDataSets;
    property metrics: variant read GetMetrics;
    property decomposition: variant read GetDecomposition;
    property svm: variant read GetSvm;
  end;

implementation

uses
  PyContext, System.Variants;

{ TScikitLearn }

function TScikitLearn.GetDataSets: variant;
begin
  Result := PyModule['datasets'].AsVariant();
end;

function TScikitLearn.GetDecomposition: variant;
begin
  Result := PyModule['decomposition'].AsVariant();
end;

function TScikitLearn.GetMetrics: variant;
begin
  Result := PyModule['metrics'].AsVariant();
end;

function TScikitLearn.GetModelSelection: variant;
begin
  Result := PyModule['model_selection'].AsVariant();
end;

function TScikitLearn.Getsklean: variant;
begin
  if VarIsNull(Fsklearn) or VarIsEmpty(Fsklearn) then
    Fsklearn := AsVariant();
  Result := Fsklearn;
end;

function TScikitLearn.GetSvm: variant;
begin
  Result := PyModule['svm'].AsVariant();
end;

function TScikitLearn.GetTree: variant;
begin
  Result := PyModule['tree'].AsVariant();
end;

procedure TScikitLearn.ImportModule;
begin
  MaskFPUExceptions(true);
  try
    inherited;
  finally
    MaskFPUExceptions(false);
  end;
end;

initialization
  TPyContext.Instance
    .RegisterInfo(TScikitLearn)
      .RegisterPIPPackage('scikit-learn')
        .RegisterModule('sklearn');

finalization
  TPyContext.Instance
    .UnRegisterInfo(TScikitLearn);

end.
