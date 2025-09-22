#define MyAppName "Live Video Magnification"
#define MyAppVersion "1.0"
#define MyAppPublisher "Open Source (tschnz)"
; Ime exe datoteke iz tvojega builda:
#define MyAppExeName "LiveVideoMagnification.exe"

; ✅ Pravilen preprocessor: #ifndef (ne #ifnexist)
#ifndef AppPayload
  #error "AppPayload was not defined. Use ISCC.exe /DAppPayload=<path>."
#endif

[Setup]
AppId={{1F2C2E2F-1234-5678-9ABC-DEF123456789}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=LiveVideoMagnification-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[Files]
; Vse iz payload mape (DLL + EXE)
Source: "{#AppPayload}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
