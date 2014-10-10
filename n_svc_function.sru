$PBExportHeader$n_svc_function.sru
$PBExportComments$Function Sets
forward
global type n_svc_function from n_svc_base
end type
end forward

global type n_svc_function from n_svc_base autoinstantiate
end type

type prototypes
/* 한영 전환  */
FUNCTION LONG ImmGetContext( long handle ) LIBRARY "IMM32.DLL"
FUNCTION LONG ImmSetConversionStatus( long hIMC, long fFlag, long l ) LIBRARY "IMM32.DLL"
FUNCTION LONG ImmReleaseContext( long handle, long hIMC ) LIBRARY "IMM32.DLL"
end prototypes

type variables
Private :
n_timing     in_time
powerobject  ipo_time
string       is_TimerEvent = "ue_timer"
end variables

forward prototypes
public function string of_2bytecut (string as_source, readonly long al_length)
public function string of_addcomma (string as_source)
public function string of_adddate (readonly string as_date, readonly long al_index)
public function string of_addmonth (readonly string as_date, readonly long al_index)
public function long of_array2string (readonly string as_source[], readonly string as_delimiter, readonly boolean ab_processempty, ref string as_ref_string)
public function long of_array2string (readonly string as_source[], readonly string as_delimiter, ref string as_ref_string)
public subroutine of_center (window aw_window)
public subroutine of_center_frame (readonly window aw_mdi, readonly window aw_window)
public function string of_charcut (readonly string as_source, readonly long al_length)
public function long of_countoccurrences (string as_source, string as_target, readonly boolean ab_ignorecase)
public function long of_days_between (string as_frdt, string as_todt)
public function string of_findobject (string as_class)
public function string of_getnumber (readonly string as_number)
public function string of_gettrimspace (string as_source)
public function string of_getstring (string as_source, string as_delimiter, long al_pos)
public function long of_getsqlcolumn (string as_sql, ref string as_collist[])
public function long of_getsqldwinfo (readonly powerobject apo, readonly string as_sql, ref string as_column[])
public function boolean of_isdate (string as_date)
public function string of_lastday (string as_date)
public function boolean of_match (readonly string as_source, readonly integer ai_chk)
public function string of_number2string (readonly double ad_number)
public function unsignedlong of_pbcolor (string as_color)
public function string of_remove (string as_source, string as_separator)
public function long of_runsql (readonly string as_sql, ref str_parm astr_parm, transaction atr)
public function long of_runsql (readonly string as_sql, ref str_parm astr_parm)
public function long of_stringposarray (readonly string as_source, readonly string as_array[])
public subroutine of_sqlerror (transaction atr, string as_title, string as_msg)
public subroutine of_opensheet (readonly window aw_mdi, string as_window)
public function integer of_month_between (string as_frym, string as_toym)
public function window of_mdiopensheetfind (window aw_mdi, string as_classname, string as_title)
public function integer of_mdiopenwinlist (window aw_mdi, ref string as_classname[], ref string as_titlename[])
public function long of_getcurrval (readonly string as_table, readonly string as_colname, readonly string as_column[], readonly string as_value[])
public function long of_getnextval (readonly string as_table, readonly string as_colname, readonly string as_column[], readonly string as_value[])
public subroutine of_ddlbsetheight (dropdownlistbox addlb)
public function string of_padleft (readonly string as_source, readonly long al_length, string as_char)
public function string of_padleft (readonly string as_source, readonly long al_length)
public function string of_padright (readonly string as_source, readonly long al_length, string as_char)
public function string of_padright (readonly string as_source, readonly long al_length)
public subroutine of_enter (powerobject apo)
public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator)
public function integer of_getopensheetlist (window aw_mdi, ref string as_winclassname[], ref string as_wintitle[])
public function date of_stringtodate (readonly string as_date)
public subroutine of_toggle (any aa_object, string as_toggle)
public function long of_charcount (readonly string as_source, readonly string as_target)
public function integer of_setdwclear (powerobject apo)
public function string of_sysdate ()
public function integer of_sortinteger (ref integer ai_sort[])
public function boolean of_isbizno (string as_bizno)
public function boolean of_iscprno (string as_cprno)
public function boolean of_isjuminno (string as_juminno)
public function long of_getcode (ref powerobject apo, readonly string as_separator, readonly string as_code[])
public function long of_getcode (ref powerobject apo, readonly string as_separator)
public function long of_setcode (ref powerobject apo, readonly str_parm astr_parm, long al_colcnt)
public function integer of_timerstart (readonly powerobject apo, readonly string as_event, readonly integer ai_interval)
public function integer of_timerstart (readonly powerobject apo, readonly integer ai_interval)
public function boolean of_gettimerstatus ()
public function integer of_timerstop ()
public function integer of_filewrite (string as_file, blob ab_file, readonly boolean ab_append)
public function integer of_filewrite (string as_file, blob ab_file)
public function integer of_filewrite (string as_file, any aa_msg)
public function integer of_filewrite (any aa_msg)
end prototypes

public function string of_2bytecut (string as_source, readonly long al_length);/*------------------------------------------------------------------------------------------------*
   string of_2ByteCut ( string as_source, long al_length )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 첫 문자부터 2Byte문자(ASC>=128)인가 체크해서 2Byte문자이면 2문자,
                                - 아니면 1문자씩을 잘라낸다
                                - of_2ByteCut( "2014년 갑오년", 8 ) RETURN "2014년 "
 *------------------------------------------------------------------------------------------------*/
long     n, ll_len
string   ls_return

IF of_IsEmpty(as_source) THEN RETURN CString.EMPTY

IF IsNull(al_length) OR al_length < 1 THEN RETURN as_source

ll_len = LEN( as_source )

for n = 1 to ll_len
   IF Asc(Mid( as_source, n, 1 )) >= 128 THEN
      ls_return = Left( as_source, n + 1 )
      n = n + 1
      IF n > al_length THEN
         ls_return = Left( ls_return, n - 2 )
      END IF
   ELSE
      ls_return = Left(as_source, n)
   END IF
   IF n >= al_length THEN EXIT
next
RETURN ls_return
end function

public function string of_addcomma (string as_source);/*------------------------------------------------------------------------------------------------*
   string of_AddComma ( string as_source )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07                   - 숫자형 문자에 천단위로 콤머(,)를 붙인다.
                                - of_AddComma( "10500" )  RETURN "10,500"
 *------------------------------------------------------------------------------------------------*/
integer  li_len, li_mod, li_portion, i, j
string   ls_num
string   ls_return

ls_num = trim(as_source)

IF of_IsEmpty(ls_num) THEN RETURN CString.EMPTY

IF NOT IsNumber(ls_num) THEN RETURN ls_num

li_len     = Len(ls_num)
li_portion = li_len / 3
li_mod     = Mod(li_len, 3)

j = li_mod + 1

ls_return = Left( ls_num, li_mod )

for i = 1 to li_portion
   IF Len( ls_return ) = 0 THEN
      ls_return = Mid( ls_num, j, 3 )
   ELSE
      ls_return = ls_return + "," + Mid( ls_num, j, 3 )
   END IF
   j = j + 3
next
RETURN ls_return
end function

public function string of_adddate (readonly string as_date, readonly long al_index);/*------------------------------------------------------------------------------------------------*
   string of_AddDate ( string as_date, long al_index )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07                   - as_date 일자에 al_index를 더한(+-) 일자를 리턴.
                                - of_addDate( "20140320", -1 )  RETURN "20140319"
 *------------------------------------------------------------------------------------------------*/
date     ld_date
string   ls_date, ls_return

IF of_IsEmpty( as_date ) THEN RETURN as_date

IF Len( as_date ) <> 8 THEN RETURN as_date

IF NOT IsNumber( as_date ) THEN RETURN as_date

ls_date = Mid( as_date, 1, 4 ) + CString.MINUS + Mid( as_date, 5, 2 ) + CString.MINUS + Mid(as_date, 7, 2 )

ld_date = date( ls_date )

ld_date = RelativeDate( ld_date, al_index )

RETURN string( ld_date, "yyyymmdd" )
end function

public function string of_addmonth (readonly string as_date, readonly long al_index);/*------------------------------------------------------------------------------------------------*
   string of_addMonth ( string as_date, long al_index )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_date 년월(일)에 al_index를 더한(+-) 년월을 리턴.
                                - of_addMonth( "20140320", -1 )  RETURN "20140220"
 *------------------------------------------------------------------------------------------------*/
long     ll_cnt
string   ls_date, ls_yy, ls_mm, ls_dd

IF of_IsEmpty( as_date ) THEN RETURN CString.EMPTY

IF (Len(as_date) > 8 OR Len(as_date) < 6) OR al_index = 0 THEN RETURN as_date

ls_yy = mid( as_date, 1, 4 )
ls_mm = mid( as_date, 5, 2 )
ls_dd = mid( as_date, 7, 2 )

IF al_index > 0 THEN
   for ll_cnt = 1 to al_index
      IF long(ls_mm) + 1 > 12 THEN
         ls_yy = string(long(ls_yy) + 1)
         ls_mm = "01"
      ELSE
         ls_mm = string(long(ls_mm) + 1, "00")
      END IF
   next
   ls_date = ls_yy + ls_mm + ls_dd
ELSEIF al_index < 0 THEN
   for ll_cnt = 1 to Abs(al_index)
      IF long(ls_mm) - 1 < 1 THEN
         ls_yy = string(long(ls_yy) - 1)
         ls_mm = "12"
      ELSE
         ls_mm = string(long(ls_mm) - 1, "00")
      END IF
   next
   ls_date = ls_yy + ls_mm + ls_dd
ELSE
   ls_date = as_date
END IF
RETURN ls_date
end function

public function long of_array2string (readonly string as_source[], readonly string as_delimiter, readonly boolean ab_processempty, ref string as_ref_string);/*------------------------------------------------------------------------------------------------*
   long of_array2String ( string as_source[], string as_delimiter, boolean ab_processempty, string as_ref_string )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_source[] 배열에 있는 문자를 as_delimiter문자로 연결한 문자열을 만든다.
                                - ab_processempty  ?
                                - of_array2string( {1,2,3,4,5}, ",", FALSE, ls_ref ) => RETURN 1,2,3,4,5
                                - <=> of_parseToArray() or of_string2Array()
 *------------------------------------------------------------------------------------------------*/
long  ll_count
long  ll_arrayupbound

ll_arrayupbound = UpperBound(as_source)

IF (isNull(as_delimiter) OR  NOT (ll_arrayupbound > 0)) THEN
   RETURN -1
END IF
as_ref_string = ""
IF  NOT (ab_processempty) THEN
   for ll_count = 1 to ll_arrayupbound
      IF as_source[ll_count] <> "" THEN
         IF len(as_ref_string) = 0 THEN
            as_ref_string = as_source[ll_count]
            CONTINUE
         END IF
         as_ref_string = as_ref_string + as_delimiter + as_source[ll_count]
      END IF
   next
ELSE
   for ll_count = 1 to ll_arrayupbound
      IF ll_count = 1 THEN
         as_ref_string = as_source[ll_count]
         CONTINUE
      END IF
      as_ref_string = as_ref_string + as_delimiter + as_source[ll_count]
   next
END IF
RETURN 1
end function

public function long of_array2string (readonly string as_source[], readonly string as_delimiter, ref string as_ref_string);RETURN of_array2String(as_source, as_delimiter, FALSE, as_ref_string)
end function

public subroutine of_center (window aw_window);/*------------------------------------------------------------------------------------------------*
   of_center ( window aw_window )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder
 *------------------------------------------------------------------------------------------------*/
integer     li_ScreenH, li_ScreenW
Environment le_Env

GetEnvironment(le_Env)

li_ScreenH = PixelsToUnits(le_Env.ScreenHeight, YPixelsToUnits!)
li_ScreenW = PixelsToUnits(le_Env.ScreenWidth, XPixelsToUnits!)

aw_window.Y = (li_ScreenH - aw_window.Height) / 2
aw_window.X = (li_ScreenW - aw_window.Width)  / 2
end subroutine

public subroutine of_center_frame (readonly window aw_mdi, readonly window aw_window);/*------------------------------------------------------------------------------------------------*
   of_center_frame ( window aw_mdi ( OR gw_Frame ), window aw_window )
   Descirption: Main Frame이 존재하면 Frame의 Center/ 화면 중앙
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author          Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder    모니터 또는 프레임 중앙에 화면을 띄운다.
 *------------------------------------------------------------------------------------------------*/
integer     li_screenheight, li_screenwidth
integer     li_x, li_y, li_x_pos, li_y_pos
environment lenv_obj

IF IsNull(aw_window) OR NOT IsValid(aw_window) THEN RETURN

aw_window.Hide()

IF aw_window.Center THEN aw_window.Center = FALSE

IF IsValid( aw_mdi ) THEN
   li_x = aw_mdi.X
   li_y = aw_mdi.Y

   li_x_pos = li_x + round(( aw_mdi.WorkSpaceWidth() - aw_window.width )  / 2, 0)
   li_y_pos = li_y + round(( aw_mdi.WorkSpaceHeight() - aw_window.height)  / 3, 0)

   IF li_x_pos < 0 THEN li_x_pos = 0
   IF li_y_pos < 0 THEN li_y_pos = 0
ELSE
   IF GetEnvironment( lenv_obj ) = -1 THEN
      aw_window.Show()
      RETURN
   END IF

   li_screenheight = PixelsToUnits ( lenv_obj.ScreenHeight, YPixelsToUnits! )
   li_screenwidth  = PixelsToUnits ( lenv_obj.ScreenWidth, XPixelsToUnits! )

   li_x_pos=1;li_y_pos=1
   IF NOT li_screenheight > 0 OR NOT li_screenwidth > 0 THEN RETURN

   IF li_screenwidth > aw_window.Width THEN
      li_x_pos = ( li_screenwidth / 2 ) - ( aw_window.Width / 2 )
   END IF

   IF li_screenheight > aw_window.Height THEN
      li_y_pos = ( li_screenheight / 2 ) - ( aw_window.Height / 2 )
   END IF
END IF

aw_window.Move(li_x_pos, li_y_pos)
aw_window.Show()
end subroutine

public function string of_charcut (readonly string as_source, readonly long al_length);/*------------------------------------------------------------------------------------------------*
   string of_CharCut ( string as_source, long al_length )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_source의 길이를 al_length의 길이 만큼 잘래냄.
                                - of_CharCut( "1234567890", 8) => "12345678"
 *------------------------------------------------------------------------------------------------*/
boolean  lb_first = FALSE
integer  li_idx
string   ls_return

IF of_IsEmpty(as_source) THEN RETURN CString.EMPTY

IF IsNull(al_length) OR al_length < 1 THEN RETURN as_source

for li_idx = 1 to al_length
   IF Asc(mid( as_source, li_idx, 1 )) >= 64 THEN
      lb_first = NOT lb_first
   ELSE
      lb_first = FALSE
   END IF
next

IF lb_first THEN
   ls_return = mid( as_source, 1, al_length - 1 )
ELSE
   ls_return = mid( as_source, 1, al_length )
END IF
RETURN ls_return
end function

public function long of_countoccurrences (string as_source, string as_target, readonly boolean ab_ignorecase);/*------------------------------------------------------------------------------------------------*
   long of_countoccurrences ( string as_source, string as_target, boolean ab_ignorecase )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_source 문자열에서 as_target의 갯수를 구한다.( 단어 세기)
                                - ab_ignorecase 로 대.소문자 구분
                                - of_countoccurrences( "10,530,000", "0", TRUE ) => RETURN 5
                                - count word
 *------------------------------------------------------------------------------------------------*/
long  n, ll_len, ll_pos

IF ((IsNull(as_source) OR IsNull(as_target)) OR IsNull(ab_ignorecase)) THEN
   RETURN 0
END IF

IF ab_ignorecase THEN
   as_source = Lower(as_source)
   as_target = Lower(as_target)
END IF

n = 0
// 구분자의 길이를 구함
ll_len = len(as_target)

ll_pos = Pos(as_source, as_target)
DO WHILE ll_pos > 0
   n ++
   ll_pos = Pos(as_source, as_target, ll_pos + ll_len)
LOOP
RETURN n
end function

public function long of_days_between (string as_frdt, string as_todt);/*------------------------------------------------------------------------------------------------*
   long of_days_between ( string as_frdt, string as_todt )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 두일자 사이의 기간(일수)을 구한다.
                                - of_days_between( "20140319", "20140320" ) ==> RETURN 1
 *------------------------------------------------------------------------------------------------*/
date     ld_fr_dt, ld_to_dt
long     ll_days

IF of_IsEmpty( as_frdt ) OR of_IsEmpty( as_todt ) THEN RETURN -1

// 숫자만 추출
as_frdt = of_getNumber(as_frdt)
as_todt = of_getNumber(as_todt)

IF as_frdt > as_todt THEN
   RETURN -1
END IF

ld_fr_dt = Date(left( as_frdt, 4 ) + CString.MINUS + mid( as_frdt, 5, 2) + CString.MINUS + right( as_frdt, 2 ))
ld_to_dt = Date(left( as_todt, 4 ) + CString.MINUS + mid( as_todt, 5, 2) + CString.MINUS + right( as_todt, 2 ))

RETURN DaysAfter( ld_fr_dt, ld_to_dt )
end function

public function string of_findobject (string as_class);/*------------------------------------------------------------------------------------------------*
   string   of_FindObject ( string as_class )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   ClassName으로 오브젝트를 찾기
   of_FindObject( "dw_1" )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_objname           ClassName(오브젝트명)
 *------------------------------------------------------------------------------------------------*/
boolean  lb_Find = FALSE
long     n, ll_bound, p, ll_upper, c, ll_arrcnt, ll_pos, ll_lot
string   ls_objtype
string   ls_lList, ls_Librarys[], ls_dw, ls_dws[], ls_null[]
string   ls_lists, ls_linedata, ls_data
string   ls_types[] = { "APPLICATION","DATAWINDOW","FUNCTION","MENU","PIPELINE","PROJECT", &
                        "QUERY","STRUCTURE","USEROBJECT", "WINDOW" }

ls_lList = GetLibraryList()
IF right(ls_lList, Len(',')) <> ',' THEN ls_lList += ','
of_parseToArray( ls_lList, ",", ls_Librarys )

ll_bound = UpperBound(ls_Librarys)
ll_upper = UpperBound(ls_types)

for n = 1 to ll_bound
   ls_lList = ls_Librarys[n]
   for p = 1 to ll_upper
      ls_objtype = ls_types[p]
      choose case Upper(ls_types[p])
         case "APPLICATION"
            ls_dw = LibraryDirectory(ls_lList, DirApplication!)
         case "DATAWINDOW"
            ls_dw = LibraryDirectory(ls_lList, DirDataWindow!)
         case "FUNCTION"
            ls_dw = LibraryDirectory(ls_lList, DirFunction!)
         case "MENU"
            ls_dw = LibraryDirectory(ls_lList, DirMenu!)
         case "PIPELINE"
            ls_dw = LibraryDirectory(ls_lList, DirPipeline!)
         case "PROJECT"
            ls_dw = LibraryDirectory(ls_lList, DirProject!)
         case "QUERY"
            ls_dw = LibraryDirectory(ls_lList, DirQuery!)
         case "STRUCTURE"
            ls_dw = LibraryDirectory(ls_lList, DirStructure!)
         case "USEROBJECT"
            ls_dw = LibraryDirectory(ls_lList, DirUserObject!)
         case "WINDOW"
            ls_dw = LibraryDirectory(ls_lList, DirWindow!)
         case else
            ls_dw = LibraryDirectory(ls_lList, DirAll!)
      end choose

      ls_dws = ls_null
      ls_lists = ls_dw + CString.NL

      ll_pos = Pos(ls_lists, CString.NL)
      DO WHILE ll_pos > 0
         ls_linedata = Left( ls_lists, ll_pos - 1 )

         ll_lot = Pos(ls_linedata, CString.TAB)
         ls_data = Left(ls_linedata, ll_lot - 1 )
         IF NOT of_IsEmpty(ls_data) THEN
            ls_dws[UpperBound(ls_dws) + 1] = ls_data
         END IF
         ls_lists = Mid( ls_lists, ll_pos + Len(CString.NL) )

         ll_pos = Pos(ls_lists, CString.NL)
      LOOP

      ll_arrcnt = UpperBound(ls_dws)
      for c = 1 to ll_arrcnt
         IF Upper(as_class) = Upper(ls_dws[c]) THEN lb_Find = TRUE
         IF lb_Find THEN EXIT
      next
      IF lb_Find THEN EXIT
   next
   IF lb_Find THEN EXIT
next
RETURN ls_objtype
end function

public function string of_getnumber (readonly string as_number);/*------------------------------------------------------------------------------------------------*
   string of_getNumber ( string as_number )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2013.03.31       PowerBuilder  문자열에서 숫자만 추출 ex) 2013-03-31 => 20130331
 *------------------------------------------------------------------------------------------------*/
char     cData[]
long     ll_bound, n = 0
string   ls_number

cData = as_number

ll_bound = UpperBound( cData )

IF of_IsEmpty( as_number ) OR ll_bound <= 0 THEN RETURN "0"

ls_number = CString.EMPTY
DO
   n++
   IF Match( mid(cData, n, 1), "[0-9]" ) THEN
      ls_number = ls_number + mid(cData, n, 1)
   END IF
LOOP WHILE ll_bound > n
RETURN ls_number
end function

public function string of_gettrimspace (string as_source);/*------------------------------------------------------------------------------------------------*
   string of_gettrimspace ( string as_source )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_source에서 " "(space)를 제거한다.
                                - of_gettrimspace( " 1 23  28    1" ) => "123281"
 *------------------------------------------------------------------------------------------------*/
long     ll_pos
string   ls_return

IF of_IsEmpty( as_source ) THEN RETURN CString.EMPTY

as_source = trim( as_source )
ls_return = CString.EMPTY
DO
   ll_pos = Pos( as_source, CString.SPACE )
   IF ll_pos > 0 THEN
      ls_return += trim(left( as_source, ll_pos )) + CString.SPACE
      as_source = trim(mid( as_source, ll_pos + 1 ))
   ELSE
      ls_return += trim (as_source )
   END IF
LOOP WHILE ll_pos > 0
RETURN trim( ls_return )
end function

public function string of_getstring (string as_source, string as_delimiter, long al_pos);/*------------------------------------------------------------------------------------------------*
   string of_getstring (string as_source, string as_delimiter, long al_pos )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07                   - as_source에서 as_delimiter를 기준으로 al_pos 번째 문자를 추출함.
 *------------------------------------------------------------------------------------------------*/
long     n, p, ll_pos, nLen
string   ls_data[]

IF of_IsEmpty(as_source) OR of_IsEmpty( as_delimiter ) &
                         OR of_IsEmpty( al_pos ) OR al_pos = 0 THEN
   RETURN as_source
ELSE
   nLen = Len( as_delimiter )
END IF

IF right( as_source, nLen ) <> as_delimiter THEN
   as_source += as_delimiter
END IF

n = 1
DO WHILE TRUE
   IF p > 0 THEN
      n = ll_pos + nLen
   END IF

   ll_pos = Pos( as_source, as_delimiter, n )
   IF ll_pos = 0 THEN
      EXIT
   END IF
   p ++
   ls_data[p] = mid( as_source, n, ll_pos - n )
LOOP

IF al_pos > p THEN RETURN CString.EMPTY

RETURN ls_data[al_pos]
end function

public function long of_getsqlcolumn (string as_sql, ref string as_collist[]);/*------------------------------------------------------------------------------------------------*
   long of_GetSQLColumn ( string as_sql, string as_collist[] )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2013.03.31       PowerBuilder  SQL문으로부터 COLUMN ID 추출
 *------------------------------------------------------------------------------------------------*/
long     ll_pos, ll_idx, ll_bound, ll_start, ll_end, ll_ii, ll_jj
string   ls_sql, ls_collist[]

as_collist = ls_collist

IF of_IsEmpty( as_sql ) THEN RETURN -1

ls_sql = trim(Lower( as_sql ))
// SELECT 이후 문장 추출.
ll_pos = Pos( ls_sql, "select" )
ls_sql = trim(mid( ls_sql, ll_pos + 1 ))

ll_bound = len( ls_sql )

// column list 추출
ll_start = 0; ll_end = 0; ll_ii = 0; ll_jj = 0
DO WHILE ll_bound > ll_idx
   ll_idx ++
   IF mid( ls_sql, ll_idx, 1 ) = "(" THEN
      ll_ii ++
      IF ll_jj = 0 AND ll_start = 0 THEN ll_start = ll_idx
   END IF
   IF mid( ls_sql, ll_idx, 1 ) = ")" THEN
      ll_jj ++
      IF ll_ii = ll_jj THEN ll_end = ll_idx
   END IF
   // scalar query내의 from => ""로 취환.
   IF ll_end > 0 THEN
      ll_pos = (ll_end - ll_start) + 2
      ls_sql = Replace( ls_sql, ll_start - 1, ll_pos, space(ll_pos) )
      ll_start = 0; ll_end = 0; ll_ii = 0; ll_jj = 0
   END IF
LOOP

IF ll_ii <> ll_jj THEN
   MessageBox("확인1", "SQL을 확인하세요1")
   RETURN -1
END IF

// FROM 이전 문장 추출
ls_sql = trim( ls_sql )
ll_pos = Pos( ls_sql, "from" )
IF ll_pos <= 0 THEN
   MessageBox("확인2", "SQL을 확인하세요2")
   RETURN -1
END IF
ls_sql = trim( left( ls_sql, ll_pos - 1) )


// ","를 기준으로 Column Id를 배열에 담는다.
IF of_parseToArray( ls_sql, ",", ls_collist ) = -1 THEN RETURN -1
ll_idx = 0
ll_bound = UpperBound( ls_collist )
DO WHILE ll_bound > ll_idx
   ll_idx ++
   ls_collist[ll_idx] = trim(ls_collist[ll_idx])

   // Table Alias를 제거하기 위해..
   ll_pos = LastPos( ls_collist[ll_idx], "." )
   IF ll_pos <= 0 THEN
      // Column Alias만 취하기 위해..
      ll_pos = LastPos( ls_collist[ll_idx], " "  )
   END IF
   IF ll_pos > 0 THEN
      ls_collist[ll_idx] = trim(mid( ls_collist[ll_idx], ll_pos + 1 ))
   END IF
LOOP

as_collist = ls_collist

RETURN ll_idx
end function

public function long of_getsqldwinfo (readonly powerobject apo, readonly string as_sql, ref string as_column[]);/*------------------------------------------------------------------------------------------------*
   long of_getSQLDWInfo (datawindow adw_data, string as_sql, string as_column[] )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2013.03.31       PowerBuilder
                    SQL문에서 Column을 추출해 DataWindow에서 Column Name과 Column Type을 추출한다.
 *------------------------------------------------------------------------------------------------*/
IF of_IsEmpty( as_sql ) THEN RETURN -1

// SQL문에서 순수한 Column Name을 추출..
RETURN of_getSQLColumn( as_sql, as_column )
end function

public function boolean of_isdate (string as_date);// of_isDate( "20140517" )
string   ls_date

IF of_IsEmpty( as_date ) THEN RETURN FALSE

// "2014-05-17"  => "20140517"
as_date = of_getNumber( as_date )

IF len( trim(as_date) ) = 6 THEN
   as_date = trim(as_date) + "01"
END IF

IF len(trim(mid( as_date, 1, 4))) < 4 OR mid( as_date, 1, 1) = " " &
   OR mid( as_date, 2, 1) = " " OR mid( as_date, 3, 1) = " " &
   OR mid( as_date, 4, 1) = " " &
   OR len(trim(mid( as_date, 5, 2))) < 2 OR mid( as_date, 5, 1) = " " &
   OR mid( as_date, 6, 1) = " " &
   OR len(trim(mid( as_date, 7, 2))) < 2 OR mid( as_date, 7, 1) = " " &
   OR mid( as_date, 8, 1) = " " THEN
   RETURN FALSE
END IF

ls_date = string( as_date, "@@@@-@@-@@")
RETURN IsDate( ls_date )
end function

public function string of_lastday (string as_date);date     ld_rdate
integer  li_yy, li_mm
string   ls_dt

ls_dt = as_date

IF of_IsEmpty( ls_dt ) THEN
   ls_dt = string( Today(), "yyyymmdd" )
END IF

li_yy = integer(left(ls_dt, 4))
li_mm = integer(mid(ls_dt, 5, 2)) + 1

IF li_mm > 12 THEN
   li_yy = li_yy + 1
   li_mm = 1
   ls_dt = string(li_yy) + "-01-01"
ELSE
   ls_dt = string(li_yy) + "-" + string(li_mm, "00") + "-01"
END IF

ld_rdate = RelativeDate(date(ls_dt), -1)

RETURN string(ld_rdate, "yyyymmdd")
end function

public function boolean of_match (readonly string as_source, readonly integer ai_chk);/*------------------------------------------------------------------------------------------------*
   boolean of_match( string as_source, integer ai_chk )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - as_source가 형식을 만족하는지 체크
   - gfn.of_match( "aaa한", 1 )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_source      체크할 원문
   ai_chk         1  => 한글이     들어오면  error
                  2  => 영문이     들어오면  error
                  3  => 숫자가     들어오면  error
                  4  => 공백이     들어오면  error
                  5  => 특수문자가 들어오면  error
                  6  => 숫자만 입력 가능
 *------------------------------------------------------------------------------------------------*/
choose case ai_chk
   case 1
      IF Match(as_source, "[^0-9a-zA-Z]") THEN
         MessageBox( "에러", "영문.숫자로 입력을 하세요.", StopSign! )
         RETURN FALSE
      END IF
   case 2
      IF Match(as_source, "[a-zA-Z]") THEN
         MessageBox( "에러", "영문은 입력할 수 없습니다.", StopSign! )
         RETURN FALSE
      END IF
   case 3
      IF Match(as_source, "[0-9]") THEN
         MessageBox( "에러", "숫자는 입력할 수 없습니다.", StopSign! )
         RETURN FALSE
      END IF
   case 4
      IF Pos(as_source, " " ) <> 0 THEN
         MessageBox( "에러", "공백은 입력할 수 없습니다.", StopSign! )
         RETURN FALSE
      END IF
   case 5
      IF Match(as_source, "[!-/:-@]") THEN
         MessageBox( "에러", "특수문자는 입력할 수 없습니다.", StopSign! )
         RETURN FALSE
      END IF
   case 6
      IF Match(as_source, "[^0-9]") THEN
         MessageBox( "에러", "숫자로 입력하세요.", StopSign! )
         RETURN FALSE
      END IF
   case 7
      IF match(as_source,"[a-zA-Z0-9!-/:-@]") THEN
         MessageBox( "에러", "한글로 입력하세요.", StopSign! )
         RETURN FALSE
      END IF
end choose
RETURN TRUE
end function

public function string of_number2string (readonly double ad_number);/*------------------------------------------------------------------------------------------------*
   boolean of_number2string( double adb_number )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 숫자금액을 한글금액으로 변환(일경 단위까지)
   - gfn.of_number2string( 1054000 )
   - retrun : "일백오만사천"
  -------------------------------------------------------------------------------------------------
   Parameters:
   adb_number        숫자금액
 *------------------------------------------------------------------------------------------------*/
integer  li_len, li_temp, i, j, k
string   ls_bil[4] = {"천", "백", "십", ""}, ls_dan[4] = {"조", "억", "만", ""}
string   ls_num[9] = {"일", "이", "삼", "사", "오", "육", "칠", "팔", "구"}
string   ls_val[4], ls_conv, ls_src

try
   ls_src = string(ad_number, "0000000000000000")  // 총 16자리 천조

   for i = 1 to 4
      j = (i * 4 - 3)
      ls_val[i] = mid(ls_src, j, 4)
      IF integer(ls_val[i]) > 0 THEN
         for k =  1 to 4
            li_temp = integer(mid(ls_val[i], k, 1))
            IF li_temp > 0 THEN
               ls_conv = ls_conv + ls_num[li_temp] + ls_bil[k]
            END IF
         next
         ls_conv = ls_conv + ls_dan[i]
      END IF
   next
catch (RunTimeError rte)
   of_systemerrordisplay ( rte )
end try
RETURN ls_conv
end function

public function unsignedlong of_pbcolor (string as_color);/*------------------------------------------------------------------------------------------------*
   uLong of_PBColor ( string as_color )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - 영문 또는 한글 컬러이름을 RGB로 가져오기
                                - of_PBColor( "128,210,136" )
                                - of_PBColor( "1234822028" )
                                - of_PBColor( "RED" )
 *------------------------------------------------------------------------------------------------*/
integer  li_red, li_green, li_blue
long     ll_bound
uLong    ul_Color
string   ls_color[]

IF of_IsEmpty(as_color) THEN RETURN RGB(255,255,255)

IF Pos(as_color, ",") = 0 THEN
   choose case Upper(Trim(as_Color))
      case "SILVER","은색"
         ul_Color = RGB(232,232,240)
      case "OLIVE","올리브"
         ul_Color = RGB(234,234,207)
      case "CLASSIC","클래식"
         ul_Color = RGB(242,243,246)
      case "RED","빨강","붉은","붉은색"
         ul_Color = RGB(255,0,0)
      case "DARK RED","어두운빨강"
         ul_Color = RGB(128,0,0)
      case "GREEN","녹색","그린색","그린"
         ul_Color = RGB(0,255,0)
      case "DARK GREEN","어두운녹색"
         ul_Color = RGB(0,128,0)
      case "BLUE","파랑","파란색","파란"
         ul_Color = RGB(0,0,255)
      case "DARK BLUE","어두운파랑"
         ul_Color = RGB(0,0,128)
      case "BLACK","검정","껌정","깜장"
         ul_Color = RGB(0,0,0)
      case "WHITE","흰색"
         ul_Color = RGB(255,255,255)
      case "LIGHT GRAY","밝은회색"
         ul_Color = RGB(192,192,192)
      case "DARK GRAY","더두운회색"
         ul_Color = RGB(128,128,128)
      case "MAGENTA","자주색"
         ul_Color = RGB(255,0,255)
      case "DARK MAGENTA","어두운자주색"
         ul_Color = RGB(128,0,128)
      case "CYAN","청록색"
         ul_Color = RGB(0,255,255)
      case "DARK CYAN","어두청록색"
         ul_Color = RGB(0,128,128)
      case "YELLOW","노랑색"
         ul_Color = RGB(255,255,0)
      case "BROWN","갈색"
         ul_Color = RGB(128,128,0)
      case "BUTTONFACE","버튼페이스"
         ul_Color = 67108864
      case "TRANSPARENT","투명"
         ul_Color = 536870912
      case else
         IF IsNumber(as_color) THEN
            ul_Color = Long( as_color )
         ELSE
            /* 숫자도 아니고 아무것도 아니면 흰색*/
            ul_Color = RGB(255,255,255)
         END IF
   end choose
ELSE
   ll_bound = of_parseToArray( as_color, ",", ls_color )
   IF ll_bound = 3 THEN
      li_red = integer( ls_color[1] )
      li_green = integer( ls_color[2] )
      li_blue = integer( ls_color[3] )
   END IF
   ul_Color = RGB(li_red, li_green, li_blue)
END IF
RETURN ul_Color
end function

public function string of_remove (string as_source, string as_separator);/*------------------------------------------------------------------------------------------------*
   string of_remove ( string as_source, string as_separator )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 문자열(as_source)에서 구분자(as_separator)를 제거한다.
                                - of_remove( 'xyz', 'z' ) => 'xy'
 *------------------------------------------------------------------------------------------------*/
long     ll_ii, ll_jj, ll_charCnt, ll_len
string   ls_addData, ls_dest

as_source = as_source + as_separator
ll_charCnt = Len( as_source )
ll_len = Len( as_separator )

ls_dest = CString.EMPTY
ll_jj   = 1

for ll_ii = 1 to ll_charCnt
   IF mid( as_source, ll_ii, ll_len ) = as_separator THEN
      ls_addData = mid( as_source, ll_jj, ll_ii - ll_jj )
      ls_dest = ls_dest + ls_addData

      ls_addData = ""
      ll_jj = ll_ii + ll_len
   END IF
next
RETURN ls_dest
end function

public function long of_runsql (readonly string as_sql, ref str_parm astr_parm, transaction atr);/*------------------------------------------------------------------------------------------------*
   long of_runSQL( string as_sql, str_parm astr_parm, transaction ATR )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - SQL syntax를 받아서 조회값들을 structure에 담는다
   - of_runSQL( ls_sql, str_parm, SQLCA )
   - 전체 rows 수를 return
  -------------------------------------------------------------------------------------------------
   Parameters:
   ls_sql         Null체크 대상 [컬럼은 10를 넘지 않는다.]
   str_parm       결과값을 담을 Structure
   SQLCA          Transaction 명
 *------------------------------------------------------------------------------------------------*/
long        ls_colcnt, ll_itemcnt
string      ls_collist[], ls_fld[]
str_parm    lstr_init

astr_parm = lstr_init

// Select 문의 Column Count
ls_colcnt = of_GetSQLColumn( as_sql, ls_collist )

IF ls_colcnt > 10 THEN
   MessageBox( "확인", "SQL Syntax를 확인하세요!~r~n ex)코드, 코드명 순...", Exclamation! )
   RETURN -1
END IF

DECLARE sql_cursor DYNAMIC CURSOR FOR SQLSA;

PREPARE SQLSA FROM :as_sql USING ATR;

OPEN DYNAMIC sql_cursor;

IF ATR.SQLCODE <> 0 THEN
   astr_parm.args01[1] = "-1"
   RETURN -1
END IF

choose case ls_colcnt
   case 1
      FETCH sql_cursor INTO :ls_fld[1];
   case 2
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2];
   case 3
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2],
                            :ls_fld[3];
   case 4
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2],
                            :ls_fld[3],
                            :ls_fld[4];
   case 5
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2],
                            :ls_fld[3],
                            :ls_fld[4],
                            :ls_fld[5];
   case 6
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2],
                            :ls_fld[3],
                            :ls_fld[4],
                            :ls_fld[5],
                            :ls_fld[6];
   case 7
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2],
                            :ls_fld[3],
                            :ls_fld[4],
                            :ls_fld[5],
                            :ls_fld[6],
                            :ls_fld[7];

   case 9
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2],
                            :ls_fld[3],
                            :ls_fld[4],
                            :ls_fld[5],
                            :ls_fld[6],
                            :ls_fld[7],
                            :ls_fld[8],
                            :ls_fld[9];

   case 10
      FETCH sql_cursor INTO :ls_fld[1],
                            :ls_fld[2],
                            :ls_fld[3],
                            :ls_fld[4],
                            :ls_fld[5],
                            :ls_fld[6],
                            :ls_fld[7],
                            :ls_fld[8],
                            :ls_fld[9],
                            :ls_fld[10];
end choose

ll_itemcnt = 0
IF ATR.SQLCODE = 100 THEN
   astr_parm.args01[1] = "0"
END IF

DO WHILE ATR.SQLCODE = 0
   ll_itemcnt++

   choose case ls_colcnt
      case 1
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )

         FETCH sql_cursor INTO :ls_fld[1] ;
      case 2
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2];
      case 3
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3];
      case 4
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3], "" )
         astr_parm.args04 [ll_itemcnt] = of_nvl( ls_fld[4], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3],
                               :ls_fld[4];
      case 5
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3], "" )
         astr_parm.args04 [ll_itemcnt] = of_nvl( ls_fld[4], "" )
         astr_parm.args05 [ll_itemcnt] = of_nvl( ls_fld[5], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3],
                               :ls_fld[4],
                               :ls_fld[5];
      case 6
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3], "" )
         astr_parm.args04 [ll_itemcnt] = of_nvl( ls_fld[4], "" )
         astr_parm.args05 [ll_itemcnt] = of_nvl( ls_fld[5], "" )
         astr_parm.args06 [ll_itemcnt] = of_nvl( ls_fld[6], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3],
                               :ls_fld[4],
                               :ls_fld[5],
                               :ls_fld[6];
      case 7
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3], "" )
         astr_parm.args04 [ll_itemcnt] = of_nvl( ls_fld[4], "" )
         astr_parm.args05 [ll_itemcnt] = of_nvl( ls_fld[5], "" )
         astr_parm.args06 [ll_itemcnt] = of_nvl( ls_fld[6], "" )
         astr_parm.args07 [ll_itemcnt] = of_nvl( ls_fld[7], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3],
                               :ls_fld[4],
                               :ls_fld[5],
                               :ls_fld[6],
                               :ls_fld[7];
      case 8
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3], "" )
         astr_parm.args04 [ll_itemcnt] = of_nvl( ls_fld[4], "" )
         astr_parm.args05 [ll_itemcnt] = of_nvl( ls_fld[5], "" )
         astr_parm.args06 [ll_itemcnt] = of_nvl( ls_fld[6], "" )
         astr_parm.args07 [ll_itemcnt] = of_nvl( ls_fld[7], "" )
         astr_parm.args08 [ll_itemcnt] = of_nvl( ls_fld[8], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3],
                               :ls_fld[4],
                               :ls_fld[5],
                               :ls_fld[6],
                               :ls_fld[7],
                               :ls_fld[8];
      case 9
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1], "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2], "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3], "" )
         astr_parm.args04 [ll_itemcnt] = of_nvl( ls_fld[4], "" )
         astr_parm.args05 [ll_itemcnt] = of_nvl( ls_fld[5], "" )
         astr_parm.args06 [ll_itemcnt] = of_nvl( ls_fld[6], "" )
         astr_parm.args07 [ll_itemcnt] = of_nvl( ls_fld[7], "" )
         astr_parm.args08 [ll_itemcnt] = of_nvl( ls_fld[8], "" )
         astr_parm.args09 [ll_itemcnt] = of_nvl( ls_fld[9], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3],
                               :ls_fld[4],
                               :ls_fld[5],
                               :ls_fld[6],
                               :ls_fld[7],
                               :ls_fld[8],
                               :ls_fld[9];
      case 10
         astr_parm.args01 [ll_itemcnt] = of_nvl( ls_fld[1] , "" )
         astr_parm.args02 [ll_itemcnt] = of_nvl( ls_fld[2] , "" )
         astr_parm.args03 [ll_itemcnt] = of_nvl( ls_fld[3] , "" )
         astr_parm.args04 [ll_itemcnt] = of_nvl( ls_fld[4] , "" )
         astr_parm.args05 [ll_itemcnt] = of_nvl( ls_fld[5] , "" )
         astr_parm.args06 [ll_itemcnt] = of_nvl( ls_fld[6] , "" )
         astr_parm.args07 [ll_itemcnt] = of_nvl( ls_fld[7] , "" )
         astr_parm.args08 [ll_itemcnt] = of_nvl( ls_fld[8] , "" )
         astr_parm.args09 [ll_itemcnt] = of_nvl( ls_fld[9] , "" )
         astr_parm.args10 [ll_itemcnt] = of_nvl( ls_fld[10], "" )

         FETCH sql_cursor INTO :ls_fld[1],
                               :ls_fld[2],
                               :ls_fld[3],
                               :ls_fld[4],
                               :ls_fld[5],
                               :ls_fld[6],
                               :ls_fld[7],
                               :ls_fld[8],
                               :ls_fld[9],
                               :ls_fld[10];
   end choose
LOOP

CLOSE sql_cursor;

RETURN ll_itemcnt
end function

public function long of_runsql (readonly string as_sql, ref str_parm astr_parm);RETURN of_runSQL( as_sql, astr_parm, SQLCA )
end function

public function long of_stringposarray (readonly string as_source, readonly string as_array[]);/*------------------------------------------------------------------------------------------------*
   long of_stringPosArray ( string as_source, string as_array[] )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 문자열에 비교할 대상 문자열이 포함되어 있는지 체크
   - gfn.of_stringPosArray( "서울특별시", { "특별", "광역" } )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_source         문자열(배열에서 찾고자하는 값을 포함?한)
   as_array[]        문자열과 비교할 대상문자열들
 *------------------------------------------------------------------------------------------------*/
long     ll_bound, ll_pos, n = 1

try
   IF of_IsEmpty( as_source ) THEN RETURN 0

   ll_bound = UpperBound( as_array[] )

   DO WHILE ll_bound >= n
      ll_pos = Pos( as_source, as_array[n] )
      IF ll_pos > 0 THEN
         EXIT
      END IF
      n ++
   LOOP
catch (RunTimeError rte)
   of_systemerrordisplay ( rte )
end try
RETURN ll_pos
end function

public subroutine of_sqlerror (transaction atr, string as_title, string as_msg);/*------------------------------------------------------------------------------------------------*
   of_SQLError ( transaction atr, string as_title, string as_msg )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07                   - DB Error Message 보여주기
                                - of_SQLError ( SQLCA, "공통코드조회에러", "에러가 발생했습니다." )
 *------------------------------------------------------------------------------------------------*/
string      s_sqlcode, s_sqlerrtext, s_sqldbcode, s_sqlnrows
string      ls_msg
Application lapp

IF NOT IsValid(atr) THEN RETURN

IF of_IsEmpty( as_Title ) THEN
   lapp = GetApplication()
   as_Title = lapp.appname
END IF

IF of_IsEmpty( as_msg ) THEN as_msg = ""

s_sqlcode    = string(ATR.SQLCODE)
s_sqlerrtext = ATR.SQLERRTEXT
s_sqldbcode  = string(ATR.SQLDBCODE)
s_sqlnrows   = string(ATR.SQLNROWS)

ls_msg  = "SQLCODE:" + s_sqlcode + CString.CR_NL
ls_msg += "SQLNROW:" + s_sqlnrows + CString.CR_NL
ls_msg += "sDBCODE:" + s_sqldbcode + CString.CR_NL
ls_msg += "SQLTEXT:" + s_sqlerrtext + CString.CR_NL
ls_msg += as_msg + CString.CR_NL + CString.CR_NL + CString.CR_NL
ls_msg += "개발담당자에 문의 바랍니다." + CString.CR_NL
ls_msg += "☏ " + "개발자 전화번호"

MessageBox( as_Title, ls_msg )
end subroutine

public subroutine of_opensheet (readonly window aw_mdi, string as_window);boolean  lb_windowopen
window   lw_active
window   lw_sheet

// aw_mdi => gw_frame
try
   lw_active = aw_mdi.GetFirstSheet()
   IF IsValid( lw_active ) THEN
      DO
         IF ClassName( lw_active ) = as_window THEN
            lb_windowopen = TRUE
            EXIT
         END IF
         lw_active = aw_mdi.GetNextSheet( lw_active )
      LOOP WHILE IsValid( lw_active )
   END IF

   IF lb_windowopen THEN
      lw_active.SetFocus()
   ELSE
      OpenSheet( lw_sheet, as_window, aw_mdi, 0, Layered! )
   END IF
catch (runtimeerror rte)
   MessageBox( "Runtime Error", rte.GetMessage(), StopSign! )
end try
end subroutine

public function integer of_month_between (string as_frym, string as_toym);/*------------------------------------------------------------------------------------------------*
   integer of_month_Between( string as_frym, string as_toym )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 두 년월 사이의 개월수를 계산한다.
   - gfn.of_month_Between( "201301", "201404" )
   - 두 년월 사이의 개월수
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_frym       시작년월
   as_toym       종료년월
 *------------------------------------------------------------------------------------------------*/
integer  li_smm, li_emm, li_month, li_between

// 숫자만 추출
as_frym = of_getNumber(as_frym)
as_toym = of_getNumber(as_toym)

// 길이 check
IF len(as_frym) < 6 OR len(as_toym) < 6 THEN
   RETURN -1
END IF
as_frym = left(as_frym, 6)
as_toym = left(as_toym, 6)

// Valid 한 날자인지 check
IF (NOT IsDate(left(as_frym, 4) + "." + right(as_frym, 2) + ".01")) OR + &
   (NOT IsDate(left(as_toym, 4) + "." + right(as_toym, 2) + ".01")) THEN
   RETURN -2
END IF

// 시작년월이 종료년월보다 큰지 check
IF as_frym > as_toym THEN
   RETURN -3
END IF

li_smm = long(right(as_frym, 2))
li_emm = long(right(as_toym, 2))

li_between = (long(left(as_toym, 4)) - long(left(as_frym, 4))) * 12

IF li_between = 0  THEN
   li_month = li_emm - li_smm
ELSEIF (li_emm > li_smm) OR (li_emm = li_smm) THEN
   li_month = li_between + abs( li_emm - li_smm )
ELSEIF li_emm < li_smm THEN
   IF abs( li_emm - li_smm ) > 10 THEN
       li_month = (li_emm + 12) - li_smm
   ELSE
       li_month = li_between - abs( li_emm - li_smm )
   END IF
END IF
RETURN li_month
end function

public function window of_mdiopensheetfind (window aw_mdi, string as_classname, string as_title);// 주어진 MDI에 열려있는 Sheet Window 중 이름이 같은 윈도 찾기
// window of_MDIOPENSheetFind ( aw_MDI, as_ClassName, as_Title )
Window   lw_win

IF IsValid( aw_Mdi ) THEN
   lw_win = aw_Mdi.GetActiveSheet()
   DO WHILE IsValid(lw_win)
      IF as_ClassName = lw_win.Classname() THEN EXIT
      IF as_Title = lw_win.title THEN EXIT
   Loop
END IF
RETURN lw_win
end function

public function integer of_mdiopenwinlist (window aw_mdi, ref string as_classname[], ref string as_titlename[]);// MDI 윈도에 열려있는 윈도 리스트
// integer of_MDIOpenWinList( window aw_mdi, ref string as_ClassName[], ref string as_TitleName[])
integer  li_ret = 0
window   lwin

try
   lwin = aw_mdi.GetActiveSheet()
   DO WHILE IsValid(lwin)
      li_ret ++
      as_ClassName[li_ret] = lwin.ClassName( )
      as_TitleName[li_ret] = lwin.Title
      lwin = aw_mdi.GetNextSheet( lwin )
   LOOP
catch (RunTimeError rte)
   li_ret = of_systemerrordisplay ( rte )
end try
RETURN li_ret
end function

public function long of_getcurrval (readonly string as_table, readonly string as_colname, readonly string as_column[], readonly string as_value[]);/*------------------------------------------------------------------------------------------------*
   long  of_getCurrVal( string as_table, string as_colname, string as_column[], string as_value[] )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   SQL Syntax문을 만들어 특정 컬럼의 MAX값을 취한다.
   of_getCurrVal( "t_bonglist", "t_seq", {"columnA", "columnB"}, {"valueA", "valueB"} )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_table          max value Column을 포함한 Table Name
   as_colname        max value를 구할 Column Name
   as_column[]       where 조건절에 들어가는 컬럼's
   as_value[]        where 조건절의 컬럼에 매치되는 값들
 *------------------------------------------------------------------------------------------------*/
long        n, ll_bound, ll_seq = 0
string      ls_sql, ls_condition
str_parm    lstr_parm

IF of_IsEmpty( as_table ) OR of_IsEmpty( as_colname ) THEN
   MessageBox( "확인", "값을 구하고자 하는 테이블 또는 컬럼명이 누락되었습니다.", StopSign! )
   RETURN -1
END IF

ls_condition = ""

ll_bound = UpperBound( as_column )
for n = 1 to ll_bound
   ls_condition = ls_condition + "  AND  " + as_column[n] + " = '" + as_value[n] +  "'"
next

ls_sql = "SELECT MAX(" + Upper(as_colname) + ") FROM " + as_table + " WHERE 1=1"
ls_sql = ls_sql + ls_condition

// Run SQL
of_runSQL(ls_sql, lstr_parm)

ll_bound = UpperBound( lstr_parm.args01 )

IF ll_bound > 0 THEN
   IF IsNumber( lstr_parm.args01[1] ) THEN
      ll_seq = long( lstr_parm.args01[1] )
   END IF
END IF

IF IsNull( ll_seq ) THEN ll_seq = 0

RETURN ll_seq
end function

public function long of_getnextval (readonly string as_table, readonly string as_colname, readonly string as_column[], readonly string as_value[]);/*------------------------------------------------------------------------------------------------*
   long  of_getNextVal( string as_table, string as_colname, string as_column[], string as_value[] )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   SQL Syntax문을 만들어 특정 컬럼의 MAX + 1 값을 취한다.
   of_getNextVal( "t_sequence", "seq", {"columnA", "columnB"}, {"valueA", "valueB"} )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_table          max value Column을 포함한 Table Name
   as_colname        max value를 구할 Column Name
   as_column[]       where 조건절에 들어가는 컬럼's
   as_value[]        where 조건절의 컬럼에 매치되는 값들
 *------------------------------------------------------------------------------------------------*/
long    ll_seq

ll_seq = of_getCurrVal( as_table, as_colname, as_column, as_value )

RETURN (ll_seq + 1)
end function

public subroutine of_ddlbsetheight (dropdownlistbox addlb);/*------------------------------------------------------------------------------------------------*
   of_ddlbsetHeight ( dropdownlistbox  addlb )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - ddlb 개수에 따라 높이 자동계산.
                                - of_DDLBsetHeight( ddlb_1 )
 *------------------------------------------------------------------------------------------------*/
integer  li_size = 20

IF addlb.TotalItems() < li_size THEN
   li_size = addlb.TotalItems()
END IF

addlb.Height = 100 + (72 * li_size)
end subroutine

public function string of_padleft (readonly string as_source, readonly long al_length, string as_char);/*------------------------------------------------------------------------------------------------*
   string of_padleft ( string as_source, long al_length, string as_char )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 지정한 길이만큼 좌측을 문자로 채운다.
                                - of_padleft( 'xyz', 8, 'A' ) => 'AAAAAxyz'
 *------------------------------------------------------------------------------------------------*/
long     ll_length
string   ls_null

IF (isnull(as_source) OR isnull(al_length)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF
IF al_length <= len(as_source) THEN
   RETURN as_source
END IF
IF (isnull(as_char) OR as_char = "") THEN
   as_char = space(1)
END IF
ll_length = al_length - len(as_source)
IF len(as_char) > ll_length THEN
   RETURN as_source
END IF

RETURN (Fill(as_char, ll_length) + as_source)
end function

public function string of_padleft (readonly string as_source, readonly long al_length);RETURN of_padleft( as_source, al_length, CString.SPACE )
end function

public function string of_padright (readonly string as_source, readonly long al_length, string as_char);/*------------------------------------------------------------------------------------------------*
   string of_padright ( string as_source, long al_length, string as_char )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 지정한 길이만큼 우측을 문자로 채운다.
                                - of_padright( 'xyz', 8, 'A' ) => 'xyzAAAAA'
 *------------------------------------------------------------------------------------------------*/
long     ll_length
string   ls_null

IF (isnull(as_source) OR isnull(al_length)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF
IF al_length <= len(as_source) THEN
   RETURN as_source
END IF
IF (isnull(as_char) OR as_char = "") THEN
   as_char = space(1)
END IF
ll_length = al_length - len(as_source)
IF len(as_char) > ll_length THEN
   RETURN as_source
END IF

RETURN ( as_source + Fill(as_char, ll_length) )
end function

public function string of_padright (readonly string as_source, readonly long al_length);RETURN of_padright( as_source, al_length, CString.SPACE )
end function

public subroutine of_enter (powerobject apo);IF IsValid( apo ) THEN
   Send( Handle(apo), 256, 9, long(0,0) )
END IF
end subroutine

public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator);boolean  lb_done
integer  li_keyword
integer  li_separator
integer  li_equal
string   ls_keyvalue
string   ls_source
string   ls_exact
string   ls_null

IF ((isnull(as_source) OR isnull(as_keyword)) OR isnull(as_separator)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF
ls_keyvalue = ""
DO WHILE NOT (lb_done)
   li_keyword = pos(lower(as_source), lower(as_keyword))
   IF li_keyword > 0 THEN
      ls_source = as_source
      as_source = lefttrim(right(as_source, len(as_source) - (li_keyword + len(as_keyword) - 1)))
      li_equal = li_keyword - len(as_separator)
      IF li_equal > 0 THEN
         ls_exact = mid(ls_source, li_equal, len(as_separator))
         IF ls_exact <> as_separator THEN
            CONTINUE
         END IF
      END IF
      IF left(as_source,1) = "=" THEN
         li_separator = pos(as_source, as_separator, 2)
         IF li_separator > 0 THEN
            ls_keyvalue = mid(as_source, 2, li_separator - 2)
         ELSE
            ls_keyvalue = mid(as_source, 2)
         END IF
         ls_keyvalue = trim(ls_keyvalue)
         lb_done = TRUE
      END IF
      CONTINUE
   END IF
   lb_done = TRUE
LOOP
RETURN ls_keyvalue
end function

public function integer of_getopensheetlist (window aw_mdi, ref string as_winclassname[], ref string as_wintitle[]);/*------------------------------------------------------------------------------------------------*
   integer of_GetOpenSheetList ( window aw_mdi, string as_winclassname[], string as_wintitle[] )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - Descirption: 주어진 MDI에서 열려있는 Sheet Window List
   - integer of_GetOpenSheetList ( aw_Mdi, ref as_winClassName[], ref as_wintitle[] )
   - 전체 Sheet Count
  -------------------------------------------------------------------------------------------------
   Parameters:
   aw_mdi
   as_winclassname[]
   as_wintitle[]
 *------------------------------------------------------------------------------------------------*/
integer  i = 0
Window   lw_win

IF IsValid( aw_Mdi ) THEN
   lw_win = aw_Mdi.GetActiveSheet()
   DO WHILE IsValid( lw_win )
      Yield()
      i++
      as_winClassName[i] = lw_win.ClassName()
      as_wintitle[i] = lw_win.Title
      lw_win = aw_Mdi.GetNextSheet ( lw_win )
   LOOP
END IF
RETURN i
end function

public function date of_stringtodate (readonly string as_date);/*------------------------------------------------------------------------------------------------*
   date of_stringToDate ( string as_date )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 문자열 년월일을 넘겨받아 date형으로 변경해 리턴
                                - of_stringToDate( '20140615' ) => Date( '2014-06-15' )
 *------------------------------------------------------------------------------------------------*/
date     ld_date
string   ls_date

IF of_IsEmpty( as_date ) THEN RETURN ld_date

ls_date = of_getNumber( as_date )

IF len(ls_date) <> 8 THEN RETURN ld_date

RETURN Date( left(ls_date,4) + CString.MINUS + mid(ls_date,5,2) + CString.MINUS + right(ls_date,2) )
end function

public subroutine of_toggle (any aa_object, string as_toggle);/*────────────────────────────────────────────────
   함수명 : of_toggle(any aa_Object, string as_toggle )
   사용예 : of_toggle(window, 'k')
          -> window 입력 상태를 한글, 영문 기능을 토글
   # 컴퓨터 window system 디렉토리에 imm32.dll 파일이 반드시 있을 것
   # IMC 상태를 확인하여 한영 제어
────────────────────────────────────────────────*/
long  IMC, Flag = 0

try
   IMC = ImmGetContext( Handle(aa_Object) )

   choose case Upper( as_toggle )
      case "K", "KOR"
         Flag = 1
   end choose

   ImmSetConversionStatus( IMC, Flag, 0 )

   ImmReleaseContext( Handle(aa_Object), IMC )
catch (RunTimeError rte)
   of_systemerrordisplay ( rte )
end try
end subroutine

public function long of_charcount (readonly string as_source, readonly string as_target);/*------------------------------------------------------------------------------------------------*
   long of_charcount ( string as_source, string as_target )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_source 문자열에서 as_target의 갯수를 구한다.
                                - of_charcount( "10,530,000", "0") => RETURN 5
 *------------------------------------------------------------------------------------------------*/
RETURN of_countoccurrences( as_source, as_target, TRUE )
end function

public function integer of_setdwclear (powerobject apo);/*------------------------------------------------------------------------------------------------*
    of_setDWClear ( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  화면상의 전체 DataWindow에 Sort Mark Clear & DataWindwo Reset
 *------------------------------------------------------------------------------------------------*/
integer            li_mode
long               ll_ctr_cnt, i, k
string             ls_object[] = { "dw_main", "dw_list", "dw_source", "u_dw" }
string             ls_args[]
DataWindow         ldw
UserObject         luo
Tab                ltab
Window             lw
ClassDefinition    lcd_windef, lcd_winparent
n_svc_powerbuilder lnv_pb

choose case apo.TypeOf()
   case DataWindow!
      k = 1
      ldw = apo
      lcd_windef = apo.ClassDefinition
      lcd_winparent = lcd_windef.Ancestor

      ll_ctr_cnt = 0
      for i = 1 to UpperBound( ls_object )
         // Ancestor DataWindow 명이 Array List에 포함되면...
         IF Pos( lcd_winparent.Name, ls_object[i] ) > 0 THEN
            ll_ctr_cnt = 1
            EXIT
         END IF
      next
      IF ll_ctr_cnt > 0 THEN
         // Sort Mark Clear
         IF lnv_pb.of_IsFunctionDefined( lcd_winparent.Name, "of_SortIconClear", ls_args ) THEN
            ldw.DYNAMIC of_SortIconClear()
         END IF

         // Set up arguments for MetaClass calls.
         ls_args = { "ref integer" }
         IF lnv_pb.of_IsFunctionDefined( lcd_winparent.Name, "of_Reset", ls_args ) THEN
            // DataWindow Reset
            IF ldw.DYNAMIC of_Reset( li_mode ) THEN
               ldw.Reset()
               // Init & Freeform Mode이면 InsertRow
               IF li_mode = 2 THEN
                  ldw.InsertRow(0)
               END IF
            END IF
         END IF
      END IF
   case UserObject!
      luo = apo
      ll_ctr_cnt = UpperBound( luo.control )
      for i = ll_ctr_cnt to 1 STEP -1
         k += of_setDWClear( luo.control[i] )
      next
   case Tab!
      ltab = apo
      ll_ctr_cnt = UpperBound( ltab.control )
      for i = ll_ctr_cnt to 1 STEP -1
         k += of_setDWClear( ltab.control[i] )
      next
   case Window!
      lw = apo
      ll_ctr_cnt = UpperBound( lw.control )
      for i = ll_ctr_cnt to 1 STEP -1
         k += of_setDWClear( lw.control[i] )
      next
end choose
RETURN k
end function

public function string of_sysdate ();/*------------------------------------------------------------------------------------------------*
   string of_sysdate ()
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21       PowerBuilder  yyyy-mm-dd hh:mm:ss
 *------------------------------------------------------------------------------------------------*/
string   ls_sysdate
date     ld_today
time     lt_now

choose case Upper(gs_DBType)
   case "ORA", "ORACLE"
      SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') INTO :ls_sysdate FROM dual;
   case "SQL", "MSSQL"
      SELECT TOP 1 CONVERT(VARCHAR(20), GETDATE(), 120) INTO :ls_sysdate FROM master.dbo.spt_values;
   case else
      ld_today   = Today()
      lt_now     = now()
      ls_sysdate = string(Datetime(ld_today, lt_now), "yyyy-mm-dd hh:mm:ss")
end choose

RETURN ls_sysdate
end function

public function integer of_sortinteger (ref integer ai_sort[]);/*------------------------------------------------------------------------------------------------*
   integer of_SortInteger ( integer ai_sort[] )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - Integer배열을 ASC로 정렬해주는 함수 입니다.
                                - of_SortInteger( {3,5,1,7,4,2,8,9} )  =>  {1,2,3,4,5,7,8,9}
                                - 0 Fail, 1 Success
 *------------------------------------------------------------------------------------------------*/
integer  li_for
integer  li_bound
integer  li_subfor
integer  li_max
integer  li_tmp
integer  li_tmpsort[]
integer  li_tmpArr

try
   li_bound = UpperBound( ai_sort )

   IF li_bound < 2 THEN RETURN -1

   for li_for = li_bound to 1 STEP -1
      li_tmp = -32768
      for li_subfor = li_bound to 1 STEP -1
         IF li_for = li_subfor THEN CONTINUE
         li_max = MAX( ai_sort[li_for], ai_sort[ li_subfor ] )

         IF li_tmp < li_max THEN
            IF li_max = ai_sort[ li_for ] THEN
               li_tmpsort[ li_for ] = ai_sort[ li_for ]
               li_tmpArr = li_for
            ELSE
               li_tmpsort[ li_for ] = ai_sort[ li_subfor ]
               li_tmpArr = li_subfor
            END IF
            li_tmp = li_max
         END IF
      next
      ai_sort[ li_tmpArr ] = -32768
   next

   ai_sort = li_tmpsort

catch (RunTimeError rte)
   of_systemerrordisplay ( rte )
end try

RETURN 1
end function

public function boolean of_isbizno (string as_bizno);/*------------------------------------------------------------------------------------------------*
   boolean  of_isBizNo ( string as_bizno )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   as_source의 값이 사업자번호 체계를 만족하는지 체크..
   of_isBizNo( "1231223829" )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_bizno           사업자번호
 *------------------------------------------------------------------------------------------------*/
integer  li_bizno[10], li_chkvalue[9] = {1,3,7,1,3,7,1,3,5}
integer  li_sum, li_mod, ls_bizno_chk
long     n

IF of_IsEmpty( as_bizno ) THEN RETURN TRUE

for n = 1 to 10
   li_bizno[n] = integer(mid(as_bizno, n, 1))
next

for n = 1 to 9
   li_sum += li_bizno[n] * li_chkvalue[n]
next

li_sum = li_sum + ((li_bizno[9] * 5) / 10)

li_mod = mod(li_sum, 10)

IF li_mod = 0 THEN
   ls_bizno_chk = 0
ELSE
   ls_bizno_chk = 10 - li_mod
END IF

IF ls_bizno_chk = li_bizno[10] THEN
   RETURN TRUE
END IF
RETURN FALSE
end function

public function boolean of_iscprno (string as_cprno);/*------------------------------------------------------------------------------------------------*
   boolean  of_isCPRNo ( string as_cprno )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   as_cprno 값이 법인번호 체계를 만족하는지 체크..
   of_isCPRNo( "111221-0000074" )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_cprno           법인번호
 *------------------------------------------------------------------------------------------------*/
integer  li_cprno[13], li_chkvalue[12] = {1,2,1,2,1,2,1,2,1,2,1,2}
integer  li_sum, li_mod, ls_bizno_chk
long     n

IF of_IsEmpty( as_cprno ) THEN RETURN TRUE

for n = 1 to 13
   li_cprno[n] = integer(mid(as_cprno, n, 1))
next

for n = 1 to 12
   li_sum += li_cprno[n] * li_chkvalue[n]
next

li_mod = 10 - mod(li_sum, 10)

IF li_mod = 0 OR li_mod = 10 THEN
   ls_bizno_chk = 0
ELSE
   ls_bizno_chk = li_mod
END IF

IF ls_bizno_chk = li_cprno[13] THEN
   RETURN TRUE
END IF
RETURN FALSE
end function

public function boolean of_isjuminno (string as_juminno);/*------------------------------------------------------------------------------------------------*
   boolean  of_isJuminNo ( string as_juminno )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   as_juminno 값이 주민등록번호 체계를 만족하는지 체크..
   of_isJuminNo( "111221-0000074" )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_juminno           주민등록번호 OR 외국인등록번호
 *------------------------------------------------------------------------------------------------*/
integer  li_juminno[13], li_juminno_calc[12], li_chkvalue[12] = {2,3,4,5,6,7,8,9,2,3,4,5}
integer  li_sum, li_mod
long     n, ll_odd

IF of_IsEmpty( as_juminno ) THEN RETURN TRUE

for n = 1 to 13
   li_juminno[n] = integer(mid(as_juminno, n, 1))
next

for n = 1 to 12
   li_juminno_calc[n] = li_juminno[n] * li_chkvalue[n]
next

IF li_juminno[7] = 9 OR li_juminno[7] = 0 THEN RETURN FALSE

// 내국인.외국인 공통..
li_sum = 0
for n = 1 to 12
   li_sum += li_juminno_calc[n]
next
li_sum = 11 - mod(li_sum, 11)

choose case li_juminno[7]
   case 5, 6, 7, 8         // 외국인 번호
      ll_odd = (li_juminno[8] * 10) + li_juminno[9]

      IF mod(ll_odd, 2) <> 0 THEN RETURN FALSE

      // li_juminno[12] IN ( 6, 7, 8, 9 ) 면 OK
      IF li_juminno[12] < 6 THEN RETURN FALSE

      // li_sum 사용
      li_sum = mod(li_sum, 10)

      li_sum += 2
end choose

li_sum = mod(li_sum, 10)

IF li_sum <> li_juminno[13] THEN RETURN FALSE

RETURN TRUE
end function

public function long of_getcode (ref powerobject apo, readonly string as_separator, readonly string as_code[]);/*------------------------------------------------------------------------------------------------*
   long of_getCode( ref powerobject apo, string as_separator, string as_code[] )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 공통코드로 부터 코드와 명칭을 조회 후 datastore에 값을 담는다.
   - of_getCode( gs_code, "ALL", { "B100", "Z100" } )
  -------------------------------------------------------------------------------------------------
   Parameters:
   apo               공통코드와 명칭을 저장할 DataStore
   as_separator      SQL분기관련 구분자
   as_code[]         공통코드 대분류코드열.
 *------------------------------------------------------------------------------------------------*/
long          n, ll_rcnt, ll_bound
string        ls_syntax, ls_condition, ls_column[]
str_parm      lstr_parm

IF NOT IsValid(apo) THEN
   MessageBox( "확인", "OBJECT를 확인하세요!", Exclamation! )
   RETURN -1
END IF

ll_bound = UpperBound( as_code )

ls_condition = ""
IF ll_bound > 0 THEN
   for n = 1 to ll_bound
      IF n > 1 THEN ls_condition += ", "
      ls_condition += "'" + Upper(Trim( as_code[n] )) + "'"
   next
END IF

choose case Upper( as_separator )
   case "ALL"
      ls_syntax = "SELECT  comm_cd, code_nm, prnt_cd, str_val, num_val, use_yn, sys_yn FROM TB_CODE" &
                + " WHERE  prnt_cd <> '0'" &
                + " ORDER  BY prnt_cd, comm_cd, order_no"
   case "PART"
      ls_syntax = "SELECT  comm_cd, code_nm, prnt_cd, str_val, num_val, use_yn, sys_yn FROM TB_CODE" &
                + " WHERE  comm_cd IN (" + ls_condition + ")" &
                + "   AND  prnt_cd <> '0'" &
                + " ORDER  BY prnt_cd, comm_cd, order_no"
   case else
      MessageBox( "확인", "구분자를 확인하세요!", Exclamation! )
      RETURN 0
end choose

// Execute SQL
ll_rcnt = of_runSQL( ls_syntax, lstr_parm )

// sql select절에서 컬럼 갯수와 컬럼명 추출..
ll_bound = of_GetSQLDWInfo( apo, ls_syntax, ls_column )

// 조회결과값을 apo에 담는다.
RETURN of_setCode( apo, lstr_parm, ll_bound )
end function

public function long of_getcode (ref powerobject apo, readonly string as_separator);string  ls_code[]

RETURN of_getCode( apo, as_separator, ls_code )
end function

public function long of_setcode (ref powerobject apo, readonly str_parm astr_parm, long al_colcnt);/*------------------------------------------------------------------------------------------------*
   long of_setCommCode( ref powerobject apo, str_parm astr_parm, long al_colcnt )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 조회된 코드값, 명으로 apo에 값을 설정한다.
   - gfn.of_setCommCode( gs_code, str_parm, 2 )
  -------------------------------------------------------------------------------------------------
   Parameters:
   apo               공통코드와 명칭을 저장할 DataStore
   astr_parm         조회된 코드값, 명을 가지고 있는 배열.
   al_colcnt         DataStore의 컬럼갯수
 *------------------------------------------------------------------------------------------------*/
long     n, ll_row, ll_rcnt

try
   ll_rcnt = UpperBound( astr_parm.args01 )

   IF al_colcnt <= 0 THEN al_colcnt = 2

   IF ll_rcnt > 0 THEN
      apo.DYNAMIC Reset()

      for n = 1 to ll_rcnt
         ll_row = apo.DYNAMIC InsertRow(0)

         gdf.of_SetItem( apo, ll_row, "col1", astr_parm.args01[ n ] )
         gdf.of_SetItem( apo, ll_row, "col2", astr_parm.args02[ n ] )

         IF al_colcnt > 2 THEN gdf.of_SetItem( apo, ll_row, "col3", astr_parm.args03[ n ] )
         IF al_colcnt > 3 THEN gdf.of_SetItem( apo, ll_row, "col4", astr_parm.args04[ n ] )
         IF al_colcnt > 4 THEN gdf.of_SetItem( apo, ll_row, "col5", astr_parm.args05[ n ] )
         IF al_colcnt > 5 THEN gdf.of_SetItem( apo, ll_row, "col6", astr_parm.args06[ n ] )
         IF al_colcnt > 6 THEN gdf.of_SetItem( apo, ll_row, "col7", astr_parm.args07[ n ] )
         IF al_colcnt > 7 THEN gdf.of_SetItem( apo, ll_row, "col8", astr_parm.args08[ n ] )
         IF al_colcnt > 8 THEN gdf.of_SetItem( apo, ll_row, "col9", astr_parm.args09[ n ] )
         IF al_colcnt > 9 THEN gdf.of_SetItem( apo, ll_row, "num1", astr_parm.args10[ n ] )
      next
   END IF
catch (RunTimeError rte)
   of_systemerrordisplay ( rte )
end try
RETURN ll_rcnt
end function

public function integer of_timerstart (readonly powerobject apo, readonly string as_event, readonly integer ai_interval);/*------------------------------------------------------------------------------------------------*
   integer of_timerstart ( powerobject apo, string as_event, integer ai_interval )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 외부 오브젝트의 이벤트를 일정시간 간격으로 반복한다.
                                - 이벤트는 user Event로 만들고 넘긴다.
                                - 간격은 초 단위로 한다.
                                - of_timerstart( apo, as_event, ai_interval )
 *------------------------------------------------------------------------------------------------*/
boolean  lb_Running = FALSE
double   ldb_time
integer  li_ret = 1

IF of_IsEmpty( as_event ) THEN
   is_TimerEvent = as_event
END IF

IF of_IsEmpty( is_TimerEvent ) THEN
   RETURN -1
END IF

try
   IF NOT IsValid( in_time ) THEN
      in_time = CREATE n_timing
   END IF

   IF IsValid( in_time ) THEN
      IF IsValid( apo ) THEN
         ipo_Time = apo
      ELSE
         ipo_Time = this
      END IF
   ELSE
      li_ret = -1
   END IF
   IF li_ret > 0 THEN
      lb_Running = of_GetTimerStatus()
      IF lb_Running THEN
         of_timerStop()
      END IF
      in_time.of_setParent( ipo_Time, is_TimerEvent )
      ldb_time = ( ai_interval / 1000 )
      li_ret = in_time.Start( ldb_time )
   END IF
catch (RunTimeError rte)
   // 실행 중 에러가 발행 하면
   li_ret = of_systemerrordisplay ( rte )
end try
RETURN li_ret
end function

public function integer of_timerstart (readonly powerobject apo, readonly integer ai_interval);/*------------------------------------------------------------------------------------------------*
   integer of_timerstart ( powerobject apo, integer ai_interval )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 외부 오브젝트의 이벤트를 일정시간 간격으로 반복한다.
                                - 이벤트는 user Event로 만들고 넘긴다.
                                - 간격은 초 단위로 한다.
                                - of_timerstart( apo, as_event, ai_interval )
 *------------------------------------------------------------------------------------------------*/
RETURN of_timerstart( apo, is_TimerEvent, ai_interval )
end function

public function boolean of_gettimerstatus ();RETURN in_time.Running
end function

public function integer of_timerstop ();/*------------------------------------------------------------------------------------------------*
   integer of_timerStop ( )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - of_timerstart() 이벤트로 일정시간 간격으로 반복하는것을 중지한다.
 *------------------------------------------------------------------------------------------------*/
integer  li_ret

try
   IF NOT IsValid( in_time ) THEN RETURN -1

   IF NOT IsValid( ipo_Time ) THEN RETURN -1

   IF of_getTimerStatus() THEN
      in_time.Stop()
   END IF
catch (RunTimeError rte)
   // 실행 중 에러가 발행 하면
   li_ret = of_systemerrordisplay ( rte )
end try
RETURN li_ret
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

FileClose( li_ret )

RETURN 1
end function

public function integer of_filewrite (string as_file, blob ab_file);RETURN of_FileWrite( as_file, ab_file, TRUE )
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

public function integer of_filewrite (any aa_msg);RETURN of_FileWrite( gs_LogFile, aa_msg )
end function

on n_svc_function.create
call super::create
end on

on n_svc_function.destroy
call super::destroy
end on

