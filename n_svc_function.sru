$PBExportHeader$n_svc_function.sru
$PBExportComments$Function Sets
forward
global type n_svc_function from n_svc_base
end type
end forward

global type n_svc_function from n_svc_base
end type
global n_svc_function n_svc_function

type prototypes
/* 한영 전환  */
FUNCTION LONG ImmGetContext( long handle ) LIBRARY "IMM32.DLL"
FUNCTION LONG ImmSetConversionStatus( long hIMC, long fFlag, long l ) LIBRARY "IMM32.DLL"
FUNCTION LONG ImmReleaseContext( long handle, long hIMC ) LIBRARY "IMM32.DLL"
end prototypes

type variables

end variables

forward prototypes
public function string of_2bytecut (string as_source, readonly long al_length)
public function string of_addcomma (string as_source)
public function string of_adddate (string as_date, readonly long al_index)
public function string of_addmonth (string as_date, readonly long al_index)
public function long of_array2string (readonly string as_source[], readonly string as_delimiter, readonly boolean ab_processempty, ref string as_ref_string)
public function long of_array2string (readonly string as_source[], readonly string as_delimiter, ref string as_ref_string)
public function long of_countoccurrences (string as_source, string as_target, readonly boolean ab_ignorecase)
public function long of_days_between (string as_frdt, string as_todt)
public function long of_getcode (ref powerobject apo, readonly string as_separator)
public function long of_getcode (ref powerobject apo, readonly string as_separator, readonly string as_code[])
public function long of_getcurrval (readonly string as_table, readonly string as_colname, readonly string as_column[], readonly string as_value[])
public function long of_getnextval (readonly string as_table, readonly string as_colname, readonly string as_column[], readonly string as_value[])
public function string of_getnumber (readonly string as_number)
public function integer of_getparentwindow (ref window aw_parent)
public function string of_getprinterlist (ref string as_printerlist[])
public function long of_getprogrow (ref str_windowparm astr_winparm, readonly string as_classid)
public function long of_getsqlcolumn (string as_sql, ref string as_collist[])
public function boolean of_isbetweendays (string as_sdt, string as_edt, string as_date)
public function boolean of_isdate (string as_date)
public function string of_lastday (string as_date)
public subroutine of_log (any aa_log)
public function integer of_month_between (string as_frym, string as_toym)
public function string of_number2string (readonly double ad_number)
public subroutine of_opensheet (readonly window aw_mdi, string as_window)
public function integer of_opensheet (str_windowparm str_winparm)
public function string of_padleft (string as_source, long al_length)
public function string of_padright (string as_source, long al_length)
public function unsignedlong of_pbcolor (string as_color)
public function string of_remove (string as_source, string as_separator)
public function long of_retrieve (ref datawindow adw, readonly str_parm astr_parm)
public function long of_runsql (readonly string as_sql, ref str_parm astr_parm)
public function long of_runsql (readonly string as_sql, ref str_parm astr_parm, transaction atr)
public function long of_setcode (ref powerobject apo, readonly str_parm astr_parm, long al_colcnt)
public subroutine of_setredraw (readonly datawindow adw, readonly string as_code)
public function integer of_sortinteger (ref integer ai_sort[])
public function date of_stringtodate (readonly string as_date)
public function string of_sysdate ()
public subroutine of_toggle (any aa_object, string as_toggle)
public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator)
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

IF isnull(al_length) OR al_length < 1 THEN RETURN as_source

ll_len = LEN(as_source)

FOR n = 1 to ll_len
   IF Asc(Mid( as_source, n, 1 )) >= 128 THEN
      ls_return = left( as_source, n + 1 )
      n = n + 1
      IF n > al_length THEN
         ls_return = left( ls_return, n - 2 )
      END IF
   ELSE
      ls_return = left(as_source, n)
   END IF
   IF n >= al_length THEN EXIT
NEXT

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

IF of_isnull(ls_num) THEN RETURN ""

IF NOT IsNumber(ls_num) THEN RETURN ls_num

li_len     = Len(ls_num)
li_portion = li_len / 3
li_mod     = Mod(li_len, 3)

j = li_mod + 1

ls_return = left( ls_num, li_mod )

FOR i = 1 to li_portion
   IF Len( ls_return ) = 0 THEN
      ls_return = Mid( ls_num, j, 3 )
   ELSE
      ls_return = ls_return + "," + Mid( ls_num, j, 3 )
   END IF
   j = j + 3
NEXT

RETURN ls_return
end function

public function string of_adddate (string as_date, readonly long al_index);/*------------------------------------------------------------------------------------------------*
   string of_AddDate ( string as_date, long al_index )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07                   - as_date 일자에 al_index를 더한(+-) 일자를 리턴.
                                - of_addDate( "20140320", -1 )  RETURN "20140319"
 *------------------------------------------------------------------------------------------------*/
date     ld_date
string   ls_date, ls_return

IF of_isnull( as_date ) THEN RETURN as_date

IF Len( as_date ) <> 8 THEN RETURN as_date

IF NOT IsNumber( as_date ) THEN RETURN as_date

ls_date = STRING(as_date, CString.DATEFORMAT)

ld_date = Date( ls_date )

ld_date = RelativeDate( ld_date, al_index )

RETURN STRING( ld_date, "yyyymmdd" )
end function

public function string of_addmonth (string as_date, readonly long al_index);/*------------------------------------------------------------------------------------------------*
   string of_addMonth ( string as_date, long al_index )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_date 년월(일)에 al_index를 더한(+-) 년월을 리턴.
                                - of_addMonth( "20140320", -1 )  RETURN "20140220"
 *------------------------------------------------------------------------------------------------*/
long     ll_cnt
string   ls_date, ls_yy, ls_mm, ls_dd

IF of_isnull( as_date ) THEN RETURN ""

IF (Len(as_date) > 8 OR Len(as_date) < 6) OR al_index = 0 THEN RETURN as_date

ls_yy = mid( as_date, 1, 4 )
ls_mm = mid( as_date, 5, 2 )
ls_dd = mid( as_date, 7, 2 )

IF al_index > 0 THEN
   FOR ll_cnt = 1 to al_index
      IF long(ls_mm) + 1 > 12 THEN
         ls_yy = string(long(ls_yy) + 1)
         ls_mm = "01"
      ELSE
         ls_mm = string(long(ls_mm) + 1, "00")
      END IF
   NEXT
   ls_date = ls_yy + ls_mm + ls_dd
ELSEIF al_index < 0 THEN
   FOR ll_cnt = 1 to Abs(al_index)
      IF long(ls_mm) - 1 < 1 THEN
         ls_yy = string(long(ls_yy) - 1)
         ls_mm = "12"
      ELSE
         ls_mm = string(long(ls_mm) - 1, "00")
      END IF
   NEXT
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
                                - <=> of_parseToArray()
 *------------------------------------------------------------------------------------------------*/
long     n, ll_count

ll_count = UpperBound(as_source)

IF (isNull(as_delimiter) OR  NOT (ll_count > 0)) THEN
   RETURN -1
END IF
as_ref_string = ""
IF  NOT (ab_processempty) THEN
   FOR n = 1 to ll_count
      IF as_source[n] <> "" THEN
         IF len(as_ref_string) = 0 THEN
            as_ref_string = as_source[n]
            CONTINUE
         END IF
         as_ref_string = as_ref_string + as_delimiter + as_source[n]
      END IF
   NEXT
ELSE
   FOR n = 1 to ll_count
      IF ll_count = 1 THEN
         as_ref_string = as_source[n]
         CONTINUE
      END IF
      as_ref_string = as_ref_string + as_delimiter + as_source[n]
   NEXT
END IF
RETURN ll_count
end function

public function long of_array2string (readonly string as_source[], readonly string as_delimiter, ref string as_ref_string);RETURN of_array2String(as_source, as_delimiter, FALSE, as_ref_string)
end function

public function long of_countoccurrences (string as_source, string as_target, readonly boolean ab_ignorecase);/*------------------------------------------------------------------------------------------------*
   long of_countoccurrences ( string as_source, string as_target, readonly boolean ab_ignorecase )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - as_source 문자열에서 as_target의 갯수를 구한다.( 단어 세기)
                                - ab_ignorecase 로 대.소문자 구분
                                - of_countoccurrences( "10,530,000", "0", TRUE ) => RETURN 5
                                - count word
 *------------------------------------------------------------------------------------------------*/
long  n, ll_len, ll_pos

IF ((isnull(as_source) OR isnull(as_target)) OR isnull(ab_ignorecase)) THEN
   RETURN 0
END IF

IF ab_ignorecase THEN
   as_source = lower(as_source)
   as_target = lower(as_target)
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

IF of_isnull( as_frdt ) OR of_isnull( as_todt ) THEN RETURN -1

// 숫자만 추출
as_frdt = of_getNumber(as_frdt)
as_todt = of_getNumber(as_todt)

IF as_frdt > as_todt THEN
   RETURN -1
END IF

ld_fr_dt = Date(STRING(as_frdt, CString.DATEFORMAT))
ld_to_dt = Date(STRING(as_todt, CString.DATEFORMAT))

RETURN DaysAfter( ld_fr_dt, ld_to_dt )
end function

public function long of_getcode (ref powerobject apo, readonly string as_separator);string  ls_code[]

RETURN of_getCode( apo, as_separator, ls_code )
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
   FOR n = 1 to ll_bound
      IF n > 1 THEN ls_condition += ", "
      ls_condition += "'" + Upper(Trim( as_code[n] )) + "'"
   NEXT
END IF

choose case Upper( as_separator )
   case "ALL"
      ls_syntax = "SELECT  comm_cd, code_nm, prnt_cd, str_val, num_val, use_yn, sys_yn FROM TB_CODE" &
                + " WHERE  cpny_cd = '" + gs_CustID + "'" &
                + "   AND  prnt_cd <> '0'" &
                + " ORDER  BY prnt_cd, comm_cd, order_no"
   case "PART"
      ls_syntax = "SELECT  comm_cd, code_nm, prnt_cd, str_val, num_val, use_yn, sys_yn FROM TB_CODE" &
                + " WHERE  cpny_cd = '" + gs_CustID + "'" &
                + "   AND  comm_cd IN (" + ls_condition + ")" &
                + "   AND  prnt_cd <> '0'" &
                + " ORDER  BY prnt_cd, comm_cd, order_no"
   case "USER"
      ls_syntax = "SELECT  user_id, user_nm, 'Z1000', '', 0, use_yn, admin_yn FROM TB_USERS" &
                + " WHERE  cpny_cd = '" + gs_CustID + "'" &
                + " ORDER  BY user_id"
   case "GROUP"
      ls_syntax = "SELECT  group_id, group_nm, 'G1000', '', 0, use_yn, '1' FROM TB_GROUPS" &
                + " WHERE  cpny_cd = '" + gs_CustID + "'" &
                + "   AND  use_yn = '" + gs_Yes + "'" &
                + " ORDER  BY group_id"
   case else
      MessageBox( "확인", "구분자를 확인하세요!", Exclamation! )
      RETURN 0
end choose

// Execute SQL
ll_rcnt = of_runSQL( ls_syntax, lstr_parm )

// sql select절에서 컬럼 갯수와 컬럼명 추출..
ll_bound = of_GetSQLColumn( ls_syntax, ls_column )

// 조회결과값을 apo에 담는다.
RETURN of_setCode( apo, lstr_parm, ll_bound )
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
FOR n = 1 to ll_bound
   IF of_IsEmpty( as_column[n] ) THEN CONTINUE
   IF of_stringPosArray( right( as_value[n], 1 ), { "%" } ) > 0 THEN
      ls_condition = ls_condition + "  AND  " + as_column[n] + " LIKE '" + as_value[n] +  "'"
   ELSE
      ls_condition = ls_condition + "  AND  " + as_column[n] + " = '" + as_value[n] +  "'"
   END IF
NEXT

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

IF isnull( ll_seq ) THEN ll_seq = 0

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

IF of_isnull( as_number ) OR ll_bound <= 0 THEN RETURN "0"

ls_number = ""
DO
   n++
   IF Match( mid(cData, n, 1), "[0-9]" ) THEN
      ls_number = ls_number + mid(cData, n, 1)
   END IF
LOOP WHILE ll_bound > n

RETURN ls_number
end function

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
// Function:  of_GetParentWindow
//
// Access:  public
//
// Arguments:
// aw_parent   The Parent window for this object (passed by reference).
//    If a parent window is not found, aw_parent is NULL
//
// Returns:  integer
//  1 = success
// -1 = error
//
// Description:    Calculates the parent window of a window object
//////////////////////////////////////////////////////////////////////////////
// Revision History
//////////////////////////////////////////////////////////////////////////////
powerobject  lpo_parent

lpo_parent = this.GetParent()

// Loop getting the parent of the object until it is of type window!
DO WHILE IsValid(lpo_parent)
   IF lpo_parent.TypeOf() <> window! THEN
      lpo_parent = lpo_parent.GetParent()
   ELSE
      EXIT
   END IF
LOOP

IF isnull(lpo_parent) OR NOT IsValid(lpo_parent) THEN
   SetNull(aw_parent)
   RETURN -1
END IF

aw_parent = lpo_parent

RETURN 1
end function

public function string of_getprinterlist (ref string as_printerlist[]);// string of_getprinterlist( ref string as_PrinterList[] )
integer  li_i = 0, li_exit = 0
string   ls_printers
string   ls_defaultprint
string   ls_PrinterList[]

as_PrinterList = ls_PrinterList

// 프린터 리스트
ls_printers = PrintGetPrinters()
DO WHILE TRUE
   IF Pos(ls_printers, CString.CR) > 0 THEN
      ls_defaultprint = left(ls_printers, Pos(ls_printers, CString.CR) - 1 )
      ls_printers = mid(ls_printers, Pos(ls_printers, CString.CR) + 1 )
   ELSE
      ls_defaultprint = ls_printers
      li_exit = 1
   END IF
   ls_defaultprint = left(ls_defaultprint, Pos(ls_defaultprint, CString.TAB) - 1 )
   li_i = UpperBound( as_PrinterList ) + 1 
   as_PrinterList[li_i] = ls_defaultprint
   IF li_exit > 0 THEN EXIT
LOOP
// 기본프린터 가져오기
ls_defaultprint = PrintGetPrinter()
ls_defaultprint = left(ls_defaultprint, Pos(ls_defaultprint, CString.TAB) - 1 )

RETURN ls_defaultprint
end function

public function long of_getprogrow (ref str_windowparm astr_winparm, readonly string as_classid);// of_GetProgRow( lstr_winparm, "w_1020" )
IF of_IsEmpty( as_classID ) THEN RETURN 0
long  ll_row

ll_row = gdf.of_FindRow( gds_prog, "prog_id", as_classID )

IF ll_row > 0 THEN
   astr_winparm.ClassName = as_classID
   astr_winparm.Title     = gds_prog.object.prog_nm[ll_row]
   astr_winparm.Authority = gds_prog.object.auth   [ll_row]
   astr_winparm.Parms     = ""
END IF

RETURN ll_row
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

IF of_isnull( as_sql ) THEN RETURN -1

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

public function boolean of_isbetweendays (string as_sdt, string as_edt, string as_date);// of_isbetweendays( "20150201", "20150228", "20140517" ) RETURN FALSE
IF NOT of_IsDate( as_sdt ) THEN RETURN FALSE
IF NOT of_IsDate( as_edt ) THEN RETURN FALSE
IF NOT of_IsDate( as_date ) THEN RETURN FALSE

IF as_sdt > as_edt THEN
   MessageBox("확인", "시작일이 종료일보다 큽니다", Exclamation!)
   RETURN FALSE
END IF

RETURN (as_date >= as_sdt AND as_date <= as_edt)
end function

public function boolean of_isdate (string as_date);// of_isDate( "20140517" )
IF of_IsNull( as_date ) THEN RETURN FALSE

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

RETURN IsDate( STRING(as_date, CString.DATEFORMAT) )
end function

public function string of_lastday (string as_date);date     ld_date
integer  li_yy, li_mm
string   ls_dt

ls_dt = as_date

IF of_isnull( ls_dt ) THEN
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

ld_date = RelativeDate(Date(ls_dt), -1)

RETURN string(ld_date, "yyyymmdd")
end function

public subroutine of_log (any aa_log);IF gs_DebugMode = "0" THEN RETURN
string   ls_log

// 1.Log File Write, 2.Log Popup
IF ClassName(aa_log) = "string" THEN
   ls_log = aa_log
ELSE
   ls_log = string( aa_log )
END IF
msg( inf, ls_log )

end subroutine

public function integer of_month_between (string as_frym, string as_toym);/*------------------------------------------------------------------------------------------------*
   integer of_month_Between( string as_frym, string as_toym )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 두 년월 사이의 개월수를 계산한다.
   - of_month_Between( "201301", "201404" )
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

public function string of_number2string (readonly double ad_number);/*------------------------------------------------------------------------------------------------*
   string of_number2string( double ad_number )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 숫자금액을 한글금액으로 변환(일경 단위까지)
   - of_number2string( 1054000 )
   - retrun : "일백오만사천"
  -------------------------------------------------------------------------------------------------
   Parameters:
   ad_number        숫자금액
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

public function integer of_opensheet (str_windowparm str_winparm);integer  li_ret
long     n, ll_bound
w_sheet  lw_window

li_ret = w_frame.uo_powerdock.of_opendocument(lw_window, str_winparm.classname, str_winparm, str_winparm.title, "Tab!")

IF li_ret = -1 THEN
   IF NOT of_IsEmpty( str_winparm.parms ) THEN
      ll_bound = UpperBound( w_frame.uo_powerdock.uo_powerdocktab.ist_tabs )
      FOR n = 1 to ll_bound
         IF str_winparm.classname = w_frame.uo_powerdock.uo_powerdocktab.ist_tabs[n].as_classname THEN
            EXIT
         END IF
      NEXT
//      w_frame.uo_powerdock.uo_powerdocktab.ist_tabs[n].aw_window.TriggerEvent( str_winparm.eventname )
   END IF
END IF
RETURN li_ret
end function

public function string of_padleft (string as_source, long al_length);/*------------------------------------------------------------------------------------------------*
   string of_padLeft ( string as_source, long al_length )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07                   - 문자의 길이만큼 왼쪽을 space로 채운다.
                                - of_padLeft( "2000", 7 )  RETURN "   2000"
 *------------------------------------------------------------------------------------------------*/
string   ls_null

IF (isnull(as_source) OR isnull(al_length)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF
IF al_length <= len(as_source) THEN
   RETURN as_source
END IF

RETURN (space(al_length - len(as_source)) + as_source)
end function

public function string of_padright (string as_source, long al_length);/*------------------------------------------------------------------------------------------------*
   string of_padRight ( string as_source, long al_length )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07                   - 문자의 길이만큼 오른쪽을 space로 채운다.
                                - of_padRight( "2000", 7 )  RETURN "2000   "
 *------------------------------------------------------------------------------------------------*/
string   ls_null

IF (isnull(as_source) OR isnull(al_length)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF
IF al_length <= len(as_source) THEN
   RETURN as_source
END IF

RETURN (as_source + space(al_length - len(as_source)))
end function

public function unsignedlong of_pbcolor (string as_color);/*------------------------------------------------------------------------------------------------*
   unsignedlong of_PBColor ( string as_color )
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

IF of_isnull(as_color) THEN RETURN RGB(255,255,255)

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
      li_red   = integer( ls_color[1] )
      li_green = integer( ls_color[2] )
      li_blue  = integer( ls_color[3] )
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

as_source  = as_source + as_separator
ll_charCnt = Len( as_source )
ll_len = Len( as_separator )

ls_dest = ""
ll_jj   = 1

FOR ll_ii = 1 to ll_charCnt
   IF mid( as_source, ll_ii, ll_len ) = as_separator THEN
      ls_addData = mid( as_source, ll_jj, ll_ii - ll_jj )
      ls_dest = ls_dest + ls_addData

      ls_addData = ""
      ll_jj = ll_ii + ll_len
   END IF
NEXT

RETURN ls_dest
end function

public function long of_retrieve (ref datawindow adw, readonly str_parm astr_parm);/*------------------------------------------------------------------------------------------------*
   long of_retrieve (datawindow adw, str_parm astr_parm)
  -------------------------------------------------------------------------------------------------
   Date(mm.dd.yyyy) Author        Description
  -------------------------------------------------------------------------------------------------
   05.10.2004       Jong Yin Park
 *------------------------------------------------------------------------------------------------*/
long     ll_rcnt

of_SetRedraw(adw, "S")

choose case UpperBound(astr_parm.argument)
   case 0
      ll_rcnt = adw.Retrieve()
   case 1
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1]        &
                            )
   case 2
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2]        &
                            )
   case 3
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3]        &
                            )
   case 4
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4]        &
                            )
   case 5
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5]        &
                            )
   case 6
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5],       &
                             astr_parm.argument[6]        &
                            )
   case 7
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5],       &
                             astr_parm.argument[6],       &
                             astr_parm.argument[7]        &
                            )
   case 8
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5],       &
                             astr_parm.argument[6],       &
                             astr_parm.argument[7],       &
                             astr_parm.argument[8]        &
                            )
   case 9
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5],       &
                             astr_parm.argument[6],       &
                             astr_parm.argument[7],       &
                             astr_parm.argument[8],       &
                             astr_parm.argument[9]        &
                            )
   case 10
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5],       &
                             astr_parm.argument[6],       &
                             astr_parm.argument[7],       &
                             astr_parm.argument[8],       &
                             astr_parm.argument[9],       &
                             astr_parm.argument[10]       &
                            )
   case 11
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5],       &
                             astr_parm.argument[6],       &
                             astr_parm.argument[7],       &
                             astr_parm.argument[8],       &
                             astr_parm.argument[9],       &
                             astr_parm.argument[10],      &
                             astr_parm.argument[11]       &
                            )
   case 12
      ll_rcnt = adw.Retrieve(                             &
                             astr_parm.argument[1],       &
                             astr_parm.argument[2],       &
                             astr_parm.argument[3],       &
                             astr_parm.argument[4],       &
                             astr_parm.argument[5],       &
                             astr_parm.argument[6],       &
                             astr_parm.argument[7],       &
                             astr_parm.argument[8],       &
                             astr_parm.argument[9],       &
                             astr_parm.argument[10],      &
                             astr_parm.argument[11],      &
                             astr_parm.argument[12]       &
                            )
   case else
      of_SetRedraw(adw, "E")
      MessageBox("확인", "조건은 최대 12개까지 입니다!", Exclamation!)
      RETURN -1
end choose

// 조회 끝.
of_SetRedraw(adw, "E")
/*------------------------------------------------------------------------------------------------*
   RETURN
 *------------------------------------------------------------------------------------------------*/
IF ll_rcnt > 0 THEN
   msgl(string(ll_rcnt, "#,##0") + " 건 조회되었습니다.")
ELSE
   msgl("자료가 존재하지 않습니다.")
END IF

adw.SetFocus()

RETURN ll_rcnt
end function

public function long of_runsql (readonly string as_sql, ref str_parm astr_parm);RETURN of_runSQL( as_sql, astr_parm, SQLCA )
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

public function long of_setcode (ref powerobject apo, readonly str_parm astr_parm, long al_colcnt);/*------------------------------------------------------------------------------------------------*
   long of_setCommCode( ref powerobject apo, str_parm astr_parm, long al_colcnt )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 조회된 코드값, 명으로 apo에 값을 설정한다.
   - of_setCommCode( gs_code, str_parm, 2 )
  -------------------------------------------------------------------------------------------------
   Parameters:
   apo               공통코드와 명칭을 저장할 DataStore
   astr_parm         조회된 코드값, 명을 가지고 있는 배열.
   al_colcnt         DataStore의 컬럼갯수
 *------------------------------------------------------------------------------------------------*/
long  n, ll_row, ll_rcnt

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

public subroutine of_setredraw (readonly datawindow adw, readonly string as_code);/*------------------------------------------------------------------------------------------------*
   of_SetRedraw(datawindow adw, string as_code) return NONE
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.09       PowerBuilder  RetrieveStart/RetrieveEnd
 *------------------------------------------------------------------------------------------------*/
choose case Upper(as_code)
   case "S" // 조회 시작
      SetPointer(HourGlass!)
      adw.SetRedraw(FALSE)
      adw.Reset()
   case "E" // 조회 종료
      adw.SetRedraw(TRUE)
      SetPointer(Arrow!)
end choose
end subroutine

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

   FOR li_for = li_bound to 1 STEP -1
      li_tmp = -32768
      FOR li_subfor = li_bound to 1 STEP -1
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
      NEXT
      ai_sort[ li_tmpArr ] = -32768
   NEXT

   ai_sort = li_tmpsort

catch (RunTimeError rte)
   of_systemerrordisplay ( rte )
end try

RETURN 1
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

IF of_isnull( as_date ) THEN RETURN ld_date

ls_date = of_getNumber( as_date )

IF len(ls_date) <> 8 THEN RETURN ld_date

RETURN Date(STRING(ls_date, CString.DATEFORMAT))
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

public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator);boolean  lb_done=FALSE
integer  li_keyword, li_separator, li_equal
string   ls_keyvalue, ls_source, ls_exact

//Check parameters
IF IsNull(as_source) OR IsNull(as_keyword) OR IsNull(as_separator) THEN
   string  ls_null
   SetNull (ls_null)
   RETURN ls_null
END IF

//Initialize key value
ls_keyvalue = ''

DO WHILE NOT lb_done
   li_keyword = Pos(Lower(as_source), Lower(as_keyword))
   IF li_keyword > 0 THEN
      ls_source = as_source
      as_source = LeftTrim( right( as_source, Len(as_source) - (li_keyword + Len(as_keyword) - 1)))
      // see if this is an exact match.  Either the match will be at the start of the string or
      // the match will be after a separator character.  So check for both cases
      li_equal = li_keyword - len(as_separator)
      If li_equal > 0 Then
         // not the start so see if this is a compound occurance separated by the separator string
         ls_exact = mid( ls_source, li_equal, len(as_separator) )
         IF ls_exact <> as_separator THEN
            // not the separator string so continue looking
            CONTINUE
         END IF
      END IF

      IF left(as_source, 1) = "=" THEN
         li_separator = Pos( as_source, as_separator, 2 )
         IF li_separator > 0 THEN
            ls_keyvalue = mid( as_source, 2, li_separator - 2 )
         ELSE
            ls_keyvalue = mid( as_source, 2 )
         END IF
         ls_keyvalue = trim(ls_keyvalue)
         lb_done = TRUE
      END IF
   ELSE
      lb_done = TRUE
   END IF
LOOP

RETURN ls_keyvalue
end function

on n_svc_function.create
call super::create
end on

on n_svc_function.destroy
call super::destroy
end on

