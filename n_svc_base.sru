$PBExportHeader$n_svc_base.sru
$PBExportComments$Base Object
forward
global type n_svc_base from nonvisualobject
end type
end forward

global type n_svc_base from nonvisualobject
end type
global n_svc_base n_svc_base

forward prototypes
public function string of_format (readonly string as_source, readonly string as_params[])
public function string of_getstring (string as_source, string as_delimiter, long al_pos)
public function string of_gettoken (ref string as_source, readonly string as_separator)
public function string of_globalreplace (string as_source, string as_old, string as_new, readonly boolean ab_ignorecase)
public function string of_globalreplace (string as_source, string as_old, string as_new)
public function any of_iif (readonly boolean ab_expression, readonly any aa_true, readonly any aa_false)
public function boolean of_isempty (any aa_source)
public function boolean of_iserrorstring (readonly string as_string)
public function boolean of_isnull (any aa_source)
public function boolean of_isnull (any aa_source, readonly boolean ab_space)
public function any of_nvl (readonly any aa_source, readonly any aa_target)
public function long of_parsetoarray (string as_source, readonly string as_delimiter, ref string as_parsingitems[])
public function long of_stringposarray (readonly string as_source, readonly string as_array[])
public function integer of_systemerrordisplay (readonly runtimeerror ae_error)
end prototypes

public function string of_format (readonly string as_source, readonly string as_params[]);long     n, ll_count
string   ls_msg

ll_count = UpperBound(as_params)

ls_msg = as_source

FOR n = 1 to ll_count
   ls_msg = of_GlobalReplace( ls_msg, "{" + STRING(n) + "}", as_params[n] )
NEXT

RETURN ls_msg
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

IF of_isnull(as_source) OR of_isnull( as_delimiter ) &
                        OR isnull( al_pos ) OR al_pos = 0 THEN
   RETURN as_source
ELSE
   nLen = Len( as_delimiter )
END IF

IF right(as_source, nLen) <> as_delimiter THEN
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
   ls_data[p] = Mid( as_source, n, ll_pos - n )
LOOP

IF al_pos > p THEN RETURN ""

RETURN ls_data[al_pos]
end function

public function string of_gettoken (ref string as_source, readonly string as_separator);/*------------------------------------------------------------------------------------------------*
   string of_getToken (string as_source, string as_separator )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2013.03.31                   - as_source에서 as_separator를 찾아 as_separator 이후 문자열을 리턴.
                                - of_getToken( ls_ret, ls_sep )
                                - of_getToken( "12,ABC,33,abc", "," ) RETURN "ABC,33,abc"
 *------------------------------------------------------------------------------------------------*/
long     ll_pos
string   ls_ret, ls_null

IF (isnull(as_source) OR isnull(as_separator)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF
ll_pos = Pos( as_source, as_separator )
IF ll_pos = 0 THEN
   ls_ret = as_source
   as_source = ""
ELSE
   ls_ret = mid(as_source, 1, ll_pos - 1)
   as_source = right(as_source, len(as_source) - (ll_pos + len(as_separator) - 1))
END IF
RETURN ls_ret
end function

public function string of_globalreplace (string as_source, string as_old, string as_new, readonly boolean ab_ignorecase);/*------------------------------------------------------------------------------------------------*
   string of_globalReplace ( string as_source, string as_old, string as_new, boolean ab_ignorecase )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 특정문자를 원하는 문자로 변경한다.
                                - of_globalReplace( 'xyz', 'z', 'Z', TRUE )
 *------------------------------------------------------------------------------------------------*/
long     ll_start
long     ll_oldlen
long     ll_newlen
string   ls_source
string   ls_null

IF (((isnull(as_source) OR isnull(as_old)) OR isnull(as_new)) OR isnull(ab_ignorecase)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF
ll_oldlen = len(as_old)
ll_newlen = len(as_new)
IF ab_ignorecase THEN
   as_old = lower(as_old)
   ls_source = lower(as_source)
ELSE
   ls_source = as_source
END IF
ll_start = Pos(ls_source,as_old)
DO WHILE ll_start > 0
   as_source = Replace(as_source, ll_start, ll_oldlen, as_new)
   IF ab_ignorecase THEN
      ls_source = lower(as_source)
   ELSE
      ls_source = as_source
   END IF
   ll_start = Pos(ls_source, as_old, ll_start + ll_newlen)
LOOP
RETURN as_source
end function

public function string of_globalreplace (string as_source, string as_old, string as_new);/*------------------------------------------------------------------------------------------------*
   string of_globalReplace ( string as_source, string as_old, string as_new )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-03-21                   - 특정문자를 원하는 문자로 변경한다.
                                - of_globalReplace( 'xyz', 'z', 'Z' )
 *------------------------------------------------------------------------------------------------*/
string   ls_null

IF ((isnull(as_source) OR isnull(as_old)) OR isnull(as_new)) THEN
   setnull(ls_null)
   RETURN ls_null
END IF

as_source = of_globalReplace(as_source, as_old, as_new, TRUE)

RETURN as_source
end function

public function any of_iif (readonly boolean ab_expression, readonly any aa_true, readonly any aa_false);/*------------------------------------------------------------------------------------------------*
   any of_iif ( boolean ab_expression, any aa_true, any aa_false )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - ab_expression값이 참일때, 거짓일때 값 리턴.
   - of_iif( '1' = '2', 'TRUE', 'FALSE' )  => 'FALSE' 리턴
  -------------------------------------------------------------------------------------------------
   Parameters:
   ab_expression         표현식
   aa_true               표현식이 참일때 리턴값
   aa_false              표현식이 거짓일때 리턴값
 *------------------------------------------------------------------------------------------------*/
IF ab_expression THEN
   RETURN aa_true
ELSE
   RETURN aa_false
END IF
end function

public function boolean of_isempty (any aa_source);/*------------------------------------------------------------------------------------------------*
   boolean of_IsEmpty ( any aa_source )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 대상을 넘겨 Null 여부를 체크 (Trim 사용 )
   - of_IsEmpty( "" )  => TRUE
   - of_IsEmpty( " " ) => TRUE
  -------------------------------------------------------------------------------------------------
   Parameters:
   aa_source         Null체크 대상
 *------------------------------------------------------------------------------------------------*/
try
   IF (isnull(aa_source) OR trim(string(aa_source)) = "" OR len(trim(string(aa_source))) = 0) THEN
      RETURN TRUE
   END IF
catch(RuntimeError rte)
   MessageBox( "Error", rte.getMessage(), StopSign! )
end try
RETURN FALSE
end function

public function boolean of_iserrorstring (readonly string as_string);/*------------------------------------------------------------------------------------------------*
   boolean of_IsErrorString ( string as_string )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - DataWindowd에서 Error String포함여부체크
   - of_iserrorstring( "!" )  => TRUE
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_string         Error String포함 문자
 *------------------------------------------------------------------------------------------------*/
RETURN (as_string = "!" OR as_string = "?")
end function

public function boolean of_isnull (any aa_source);RETURN of_isnull( aa_source, TRUE )
end function

public function boolean of_isnull (any aa_source, readonly boolean ab_space);/*------------------------------------------------------------------------------------------------*
   boolean of_isnull ( any aa_source, boolean ab_space )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - 대상을 넘겨 Null 여부를 체크 ( Trim없음 )
   - of_isnull( " ", TRUE  ) => NULL TRUE
   - of_isnull( " ", FALSE ) => NULL FALSE
  -------------------------------------------------------------------------------------------------
   Parameters:
   aa_source         Null체크 대상
   ab_space          Space도 NULL로 처리
 *------------------------------------------------------------------------------------------------*/
try
   IF (isnull(aa_source) OR STRING(aa_source) = "") THEN
      RETURN TRUE
   END IF
   IF ab_space THEN
      IF (trim(STRING(aa_source)) = "" OR len(trim(STRING(aa_source))) = 0) THEN
         RETURN TRUE
      END IF
   END IF
catch(RuntimeError rte)
   MessageBox( "Error", rte.getMessage(), StopSign! )
end try
RETURN FALSE
end function

public function any of_nvl (readonly any aa_source, readonly any aa_target);/*------------------------------------------------------------------------------------------------*
   any of_nvl ( any aa_source, any aa_target )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - aa_source 값이 NULL이면 aa_target 리턴, 아니면 aa_source 리턴.
   - of_nvl( 'TRUE', 'FALSE' )  => 'TRUE' 리턴
  -------------------------------------------------------------------------------------------------
   Parameters:
   aa_source         Null체크 대상
   aa_target         aa_source가 NULL일때 넘겨받을 값.
 *------------------------------------------------------------------------------------------------*/
IF of_IsEmpty( aa_source ) THEN
   RETURN aa_target
END IF
RETURN aa_source
end function

public function long of_parsetoarray (string as_source, readonly string as_delimiter, ref string as_parsingitems[]);/*------------------------------------------------------------------------------------------------*
    of_parseToArray (
                     string          as_source            - 원래의 문자열
                     string          as_delimiter         - 문자열안의 분리자
                 ref string          as_parsingitems[]    - 나뉘어진 문자열들을 저장하는 배열
                    )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2013.03.31                   - 해당문자열의 token을 찾아 문자열을 나누어 array이에 저장하여 넘김
                                - 해당문자열의 특수문자열을 찾아 문자열을 나누어 문자배열에 저장
                                - 공백은 제거하지 않음
                                - <-> of_array2String()
 *------------------------------------------------------------------------------------------------*/
long  ll_start = 1, ll_pos = 1, ll_idx = 1, ll_tokenLen

IF of_IsEmpty( as_source ) THEN RETURN -1

IF (isnull(as_delimiter) OR as_delimiter = "") THEN RETURN -1

ll_tokenLen = len(as_delimiter)

DO WHILE ll_pos <> 0
   ll_pos = Pos(as_source, as_delimiter, ll_start)
   IF ll_pos > 0 THEN
      as_parsingItems[ll_idx] = mid( as_source, ll_start, ll_pos - ll_start )
      ll_start = ll_pos + ll_tokenLen
      ll_idx ++
   END IF
LOOP

as_parsingItems[ll_idx] = mid( as_source, ll_start )

RETURN ll_idx
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

public function integer of_systemerrordisplay (readonly runtimeerror ae_error);/*------------------------------------------------------------------------------------------------*
   integer of_systemerrordisplay ( RunTimeError ae_Error )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - 작동중 에러 발생한 값을 표시
                                - of_systemerrordisplay( )

   ClassDefinition   PowerObject An object of type PowerObject containing information about the class definition of the object or control
   Class             String   Name of the class where the exception occurred
   DLLName           String   (PBXRuntimeError only) Name of the PowerBuilder extension DLL where the exception occurred
   Line              Integer  Line number where the exception occurred
   Number            Integer  Identifies the PowerBuilder error
   ObjectName        String   Name of the object where the exception occurred
   RoutineName       String   Name of the event or routine where the exception occurred
   Text  String      Text associated with the type of exception
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
string   ls_Message

try
   // 작동중 에러 발생한 값을 표시
   ls_Message = "Err NO: " + string(ae_Error.Number)  + "~r~n"
   ls_Message = "모객체: " + ae_Error.Class           + "~r~n"
   ls_Message = "객  체: " + ae_Error.ObjectName      + "~r~n"
   ls_Message = "이벤트: " + ae_Error.RoutineName     + "~r~n"
   ls_Message = "위  치: " + string(ae_Error.Line)    + "~r~n"
   ls_Message = "안내문: " + ae_Error.Text            + "~r~n"

   MessageBox( "Error", ls_Message, StopSign! )
   li_ret = ae_Error.Number
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay( rte )
end try
RETURN li_ret
end function

on n_svc_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_svc_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

