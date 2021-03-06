$PBExportHeader$n_svc_file.sru
$PBExportComments$File Function Sets
forward
global type n_svc_file from n_svc_base
end type
type openfilename from structure within n_svc_file
end type
end forward

type openfilename from structure
	ulong		lStructSize
	ulong		hwndOwner
	ulong		hInstance
	ulong		lpstrFilter
	ulong		lpstrCustomFilter
	ulong		nMaxCustFilter
	ulong		nFilterIndex
	ulong		lpstrFile
	ulong		nMaxFile
	ulong		lpstrFileTitle
	ulong		nMaxFileTitle
	ulong		lpstrInitialDir
	ulong		lpstrTitle
	ulong		Flags
	integer		nFileOffset
	integer		nFileExtension
	ulong		lpstrDefExt
	ulong		lCustData
	ulong		lpfnHook
	ulong		lpTemplateName
end type

global type n_svc_file from n_svc_base autoinstantiate
end type

type prototypes
FUNCTION boolean GetOpenFileName ( &
   Ref OPENFILENAME lpOFN &
   ) Library "comdlg32.dll" Alias For "GetOpenFileNameW"

FUNCTION boolean GetSaveFileName ( &
   Ref OPENFILENAME lpOFN &
   ) Library "comdlg32.dll" Alias For "GetSaveFileNameW"

FUNCTION ulong CommDlgExtendedError ( &
   ) Library "comdlg32.dll"

FUNCTION long RtlMoveMemory ( &
   Ref char dest[], &
   long source, &
   long size &
   ) Library "kernel32.dll"

FUNCTION long RtlMoveMemory ( &
   long dest, &
   Ref string source, &
   long Size ) Library "kernel32.dll"

FUNCTION long RtlMoveMemory ( &
   long dest, &
   Ref char source[], &
   long Size ) Library "kernel32.dll"

FUNCTION long LocalAlloc ( &
   long uFlags, &
   long uBytes &
   ) Library "kernel32.dll"

FUNCTION long LocalFree ( &
   long hMem &
   ) Library "kernel32.dll"
end prototypes

type variables
Private:
string        is_key
OPENFILENAME  iOFN

CONSTANT ulong LMEM_ZEROINIT              = 64
CONSTANT ulong MAX_LENGTH                 = 32767

CONSTANT ulong OFN_READONLY               = 1
CONSTANT ulong OFN_OVERWRITEPROMPT        = 2
CONSTANT ulong OFN_HIDEREADONLY           = 4
CONSTANT ulong OFN_NOCHANGEDIR            = 8
CONSTANT ulong OFN_SHOWHELP               = 16
CONSTANT ulong OFN_ENABLEHOOK             = 32
CONSTANT ulong OFN_ENABLETEMPLATE         = 64
CONSTANT ulong OFN_ENABLETEMPLATEHANDLE   = 128
CONSTANT ulong OFN_NOVALIDATE             = 256
CONSTANT ulong OFN_ALLOWMULTISELECT       = 512
CONSTANT ulong OFN_EXTENSIONDIFFERENT     = 1024
CONSTANT ulong OFN_PATHMUSTEXIST          = 2048
CONSTANT ulong OFN_FILEMUSTEXIST          = 4096
CONSTANT ulong OFN_CREATEPROMPT           = 8192
CONSTANT ulong OFN_SHAREAWARE             = 16384
CONSTANT ulong OFN_NOREADONLYRETURN       = 32768
CONSTANT ulong OFN_NOTESTFILECREATE       = 65536
CONSTANT ulong OFN_NONETWORKBUTTON        = 131072
CONSTANT ulong OFN_NOLONGNAMES            = 262144
CONSTANT ulong OFN_EXPLORER               = 524288
CONSTANT ulong OFN_NODEREFERENCELINKS     = 1048576
CONSTANT ulong OFN_LONGNAMES              = 2097152

CONSTANT long   MAX_LEN                   = 255
CONSTANT long   CHUNK_32K                 = 32765
CONSTANT string ALL_FILES                 = "*.*"
CONSTANT string PATH_SEPARATOR            = CString.BACKSLASH
CONSTANT string TMP_EXTENSION             = "TMP"
end variables

forward prototypes
public function long of_chartostring (character ac_char[], ref string as_string[])
public function string of_combinepath (string as_path1, string as_path2)
public function string of_decode (string as_text)
public subroutine of_deltree (readonly string as_path)
public function string of_encode (string as_text)
public function integer of_filecopy (string as_sourcefile, string as_targetfile)
public function integer of_filecopy (string as_sourcefile, string as_targetfile, boolean ab_overwrite)
public function integer of_filecopy (string as_sourcefile, string as_targetfile, boolean ab_overwrite, ref string as_error)
public function integer of_filecopy (string as_sourcefile, string as_targetfile, boolean ab_overwrite, ref string as_error, hprogressbar ahpb_bar)
public function integer of_filecopy (string as_sourcefile, string as_targetfile, hprogressbar ahpb_bar)
public function blob of_fileread (string as_file)
public function integer of_filewrite (any aa_msg)
public function integer of_filewrite (string as_file, any aa_msg)
public function integer of_filewrite (string as_file, blob ab_file)
public function integer of_filewrite (string as_file, blob ab_file, readonly boolean ab_append)
public function string of_fixpath (readonly string as_path)
public function string of_getapppath ()
public function string of_getfilename (string as_fullpath)
public function integer of_getopenfilename (long al_hwnd, string as_title, ref string as_pathname, ref string as_filename, string as_filter, string as_initialdir)
public function integer of_getopenfilename (long al_hwnd, string as_title, ref string as_pathname[], ref string as_filename[], string as_filter, string as_initialdir)
public function integer of_getopenfilename (long al_hwnd, unsignedlong aul_flags, string as_title, ref string as_pathname[], ref string as_filename[], string as_filter, string as_initialdir)
public function string of_getpath (readonly string as_fullpath)
public function integer of_getprofile (string as_section, string as_name, ref string as_value)
public function string of_getreg (string as_subkey, string as_valuename, string as_default)
public function string of_getreg (string as_valuename, string as_default)
public function integer of_getsavefilename (long al_hwnd, string as_title, ref string as_pathname, ref string as_filename, string as_filter, string as_initialdir)
public function integer of_getsavefilename (long al_hwnd, unsignedlong aul_flags, string as_title, ref string as_pathname[], ref string as_filename[], string as_filter, string as_initialdir)
public function string of_getseparator ()
public function string of_gettemppath ()
public subroutine of_parse (string as_sep, string as_list, ref string as_array[])
public function integer of_setprofile (string as_section, string as_name, string as_value)
public subroutine of_setreg (string as_subkey, string as_valuename, string as_value)
public subroutine of_setreg (string as_valuename, string as_value)
public function long of_stringtochar (string as_string, ref character ac_char[])
public function string of_compactpath (readonly dragobject ado, readonly string as_string)
public function string of_createtempfile (string as_extension)
public function string of_createtempfile ()
end prototypes

public function long of_chartostring (character ac_char[], ref string as_string[]);// -----------------------------------------------------------------------------
// SCRIPT:     of_CharToString
//
// PURPOSE:    This function converts a character array into an array of
//             strings.  Each string is separated by a null entry.
//
// ARGUMENTS:  ac_char[]   -  Character array
//             as_string[] -  Output String array
//
// RETURN:     Long        -  The number of entries in the string array
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
long     ll_char, ll_max, ll_array = 1
string   ls_empty[]

as_string = ls_empty

ll_max = UpperBound(ac_char)
FOR ll_char = 1 to ll_max
   IF ac_char[ll_char] = Char(0) THEN
      IF ac_char[ll_char + 1] = Char(0) THEN
         EXIT
      ELSE
         ll_array = ll_array + 1
      END IF
   ELSE
      as_string[ll_array] += string(ac_char[ll_char])
   END IF
NEXT
RETURN UpperBound(as_string)
end function

public function string of_combinepath (string as_path1, string as_path2);//===========================================================================
// Function: of_Combinepath (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  value String as_path1
//  value String as_path2
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
as_path1 = of_FixPath(as_path1)

IF left(as_path2, 1) = PATH_SEPARATOR THEN
   as_path2 = mid( as_path2, 2 )
END IF

RETURN as_path1 + as_path2
end function

public function string of_decode (string as_text);integer  i_code, i2, li_len
string   outstring = "", ls_hexa = ""

IF is_key = "BAD" THEN
   outstring = as_text
ELSE
   li_len = (len(as_text) / 4)
   FOR i2 = 1 to li_len
      ls_hexa = mid(as_text, (4 * (i2 - 1) + 1), 4)
      ls_hexa = Char( integer(left(ls_hexa, 2)) * 16 + integer(right(ls_hexa, 2)) )
      i_code = Asc(ls_hexa) + &
               Asc(mid(is_key, (i2 + 1), 1)) - &
               Asc(mid(is_key, i2, 1))

      outstring = outstring + Char( i_code )
   NEXT
END IF
RETURN outstring
end function

public subroutine of_deltree (readonly string as_path);//===========================================================================
// Function: of_Deltree (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note: Deletes a directory including all the files and sub-directories
//---------------------------------------------------------------------------
// Parameters:
//  reference n_svc_mgr anv_svc
//  readonly String as_path
//---------------------------------------------------------------------------
// Returns: (none)
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     n, ll_count
string   ls_dirs[], ls_files[], ls_fullpath, ls_dirpath
MessageBox( ClassName(this), 'of_deltree' )
//ll_count = of_getdirectories(anv_svc, as_path, ls_dirs)
FOR n = 1 to ll_count
   // recurse
   of_DelTree( of_CombinePath(as_path, ls_dirs[n]) )
NEXT

//ll_count = of_dirlist(as_path, ls_files)
FOR n = 1 to ll_count
   ls_fullpath = of_CombinePath( as_path, ls_files[n] )
   IF FileExists(ls_fullpath) THEN FileDelete(ls_fullpath)
NEXT

RemoveDirectory(as_path)
end subroutine

public function string of_encode (string as_text);integer  i_code, i2
string   outstring = "", ls_hexa = ""

IF is_key = "BAD" THEN
   outstring = as_text
ELSE
   FOR i2 = 1 to len(as_text)
//    outstring = outstring + char( asc(mid(as_text,i2,1)) + &
//                                  asc(mid(is_key,i2,1)) - &
//                                  asc(mid(is_key,i2 + 1,1)) )

      i_code = Asc(mid(as_text, i2, 1)) + &
               Asc(mid(is_key, i2, 1)) - &
               Asc(mid(is_key, i2 + 1, 1))

      outstring = outstring + Char( i_code )
      ls_hexa = ls_hexa + string(Truncate(i_code/16, 0), "00") + string(mod(i_code, 16), "00")
   NEXT
END IF
RETURN ls_hexa
end function

public function integer of_filecopy (string as_sourcefile, string as_targetfile);/*
   파워빌더 기본 Filecopy 명령을 사용하지 않고
   string   as_SourceFile    // 원본파일
   string   as_TargetFile    // 대상파일
*/
// integer of_FileCopy ( string as_SourceFile, string as_TargetFile )
boolean        ab_overWrite = TRUE
string         as_error
hprogressbar   lhpb_bar

RETURN of_filecopy( as_sourcefile, as_targetfile, ab_overwrite, as_error, lhpb_bar )
end function

public function integer of_filecopy (string as_sourcefile, string as_targetfile, boolean ab_overwrite);/*
   파워빌더 기본 Filecopy 명령을 사용하지 않고
   string   as_SourceFile    // 원본파일
   string   as_TargetFile    // 대상파일
   boolean  ab_overWrite     // 덥어쓰기
*/
// integer of_FileCopy ( string as_SourceFile, string as_TargetFile, boolean ab_overWrite )
string         as_error
hprogressbar   lhpb_bar

RETURN of_filecopy( as_sourcefile, as_targetfile, ab_overwrite, as_error, lhpb_bar )
end function

public function integer of_filecopy (string as_sourcefile, string as_targetfile, boolean ab_overwrite, ref string as_error);/*
   파워빌더    기본 Filecopy 명령을 사용하지 않고
    string      as_SourceFile    // 원본파일
    string      as_TargetFile    // 대상파일
    boolean     ab_overWrite     // 덥어쓰기
Ref string      as_Error         // Error
*/
// integer of_FileCopy ( string as_SourceFile, string as_TargetFile, boolean ab_overWrite, Ref string as_Error )
hprogressbar   lhpb_bar

RETURN of_filecopy( as_sourcefile, as_targetfile, ab_overwrite, as_error, lhpb_bar )
end function

public function integer of_filecopy (string as_sourcefile, string as_targetfile, boolean ab_overwrite, ref string as_error, hprogressbar ahpb_bar);/*
   파워빌더 기본 Filecopy 명령을 사용하지 않고
      string      as_SourceFile     // 원본파일
      string      as_TargetFile     // 대상파일
      boolean     ab_overWrite      // 덥어쓰기
 Ref  string      as_Error          // Error
      hscrollbar  ahscrollbar       // 진행봐
*/
// integer of_FileCopy ( string as_SourceFile, string as_TargetFile, boolean ab_overWrite, Ref string as_Error, hprogressbar ahpb_bar )
integer  irtn = 1, iPos, iFile1, iFile2
string   ls_RunPath, ls_Path, ls_dir

ls_RunPath = GetCurrentDirectory()

IF right(ls_RunPath, len('\')) <> "\" THEN ls_RunPath += "\"
IF irtn >=0 THEN
   IF of_IsEmpty(as_SourceFile) THEN
      irtn = -1
      as_Error = '원본파일을 지정 하세요'
   END IF
END IF
IF irtn >=0 THEN
   IF NOT FileExists(as_SourceFile) THEN
      irtn = -1
      as_Error = '원본파일이 존재하지 않습니다.'
   END IF
END IF
IF irtn >=0 THEN
   IF of_IsEmpty(as_TargetFile) THEN
      irtn = -1
      as_Error = '대상파일을 지정 하세요'
   END IF
END IF
IF irtn >=0 THEN
   ls_Path = left( as_TargetFile, LastPos(as_TargetFile,'\') )
   IF NOT DirectoryExists( ls_Path ) THEN
      iPos = 1
      iPos = Pos(ls_path, '\', iPos)
      DO WHILE iPos > 0
         ls_dir = left(ls_path, iPos - 1)
         irtn = ChangeDirectory(ls_dir)
         IF irtn < 0 THEN
            irtn = CreateDirectory( ls_dir )
            IF irtn < 0 THEN
               as_Error = 'Directory Error'
               EXIT
            END IF
         END IF
         iPos = Pos(ls_path, '\', iPos + len('\') )
      LOOP
      ChangeDirectory(ls_RunPath)
   END IF
   IF irtn < 0 THEN
      as_Error = '대상파일을 저장할 폴더가 없습니다.'
   END IF
END IF
IF irtn >=0 THEN
   IF ab_overWrite THEN
      IF FileExists(as_TargetFile) THEN
         FileDelete(as_TargetFile)
      END IF
   END IF
END IF
IF irtn >=0 THEN
   blob  ib_file
   long  l, l_loop, l_fLen
   l_fLen = FileLength(as_SourceFile)
   IF l_fLen > 32765 THEN
      IF Mod(l_fLen, 32765) = 0 THEN
         l_loop = l_fLen / 32765
      ELSE
         l_loop = l_fLen / 32765 + 1
      END IF
   ELSE
      l_loop = 1
   END IF

   iFile1 = FileOpen( as_SourceFile, StreamMode!, Read!, Shared! )
   iFile2 = FileOpen( as_TargetFile, StreamMode!, Write!, LockWrite!, Append! )

   IF IsValid(ahpb_bar) THEN
      ahpb_bar.Position = 0
   END IF
   FOR l = 1 to l_loop
      IF IsValid(ahpb_bar) THEN
         ahpb_bar.Position = integer( l / l_loop * 100 )
      END IF
      FileRead( iFile1, ib_file )
      FileWrite( iFile2, ib_file )
   NEXT

   FileClose(iFile1)
   FileClose(iFile2)
END IF
RETURN irtn
end function

public function integer of_filecopy (string as_sourcefile, string as_targetfile, hprogressbar ahpb_bar);/*
   파워빌더 기본 Filecopy 명령을 사용하지 않고
   string      as_SourceFile     // 원본파일
   string      as_TargetFile     // 대상파일
   hscrollbar  ahscrollbar       // 진행봐
*/
// integer of_FileCopy ( string as_SourceFile, string as_TargetFile, hprogressbar ahpb_bar )
boolean  ab_overWrite = TRUE
string   as_error

RETURN of_filecopy( as_sourcefile, as_targetfile, ab_overwrite, as_error, ahpb_bar )
end function

public function blob of_fileread (string as_file);// blob of_FileRead(string as_file)
// blob_file of_FileRead("C:\CopyData.bmp")
// 파일 읽기
blob     lb_file, b
integer  li_ret
long     n, l_loop, l_fLen

l_fLen = FileLength(as_File)

IF l_fLen > 32765 THEN
   IF mod( l_fLen, 32765 ) = 0 THEN
      l_loop = l_fLen / 32765
   ELSE
      l_loop = l_fLen / 32765 + 1
   END IF
ELSE
   l_loop = 1
END IF

li_ret   = FileOpen( as_File, StreamMode!, Read! )
FOR n = 1 to l_loop
   Yield()
   SetPointer(HourGlass!)
   FileRead(li_ret, b)
   lb_file = lb_file + b
NEXT

FileClose(li_ret)

RETURN lb_file
end function

public function integer of_filewrite (any aa_msg);RETURN of_FileWrite( gs_LogFile, aa_msg )
end function

public function integer of_filewrite (string as_file, any aa_msg);/*------------------------------------------------------------------------------------------------*
   integer of_FileWrite ( string as_file, any aa_msg )
  -------------------------------------------------------------------------------------------------
   Description                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   ls_file = ls_path + 'DWSimple_' + ls_file + '.dwt'
   ls_data = "파일 쓰기 예제"
   lb_file = Blob(ls_data {, EncodingANSI!} )
   of_FileWrite( ls_file, lb_File )
 *------------------------------------------------------------------------------------------------*/
blob     lblb
string   ls_msg

IF of_IsEmpty( aa_msg ) THEN RETURN -1

choose case ClassName( aa_msg )
   case "string"
      ls_msg = CString.NEWLINE + aa_msg
   case else
      ls_msg = string( aa_msg ) + CString.NEWLINE
end choose

lblb = Blob( ls_msg, EncodingANSI! )

RETURN of_FileWrite( as_file, lblb, TRUE )
end function

public function integer of_filewrite (string as_file, blob ab_file);RETURN of_FileWrite( as_file, ab_file, TRUE )
end function

public function integer of_filewrite (string as_file, blob ab_file, readonly boolean ab_append);/*------------------------------------------------------------------------------------------------*
   integer of_FileWrite ( string as_file, blob ab_file, boolean ab_append )
  -------------------------------------------------------------------------------------------------
   Description                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   ls_file = ls_path + 'DWSimple_' + ls_file + '.dwt'
   ls_data = adw.Describe("DataWindow.Data")
   lb_file = Blob(ls_data {, EncodingANSI!} )
   of_FileWrite( ls_file, lb_File, FALSE )
 *------------------------------------------------------------------------------------------------*/
blob        lblb
integer     li_ret
long        ll_tLen, ll_rLen
string      ls_file
WriteMode   lwm_Mode

ls_file = as_file
IF Pos( ls_file, CString.BACKSLASH ) <= 0 THEN
   ls_file = GetCurrentDirectory() + CString.BACKSLASH + as_file
END IF

IF ab_Append THEN
   lwm_Mode = Append!
ELSE
   lwm_Mode = Replace!
END IF

li_ret = FileOpen( ls_file, StreamMode!, Write!, LockWrite!, lwm_Mode )

IF li_ret < 0 THEN RETURN -1

ll_tLen = 1

SetNull(lblb)
lblb = BlobMid( ab_file, ll_tLen, 32765 )
ll_rLen += Len ( lblb )
DO WHILE Len( lblb ) > 0
   FileWrite( li_ret, lblb )
   ll_tLen = ll_tLen + 32765

   SetNull( lblb )
   lblb = BlobMid( ab_file, ll_tLen, 32765 )
   ll_rLen += Len ( lblb )
LOOP
RETURN FileClose( li_ret )
end function

public function string of_fixpath (readonly string as_path);//===========================================================================
// Function: of_Fixpath (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly String as_path
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
IF right( as_path, 1 ) = PATH_SEPARATOR THEN RETURN as_path

RETURN as_path + PATH_SEPARATOR
end function

public function string of_getapppath ();//===========================================================================
// Function: of_Getapppath (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note: This call will only work for the currently running application.
//       If you run it from within PB, it will give you PB's application path.  
//       When you compile and run you application it will return that application's path
//---------------------------------------------------------------------------
// Parameters:
//  reference n_svc_mgr anv_svc
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string      lsf
ulong       lul_Handle
n_svc_win32 lnw

lul_Handle = handle(GetApplication()) // get application handle
lsf = Space(MAX_LEN) // pre-allocate buffer

lnw.GetModuleFilename( lul_Handle, lsf, MAX_LEN )

RETURN trim(lsf)
end function

public function string of_getfilename (string as_fullpath);//===========================================================================
// Function: of_Getfilename (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  value String as_fullpath
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
IF pos( as_fullpath, PATH_SEPARATOR ) <= 0 THEN RETURN as_fullpath

as_fullpath = Reverse(as_fullpath)

RETURN Reverse( mid(as_fullpath, 1, pos(as_fullpath, PATH_SEPARATOR) - len(PATH_SEPARATOR)) )
end function

public function integer of_getopenfilename (long al_hwnd, string as_title, ref string as_pathname, ref string as_filename, string as_filter, string as_initialdir);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetOpenFileName
//
// PURPOSE:    This function opens the GetOpenFileName dialog box which
//             allows for multiple file selection.
//
// ARGUMENTS:  al_hWnd        -  Handle to parent window
//             as_title       -  Title for the dialog box
//             as_pathname    -  Returned full path filename
//             as_filename    -  Returned filename
//             as_filter      -  Filter string (see PB Help for format)
//             as_initialdir  -  Initial directory
//
// RETURN:     Integer        -   1 = File(s) were selected
//                                0 = User clicked cancel button
//                               -1 = Some sort of error
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
integer  li_ret
string   ls_pathname[], ls_filename[]
ulong    lul_flags

as_pathname = ""
as_filename = ""

lul_flags = OFN_HIDEREADONLY + OFN_EXPLORER + OFN_FILEMUSTEXIST

li_ret = of_GetOpenFileName( al_hWnd, lul_flags, as_title, ls_pathname, &
                             ls_filename, as_filter, as_initialdir)

IF UpperBound(ls_pathname) > 0 THEN
   as_pathname = ls_pathname[1]
   as_filename = ls_filename[1]
END IF
RETURN li_ret
end function

public function integer of_getopenfilename (long al_hwnd, string as_title, ref string as_pathname[], ref string as_filename[], string as_filter, string as_initialdir);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetOpenFileName
//
// PURPOSE:    This function opens the GetOpenFileName dialog box which
//             allows for multiple file selection.
//
// ARGUMENTS:  al_hWnd        -  Handle to parent window
//             as_title       -  Title for the dialog box
//             as_pathname[]  -  Array of returned full path filenames
//             as_filename[]  -  Array of returned filenames
//             as_filter      -  Filter string (see PB Help for format)
//             as_initialdir  -  Initial directory
//
// RETURN:     Integer        -   1 = File(s) were selected
//                                0 = User clicked cancel button
//                               -1 = Some sort of error
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
integer  li_ret
ulong    lul_flags

lul_flags = OFN_HIDEREADONLY + OFN_ALLOWMULTISELECT + OFN_EXPLORER + OFN_FILEMUSTEXIST

li_ret = of_GetOpenFileName( al_hWnd, lul_flags, as_title, as_pathname, &
                             as_filename, as_filter, as_initialdir )

RETURN li_ret
end function

public function integer of_getopenfilename (long al_hwnd, unsignedlong aul_flags, string as_title, ref string as_pathname[], ref string as_filename[], string as_filter, string as_initialdir);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetOpenFileName
//
// PURPOSE:    This function opens the GetOpenFileName dialog box which
//             allows for multiple file selection.
//
// ARGUMENTS:  al_hWnd        -  Handle to parent window
//             aul_flags      -  Flag to set various options
//             as_title       -  Title for the dialog box
//             as_pathname[]  -  Array of returned full path filenames
//             as_filename[]  -  Array of returned filenames
//             as_filter      -  Filter string (see PB Help for format)
//             as_initialdir  -  Initial directory
//
// RETURN:     Integer        -   1 = File(s) were selected
//                                0 = User clicked cancel button
//                               -1 = Some sort of error
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
char     lc_pathname[], lc_filter[]
integer  li_ret, li_cnt, li_max, li_next
long     ll_errcode, ll_length
string   ls_filter[], ls_work[]

// initialize structure
iOFN.lStructSize = (18 * 4) + (2 * 2)
iOFN.nFilterIndex = 1
iOFN.nMaxFile = MAX_LENGTH
iOFN.hWndOwner = al_hWnd
iOFN.Flags = aul_flags

// initialize output arrays
as_pathname = ls_work
as_filename = ls_work

// allocate memory and copy title
ll_length = Len( as_title ) * 2
iOFN.lpstrTitle = LocalAlloc( LMEM_ZEROINIT, ll_length + 2 )
RtlMoveMemory( iOFN.lpstrTitle, as_title, ll_length )

// allocate memory and copy filter
this.of_Parse( ",", as_filter, ls_filter )
li_max = UpperBound( ls_filter )
FOR li_cnt = 1 to li_max
   ll_length = this.of_StringToChar( trim(ls_filter[li_cnt]), lc_filter )
NEXT
ll_length = UpperBound( lc_filter ) * 2
iOFN.lpstrFilter = LocalAlloc( LMEM_ZEROINIT, ll_length )
RtlMoveMemory( iOFN.lpstrFilter, lc_filter, ll_length )

// allocate memory and copy initialdir (if given)
IF as_initialdir <> "" THEN
   ll_length = Len( as_initialdir ) * 2
   iOFN.lpstrInitialDir = LocalAlloc( LMEM_ZEROINIT, ll_length )
   RtlMoveMemory( iOFN.lpstrInitialDir, as_initialdir, ll_length )
END IF

// allocate memory for returned data
lc_pathname = Space( MAX_LENGTH )
iOFN.nMaxFile = MAX_LENGTH
iOFN.lpstrFile = LocalAlloc( LMEM_ZEROINIT, MAX_LENGTH )

// display dialog box
IF GetOpenFileName( iOFN ) THEN
   // copy returned pathnames to char array
   RtlMoveMemory( lc_pathname, iOFN.lpstrFile, MAX_LENGTH )
   this.of_CharToString( lc_pathname, ls_work )
   // copy pathnames/filenames to output arguments
   li_max = UpperBound( ls_work )
   IF li_max = 1 THEN
      li_next = LastPos( ls_work[1], CString.BACKSLASH )
      as_pathname[1] = ls_work[1]
      as_filename[1] = right( ls_work[1], (Len(ls_work[1]) - li_next) )
   ELSE
      FOR li_cnt = 2 to li_max
         li_next = UpperBound( as_pathname ) + 1
         as_pathname[li_next] = ls_work[1] + CString.BACKSLASH + ls_work[li_cnt]
         as_filename[li_next] = ls_work[li_cnt]
      NEXT
   END IF
   li_ret = 1
ELSE
   ll_errcode = CommDlgExtendedError()
   IF ll_errcode = 0 THEN
      li_ret = 0
   ELSE
      MessageBox( "Common Dialog Error", "Error code: " + STRING(ll_errcode) )
      li_ret = -1
   END IF
END IF

// free allocated memory
LocalFree( iOFN.lpstrTitle )
LocalFree( iOFN.lpstrFilter )
LocalFree( iOFN.lpstrFile )
IF iOFN.lpstrInitialDir > 0 THEN
   LocalFree( iOFN.lpstrInitialDir )
END IF
RETURN li_ret
end function

public function string of_getpath (readonly string as_fullpath);//===========================================================================
// Function: of_Getpath (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly String as_fullpath
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string   lsr

lsr = Reverse(as_fullpath)

lsr = Reverse( mid(lsr, pos(lsr, PATH_SEPARATOR) + len(PATH_SEPARATOR)) )

RETURN of_FixPath(lsr)
end function

public function integer of_getprofile (string as_section, string as_name, ref string as_value);/*------------------------------------------------------------------------------------------------*
   integer of_getProFile ( string as_Section , string as_Name, string as_Value )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - INI 파일에서 특정 값을 읽어 온다.
                                - of_getProFile( "D:\pb.ini", "SYSTEM", "NAME" )
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
string   ls_INIFile, ls_Value

setnull( ls_Value )

as_value = ls_Value
// Use INI file
ls_INIFile = gs_INIFile

// Use INI file
IF of_IsEmpty( ls_INIFile ) THEN
   MessageBox( "Error!", "환경파일명이 NULL입니다.", StopSign! )
   RETURN -1
END IF

// FILE EXISTS CHECK
IF NOT FileExists( ls_INIFile ) THEN
   MessageBox( "Error!", "환경파일이 존재하지 않습니다.", StopSign! )
   RETURN -1
END IF

IF of_IsEmpty( as_Section ) OR of_IsEmpty( as_Name ) THEN
   MessageBox( "확인", "of_setProFile Argument를 확인하세요!" )
   RETURN 0
END IF


ls_Value = ProfileString( ls_INIFile, as_Section, as_Name, "*" )
IF ls_Value = "*" THEN
   li_ret = -1
ELSE
   as_Value = ls_Value
END IF

RETURN li_ret
end function

public function string of_getreg (string as_subkey, string as_valuename, string as_default);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetReg
//
// PURPOSE:    This function returns a string value from the registry.
//
// ARGUMENTS:  as_subkey      - Optional subkey under the base key
//             as_valuename   - Name of the value
//             as_default     - Default to return if not found
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/13/2006  RolandS     Initial Coding
// -----------------------------------------------------------------------------
string   ls_regkey, ls_value

ls_regkey = gs_RegKey

IF len(as_subkey) > 0 THEN
   IF right( ls_RegKey, 1 ) = "\" THEN
      ls_regkey += as_subkey
   ELSE
      ls_regkey += "\" + as_subkey
   END IF
END IF

RegistryGet( ls_regkey, as_valuename, RegString!, ls_value )

IF of_IsEmpty(ls_value) THEN
   RETURN as_default
ELSE
   RETURN ls_value
END IF
end function

public function string of_getreg (string as_valuename, string as_default);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetReg
//
// PURPOSE:    This function returns a string value from the registry.
//
// ARGUMENTS:  as_valuename   - Name of the value
//             as_default     - Default to return if not found
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/13/2006  RolandS     Initial Coding
// -----------------------------------------------------------------------------
RETURN of_getReg( "", as_valuename, as_default )
end function

public function integer of_getsavefilename (long al_hwnd, string as_title, ref string as_pathname, ref string as_filename, string as_filter, string as_initialdir);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetOpenFileName
//
// PURPOSE:    This function opens the GetOpenFileName dialog box which
//             allows for multiple file selection.
//
// ARGUMENTS:  al_hWnd        -  Handle to parent window
//             as_title       -  Title for the dialog box
//             as_pathname    -  Returned full path filename
//             as_filename    -  Returned filename
//             as_filter      -  Filter string (see PB Help for format)
//             as_initialdir  -  Initial directory
//
// RETURN:     Integer        -   1 = File(s) were selected
//                                0 = User clicked cancel button
//                               -1 = Some sort of error
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
integer  li_ret
string   ls_pathname[], ls_filename[]
ulong    lul_flags

as_pathname = ""
as_filename = ""

lul_flags = OFN_HIDEREADONLY + OFN_EXPLORER + OFN_FILEMUSTEXIST

li_ret = of_GetSaveFileName( al_hWnd, lul_flags, as_title, ls_pathname, &
                             ls_filename, as_filter, as_initialdir )

IF UpperBound( ls_pathname ) > 0 THEN
   as_pathname = ls_pathname[1]
   as_filename = ls_filename[1]
END IF
RETURN li_ret
end function

public function integer of_getsavefilename (long al_hwnd, unsignedlong aul_flags, string as_title, ref string as_pathname[], ref string as_filename[], string as_filter, string as_initialdir);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetOpenFileName
//
// PURPOSE:    This function opens the GetOpenFileName dialog box which
//             allows for multiple file selection.
//
// ARGUMENTS:  al_hWnd        -  Handle to parent window
//             aul_flags      -  Flag to set various options
//             as_title       -  Title for the dialog box
//             as_pathname[]  -  Array of returned full path filenames
//             as_filename[]  -  Array of returned filenames
//             as_filter      -  Filter string (see PB Help for format)
//             as_initialdir  -  Initial directory
//
// RETURN:     Integer        -   1 = File(s) were selected
//                                0 = User clicked cancel button
//                               -1 = Some sort of error
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
char     lc_pathname[], lc_filter[]
integer  li_ret, li_cnt, li_max, li_next
long     ll_errcode, ll_length
string   ls_filter[], ls_work[]

// initialize structure
iOFN.lStructSize = (18 * 4) + (2 * 2)
iOFN.nFilterIndex = 1
iOFN.nMaxFile = MAX_LENGTH
iOFN.hWndOwner = al_hWnd
iOFN.Flags = aul_flags

// initialize output arrays
as_pathname = ls_work
as_filename = ls_work

// allocate memory and copy title
ll_length = Len(as_title) * 2
iOFN.lpstrTitle = LocalAlloc( LMEM_ZEROINIT, ll_length + 2 )
RtlMoveMemory( iOFN.lpstrTitle, as_title, ll_length )

// allocate memory and copy filter
this.of_Parse( ",", as_filter, ls_filter )
li_max = UpperBound(ls_filter)
FOR li_cnt = 1 to li_max
   ll_length = this.of_StringToChar( trim(ls_filter[li_cnt]), lc_filter )
NEXT
ll_length = UpperBound(lc_filter) * 2
iOFN.lpstrFilter = LocalAlloc( LMEM_ZEROINIT, ll_length )
RtlMoveMemory( iOFN.lpstrFilter, lc_filter, ll_length )

// allocate memory and copy initialdir (if given)
IF as_initialdir <> "" THEN
   ll_length = Len(as_initialdir) * 2
   iOFN.lpstrInitialDir = LocalAlloc( LMEM_ZEROINIT, ll_length )
   RtlMoveMemory( iOFN.lpstrInitialDir, as_initialdir, ll_length )
END IF

// allocate memory for returned data
lc_pathname = Space(MAX_LENGTH)
iOFN.nMaxFile = MAX_LENGTH
iOFN.lpstrFile = LocalAlloc( LMEM_ZEROINIT, MAX_LENGTH )

// display dialog box
IF GetSaveFileName(iOFN) THEN
   // copy returned pathnames to char array
   RtlMoveMemory( lc_pathname, iOFN.lpstrFile, MAX_LENGTH )
   this.of_CharToString( lc_pathname, ls_work )
   // copy pathnames/filenames to output arguments
   li_max = UpperBound(ls_work)
   IF li_max = 1 THEN
      li_next = LastPos( ls_work[1], CString.BACKSLASH )
      as_pathname[1] = ls_work[1]
      as_filename[1] = right( ls_work[1], (Len(ls_work[1]) - li_next) )
   ELSE
      FOR li_cnt = 2 to li_max
         li_next = UpperBound( as_pathname ) + 1
         as_pathname[li_next] = ls_work[1] + CString.BACKSLASH + ls_work[li_cnt]
         as_filename[li_next] = ls_work[li_cnt]
      NEXT
   END IF
   li_ret = 1
ELSE
   ll_errcode = CommDlgExtendedError()
   IF ll_errcode = 0 THEN
      li_ret = 0
   ELSE
      MessageBox( "Common Dialog Error", "Error code: " + STRING(ll_errcode) )
      li_ret = -1
   END IF
END IF

// free allocated memory
LocalFree( iOFN.lpstrTitle )
LocalFree( iOFN.lpstrFilter )
LocalFree( iOFN.lpstrFile )
IF iOFN.lpstrInitialDir > 0 THEN
   LocalFree( iOFN.lpstrInitialDir )
END IF

RETURN li_ret
end function

public function string of_getseparator ();//===========================================================================
// Function: of_Getseparator (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
RETURN PATH_SEPARATOR
end function

public function string of_gettemppath ();//===========================================================================
// Function: of_Gettemppath (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  reference n_svc_mgr anv_svc
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string      ls_ret, ls_tmp
n_svc_win32 lnv_win32

ls_tmp = space(MAX_LEN)

IF lnv_win32.GetTempPath(MAX_LEN, ls_tmp) = 0 THEN
   RETURN CString.EMPTY
END IF

ls_tmp = trim(ls_tmp)
ls_ret = space(MAX_LEN)
lnv_win32.GetLongPathName(ls_tmp, ls_ret, MAX_LEN)

RETURN ls_ret
end function

public subroutine of_parse (string as_sep, string as_list, ref string as_array[]);// -----------------------------------------------------------------------------
// SCRIPT:     of_Parse
//
// PURPOSE:    This function parses a string of comma separated values and
//             returns an array.
//
// ARGUMENTS:  as_sep      -  The separating value
//             as_list     -  String containing separated list
//             as_array[]  -  String array returned
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
integer  li_next
long     ll_pos, ll_cnt, ll_start
string   ls_empty[], ls_list

as_array = ls_empty
ls_list = trim(as_list)
IF right( ls_list, 1 ) <> as_sep THEN
   ls_list = ls_list + as_sep
END IF

ll_start = 1
ll_pos = Pos( ls_list, as_sep, ll_start )
DO WHILE ll_pos > 1
   li_next = UpperBound(as_array) + 1
   as_array[li_next] = mid( ls_list, ll_start, (ll_pos - ll_start) )
   ll_start = ll_pos + 1
   ll_pos = Pos( ls_list, as_sep, ll_start )
LOOP
end subroutine

public function integer of_setprofile (string as_section, string as_name, string as_value);/*------------------------------------------------------------------------------------------------*
   integer of_setProFile ( string as_Section , string as_Name, string as_Value )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - INI파일에 문자열 쓰기
                                - of_setProFile( "SYSTEM", "NAME", "JAD" )
 *------------------------------------------------------------------------------------------------*/
integer  li_ret
string   ls_INIFile

// Use INI file
ls_INIFile = gs_INIFile

IF of_IsEmpty( ls_INIFile ) THEN
   MessageBox( "Error!", "INI파일이 존재하지 않습니다.", StopSign! )
   RETURN -1
END IF

IF of_IsEmpty( as_Section ) OR of_IsEmpty( as_Name ) THEN
   MessageBox( "확인", "of_setProFile Argument를 확인하세요!" )
   RETURN 0
END IF

li_ret  = SetProfileString( ls_inifile, as_Section, as_Name, as_Value )

RETURN li_ret
end function

public subroutine of_setreg (string as_subkey, string as_valuename, string as_value);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetReg
//
// PURPOSE:    This function saves string values in the registry.
//
// ARGUMENTS:  as_subkey      - Optional subkey under the base key
//             as_valuename   - Name of the value
//             as_value       - The value to save
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/13/2006  RolandS     Initial Coding
// -----------------------------------------------------------------------------
string   ls_regkey

ls_regkey = gs_RegKey

IF len(as_subkey) > 0 THEN
   IF right( ls_RegKey, 1 ) = CString.BACKSLASH THEN
      ls_regkey += as_subkey
   ELSE
      ls_regkey += CString.BACKSLASH + as_subkey
   END IF
END IF

RegistrySet( ls_regkey, as_valuename, RegString!, as_value )
end subroutine

public subroutine of_setreg (string as_valuename, string as_value);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetReg
//
// PURPOSE:    This function saves string values in the registry.
//
// ARGUMENTS:  as_valuename   - Name of the value
//             as_value       - The value to save
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/13/2006  RolandS     Initial Coding
// -----------------------------------------------------------------------------
of_SetReg( "", as_valuename, as_value )
end subroutine

public function long of_stringtochar (string as_string, ref character ac_char[]);// -----------------------------------------------------------------------------
// SCRIPT:     of_StringToChar
//
// PURPOSE:    This function converts a string to an array of chars.  If this
//             function is called again, the string is added to the end of the
//             array.  Each string is separated by a single null and there are
//             two nulls at the end.
//
// ARGUMENTS:  as_string   -  String to convert
//             ac_char[]   -  String variable to search for
//
// RETURN:     Long        -  Number of entries in the array
//
// DATE        PROG/ID     DESCRIPTION OF CHANGE / REASON
// ----------  --------    -----------------------------------------------------
// 10/11/2002  RolandS     Initial creation
// -----------------------------------------------------------------------------
long  ll_len, ll_char, ll_into

// copy string to array
ll_len = len(as_string)
FOR ll_char = 1 to ll_len
   IF ll_char = 1 THEN
      ll_into = UpperBound(ac_char)
      IF ll_into = 0 THEN
         ll_into = 1
      END IF
   ELSE
      ll_into = UpperBound(ac_char) + 1
   END IF
   ac_char[ll_into] = mid( as_string, ll_char, 1 )
NEXT

// terminate with two nulls
SetNull(ac_char[ll_into + 1])
SetNull(ac_char[ll_into + 2])

RETURN UpperBound(ac_char)
end function

public function string of_compactpath (readonly dragobject ado, readonly string as_string);//===========================================================================
// Function: of_Compactpath (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   DragObject  ado
//  readonly   string      as_string
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string   ls_ret
long     ll_h
ulong    lul_dc
n_svc_win32   lnv_win

ll_h = Handle(this)

lul_dc = lnv_win.GetDC(ll_h)
ls_ret = as_string
lnv_win.PathCompactPath( lul_dc, ls_ret, UnitsToPixels(ado.width, XUnitsToPixels!) )
lnv_win.ReleaseDC( ll_h, lul_dc )

RETURN ls_ret
end function

public function string of_createtempfile (string as_extension);//===========================================================================
// Function: of_Createtempfile (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  value string as_extension
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string      ls_ret, ls_path, ls_filename
n_svc_win32 lnv_win32

IF of_IsEmpty(as_extension) THEN
	as_extension = TMP_EXTENSION
END IF

ls_ret = SPACE(MAX_LEN)

ls_path = of_GetTempPath()
lnv_win32.GetTempFilename( ls_path, as_extension, 0, ls_ret )

RETURN trim(ls_ret)
end function

public function string of_createtempfile ();//===========================================================================
// Function: of_Createtempfile (public )
// Object: n_svc_files
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
RETURN of_createtempfile(CString.EMPTY)
end function

on n_svc_file.create
call super::create
end on

on n_svc_file.destroy
call super::destroy
end on

event constructor;call super::constructor;//is_key = "A%a5&*Bnfue%wmmkI(0aCv#2Jmld!baHierrtL;P{anYrhUuuS&mNbyswwjdjOJjjaoioC,rU*889A76"
is_key = "dydgmlwnddlaksemsaydnjswlrltltmxpadlqslek"
end event

