program pas2js_demo;

{$mode objfpc}

uses
  browserapp,
  JS,
  Classes,
  SysUtils,
  Web,
  utestweb;

type

  { TMyApplication }

  TMyApplication = class(TBrowserApplication)
  private
    FTestWeb: TTestWeb;
    procedure doRun; override;
  end;

  procedure TMyApplication.doRun;

  begin
    FTestWeb := TTestWeb.Create(Self);
    FTestWeb.Start;
    // Your code here
    Terminate;
  end;


var
  Application: TMyApplication;

begin
  Application := TMyApplication.Create(nil);
  Application.Initialize;
  Application.Run;
end.
