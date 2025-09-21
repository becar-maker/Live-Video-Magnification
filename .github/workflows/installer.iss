#define MyAppName "Live Video Magnification"
#define MyAppVersion "1.0"
#define MyAppPublisher "Open Source (tschnz)"
#define MyAppExeName "Live-Video-Magnification.exe"

#ifnexist "AppPayload"
  #error "AppPayload was not defined. Use ISCC.exe /dAppPayload=<path>"
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
Source: "{#AppPayload}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
