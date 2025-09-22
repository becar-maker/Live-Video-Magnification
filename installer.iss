#define MyAppName "LiveVideoMagnification"
#define MyAppExeName "LiveVideoMagnification.exe"
#ifndef AppPayload
  #define AppPayload "payload"
#endif

[Setup]
AppName={#MyAppName}
AppVersion=1.0
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=Output
OutputBaseFilename=LiveVideoMagnification-Setup
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
UninstallDisplayIcon={app}\{#MyAppExeName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; 1) Vse iz payload (EXE + DLL + podmape, če obstajajo)
Source: "{#AppPayload}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

; 2) **Eksplicitno** dodaj Qt platform plugins iz vcpkg v {app}\platforms
;    (ta pot obstaja na GitHub runnerju; installer jih bo zapakiral zraven)
Source: "C:\vcpkg\installed\x64-windows\plugins\platforms\*"; DestDir: "{app}\platforms"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
