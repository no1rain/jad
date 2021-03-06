$PBExportHeader$n_svc_win32.sru
$PBExportComments$Win32 API service
forward
global type n_svc_win32 from n_svc_base
end type
end forward

global type n_svc_win32 from n_svc_base autoinstantiate
event ue_constructor ( )
end type

type prototypes
// Shell FUNCTIONs
SUBROUTINE SHAddToRecentDocs( ulong uFlags, Ref String pV ) Library "shell32.dll" alias for "SHAddToRecentDocs;Ansi" 
//FUNCTION long SHBrowseForFolder( Ref BROWSEINFO lpBi ) Library "shell32.dll" alias for "SHBrowseForFolder;Ansi"
FUNCTION boolean SHGetPathFromIDList( long pIDL, ref String pszPath) Library "shell32.dll" Alias For "SHGetPathFromIDListA;Ansi"
FUNCTION long ShellExecuteA( Long w_handle, String lpOperation, String lpFile, String lpParameters, String lpDirectory, Long nShowCmd ) LIBRARY "shell32.dll" Alias for "ShellExecuteA;Ansi"
//FUNCTION long SHFileOperation( Ref SHFILEOPSTRUCT lpFileOp ) Library "shell32.dll" Alias For "SHFileOperationA;Ansi"
FUNCTION long SHGetSpecialFolderLocation( long hwndOwner, long nFolder, Ref Long ppidl ) Library "shell32.dll"
FUNCTION long SHFormatDrive( ulong hWnd, ulong iDrive, ulong iCapacity, ulong iType ) Library "shell32.dll"
FUNCTION long CoTaskMemFree( long pv ) Library "ole32.dll"
// Memory FUNCTIONs
FUNCTION long RtlMoveMemory(REF Char Destination[], long Source, long Size) library "kernel32" alias for "RtlMoveMemory"
FUNCTION long RtlMoveMemory(long Destination, REF Char Source[], long Size) library "kernel32" alias for "RtlMoveMemory"
FUNCTION long LocalAlloc(long Flags, long Bytes) library "kernel32"
FUNCTION long LocalFree(long MemHandle) library "kernel32"
FUNCTION long Lstrcpy(long Destination, string Source) library "kernel32.dll" ALIAS FOR "lstrcpyA;Ansi"
FUNCTION long lstrcpy(long Destination, ref char Source[]) library "kernel32.dll" alias for "lstrcpy;Ansi"
//SUBROUTINE GetMinMaxInfo ( ref minmaxinfo d, long s, long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
//SUBROUTINE SetMinMaxInfo ( long d, minmaxinfo s, long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
FUNCTION long LoadLibrary(ref string lpLibFileName) LIBRARY "kernel32.dll" ALIAS FOR "LoadLibraryA;Ansi"
FUNCTION long FreeLibrary(long hLibModule) LIBRARY "kernel32.dll"
//FUNCTION long GetDevMode(REF DEVMODE Destination, long Source, long Size) library "kernel32.dll" Alias For "RtlMoveMemory"
//FUNCTION long GetDevNames(REF DEVNAMES Destination, long Source, long Size) library "kernel32.dll" Alias For "RtlMoveMemory"
//FUNCTION long GetLogFont(REF LOGFONT Destination, long Source, long Size) library "kernel32.dll" Alias For "RtlMoveMemory"
//FUNCTION long PutLogFont(long Destination, REF LOGFONT Source, long Size) library "kernel32.dll" Alias For "RtlMoveMemory"
FUNCTION long StrCopy(long Destination, REF string Source, long Size) library "kernel32.dll"  Alias for "RtlMoveMemory"
FUNCTION long CommDlgExtendedError() library "comdlg32.dll"
FUNCTION long LocalLock(long Handle) library "kernel32.dll"
FUNCTION long LocalUnlock(long Handle) library "kernel32.dll"
// Directory FUNCTIONs
FUNCTION ulong GetModuleFileName (ulong hinstModule, ref string lpszPath, ulong cchPath ) Library "KERNEL32.DLL" Alias for "GetModuleFileNameA;Ansi"
//FUNCTION long CreateDirectory(ref string lpPathName,ref SECURITY_ATTRIBUTES lpSecurityAttributes) LIBRARY "kernel32.dll" ALIAS FOR "CreateDirectoryA;Ansi"
FUNCTION ulong GetLongPathName(string nShort,ref string nLong, ulong buffer) LIBRARY "kernel32.dll" ALIAS FOR "GetLongPathNameA;Ansi"
FUNCTION long GetWindowsDirectory(REF string Buffer, long Size) library "kernel32.dll" ALIAS FOR "GetWindowsDirectoryA;Ansi"
// File FUNCTIONs
//FUNCTION long FindFirstFile(string FileName,	ref WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindFirstFileA;Ansi"
//FUNCTION integer FindNextFile ( ulong FindFile,	ref WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindNextFileA;Ansi"
FUNCTION integer FindClose( ulong FindFile ) Library "kernel32.dll"
FUNCTION long SearchPath ( ref string Path, ref string FileName, ref string Extension, ulong BufferLength, ref string Buffer, ref integer FilePart ) Library  "kernel32.dll" Alias for "SearchPathA;Ansi"
FUNCTION long SHGetFolderPath ( long hwndOwner, long nFolder, long hToken, long dwFlags, Ref string pszPath ) LIBRARY "shell32.dll" Alias For "SHGetFolderPathW"
//FUNCTION ulong FindFirstFileEx(ref string lpFileName, integer finfolevelid, ref WIN32_FIND_DATA lpFindFileData, long fsearchop, long lpsearchfilter, long dwadditionalflags) LIBRARY "kernel32.dll" ALIAS FOR "FindFirstFileExA;Ansi"
FUNCTION ulong GetTempFileName(ref string lpszPath,ref string lpPrefixString,ulong wUnique,ref string lpTempFileName) LIBRARY "kernel32.dll" ALIAS FOR "GetTempFileNameA;Ansi"
FUNCTION ulong GetTempPath(ulong nBufferLength,ref string lpBuffer) LIBRARY "kernel32.dll" ALIAS FOR "GetTempPathA;Ansi"
//Drawing FUNCTIONs
FUNCTION boolean DrawEdge( long hdc, ref str_rect rc, long edge, long grflags ) Library "USER32.DLL" alias for "DrawEdge;Ansi" 
//FUNCTION Ulong BeginPaint(long hwnd, ref PAINTSTRUCT pstr) Library "USER32.DLL" alias for "BeginPaint;Ansi" 
//FUNCTION Boolean EndPaint(long hwnd, ref PAINTSTRUCT pstr) Library "USER32.DLL" alias for "EndPaint;Ansi" 
FUNCTION Boolean Polygon(ulong hdc, ref POINT ppoint[], int count) Library "GDI32.DLL"
FUNCTION ulong CreatePolygonRgn(ref POINT ppoint[], int count, int fillMode) Library "GDI32.DLL"
FUNCTION long SelectClipRgn(ulong hdc, ulong hrgn) Library "GDI32.DLL"
// Window FUNCTIONs
FUNCTION boolean BringWindowToTop(  ulong  HWND  ) LIBRARY "user32"
FUNCTION ulong InvalidateRect(ulong hwnd,ref str_rect lpRect,boolean bErase) LIBRARY "user32.dll" alias for "InvalidateRect;Ansi"
FUNCTION ulong InvalidateRect(ulong hwnd,ref long lpRect,boolean bErase) LIBRARY "user32.dll"
FUNCTION ulong MoveWindow(ulong hwnd,ulong x,ulong y,ulong nWidth,ulong nHeight,ulong bRepaint) LIBRARY "user32.dll"
FUNCTION long SendMessageString( long hWindow, uint Msg, ulong wParam, Ref string szText ) Library 'user32' alias for 'SendMessageA;Ansi'
FUNCTION long GetDC (ulong hWnd) Library "USER32.DLL"
FUNCTION long SetFocusAPI (ulong hWnd) Library "USER32.DLL" Alias for "SetFocus"
FUNCTION int ReleaseDC (ulong hWnd, ulong hDC) Library "USER32.DLL"
FUNCTION ulong IsWindow(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong FindWindow ( ref string lpClassName, ref string lpWindowName) Library "USER32.DLL" Alias for "FindWindowA;Ansi"
FUNCTION LONG FindWindowA( ulong  Winhandle, string wintitle ) LIBRARY "user32"
FUNCTION ulong GetWindowRect ( ulong hwnd, ref str_rect lprect) Library "USER32.DLL" alias for "GetWindowRect;Ansi" 
FUNCTION boolean GetClientRect (ulong hWnd, ref str_rect lpRect) Library "USER32.DLL" alias for "GetClientRect;Ansi"
FUNCTION ulong GetSystemMetrics(ulong nIndex) LIBRARY "user32.dll"
FUNCTION long SetWindowLong(long hwnd,long nIndex,long dwNewLong) LIBRARY "user32.dll" ALIAS FOR "SetWindowLongA"
FUNCTION long GetWindowLong(long hwnd,long nIndex) LIBRARY "user32.dll" ALIAS FOR "GetWindowLongA"
FUNCTION ulong SetParent(ulong hWndChild,ulong hWndNewParent) LIBRARY "user32.dll"
FUNCTION long CreateWindowEx( ulong dwExStyle, string lpClassName, string lpWindowName, ulong dwStyle, long xPos, long yPos, long nWidth, long nHeight, long hWndParent, long hMenu, long hInstance, long lpParam ) Library "user32" ALIAS FOR "CreateWindowExA;Ansi"
FUNCTION boolean DestroyWindow( long hWnd ) Library "user32"
FUNCTION boolean ShowWindow (ulong hWnd, int nCmdShow) Library "USER32.DLL"
FUNCTION long MapWindowPoints(long hwndFrom,long hwndTo,ref str_rect lppt,long cPoints) LIBRARY "user32.dll" alias for "MapWindowPoints;Ansi"
FUNCTION long MapWindowPoints(long hwndFrom,long hwndTo,ref point lppt,long cPoints) LIBRARY "user32.dll" alias for "MapWindowPoints;Ansi"
FUNCTION ulong MoveWindow(ulong hwnd,ulong x,ulong y,ulong nWidth,ulong nHeight,Boolean bRepaint) LIBRARY "user32.dll"
FUNCTION ulong UpdateWindow(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong GetStockObject(ulong nIndex) LIBRARY "gdi32.dll"
//FUNCTION ulong CreateFontIndirect(ref LOGFONT lpLogFont) LIBRARY "gdi32.dll" ALIAS FOR "CreateFontIndirectA;Ansi"
FUNCTION Boolean ClientToScreen(ulong hWnd, Ref POINT lpPoint) Library "USER32.DLL" alias for "ClientToScreen;Ansi"
FUNCTION boolean ScreenToClient(ulong hWnd, ref POINT lpPoint) Library "USER32.DLL"
FUNCTION boolean GetCursorPos(ref POINT lpPoint) Library "USER32.DLL"
FUNCTION BOOLEAN ShowWindow ( long handle, integer ncmdshow ) LIBRARY "user32.dll"
//Menu FUNCTIONs
FUNCTION ulong GetSystemMenu(ulong hWnd, BOOLEAN bRevert)  Library "USER32"
FUNCTION boolean DeleteMenu( ulong hMenu, uint uPosition, uint uFlags ) LIBRARY "user32.dll"
FUNCTION boolean DrawMenuBar( ulong hWnd ) LIBRARY "user32.dll"
//Common Controls
SUBROUTINE InitCommonControls() library "comctl32.dll"
//FUNCTION boolean InitCommonControlsEx( Ref INITCOMMONCONTROLS LPINITCOMMONCONTROLS) Library "comctl32.dll" alias for "InitCommonControlsEx;Ansi"
//FUNCTION integer ToolTipMsg(long hWnd, long uMsg, long wParam, REF TOOLINFO ToolInfo) library "user32.dll" Alias For "SendMessageA;Ansi"
//FUNCTION integer RelayMsg(long hWnd, long uMsg, long wParam, REF MSG Msg) library "user32.dll" Alias For "SendMessageA;Ansi"
FUNCTION integer SendPoint(long hWnd, long uMsg, long wParam, REF POINT pt) library "user32.dll" Alias For "SendMessageA;Ansi"
FUNCTION integer SendRect(long hWnd, long uMsg, long wParam, REF str_rect rt) library "user32.dll" Alias For "SendMessageA;Ansi"
//FUNCTION integer SendButtonImageList(long hWnd, long uMsg, long wParam, REF BUTTON_IMAGELIST  rt) library "user32.dll" Alias For "SendMessageA;Ansi"
//FUNCTION integer SendBalloontip(long hWnd, long uMsg, long wParam, REF EDITBALLOONTIP  rt) library "user32.dll" Alias For "SendMessageA;Ansi"
//SUBROUTINE GetNMHDR( ref NMHDR d, long s, long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
//SUBROUTINE GetNMClick( ref NMMOUSE d, long s, long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
//FUNCTION long SendMessageItems( long hWnd, long uMsg, long wParam, Ref tbbutton lpst[] ) Library "user32" Alias For "SendMessageA;Ansi"
//FUNCTION long GetButton( long hWnd, long uMsg, long wParam, Ref tbbutton lpst ) Library "user32" Alias For "SendMessageA;Ansi"
//FUNCTION long SendMessageInfo( long hWnd, long uMsg, long wParam, Ref tbbuttoninfo lpst ) Library "user32" Alias For "SendMessageA;Ansi"
FUNCTION long SendMessageRECT( long hWnd, long uMsg, long wParam, Ref str_rect lpst ) Library "user32" Alias For "SendMessageA;Ansi"
FUNCTION long SendBoolean( long hWnd, long uMsg, long wParam,  Boolean lpst ) Library "user32" Alias For "SendMessageA"
FUNCTION long SendMessageCharBuffer( long hWnd, long uMsg, long wParam,  ref char lc[]) Library "user32" Alias For "SendMessageA;Ansi"
//FUNCTION long SendMessageSize( long hWnd, long uMsg, long wParam, ref tagsize lpst ) Library "user32" Alias For "SendMessageA;Ansi"
//FUNCTION long SendMessageBand( long hWnd, long uMsg, long wParam, Ref REBARBANDINFO lpst ) Library "user32" Alias For "SendMessageA;Ansi"
//FUNCTION long SendMessageImage( long hWnd, long uMsg, long wParam, Ref lvbkimage lpst ) Library "user32" Alias For "SendMessageA;Ansi"
FUNCTION long SendMessageNumber( long hWindow, uint Msg, ulong wParam, ulong lParam ) Library 'user32' alias for 'SendMessageA'
FUNCTION long PtInRect(ref str_rect rc, point pt) LIBRARY "user32.dll"
FUNCTION long PtInRegion(ulong hrgn, int x, int y) LIBRARY "GDI32.dll"
//Listview
//FUNCTION long Sendlvref( long hWnd, long uMsg, long wParam,  ref lvitem lpst ) Library "user32" Alias For "SendMessageA;Ansi"
//FUNCTION long Sendlv( long hWnd, long uMsg, long wParam,  lvitem lpst ) Library "user32" Alias For "SendMessageA;Ansi"
//FUNCTION long SendlvFindInfo( long hWnd, long uMsg, long wParam,  ref lvfindinfo lpst ) Library "user32" Alias For "SendMessageA;Ansi"
// Treeview
//FUNCTION Long HitMsg(Long hWindow, UInt Msg, Long wParam,  Ref tvhittestinfo lParam) Library 'user32.dll' Alias for "SendMessageA;Ansi"
// Mouse FUNCTIONs
FUNCTION ulong SetCapture(ulong hwnd) LIBRARY "user32.dll"
FUNCTION Boolean ReleaseCapture() LIBRARY "user32.dll"
//Path Fucntions
FUNCTION Boolean PathCompactPath(long hdc, ref string lpszpath, uint dx) LIBRARY "shlwapi.dll" ALIAS FOR "PathCompactPathA;Ansi"
// System FUNCTIONs
FUNCTION ulong GetSysColor(ulong nIndex) LIBRARY "user32.dll"
SUBROUTINE Sleep(ulong dwMilliseconds) LIBRARY "kernel32.dll"
// Image/Icon FUNCTIONs
FUNCTION ulong ExtractIcon(ulong hInst,string lpszExeFileName,ulong nIconIndex) LIBRARY "shell32.dll" ALIAS FOR "ExtractIconA;Ansi"
FUNCTION long ExtractIconEx( String lpszFile, long nIconIndex, Ref Long phIconLarge[], Ref Long phIconSmall[], long nIcons ) Library "shell32.dll" Alias For "ExtractIconExA;Ansi"
FUNCTION long DrawIcon(long hdc,long x,long y,long hIcon) LIBRARY "user32.dll"
FUNCTION boolean DrawIconEx(ulong hdc,ulong xLeft,ulong yTop,ulong hIcon,ulong cxWidth,ulong cyWidth,ulong istepIfAniCur,ulong hbrFlickerFreeDraw,ulong diFlags) LIBRARY "user32.dll"
FUNCTION ulong LoadIcon(long hInstance,long lpIconName) LIBRARY "user32.dll" ALIAS FOR "LoadIconA"
FUNCTION ulong DestroyIcon(ulong hIcon) LIBRARY "user32.dll"
FUNCTION ulong LoadImage(ulong hInst,ref string lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageA;Ansi"
FUNCTION ulong LoadImage(ulong hInst,long lpsz,ulong un1,ulong n1,ulong n2,ulong un2) LIBRARY "user32.dll" ALIAS FOR "LoadImageA;Ansi"
FUNCTION ulong MAKEINTRESOURCE(int res)  LIBRARY "user32.dll"
//toolbar FUNCTIONs
//SUBROUTINE GetDISP( ref NMTTDISPINFO d, long s, long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
//SUBROUTINE SetDISP( long s, ref NMTTDISPINFO d,  long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
//SUBROUTINE GetTOOL( ref NMTOOLBAR d, long s, long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
//SUBROUTINE SetTOOL( long s, ref NMTOOLBAR d,  long l ) library 'kernel32.dll' alias for "RtlMoveMemory"
//drawing and bitmap FUNCTIONs
//FUNCTION Boolean GetTextExtentPoint32(ulong hdc, string text, long textLen, ref tagSize lstr) Library "gdi32.dll" alias for "GetTextExtentPoint32A;Ansi"
//FUNCTION Long MulDiv( Long nNumber, Long nNumerator, Long nDenominator ) Library "kernel32.dll"
FUNCTION ulong MoveToEx(ulong hdc,ulong x,ulong y,ref POINT lpPoint) LIBRARY "gdi32.dll" alias for "MoveToEx;Ansi"
FUNCTION ulong LineTo(ulong hdc,ulong x,ulong y) LIBRARY "gdi32.dll"
FUNCTION ulong CreatePen(ulong nPenStyle,ulong nWidth,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION ulong SelectObject(ulong hdc,ulong hObject) LIBRARY "gdi32.dll"
FUNCTION ulong DeleteObject(ulong hObject) LIBRARY "gdi32.dll"
SUBROUTINE CopyBitmap( blob b, ulong s, long l ) alias for "RtlMoveMemory;Ansi" library "kernel32.dll"
//SUBROUTINE CopyBitmapFileHeader( ref blob b, bitmapheader b, long l ) alias for "RtlMoveMemory;Ansi" library "kernel32.dll"
//SUBROUTINE CopyBitmapInfoHeader( ref blob b, bitmapinfoheader b, long l ) alias for "RtlMoveMemory;Ansi" library "kernel32.dll"
//SUBROUTINE CopyBitmapInfo( ref blob b, bitmapinfo b, long l ) alias for "RtlMoveMemory;Ansi" library "kernel32.dll"
//FUNCTION long GetDIBits(ulong hdc, ulong bitmap, ulong start, ulong lines, ref blob bits, ref bitmapinfo i, ulong pallete ) library "gdi32.dll" alias for "GetDIBits;Ansi"
//FUNCTION long GetDIBits(ulong hdc, ulong bitmap, ulong start, ulong lines, long bits, ref bitmapinfo i, ulong pallete ) library "gdi32.dll" alias for "GetDIBits;Ansi"
FUNCTION ulong GetDesktopWindow( ) LIBRARY "User32.dll"
FUNCTION int DeleteDC(ulong hDC) LIBRARY "Gdi32.dll"
FUNCTION int BitBlt(ulong hDC, int num, int num, int num, int num, ulong hDC, int num, int num, ulong lParam) LIBRARY "Gdi32.dll"
FUNCTION int TransparentBlt(ulong hDC, int num, int num, int num, int num, ulong hDC, int num, int num, int num, int num, long rgb) LIBRARY "msimg32.dll"
FUNCTION ulong CreateDC(ref string str, ref string str, ref string str, ref string str) LIBRARY "Gdi32.dll" ALIAS FOR "CreateDCA;Ansi"
FUNCTION ulong CreateCompatibleDC(ulong hDC) LIBRARY "Gdi32.dll"
FUNCTION ulong CreateCompatibleBitmap(ulong hDC, int num, int num) LIBRARY "Gdi32.dll"
//FUNCTION boolean GradientFill( Long hdc , trivertex pvertex[],  long dwnumvertices, ref gradient_rect pmesh[], long dwnummwesh, long dwmmode) Library "msimg32.dll" alias for "GradientFill;Ansi"
//FUNCTION boolean GradientFill( Long hdc , trivertex pvertex[],  long dwnumvertices, ref gradient_rect pmesh, long dwnummwesh, long dwmmode) Library "msimg32.dll" alias for "GradientFill;Ansi"
FUNCTION ulong DrawText(ulong hdc,ref string lpStr,ulong nCount,ref str_rect lpRect,ulong wFormat) LIBRARY "user32.dll" ALIAS FOR "DrawTextA;Ansi"
FUNCTION ulong SetBkMode(ulong hdc,ulong nBkMode) LIBRARY "gdi32.dll"
FUNCTION long SetDCPenColor(ulong hdc,ulong color) LIBRARY "gdi32.dll"
FUNCTION long SetDCBrushColor(ulong hdc,ulong color) LIBRARY "gdi32.dll"
FUNCTION ulong TextOut(ulong hdc,ulong x,ulong y,ref string lpString,ulong nCount) LIBRARY "gdi32.dll" ALIAS FOR "TextOutA;Ansi"
FUNCTION ulong Rectangle(ulong hdc,ulong X1,ulong Y1,ulong X2,ulong Y2) LIBRARY "gdi32.dll"
FUNCTION ulong BeginPath(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong EndPath(ulong hdc) LIBRARY "gdi32.dll"
FUNCTION ulong SetTextColor(ulong hdc,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION long FillRect(ulong hdc, ref str_rect rc, ulong hBrush) LIBRARY "user32.dll"
FUNCTION long CreateSolidBrush(long color) LIBRARY "gdi32.dll"
FUNCTION long SetDCPenColor(ulong hdc, long color) LIBRARY "gdi32.dll"
// Common Dialog External FUNCTIONs
//FUNCTION long GetOpenFileName(REF OPENFILENAME OpenFileName) library "comdlg32.dll" ALIAS FOR "GetOpenFileNameA;Ansi"
//FUNCTION long GetSaveFileName(REF OPENFILENAME SaveFileName) library "comdlg32.dll" ALIAS FOR "GetSaveFileNameA;Ansi"
//FUNCTION long PrintDlg(REF PRINTDLG PrintDlg) library "comdlg32.dll" ALIAS FOR "PrintDlgA;Ansi"
//FUNCTION long ChooseFont(REF CHOOSEFONT ChooseFont) library "comdlg32.dll" ALIAS FOR "ChooseFontA;Ansi"
//FUNCTION BOOLEAN ChooseColor(ref CHOOSECOLOR pChoosecolor) LIBRARY "comdlg32.dll" ALIAS FOR "ChooseColorA;Ansi"
FUNCTION boolean ChooseColorA( REF os_ChooseColor  lpcc ) LIBRARY "comdlg32.dll" ALIAS FOR "ChooseColorA;Ansi"
SUBROUTINE InitCustomColors ( long d, long custom[16], long l ) library 'kernel32.dll' alias for RtlMoveMemory
//Cursor
FUNCTION BOOLEAN ClipCursor(REF str_rect lprect) LIBRARY 'user32.dll' alias for "ClipCursor;Ansi"
FUNCTION BOOLEAN GetClipCursor(REF str_rect lprect) LIBRARY 'user32.dll' alias for "GetClipCursor;Ansi"
//Timer
FUNCTION ULONG SetTimer(long hwnd, ULONG nIDEvent, ULONG elapse, long zero) LIBRARY "USER32.DLL"
FUNCTION BOOLEAN KillTimer(long hwnd, ULONG nIDEvent) LIBRARY "USER32.DLL"
// 외부 함수 선언
FUNCTION long GetEnvironmentVariableA( string  lpszName, ref string lpszValue, long lLen ) LIBRARY "kernel32.dll" alias for "GetEnvironmentVariableA;ansi"
/* 윈도 상태바 높이 구함 */
FUNCTION LONG SystemParametersInfoA(long uAction, long uParam, ref str_rect lpvParam, long fuWinIni ) LIBRARY "user32.dll"
//Get Computer Name
FUNCTION boolean GetComputerNameA(ref string cname,ref long nbuf) LIBRARY "Kernel32.dll" alias for "GetComputerNameA;Ansi"
FUNCTION boolean GetUserNameA(ref string uname, ref ulong slength) LIBRARY "ADVAPI32.DLL" alias for "GetUserNameA;Ansi"
// winsock functions
Function long GetMACAddress( ref string as_mac, long len ) library "GetMACIP.dll" alias for "GetMACAddress;ansi" 
Function long GetIPAddress ( ref string as_ip, long len ) library "GetMACIP.dll" alias for "GetIPAddress;ansi"
end prototypes

type variables
Private :
CONSTANT long     SW_SHOWNOMAL = 1
string            is_hostname, is_username
string            is_ipaddr, is_macaddr
// Image
blob{64}          ibl_CustomColors
long              il_CustomInitColors[16]
os_ChooseColor    istr_ChooseColor
end variables

forward prototypes
public function boolean of_bringtotop (unsignedlong aul_winhandle)
public function long of_choosecolor (long al_rgbresult)
public function long of_findwindowbytitle (string as_wintitle)
public function string of_getappname ()
public subroutine of_getcontrast ()
public function long of_getenvironment ()
public function string of_getfolderpath (string as_folder)
public function string of_gethostnmae ()
public function string of_getipaddr ()
public function string of_getmacaddr ()
public function string of_gettemppath ()
public function string of_getusername ()
public function string of_osstatusbarheight (ref long al_left, ref long al_top, ref long al_right, ref long al_bottom)
public function long of_shellexecute (string as_file)
public function long of_shellexecute (string as_pszop, string as_pszfile)
public function boolean of_showwindow (unsignedlong aul_winhandle)
public subroutine of_showwindow (window aw_window, windowstate ae_state)
end prototypes

event ue_constructor();// initialize choosecolor information

// convert the default custom color array to a blob variable
blobedit(ibl_customcolors, 1, il_custominitcolors)

// let the structure element point to the blob array
istr_choosecolor.lpcustcolors = ibl_customcolors 

// set the size
istr_choosecolor.lStructSize = 36

// no owner 
SetNull(istr_choosecolor.hwndOwner)

// set flag
istr_choosecolor.flags = 1
end event

public function boolean of_bringtotop (unsignedlong aul_winhandle);RETURN BringWindowToTop( aul_winhandle )
end function

public function long of_choosecolor (long al_rgbresult);boolean  lb_choose

istr_ChooseColor.rgbresult = al_rgbresult

lb_choose = ChooseColorA(istr_choosecolor)

al_rgbresult = istr_ChooseColor.rgbresult

RETURN al_rgbresult
end function

public function long of_findwindowbytitle (string as_wintitle);RETURN FindWindowA( 0, as_wintitle )
end function

public function string of_getappname ();//===========================================================================
// Function: of_getAppName( )
// Access  : public
//---------------------------------------------------------------------------
// Description: 현 프로그램을 실행한 Application의 이름을 찾는다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
// 
//---------------------------------------------------------------------------
// Return: string
// application name
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
long           ll_pos
string         ls_Path, ls_AppName
unsignedlong   lul_handle

ls_Path = Space(1024)

lul_handle = Handle(GetApplication())

GetModuleFilename(lul_handle, ls_Path, 1024)

ll_pos = LastPos( ls_Path, "\" )

IF ll_pos > 0 THEN
   ls_AppName = mid( ls_Path, ll_pos + 1 )
ELSE
   ls_AppName = ls_Path
END IF

RETURN ls_AppName
end function

public subroutine of_getcontrast ();// of_getContrast()
int   li_width , li_height
int   li_x, li_y
int   li_unitX, li_unitY

// 작업표시줄 포함
li_width  = GetSystemMetrics(0)
li_height = GetSystemMetrics(1)

// 작업표시줄 제외
li_x = GetSystemMetrics(16)
li_y = GetSystemMetrics(17)

li_unitX = PixelsToUnits(1280, XPixelsToUnits!)
li_unitY = PixelsToUnits(li_height, YPixelsToUnits!)
//li_unitX = PixelsToUnits(li_x, XPixelsToUnits!)
//li_unitY = PixelsToUnits(li_y, YPixelsToUnits!)

MessageBox( "확인", "작업표시줄포함" + CString.NEWLINE &
                  + "넓이=" + string(li_width) + CString.NEWLINE &
                  + "넓이=" + string(li_height) + CString.NEWLINE + CString.NEWLINE &
                  + "작업표시줄제외" + CString.NEWLINE &
                  + "넓이=" + string(li_x) + CString.NEWLINE &
                  + "넓이=" + string(li_y) + CString.NEWLINE + CString.NEWLINE &
                  + "PB설정" + CString.NEWLINE &
                  + "넓이=" + string(li_unitX) + CString.NEWLINE &
                  + "넓이=" + string(li_unitY) )
end subroutine

public function long of_getenvironment ();/* 실 사용예*/
long     n, nLen, ll_ret
string   ls_value, ls_name[]

// 환경변수 리스트 만들기
ls_name[ UpperBound( ls_name ) + 1] = "ALLUSERSPROFILE"
ls_name[ UpperBound( ls_name ) + 1] = "APPDATA"
ls_name[ UpperBound( ls_name ) + 1] = "COMMONPROGRAMFILES"
ls_name[ UpperBound( ls_name ) + 1] = "COMPUTERNAME"
ls_name[ UpperBound( ls_name ) + 1] = "COMSPEC"
ls_name[ UpperBound( ls_name ) + 1] = "FP_NO_HOST_CHECK"
ls_name[ UpperBound( ls_name ) + 1] = "HOMEDRIVE"
ls_name[ UpperBound( ls_name ) + 1] = "HOMEPATH"
ls_name[ UpperBound( ls_name ) + 1] = "LOCALAPPDATA"
ls_name[ UpperBound( ls_name ) + 1] = "LOGONSERVER"
ls_name[ UpperBound( ls_name ) + 1] = "NUMBER_OF_PROCESSORS"
ls_name[ UpperBound( ls_name ) + 1] = "OS"
ls_name[ UpperBound( ls_name ) + 1] = "PATH"
ls_name[ UpperBound( ls_name ) + 1] = "PATHEXT"
ls_name[ UpperBound( ls_name ) + 1] = "PBNET_HOME"
ls_name[ UpperBound( ls_name ) + 1] = "PROCESSOR_ARCHITECTURE"
ls_name[ UpperBound( ls_name ) + 1] = "PROCESSOR_IDENTIFIER"
ls_name[ UpperBound( ls_name ) + 1] = "PROCESSOR_LEVEL"
ls_name[ UpperBound( ls_name ) + 1] = "PROCESSOR_REVISION"
ls_name[ UpperBound( ls_name ) + 1] = "PROGRAMDATA"
ls_name[ UpperBound( ls_name ) + 1] = "PROGRAMFILES"
ls_name[ UpperBound( ls_name ) + 1] = "PROMPT"
ls_name[ UpperBound( ls_name ) + 1] = "PSMODULEPATH"
ls_name[ UpperBound( ls_name ) + 1] = "PUBLIC"
ls_name[ UpperBound( ls_name ) + 1] = "SQLANY12"
ls_name[ UpperBound( ls_name ) + 1] = "SQLANYSAMP12"
ls_name[ UpperBound( ls_name ) + 1] = "SYSTEMDRIVE"
ls_name[ UpperBound( ls_name ) + 1] = "SYSTEMROOT"
ls_name[ UpperBound( ls_name ) + 1] = "TEMP"
ls_name[ UpperBound( ls_name ) + 1] = "TMP"
ls_name[ UpperBound( ls_name ) + 1] = "USERDOMAIN"
ls_name[ UpperBound( ls_name ) + 1] = "USERNAME"
ls_name[ UpperBound( ls_name ) + 1] = "USERPROFILE"
ls_name[ UpperBound( ls_name ) + 1] = "WINDIR"

// 환경변수값 읽어오기
nLen = 1024
FOR n = 1 to UpperBound( ls_name )
   ls_value = Space( nLen )
   ll_ret = GetEnvironmentVariableA( ls_name[n], ls_value, nLen )
//   mle_1.text += ls_name[i]+ space(22 - Len(ls_name[i])) + ": "+ Trim(ls_value) + "~r~n"
NEXT
RETURN ll_ret
end function

public function string of_getfolderpath (string as_folder);// -----------------------------------------------------------------------------
// SCRIPT:     n_function.of_GetFolderPath
//
// PURPOSE:    This function returns the path to a shell folder.
//
// ARGUMENTS:  as_folder   - Name of the shell folder
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/13/2006  RolandS     Initial Coding
// -----------------------------------------------------------------------------
CONSTANT long SHGFP_TYPE_CURRENT = 0
CONSTANT long CSIDL_DESKTOP   = 0
CONSTANT long CSIDL_PROGRAMS  = 2
CONSTANT long CSIDL_PERSONAL  = 5
CONSTANT long CSIDL_FAVORITES = 6
CONSTANT long CSIDL_STARTUP   = 7
CONSTANT long CSIDL_RECENT    = 8
CONSTANT long CSIDL_BITBUCKET = 10
CONSTANT Long CSIDL_APPDATA   = 26

long    ll_rc, ll_hWnd, ll_csidl
string  ls_path

// set the CSIDL
choose case Upper(as_folder)
   case "DESKTOP"
      ll_csidl = CSIDL_DESKTOP
   case "PROGRAMS"
      ll_csidl = CSIDL_PROGRAMS
   case "PERSONAL"
      ll_csidl = CSIDL_PERSONAL
   case "FAVORITES"
      ll_csidl = CSIDL_FAVORITES
   case "STARTUP"
      ll_csidl = CSIDL_STARTUP
   case "RECENT"
      ll_csidl = CSIDL_RECENT
   case "BITBUCKET"
      ll_csidl = CSIDL_BITBUCKET
   case "APPDATA"
      ll_csidl = CSIDL_APPDATA
   case else
      RETURN ""
end choose

ll_hWnd = Handle(this)

ls_path = Space(256)

ll_rc = SHGetFolderPath(ll_hWnd, ll_csidl, &
            0, SHGFP_TYPE_CURRENT, ls_path)

RETURN ls_path
end function

public function string of_gethostnmae ();IF isnull( is_hostname ) THEN
   RETURN ""
ELSE
   RETURN is_hostname
END IF
end function

public function string of_getipaddr ();IF isnull( is_ipaddr ) THEN
   RETURN ""
ELSE
   RETURN is_ipaddr
END IF
end function

public function string of_getmacaddr ();IF isnull( is_macaddr ) THEN
   RETURN ""
ELSE
   RETURN is_macaddr
END IF
end function

public function string of_gettemppath ();// -----------------------------------------------------------------------------
// SCRIPT:     n_function.of_GetTempPath
//
// PURPOSE:    This function returns the system temporary file directory.
//
// RETURN:     Temp directory
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/13/2006  RolandS     Initial Coding
// -----------------------------------------------------------------------------
integer li_buflen
string  ls_path

li_buflen = 260
ls_path = Space( li_buflen )

GetTempPath(li_buflen, ls_path)

RETURN ls_path
end function

public function string of_getusername ();IF isnull( is_username ) THEN
   RETURN ""
ELSE
   RETURN is_username
END IF
end function

public function string of_osstatusbarheight (ref long al_left, ref long al_top, ref long al_right, ref long al_bottom);/*------------------------------------------------------------------------------------------------*
   of_OSstatusbarHeight (
                    ref  long      al_Left
                    ref  long      al_top
                    ref  long      al_right
                    ref  long      al_bottom
                      ) returns string
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - 윈도 상태바 높이 구함
                                - of_OSstatusbarHeight( ref long : al_Left, al_top, al_right, al_bottom )
 *------------------------------------------------------------------------------------------------*/
Environment le_env
long        ll_Widht, ll_height
string      ls_ret
str_rect    lstr_rect

GetEnvironment( le_env )

ll_Widht    = PixelsToUnits( le_env.screenwidth,   XPixelsToUnits! )
ll_height   = PixelsToUnits( le_env.screenheight,  YPixelsToUnits! )

IF SystemParametersInfoA( 48, 0, lstr_rect, 0 ) <> 1 THEN
   ls_ret = "Error"
ELSE
   al_Left   = PixelsToUnits(lstr_rect.Left,   XPixelsToUnits!)
   al_top    = PixelsToUnits(lstr_rect.top,    YPixelsToUnits!)
   al_right  = PixelsToUnits(lstr_rect.right,  XPixelsToUnits!)
   al_bottom = PixelsToUnits(lstr_rect.bottom, YPixelsToUnits!)

   IF al_Left = 0 AND al_top > 0 AND al_right = ll_Widht AND al_bottom = ll_height THEN
      ls_ret = "top"    //윗쪽
   ELSEIF al_Left = 0 AND al_top = 0 AND al_right = ll_Widht AND al_bottom < ll_height THEN
      ls_ret = "bottom" //아래쪽
   ELSEIF al_Left > 0 AND al_top = 0 AND al_right = ll_Widht AND al_bottom = ll_height THEN
      ls_ret = "left"   //왼쪽
   ELSEIF al_Left = 0 AND al_top = 0 AND al_right < ll_Widht AND al_bottom = ll_height THEN
      ls_ret = "right"  //오른쪽
   END IF
END IF
RETURN ls_ret
end function

public function long of_shellexecute (string as_file);RETURN of_shellExecute( "open", as_file )
end function

public function long of_shellexecute (string as_pszop, string as_pszfile);// of_shellexecute( "open", "C:\sample.txt" )
long    ll_ret, ll_handle
string  ls_Null, ls_msg

setnull(ls_Null)
ll_handle = GetDesktopWindow()

IF of_isnull( as_pszop ) THEN
   as_pszop = "open"
END IF

IF of_isnull( as_pszfile ) THEN
   MessageBox( "확인", "파일명이 없습니다.", Exclamation! )
   RETURN 0
END IF

ll_ret = ShellExecuteA( ll_handle, as_pszOp, as_pszFile, ls_Null, ls_Null, SW_SHOWNOMAL )

IF ll_ret <= 32 THEN
   choose case ll_ret
      case 2   ; ls_msg = "파일을 찾을 수 없습니다."//"File not found"
      case 3   ; ls_msg = "경로를 찾을 수 없습니다."//"Path not found"
      case 5   ; ls_msg = "접근 불가 입니다.."//"Access denied"
      case 8   ; ls_msg = "메모리 없습니다."//"Out of memory"
      case 32  ; ls_msg = "DLL을 찾을 수 없습니다."//"DLL not found"
      case 26  ; ls_msg = "공유 위반이 발생하였습니다."//"A sharing violation occurred"
      case 27  ; ls_msg = "불완전하거나 잘못된 파일 연결 입니다."//"Incomplete or invalid file association"
      case 28  ; ls_msg = "DDE(Dynamic Data Exchange)의 타임 아웃 입니다."//"DDE Time out"
      case 29  ; ls_msg = "DDE(Dynamic Data Exchange) 트랜잭션이 실패했습니다."//"DDE transaction failed"
      case 30  ; ls_msg = "DDE(Dynamic Data Exchange) 연결오류 입니다."//"DDE busy"
      case 31  ; ls_msg = "파일 확장자에 대한 연결 없습니다."//"No association for file extension"
      case 11  ; ls_msg = "잘못된 EXE 파일 또는 EXE 이미지의 오류 입니다."//"Invalid EXE file or error in EXE image"
      case else; ls_msg = "알수 없는 에러가 발생 하였습니다."//"Unknown error"
   end choose
   MessageBox( "확인", ls_msg )
   ll_ret = -1
ELSE
   ll_ret = 1
END IF
RETURN ll_ret
end function

public function boolean of_showwindow (unsignedlong aul_winhandle);RETURN ShowWindow( aul_winhandle, 5)
end function

public subroutine of_showwindow (window aw_window, windowstate ae_state);// this function sets the windowstate
integer li_cmdshow

choose case ae_state
   case Maximized!
      li_cmdshow = 3
   case Minimized!
      li_cmdshow = 2
   case Normal!
      li_cmdshow = 1
end choose

ShowWindow(Handle(aw_window), li_cmdshow)

aw_window.SetFocus()
end subroutine

on n_svc_win32.create
call super::create
end on

on n_svc_win32.destroy
call super::destroy
end on

event constructor;call super::constructor;//long     ll_buf
//ulong    lul_buf
//string   ls_buf
//
//ll_buf = 50
//
//try
//   // Get MAC Address
//   ls_buf = space(ll_buf)
//   IF GetMACAddress( ls_buf, ll_buf ) = 1 THEN
//      is_macaddr = ls_buf
//   ELSE
//      SetNull(is_macaddr)
//   END IF
//catch(RuntimeError rta)
//   OLEObject   ole_wsh
//   any         la_usb[]
//   string      ls_message
//
//   ole_wsh = CREATE OLEObject
//   ole_wsh.ConnectToNewObject("MSScriptControl.ScriptControl")
//   ole_wsh.Language = "vbscript"
//   ole_wsh.AddCode('Function rtnMACAddresses()~r~n' &
//   + 'MACAddressList = "" ~r~n' + &
//   + 'strComputer = "."~r~n' + &
//   + 'Set objWMIService = ' + &
//   + '   GetObject("winmgmts:{impersonationLevel=impersonate}!\\" _~r~n' &
//   + '& strComputer & "\root\cimv2")~r~n' &
//   + 'Set colItems = ' &
//   + '  objWMIService.ExecQuery("Select * from Win32_NetworkAdapterConfiguration Where IPEnabled = ~'TRUE~'")~r~n' &
//   + 'For Each objItem in colItems~r~n' &
//   + 'MACAddressList = MACAddressList & " | " & objItem.Description & " = " & objItem.MACAddress  ~r~n' &
//   + 'Next~r~n' &
//   + 'rtnMACAddresses = MACAddressList~r~n' &
//   + 'End Function')
//   ls_message = ole_wsh.Eval("rtnMACAddresses")
//   is_macaddr = trim(mid(ls_message, pos(ls_message, '=') + 2, 17))
//   ole_wsh.DisconnectObject()
//   DESTROY ole_wsh
//end try
//
//try
//   // Get IP Address
//   ls_buf = space(ll_buf)
//   IF GetIPAddress( ls_buf, ll_buf ) = 1 THEN
//      is_ipaddr = ls_buf
//   ELSE
//      SetNull(is_ipaddr)
//   END IF
//catch(RuntimeError rtb)
//   is_ipaddr = "127.0.0.1"
//end try
//
//// Get Computer Name
//ll_buf = 255
//ls_buf = space(ll_buf)
//IF GetComputerNameA(ls_buf, ll_buf) = TRUE THEN
//   is_hostname = ls_buf
//ELSE
//   SetNull(is_hostname)
//END IF
//
//lul_buf = 255
//ls_buf  = space(lul_buf)
//IF GetUserNameA(ls_buf, lul_buf) = TRUE THEN
//   is_username = ls_buf
//ELSE
//   SetNull(is_username)
//END IF
//
//EVENT ue_constructor()
end event

