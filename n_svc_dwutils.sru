$PBExportHeader$n_svc_dwutils.sru
$PBExportComments$DataWindow Function Sets
forward
global type n_svc_dwutils from n_svc_dw
end type
end forward

global type n_svc_dwutils from n_svc_dw
end type
global n_svc_dwutils n_svc_dwutils

type variables
Private:
// DataWindow Table공통...
CONSTANT string ARROW_ASCENDING = "t"
CONSTANT string ARROW_DESCENDING = "u"
CONSTANT string HEADER_HEIGHT = "80"
CONSTANT string ARROW_SUFFIX = "_arrow"
CONSTANT string ARROW_NUMSUFFIX = "_arrow_num"
CONSTANT string SHADE_SUFFIX = "_shade"

CONSTANT string GAP = "0"
CONSTANT long MINWIDTH = 64
CONSTANT long SIZE_TOLERANCE = 24

/*
 1 = dwobjname
 2 = filename
 3 = x
 4 = y
 5 = width
 6 = height
*/

CONSTANT string NORMAL_LINE_SYNTAX = 'CREATE bitmap(band=header filename="{2}" x="{3}" y="{4}" height="{6}" width="{5}" border="0" name={1} visible="1")'
CONSTANT string HOT_LINE_SYNTAX = 'CREATE bitmap(band=header filename="{2}" x="{3}" y="{4}" height="{6}" width="{5}" border="0" name={1} visible="0")'

/*
 1 - name
 2 - text
 3 - x
 4 - y
 5 - width
 6 - height
 7 - color
*/
CONSTANT string BACKGROUND_SYNTAX = 'CREATE text(band=header alignment="0" text="{2}" border="0" color="0" x="{3}" y="{4}" height="{6}" width="{5}" html.valueishtml="0"  name={1} visible="0"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="0" background.color="{7}")'

/*
1 - name
2 - color
3 - x
4 - y
5 - width
6 - height
*/
CONSTANT string GRAY = "text(band=header alignment='0' text='' border='0' color='{2}' x='{3}' y='{4}' height='{6}' width='{5}' html.valueishtml='0'  name={1} visible='1'  font.face='Marlett' font.height='-12' font.weight='400'  font.family='0' font.pitch='2' font.charset='2' background.mode='0' background.color='{2}')"
/*
1 - name
2 - x
3 - text
*/
CONSTANT string ARROW = "text(band=foreground alignment='0' text='{3}' border='0' color='268435456' x='{2}' y='0' height='48' width='55' html.valueishtml='0'  name={1} visible='1'  font.face='Marlett' font.height='-12' font.weight='400'  font.family='0' font.pitch='2' font.charset='2' background.mode='1' background.color='553648127')"
/*
1 - name
2 - x
3 - text
*/
CONSTANT string ARROW_NUM = "text(band=foreground alignment='0' text='{3}' border='0' color='268435456' x='{2}' y='8' height='48' width='55' html.valueishtml='0'  name={1} visible='1'  font.face='Tahoma' font.height='-6' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127')"
/*
1 - name
2 - x
3 - width
4 - height
5 - color
*/
CONSTANT string SHADE = "text(band=background alignment='0' text='' border='0' color='268435456' x='{2}' y='0' height='{4}' width='{3}' html.valueishtml='0'  name={1} visible='1'  font.face='Marlett' font.height='-12' font.weight='400'  font.family='0' font.pitch='2' font.charset='2' background.mode='0' background.color='{5}')"
/*
 1 = dwobjname
 2 = filename
 3 = x
 4 = y
 5 = width
 6 = height
*/
CONSTANT string HEAD_IMAGE_SYNTAX = 'CREATE bitmap(band=header filename="{2}" x="{3}~t0" y="{4}" height="{6}" width="{5}" border="0" name={1} visible="1")'
end variables

forward prototypes
public subroutine of_alternaterowcolor (readonly powerobject apo)
public subroutine of_alternaterowcolor (readonly powerobject apo, readonly boolean ab_alternate, readonly long al_alternatecolor)
public function integer of_commit ()
public function integer of_commit (readonly transaction atr)
public function integer of_compositepage (datawindow adw, readonly string as_column, readonly long al_first, readonly long al_page)
public function integer of_datacopy (readonly powerobject apo_s, long al_scolid, long al_ecolid, long al_srow, ref powerobject apo_t, long al_trow)
public subroutine of_datawindowlock (readonly powerobject apo, readonly boolean ab_lock)
public function long of_filter (readonly powerobject apo, string as_filter)
public function string of_findcolumn (readonly powerobject apo, readonly string as_position)
public function integer of_getchildrowvalue (readonly datawindow adw, readonly string as_column, ref datastore ads)
public function string of_getchildvalue (readonly datawindow adw, readonly long al_row, readonly string as_column, readonly string as_value)
public function string of_getcolumnstatus (readonly powerobject apo, long al_row, string as_column)
public subroutine of_initvalidatefields (datawindow adw, ref string as_columns[])
public function long of_insertrow (readonly powerobject apo, readonly boolean ab_mode)
public function integer of_makedw (readonly datawindow adw, ref str_dwheader astr_headers[])
public function long of_required (readonly powerobject apo)
public function long of_required (readonly powerobject apo, ref long al_modifycnt[])
public subroutine of_requiredcolor (readonly powerobject apo)
public subroutine of_resizelines (readonly datawindow adw, readonly str_dwheader headers[])
public function integer of_rollback ()
public function integer of_rollback (readonly transaction atr)
public function long of_setchildvalue (readonly datastore ads, datawindowchild adwc)
public function integer of_setcolumn (readonly powerobject apo, long al_row, readonly string as_column)
public function long of_setdddw (datastore ads, datawindow adw, readonly string as_column, readonly string as_filter)
public function long of_setdddw (datastore ads, datawindow adw, readonly string as_column, readonly string as_filter, string as_useyn)
public subroutine of_setdefaultcolor (readonly powerobject apo)
public function boolean of_sethidegrayline (readonly powerobject apo)
public subroutine of_settextcolor (readonly powerobject apo, readonly string as_color)
public subroutine of_settitleimage (readonly powerobject apo, readonly boolean ab_createimg)
public function string of_setvalue (readonly powerobject apo, readonly long al_row)
public subroutine of_showsortarrows (readonly datawindow adw, readonly str_dwheader astr_headers[])
public subroutine of_sort (readonly datawindow adw, readonly string as_object, readonly str_dwheader astr_headers[])
public subroutine of_sort (readonly datawindow adw, string as_object, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[])
public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[])
public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[], readonly boolean ab_reset)
public function integer of_unfilter (readonly powerobject apo)
public function integer of_update (readonly powerobject apo)
public function integer of_update (readonly powerobject apo, readonly boolean ab_autocommit)
public function integer of_update (readonly powerobject apo, readonly transaction atr, readonly boolean ab_autocommit)
public subroutine of_setdisponly (readonly powerobject apo, readonly boolean ab_disponly)
public function integer of_setdwclear (readonly powerobject apo)
public function string of_createdataobject (powerobject apo, string as_sql, transaction atr, readonly boolean ab_rownum)
public function string of_createdataobject (powerobject apo, string as_sql)
end prototypes

public subroutine of_alternaterowcolor (readonly powerobject apo);of_alternaterowcolor(apo, TRUE, CColor.ALTERNATE)
end subroutine

public subroutine of_alternaterowcolor (readonly powerobject apo, readonly boolean ab_alternate, readonly long al_alternatecolor);string   ls_mod

IF NOT of_IsServicableObject(apo) THEN RETURN
try
   IF ab_alternate THEN
      ls_mod = "Datawindow.Detail.Color=~"" + &
                  STRING(CColor.WINDOW_BACKGROUND) + &
                  "~tif (mod(getrow(), 2) = 0, " + STRING(al_alternatecolor) + &
                  ", " + STRING(CColor.TRANSPARENT) + ")~""
   ELSE
      ls_mod = "Datawindow.Detail.Color=" + STRING(CColor.TRANSPARENT)
   END IF

   apo.DYNAMIC Modify(ls_mod)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public function integer of_commit ();RETURN of_commit(SQLCA)
end function

public function integer of_commit (readonly transaction atr);COMMIT USING atr;
RETURN 1
end function

public function integer of_compositepage (datawindow adw, readonly string as_column, readonly long al_first, readonly long al_page);// of_compositepage( dw_print, "dw_1", 23, 36 )
// 23 : 첫화면 row 수
// 36 : 두번째 이후 row 수
integer  li_ret
long     n, ll_rcnt, ll_page
string   ls_msg = "== 이하여백 =="
DataWindowChild   ldwc

IF NOT IsValid(adw) THEN RETURN -1
try
   li_ret  = adw.GetChild( as_column, ldwc )
   IF li_ret = 1 THEN
      ll_rcnt = ldwc.RowCount()
      IF ll_rcnt < al_first THEN
         ll_page = al_first
      ELSE
         ll_page = (Ceiling((ll_rcnt - al_first) / al_page) * al_page) + al_first
      END IF
      FOR n = (ll_rcnt + 1) to ll_page
         ldwc.InsertRow(0)
         IF n = (ll_rcnt + 1) THEN
            IF of_IsObjectValid( ldwc, "item_nm" ) THEN
               ldwc.SetItem( n, "item_nm", ls_msg )
            END IF
         END IF
      NEXT
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
RETURN li_ret
end function

public function integer of_datacopy (readonly powerobject apo_s, long al_scolid, long al_ecolid, long al_srow, ref powerobject apo_t, long al_trow);any      aData
long     n, ll_Copy
string   sCol

IF NOT IsValid(apo_s) THEN ll_Copy = -1
IF NOT IsValid(apo_t) THEN ll_Copy = -1

try
   IF al_scolid > al_ecolid OR al_scolid < 1 OR al_ecolid < 1 THEN ll_Copy = -1

   IF al_srow < 1 THEN ll_Copy = -1
   IF al_trow < 1 THEN ll_Copy = -1

   IF ll_Copy = -1 THEN RETURN -1

   apo_s.DYNAMIC AcceptText()

   FOR n = al_scolid to al_ecolid
      sCol = of_getcolumnname(apo_s, n)

      IF NOT of_IsObjectValid(apo_t, sCol) THEN CONTINUE

      aData = of_GetItemAny(apo_s, al_srow, sCol)

      of_SetItem(apo_t, al_trow, sCol, STRING(aData))
   NEXT
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
RETURN ll_Copy
end function

public subroutine of_datawindowlock (readonly powerobject apo, readonly boolean ab_lock);/*------------------------------------------------------------------------------------------------*
   of_DataWindowLock(powerobject apo, boolean ab_lock)
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 모든 컬럼을 ReadOnly 또는 Write로 변경
  -------------------------------------------------------------------------------------------------
   Parameters:
 *------------------------------------------------------------------------------------------------*/
long     n, ll_bound
string   ls_mode, ls_colname, ls_edit

IF NOT of_IsServicableObject(apo) THEN RETURN
try
   IF ab_lock THEN
      ls_mode = CString.YES
   ELSE
      ls_mode = CString.NO
   END IF

   apo.DYNAMIC Modify("DataWindow.ReadOnly=" + ls_mode)

   ll_bound = of_Getcolumncount( apo )
   FOR n = 1 to ll_bound
      ls_colname = of_Getcolumnname( apo, n )
      ls_edit = of_GetColumnEditStyle( apo, ls_colname )
      choose case lower(ls_edit)
         case "dddw", "ddlb"
            apo.DYNAMIC Modify( ls_colname + "." + ls_edit + ".ShowList='" + ls_mode + "'")
      end choose
   NEXT
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

public function long of_filter (readonly powerobject apo, string as_filter);integer  li_ret

try
   // Filter Free
   IF of_UnFilter(apo) = -1 THEN RETURN 0

   apo.DYNAMIC SetFilter( as_filter )
   li_ret = apo.DYNAMIC Filter()

   IF li_ret = 1 THEN
      li_ret = apo.DYNAMIC RowCount()
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN LONG(li_ret)
end function

public function string of_findcolumn (readonly powerobject apo, readonly string as_position);long     ls_count
string   ls_column, ls_columns[]

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

try
   // Visible Column을 x좌표의 위치별로 배열에 담는다.
   of_Ordercolumnsbypositionx(apo, ls_columns)

   choose case Upper(as_position)
      case "F", "S", "FIRST", "START"
         ls_column = ls_columns[1]
      case "E", "L", "END", "LAST"
         ls_column = ls_columns[UpperBound(ls_columns)]
      case else
         ls_column = CString.EMPTY
   end choose
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN ls_column
end function

public function integer of_getchildrowvalue (readonly datawindow adw, readonly string as_column, ref datastore ads);//===========================================================================
// Function: integer of_GetChildRowValue( dw_1, "bank_cd", lds_code )
//---------------------------------------------------------------------------
// Description: DDDW의 선택값의 전체 DDDW ROW값을 읽어옴.
// Note: dddw 모든 컬럼값을 ads에 담는다.
//---------------------------------------------------------------------------
// Parameters:
//  readonly  datawindow  adw
//  readonly  string      as_column
//  reference datastore   ads
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
// IF of_GetChildRowValue( dw_1, "bank_cd", lds_code ) > 0 THEN
integer  li_ret
DataWindowChild   ldwc

IF NOT of_IsObjectValid( adw, as_column ) THEN RETURN 0

try
   li_ret  = adw.GetChild(as_column, ldwc)
   IF li_ret = 1 THEN
      of_CreateStringDatastore(ldwc, ads, TRUE)

      ldwc.RowsCopy(ldwc.GetRow(), ldwc.GetRow(), Primary!, ads, 1, Primary!)
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN li_ret
end function

public function string of_getchildvalue (readonly datawindow adw, readonly long al_row, readonly string as_column, readonly string as_value);//===========================================================================
// Function: of_GetChildValue( dw_1, 1, "bank_cd", "str1" )
//---------------------------------------------------------------------------
// Description: DDDW의 컬럼(as_value) 값을 읽어옴.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  datawindow  adw
//  readonly  long        al_row
//  readonly  string      as_column
//  readonly  string      as_value
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
// of_GetChildValue( dw_1, 1, "bank_cd", "str1" )
any      la_value
integer  li_ret
long     n, ll_count
DataWindowChild   ldwc

IF NOT of_IsObjectValid( adw, as_column ) THEN RETURN CString.EMPTY

try
   li_ret  = adw.GetChild(as_column, ldwc)
   IF li_ret = 1 THEN
      IF of_IsObjectValid(ldwc, as_value) THEN
         la_value = of_GetItemAny(ldwc, ldwc.GetRow(), as_value)
      END IF
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN STRING(la_value)
end function

public function string of_getcolumnstatus (readonly powerobject apo, long al_row, string as_column);//===========================================================================
// Function: of_GetColumnStatus( dw_1, 2, "code" )
//---------------------------------------------------------------------------
// Description: 컬럼 또는 데이타윈도의 상태여부 체크.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  powerobject apo
//  value     long        al_row
//  value     string      as_column
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string         ls
dwitemstatus   ldws

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

try
   IF isnull( al_row ) OR al_row <= 0 THEN RETURN ls

   IF of_IsEmpty( as_column ) THEN
      ldws = apo.DYNAMIC GetItemStatus(al_row, 0, Primary!)
   ELSE
      ldws = apo.DYNAMIC GetItemStatus(al_row, as_column, Primary!)
   END IF

   choose case ldws
      case New!
         ls = "NEW"
      case NewModified!
         ls = "NEW"
      case DataModified!
         ls = "MOD"
      case NotModified!
         ls = "NOT"
   end choose
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN ls
end function

public subroutine of_initvalidatefields (datawindow adw, ref string as_columns[]);long     n, m, c, ll_count
string   ls_types[], ls_mod, ls_col

IF NOT IsValid(adw) THEN RETURN

try
   // Init Validation for following edit types
   ls_types = {"edit", &
               "editmask", &
               "ddlb", &
               "dddw", &
               "checkbox", &
               "column"}

   ll_count = of_GetColumnCount(adw)

   FOR n = 1 to ll_count
      ls_col = "#" + STRING(n)
      FOR m = 1 to 6
         IF adw.Describe(ls_col + "." + ls_types[m] + ".Required") = CString.YES THEN
            c ++
            as_columns[c] = adw.Describe(ls_col + ".Name")
            ls_mod += as_columns[c] + "." + ls_types[m] + ".Required=" + CString.NO + CString.SPACE &
                   +  as_columns[c] + "_t.Color=" + STRING(CColor.LINK) + CString.SPACE &
                   +  as_columns[c] + ".Background.Mode =0 " + CString.SPACE &
                   +  as_columns[c] + ".Background.Color=" + STRING(CColor.REQUIRED_BACKGROUND_COLOR) + CString.SPACE
            EXIT
         END IF
      NEXT
   NEXT

   // One-Hit Modify
   adw.Modify(ls_mod)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public function long of_insertrow (readonly powerobject apo, readonly boolean ab_mode);/*------------------------------------------------------------------------------------------------*
   long of_insertrow( )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   InsertRow 옵션 ( #AppendRow 체크시 선택한 Row의 아래에 신규 Row 추가 )
  -------------------------------------------------------------------------------------------------
   Parameters:
 *------------------------------------------------------------------------------------------------*/
long     n, ll_row

IF NOT of_IsServicableObject(apo) THEN RETURN -1

try
   n = 0
   IF NOT ab_mode THEN
      n = apo.DYNAMIC GetRow() + 1
   END IF
   ll_row = apo.DYNAMIC InsertRow( n )
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try

RETURN ll_row
end function

public function integer of_makedw (readonly datawindow adw, ref str_dwheader astr_headers[]);/*------------------------------------------------------------------------------------------------*
   of_makeDW(dw_1, str_dwheader)
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  Default DataWindow Theme Make
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
long     n, ll_count, llx, llw
string   ls_mod, ls_cols[], lsw, lsx
string   ls_dwstyle, ls_headerheight, ls_percenty, ls_liney, ls_sepheight
string   ls_NormalFile, ls_HotFile, ls_Error

IF NOT IsValid(adw) THEN RETURN 0
try
   // Make sure it's a tabular DW
   ls_dwstyle = of_GetDWStyle(adw)

   IF NOT(ls_dwstyle = "0" OR ls_dwstyle = "1") THEN RETURN -1

   ls_headerheight = adw.Describe("Datawindow.Header.Height")
   IF LONG(ls_headerheight) < 90 THEN ls_headerheight = "90"

   ls_mod = "Datawindow.Processing='0'"
   ls_mod += "Datawindow.Header.Height=" + ls_headerheight

   ls_liney = STRING(PixelsToUnits( &
            UnitsToPixels(LONG(ls_headerheight), YUnitsToPixels!) - 3, &
            YPixelsToUnits!))

   ls_sepheight = STRING(PixelsToUnits( &
            UnitsToPixels(LONG(ls_headerheight), YUnitsToPixels!) - 9, &
            YPixelsToUnits!))

   ls_percenty = STRING(LONG(ls_headerheight) * .15, "#,##0")

   // Normal Line[Between Header & Detail Division Line]
   /*
    1 = dwobjname
    2 = filename
    3 = x
    4 = yes
    5 = width
    6 = height
   */
   ls_mod += CString.SPACE &
          +  of_Format(NORMAL_LINE_SYNTAX, &
               {&
               CDWBase.LINEBAR, &
               CString.EMPTY, &
               "0", &
               ls_liney, &
               "4", &
               STRING(PixelsToUnits(3, YPixelsToUnits!)) &
               })


   // Hot Line[Select Head Text Bottom Line]
   /*
    1 = dwobjname
    2 = filename
    3 = x
    4 = y
    5 = width
    6 = height
   */
   ls_mod += CString.SPACE &
          +  of_Format(HOT_LINE_SYNTAX, &
               {&
               CDWBase.HOTTBAR, &
               CString.EMPTY, &
               "0", &
               ls_liney, &
               "4", &
               STRING(PixelsToUnits(3, YPixelsToUnits!)) &
               })


   // Header
   /*
    1 - name
    2 - text
    3 - x
    4 - y
    5 - width
    6 - height
    7 - color
   */
   ls_mod += CString.SPACE &
          +  of_Format(BACKGROUND_SYNTAX, &
               {&
               CDWBase.HEADBAR, &
               CString.EMPTY, &
               "0", &
               "0", &
               "4", &
               ls_headerheight, &
               STRING( CColor.WHITE ) &
               })


   // Reset headers
   str_dwheader   lstr_empty[]

   astr_headers = lstr_empty

   // Column Sort by Position
   ll_count = of_Ordercolumnsbypositionx( adw, ls_cols )
   FOR n = 1 to ll_count
      astr_headers[n].header = ls_cols[n] + "_t"
      astr_headers[n].column = ls_cols[n]

      // Flatten and not bold
      ls_mod += CString.SPACE + astr_headers[n].header + ".Border=0 " &
             +  astr_headers[n].header + ".Background.Mode=1 " &
             +  astr_headers[n].header + ".Font.Face='" + Gstr_System.TitlebarFontName + "' " &
             +  astr_headers[n].header + ".Font.Height='-" + Gstr_System.TitlebarFonSize + "'"
      ls_mod += " " + astr_headers[n].header + ".Y=" + ls_percenty
      ls_mod += " " + astr_headers[n].header + ".Height=" + ls_headerheight

      // Set Positions
      lsw = adw.Describe(astr_headers[n].header + ".width")
      IF NOT IsNumber(lsw) THEN lsw = GAP
      IF n = 1 THEN
         ls_mod += CString.SPACE + astr_headers[n].header + ".X=" + GAP
         llx = LONG(GAP)
         ls_mod += CString.SPACE + ls_cols[n] + ".X=" + STRING(LONG(GAP) / 2)
         llx += LONG(lsw)
         llw = LONG(lsw)
         ls_mod += CString.SPACE + ls_cols[n] + ".width=" + STRING(llw)
      ELSE
         // get previous header x location and width
         lsx = adw.Describe(astr_headers[n].header + ".X")
         llx += LONG(GAP)
         ls_mod += CString.SPACE + astr_headers[n].header + ".X=" + STRING(llx)
         ls_mod += CString.SPACE + ls_cols[n] + ".X=" + STRING(llx - (LONG(GAP) / 2))
         llx += LONG(lsw)
         llw = LONG(lsw)
         ls_mod += CString.SPACE + ls_cols[n] + ".width=" + STRING(llw)
      END IF
      astr_headers[n].lgap = llx - size_tolerance
      astr_headers[n].rgap = llx + size_tolerance
   NEXT
   ls_NormalFile = ".\Bmp\dwlvheaderline4_n.bmp"
   ls_HotFile = ".\Bmp\headerhotline.bmp"

   // DataWindow Header Band & Head Text(jaddwheader) Color 지정
   ls_mod += " " + "Datawindow.Header.Color=" + STRING( Gstr_System.TitlebarBackgroundNormal )
   ls_mod += " " + CDWBase.HEADBAR + ".Background.Color=" + STRING( Gstr_System.TitlebarBackgroundHot )
   ls_mod += " " + CDWBase.LINEBAR + ".FileName='" + ls_NormalFile + "'"
   ls_mod += " " + CDWBase.HOTTBAR + ".FileName='" + ls_HotFile + "'"

   ls_Error = adw.Modify( ls_mod )

   IF NOT of_IsEmpty(ls_Error) THEN
      MessageBox( "Modify Error!", ls_Error, StopSign! )
   END IF

   // position z order
   adw.SetPosition( CDWBase.LINEBAR, "header", TRUE )
   adw.SetPosition( CDWBase.HEADBAR, "header", TRUE )
   FOR n = 1 to ll_count
      adw.SetPosition( astr_headers[n].header, "header", TRUE )
   NEXT
   adw.SetPosition( CDWBase.HOTTBAR, "header", TRUE )

   of_ResizeLines( adw, astr_headers )
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay( rte )
end try

RETURN li_ret
end function

public function long of_required (readonly powerobject apo);long     p[]

RETURN of_Required( apo, p )
end function

public function long of_required (readonly powerobject apo, ref long al_modifycnt[]);/*------------------------------------------------------------------------------------------------*
   long  of_Required( powerobject apo, ref long al_modifycnt[] )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 필수 입력값 및 길이를 체크한다.
   of_Required( "1" )
  -------------------------------------------------------------------------------------------------
   Parameters:
   as_separator      1: New + Modify Count,  2: New Count,  3: Modify Count
 *------------------------------------------------------------------------------------------------*/
long     n, ll_rcnt, ll_tcnt, ll_row, p[2]
string   ls_column, ls_style, ls_coltype
string   ls_status, ls_tag, ls_data

// Buffer확인
apo.DYNAMIC AcceptText()

ll_rcnt = apo.DYNAMIC RowCount()

IF ll_rcnt = 0 THEN RETURN 0

// 수정건이 있는지 체크
IF apo.DYNAMIC ModifiedCount() < 1 THEN RETURN 0
try
   // Column Count
   ll_tcnt = of_GetColumnCount( apo )

   DO
      ll_row = apo.DYNAMIC GetNextModified(ll_row, Primary!)

      IF ll_row > 0 THEN
         // row 상태값
         ls_status = of_GetColumnStatus( apo, ll_row, "" )
         IF left(ls_status, 3) = "NEW" THEN
            p[1] ++
         ELSE
            p[2] ++
         END IF

         FOR n = 1 to ll_tcnt
            // Get Column Name
            ls_column = of_GetColumnName( apo, n )

            ls_data = STRING( of_GetItemAny( apo, ll_row, ls_column ) )

            ls_coltype = of_GetColumnDatatype( apo, ls_column )
            choose case ls_coltype
               case "decimal", "long", "number", "real"
                  IF isnull( ls_data ) THEN  // OR ls_data = "0"
                     ls_data = ""
                  END IF
               case else
            end choose

            // Edit, EditMask등 체크.
            ls_style  = of_GetColumnEditStyle( apo, ls_column )

            IF of_IsEmpty( ls_data ) THEN
               // If Required Checked
               IF lower(apo.DYNAMIC Describe(ls_column + "." + ls_style + ".Required")) = "yes" THEN
                  ls_tag = apo.DYNAMIC Describe( ls_column + ".Tag" )

                  IF of_IsEmpty( ls_tag ) OR of_IsErrorString(ls_tag) THEN
                     ls_tag = of_getProperties( apo, ls_column, "text" )

                     of_GlobalReplace( ls_tag, CString.CR, "" )
                     of_GlobalReplace( ls_tag, CString.NL, "" )

                     MessageBox("확인", "[" + ls_tag + "]의 값은 필수입력항목입니다.(" + String(ll_row) + ")", Exclamation!)

                     of_SetColumn( apo, ll_row, ls_column )
                     RETURN -1
                  END IF
               END IF
            /*
            ELSE
               IF Lower( ls_style ) <> "edit" THEN CONTINUE
               IF Describe( ls_column + ".edit.limit" ) = "0" THEN  CONTINUE
               IF Len( ls_data ) > Long( Describe( ls_column + ".edit.limit" ) ) THEN
                  ls_tag = of_getText( ls_column )
                  MessageBox("확인", "[" + ls_tag + "]의 데이터 길이를 확인하세요.(" + String(Len( ls_data )) + "/" + Describe( ls_column + ".edit.limit" ) + ")")

                  of_SetColumn( ll_row, ls_column )
                  RETURN -1
               END IF
            */
            END IF
         NEXT
      END IF
   LOOP WHILE ll_row > 0
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
finally
   al_modifycnt = p
end try
RETURN (p[1] + p[2])
end function

public subroutine of_requiredcolor (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
   of_RequiredColor( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 필수입력항목에 Color를 지정한다.
  -------------------------------------------------------------------------------------------------
   Parameters:
 *------------------------------------------------------------------------------------------------*/
long     n, ll_bound
string   ls_column, ls_style

IF NOT of_IsServicableObject(apo) THEN RETURN
try
   ll_bound = of_GetColumnCount( apo )

   apo.DYNAMIC Modify ("DataWindow.Detail.Height.AutoSize=yes")

   FOR n = 1 to ll_bound
      // Get Column Name
      ls_column = of_GetColumnName( apo, n )

      // Edit, EditMask등 체크.
      ls_style  = of_GetColumnEditStyle( apo, ls_column )

      // Primary Key Column Color 지정.
      IF lower(apo.DYNAMIC Describe( ls_column + ".Key" )) = CString.YES THEN
         apo.DYNAMIC Modify( ls_column + ".Background.Mode='0'")
         apo.DYNAMIC Modify( ls_column + ".Background.color='" + STRING(CColor.LIGHT_PINK) + "'" )
      ELSE
         IF lower(apo.DYNAMIC Describe( ls_column + "." + ls_style + ".Required" )) = CString.YES THEN
            apo.DYNAMIC Modify( ls_column + ".Background.Mode='0'")
            apo.DYNAMIC Modify( ls_column + ".Background.color='" + STRING(CColor.YELLOW) + "'" )
         END IF
      END IF
   NEXT
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

public subroutine of_resizelines (readonly datawindow adw, readonly str_dwheader headers[]);long     ll, ll_totw
string   ls_mod

IF NOT IsValid(adw) THEN RETURN

try
   ll = UpperBound(headers)

   ll_totw = LONG(adw.Describe(headers[ll].header + ".x")) + LONG(adw.Describe(headers[ll].header + ".width"))
   IF ll_totw + 48 < adw.width THEN
      ll_totw = adw.width - 10
   END IF

   ls_mod = CDWBase.LINEBAR + ".width=" + STRING(ll_totw)

   adw.Modify(ls_mod)

   of_ShowSortArrows(adw, headers)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public function integer of_rollback ();RETURN of_rollback( SQLCA )
end function

public function integer of_rollback (readonly transaction atr);MessageBox( "ERROR", "실패:" + atr.SQLERRTEXT, StopSign! )
ROLLBACK USING atr;
RETURN 1
end function

public function long of_setchildvalue (readonly datastore ads, datawindowchild adwc);/*------------------------------------------------------------------------------------------------*
   long of_setChildValue( datastore ads, datawindowchild adwc )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - DDDW를 포함한 컬럼에 코드와 명을 설정한다.
   - gdf.of_setChildValue( ds_code, ldwc )
  -------------------------------------------------------------------------------------------------
   Parameters:
   ads               코드값을 가지고 있는 datastore
   adwc              값을 설정할 DataWindowChild
 *------------------------------------------------------------------------------------------------*/
long     n, ll_row, ll_rcnt
string   ls_cols[] = {"str1", "str2", "str3", "str4", "str5", "str6"}

ll_rcnt = ads.RowCount()

IF ll_rcnt <= 0 THEN RETURN ll_rcnt

IF NOT IsValid(adwc) THEN RETURN -1

try
   adwc.Reset()
   FOR n = 1 to ll_rcnt
      ll_row = adwc.InsertRow(0)

      of_SetItem(adwc, ll_row, "code", ads.object.col1[n])
      of_SetItem(adwc, ll_row, "name", ads.object.col2[n])

      IF of_IsObjectValid(adwc, ls_cols[1]) THEN
         of_SetItem(adwc, ll_row, ls_cols[1], ads.object.col3[n])
      END IF
      IF of_IsObjectValid(adwc, ls_cols[2]) THEN
         of_SetItem(adwc, ll_row, ls_cols[2], ads.object.col4[n])
      END IF
      IF of_IsObjectValid(adwc, ls_cols[3]) THEN
         of_SetItem(adwc, ll_row, ls_cols[3], ads.object.col5[n])
      END IF
      IF of_IsObjectValid(adwc, ls_cols[4]) THEN
         of_SetItem(adwc, ll_row, ls_cols[4], ads.object.col6[n])
      END IF
      IF of_IsObjectValid(adwc, ls_cols[5]) THEN
         of_SetItem(adwc, ll_row, ls_cols[5], ads.object.col7[n])
      END IF
      IF of_IsObjectValid(adwc, ls_cols[6]) THEN
         adwc.SetItem(ll_row, ls_cols[6], ads.object.col8[n])
      END IF
   NEXT
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
RETURN ll_rcnt
end function

public function integer of_setcolumn (readonly powerobject apo, long al_row, readonly string as_column);long     n, ll_rcnt, ll_tcnt
string   ls_column

IF NOT of_IsServicableObject(apo) THEN RETURN -1
try
   ll_rcnt = apo.DYNAMIC RowCount()

   IF ll_rcnt = 0 THEN RETURN -1

   IF isnull(al_row) OR al_row <= 0 OR al_row > ll_rcnt THEN
      al_row = ll_rcnt
   END IF

   ls_column = as_column

   // Focusing 불가이면..
   IF apo.DYNAMIC Describe(ls_column + ".Visible") = "0" OR &
      apo.DYNAMIC Describe(ls_column + ".Protect") = "1" OR &
      apo.DYNAMIC Describe(ls_column + ".TabSequence") = "0" THEN
      // DataWindow의 컬럼의 총 갯수.
      ll_tcnt = of_GetColumnCount(apo)

      DO WHILE ll_tcnt > n
         n ++
         ls_column = of_getcolumnname(apo, n)
         IF apo.DYNAMIC Describe(ls_column + ".Visible") = "1" THEN
            IF NOT (apo.DYNAMIC Describe(ls_column + ".Protect") = "1" OR &
                    apo.DYNAMIC Describe(ls_column + ".TabSequence") = "0") THEN
               EXIT
            END IF
         END IF
      LOOP
   END IF

   apo.DYNAMIC ScrollToRow( al_row )
   apo.DYNAMIC SetRow( al_row )
   apo.DYNAMIC SetColumn( ls_column )
   apo.DYNAMIC SetFocus()
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
RETURN 1
end function

public function long of_setdddw (datastore ads, datawindow adw, readonly string as_column, readonly string as_filter);RETURN of_SetDDDW( ads, adw, as_column, as_filter, "" )
end function

public function long of_setdddw (datastore ads, datawindow adw, readonly string as_column, readonly string as_filter, string as_useyn);/*------------------------------------------------------------------------------------------------*
   long of_setdddw( datastore ads, datawindow adw, string as_column, string as_filter, string as_useyn )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   - datastore에서 값을 filter값으로 추출해 adw의 as_column에 값을 담는다.
   - gdf.of_setdddw( ds_code, dw_main, "dept_cd", "A10", "1" )
   - col3( 그룹코드), col4(사용여부)
   - as_useyn값으로 Filter를 못하면 프로그램 셧다운.
  -------------------------------------------------------------------------------------------------
   Parameters:
   ads               코드값을 가지고 있는 datastore
   adw               DDDW를 포함한 DataWindow
   as_column         DDDW 컬럼
   as_filter         코드테이블의 그룹코드값
   as_useyn          사용여부
 *------------------------------------------------------------------------------------------------*/
integer  li_ret
long     n, ll_rcnt
string   ls_filter
DataWindowChild   ldwc

IF of_IsEmpty(as_column) THEN RETURN -1
IF of_IsEmpty(as_filter) THEN RETURN -1

try
   li_ret = adw.GetChild(as_column, ldwc)
   IF li_ret = -1 THEN
      MessageBox( "확인", "NOT a DataWindowChild", StopSign! )
      RETURN li_ret
   END IF

   // 대분류 또는 그룹구분자
   ls_filter = "col3='" + as_filter + "'"
   IF NOT of_IsEmpty( as_useyn ) THEN
      IF Upper( as_useyn ) = "Y" THEN as_useyn = "1"
      ls_filter = ls_filter + " AND col6='" + as_useyn + "'"
   END IF

   IF of_Filter( ads, ls_filter ) <= 0 THEN RETURN -1

   ll_rcnt = ads.RowCount()

   IF ll_rcnt <= 0 THEN RETURN ll_rcnt

   IF of_IsObjectValid( ads, "num1" ) THEN
      IF NOT of_IsEmpty( ads.object.num1[1] ) THEN
         ads.SetSort("col3 A,num1 A")
         ads.Sort()
      END IF
   END IF

   ldwc.SetRedraw( FALSE )

   n = of_setChildValue( ads, ldwc )
   IF n > 0 THEN
      IF n > 20 THEN n = 20
      adw.Modify(as_column + ".dddw.Lines=" + string(n))
   END IF
   ldwc.SetRedraw( TRUE )
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN n
end function

public subroutine of_setdefaultcolor (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
    of_setDefaultColor ( powerobject apo )
   Descirption: DataWindow column별 tab sequence를 정한 후 tab sequence가 0이거나 Protect이면 column은 회색 바탕,
                이외의 column은 흰색 바탕
                추가 ) 필수입력항목이면...
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder
 *------------------------------------------------------------------------------------------------*/
boolean  lb_disable
long     ll_tabseq, ll_idx, ll_colcnt, ll_setcolumn
string   ls_readonly

IF NOT of_IsServicableObject(apo) THEN RETURN

try
   ll_colcnt = of_GetColumnCount(apo)

   ls_readonly = apo.DYNAMIC Describe("DataWindow.ReadOnly") // "Yes"/"No"

   apo.DYNAMIC SetRedraw( FALSE )
   FOR ll_idx = 1 to ll_colcnt
      ll_tabseq = LONG(apo.DYNAMIC Describe( "#" + STRING(ll_idx) + ".TabSequence" ))

      IF apo.DYNAMIC Describe( "#" + STRING(ll_idx) + ".Protect" ) = "1" OR &
         apo.DYNAMIC Describe( "#" + STRING(ll_idx) + ".TabSequence" ) = "0" THEN
         lb_disable = TRUE
      ELSE
         lb_disable = FALSE
      END IF

      // Background Mode가 Transparent이면 그 mode를 해제한다.
      apo.DYNAMIC Modify("#" + STRING(ll_idx) + ".Background.Mode='2'")

      IF lower(ls_readonly) = "yes" THEN
         apo.DYNAMIC Modify( "#" + STRING(ll_idx) + ".Background.color ='12632256'" )
      ELSE
         IF lb_disable THEN
            apo.DYNAMIC Modify( "#" + STRING(ll_idx) + ".Background.color ='12632256'" )
         ELSE
            apo.DYNAMIC Modify( "#" + STRING(ll_idx) + ".Background.color ='16777215'" )
         END IF
      END IF
   NEXT
   apo.DYNAMIC SetRedraw( TRUE )
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

public function boolean of_sethidegrayline (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
   boolean of_SetHideGrayLine(powerobject apo)
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   Grid에서 Group 사용시 페이지 변경라인의 회색선 제거
  -------------------------------------------------------------------------------------------------
   Parameters:
   readonly       powerobject    apo
 *------------------------------------------------------------------------------------------------*/
boolean  lb_band = FALSE
long     n, ll_bound, ll_height
string   ls_bands[]

IF NOT of_IsServicableObject(apo) THEN RETURN lb_band

try
   // Get DataWindow Bands
   ll_bound = of_GetBands( apo, ls_bands )

   ll_height = 0
   FOR n = 1 to ll_bound
      IF Pos(lower(ls_bands[n]), "trailer") > 0 THEN
         IF NOT lb_band THEN
            lb_band = TRUE
         END IF
         ll_height = ll_height + long(apo.DYNAMIC Describe("DataWindow." + ls_bands[n] + ".Height"))
      END IF
   NEXT

   // Group Style DW 스크롤시 보이는 회색선 제거
   IF ll_height > 40 THEN apo.DYNAMIC Modify("DataWindow.HideGrayLine='yes'")
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
RETURN lb_band
end function

public subroutine of_settextcolor (readonly powerobject apo, readonly string as_color);/*------------------------------------------------------------------------------------------------*
   of_SetTextColor(powerobject apo, string as_color)
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - DataWindow Text 에 색상을 지정한다.
                                - of_SetTextColor(dw_1, "RED")
 *------------------------------------------------------------------------------------------------*/
long     n, ll_count
string   ls_HTextColor, ls_mod
string   ls_cols[], ls_types[], ls_exclude[] = {"jadwheader", "_arrow", "_arrow_num", "_shade", "BackIMAGE_", "_sort"}

IF NOT of_IsServicableObject(apo) THEN RETURN

try
   ls_HTextColor = STRING(gfn.of_PBColor(as_color))

   ll_count = of_Getobjects(apo, ls_cols, ls_types)

   ls_mod = CString.EMPTY
   FOR n = 1 to ll_count
      IF ls_types[n] = "text" THEN
         IF of_StringPosArray(ls_cols[n], ls_exclude) > 0 THEN CONTINUE
         IF Pos(ls_cols[n], CString.SUFFIX) > 0 THEN
            ls_mod += ls_cols[n] + ".BackGround.Color=" + ls_HTextColor
         ELSE
            ls_mod += ls_cols[n] + ".BackGround.Color=" + STRING(CColor.BROWN)
         END IF
         ls_mod += ls_cols[n] + '.Font.Face="' + Gstr_System.TitlebarFontName + '"' + ls_cols[n] + '.Font.Height="-' + Gstr_System.TitlebarFonSize + '" '
      END IF
   NEXT
   IF NOT of_IsEmpty(ls_mod) THEN
      apo.DYNAMIC Modify(ls_mod)
   END IF
catch (RunTimeError rte)
   of_systemerrordisplay ( rte )
end try
end subroutine

public subroutine of_settitleimage (readonly powerobject apo, readonly boolean ab_createimg);/*------------------------------------------------------------------------------------------------*
   of_setTitleImage(powerobject apo,boolean ab_createimg)
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 Title에 Image를 집어 넣는다.
   of_setTitleImage(dw_1, TRUE)
  -------------------------------------------------------------------------------------------------
   Parameters:
 *------------------------------------------------------------------------------------------------*/
long     ll_XPosition, ll_width
string   ls_mod, ls_column, ls_path, ls_error
string   ls_height
string   ls_colnames[], ls_coltypes[]

IF NOT of_IsServicableObject(apo) THEN RETURN

try
   IF LONG(of_Getdwstyle(apo)) > 1 THEN RETURN

   // Grid Title Header의 높이가 50미만이면...
   ls_height = apo.DYNAMIC Describe("DataWindow.Header.Height")
   IF LONG(ls_height) < 50 THEN RETURN

   IF of_IsObjectValid(apo, "p_title") THEN
      apo.DYNAMIC Modify( "DESTROY p_title" )
   END IF
   IF NOT ab_createimg THEN RETURN

   // Column Name Sort
   of_Ordercolumnsbypositionx(apo, ls_colnames)

   // Get Grid Last Column
   ls_column = ls_colnames[UpperBound(ls_colnames)]

   IF of_IsEmpty( ls_column ) THEN RETURN

   // Last Column (X Position & Width)를 구한다.
   ll_XPosition = LONG(apo.DYNAMIC Describe(ls_column + ".x")) + LONG(apo.DYNAMIC Describe(ls_column + ".width"))

   // Get DataWindow Width
   ll_width = LONG(apo.DYNAMIC of_getwidth()) + LONG(apo.DYNAMIC Describe("Datawindow.HorizontalScrollPosition"))

   // IF ll_XPosition < ll_width THEN
   IF ll_XPosition < ll_width THEN ll_XPosition = ll_width

   // Head BackGround Image
   /*
    1 = dwobjname
    2 = filename
    3 = x
    4 = y
    5 = width
    6 = height
   */
   ls_path = ".\Bmp\titlebar.bmp"
   ls_mod += " " + of_Format(HEAD_IMAGE_SYNTAX, &
             {&
             "p_title", &
             ls_path, &
             "0", &
             "0", &
             STRING(ll_XPosition), &
             ls_height &
             })

   // 헤더바 생성
   ls_error = apo.DYNAMIC Modify( ls_mod )

   // 맨뒤로 보낸다
   IF of_IsEmpty(ls_error) THEN
      apo.DYNAMIC SetPosition( "p_title", "Header", FALSE )
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

public function string of_setvalue (readonly powerobject apo, readonly long al_row);/*------------------------------------------------------------------------------------------------*
   string   of_SetValue( long al_row )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 기본값을 설정하고 작업 Row의 상태값을 Return한다. ( NEW:신규, DAT:수정, NOT:변경X )
  -------------------------------------------------------------------------------------------------
   Parameters:
   long              al_row         : DataWindow의 현재 Row
 *------------------------------------------------------------------------------------------------*/
string   ls_sysdate, ls_status

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY
try
   ls_sysdate = gfn.of_Sysdate()
   ls_status  = of_GetColumnStatus(apo, al_row, CString.EMPTY)

   IF Pos(ls_status, "NEW") > 0 THEN
      // Default
      IF of_IsObjectValid(apo, "cpny_cd") THEN
         of_SetItem(apo, al_row, "cpny_cd", gs_CustID)
      END IF
      IF of_IsObjectValid(apo, "reg_id" ) THEN
         of_SetItem(apo, al_row, "reg_id", gs_UserID)
      END IF
      IF of_IsObjectValid( apo, "reg_dte" ) THEN
         of_SetItem(apo, al_row, "reg_dte", ls_sysdate)
      END IF
   ELSE
      IF of_IsObjectValid( apo, "upd_id" ) THEN
         of_SetItem(apo, al_row, "upd_id", gs_UserID)
      END IF
      IF of_IsObjectValid( apo, "upd_dte" ) THEN
         of_SetItem(apo, al_row, "upd_dte", ls_sysdate)
      END IF
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
   SetNull( ls_status )
end try
RETURN ls_status
end function

public subroutine of_showsortarrows (readonly datawindow adw, readonly str_dwheader astr_headers[]);long     n, ll_count, ll_x, ll_w, ll_h, ll_color
string   ls_cols[], ls_sort[], ls_mod
string   ls_shade, ls_arrow, ls_arrownum
string   ls_header, ls_sorttype

IF NOT IsValid(adw) THEN RETURN
try
   // Destroy arrows
   IF of_sortarrowsclear(adw, astr_headers) <= 0 THEN RETURN

   // Set Shade Color[Vertical Column Color]
   ll_color = CColor.WHITE_SMOKE // 3790332

   // Create Sort Arrows
   ll_count = of_GetSort(adw, ls_cols, ls_sort)
   FOR n = 1 to ll_count
      // Build arrow
      ls_header = ls_cols[n] + "_t"
      IF NOT of_IsObjectValid(adw, ls_Header) THEN CONTINUE

      // Flag draw
      ls_arrow = ls_cols[n] + ARROW_SUFFIX

      // Get coord
      ll_x = LONG(adw.Describe(ls_header + ".X")) + LONG(adw.Describe(ls_header + ".width")) - 80

      // Get sort type
      IF ls_sort[n] = "A" THEN
         ls_sorttype = ARROW_ASCENDING
      ELSE
         ls_sorttype = ARROW_DESCENDING
      END IF
      ls_mod = "CREATE " + of_Format(ARROW, {ls_arrow, STRING(ll_x), ls_sorttype})
      adw.Modify(ls_mod)

      // Build arrow numbers
      IF ll_count > 1 THEN
         ls_arrownum = ls_cols[n] + ARROW_NUMSUFFIX
         ll_x -= 16
         ls_mod = "CREATE " + of_Format(ARROW_NUM, {ls_arrownum, STRING(ll_x), STRING(n)})
         adw.Modify(ls_mod)
      END IF

      // Build shade
      ls_shade = ls_cols[n] + SHADE_SUFFIX

      // Get coord
      ll_x = LONG(adw.Describe(ls_header + ".X")) - LONG(GAP)
      ll_w = LONG(adw.Describe(ls_header + ".width")) + LONG(GAP)
      ll_h = LONG(adw.Describe("Datawindow.Detail.height")) + 30
      ll_h *= adw.RowCount()

      IF ll_h < adw.Height THEN ll_h = adw.Height

      ls_mod = "CREATE " + of_Format(SHADE, {ls_shade, STRING(ll_x), STRING(ll_w), STRING(ll_h), STRING(ll_color)})
      adw.Modify(ls_mod)
   NEXT
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public subroutine of_sort (readonly datawindow adw, readonly string as_object, readonly str_dwheader astr_headers[]);str_dwheader   lstr_header[]

of_Sort(adw, as_object, astr_headers, lstr_header)
end subroutine

public subroutine of_sort (readonly datawindow adw, string as_object, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[]);boolean  lb_found, lb_controlkey
long     n, ll_count
string   ls_sort, ls_cols[], ls_type[], ls_sorttype

IF NOT IsValid(adw) THEN RETURN

try
   // Less Then One Return
   IF adw.RowCount() <= 1 THEN RETURN

   // skip astr_excluded
//   IF of_isexcluded(as_object, astr_exclude) THEN RETURN

   IF NOT of_IsObjectValid(adw, as_object) THEN RETURN
   // Head Text Name >> Column Name
   as_object = mid(as_object, 1, Len(as_object) - 2)

   lb_controlkey = KeyDown(KeyControl!)

   // get prev sort
   ll_count = of_GetSort(adw, ls_cols, ls_type)
   IF ll_count > 0 THEN
      FOR n = 1 to ll_count
         IF ls_cols[n] = as_object THEN
            lb_found = TRUE
            IF ls_type[n] = "A" THEN
               ls_sorttype = " D"
            ELSE
               ls_sorttype = " A"
            END IF
            ls_sort += ls_cols[n] + ls_sorttype
         ELSE
            IF lb_controlkey THEN
               IF LEN(ls_sort) > 0 THEN ls_sort += ", "
               IF ls_cols[n] = as_object THEN
                  lb_found = TRUE
                  IF ls_type[n] = "A" THEN
                     ls_sorttype = " D"
                  ELSE
                     ls_sorttype = " A"
                  END IF
                  ls_sort += ls_cols[n] + ls_sorttype
               ELSE
                  ls_sort += ls_cols[n] + CString.SPACE + ls_type[n]
               END IF
            END IF
         END IF
      NEXT
      IF lb_controlkey AND NOT lb_found THEN
         ls_sort += ", " + as_object + " A"
      ELSE
         IF NOT lb_found THEN ls_sort = as_object + " A"
      END IF
   ELSE
      ls_sort = as_object + " A"
   END IF

   adw.SetSort(ls_sort)
   adw.Sort()

   IF lb_controlkey THEN adw.SetRedraw(FALSE)
   of_ShowSortArrows(adw, astr_headers)
   IF lb_controlkey THEN adw.SetRedraw(TRUE)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[]);RETURN of_sortarrowsclear(adw, astr_headers, FALSE)
end function

public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[], readonly boolean ab_reset);/*------------------------------------------------------------------------------------------------*
   of_sortarrowsclear(dw_1, str_header, FALSE)
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  TitleBar의 Sort Marker를 제거
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
long     n, ll_count
string   ls_shade, ls_arrow, ls_arrownum, ls_mod

IF NOT IsValid(adw) THEN RETURN 0
try
   // Destroy Arrows
   ll_count = UpperBound(astr_headers)
   FOR n = 1 to ll_count
      ls_arrow = astr_headers[n].column + ARROW_SUFFIX
      IF of_IsObjectValid(adw, ls_arrow) THEN
         ls_mod = "DESTROY " + ls_arrow
         adw.Modify(ls_mod)
      END IF
      ls_arrownum = astr_headers[n].column + ARROW_NUMSUFFIX
      IF of_IsObjectValid(adw, ls_arrownum) THEN
         ls_mod = "DESTROY " + ls_arrownum
         adw.Modify(ls_mod)
      END IF
      ls_shade = astr_headers[n].column + SHADE_SUFFIX
      IF of_IsObjectValid(adw, ls_shade) THEN
         ls_mod = "DESTROY " + ls_shade
         adw.Modify(ls_mod)
      END IF
   NEXT
   IF ab_reset THEN
      adw.SetSort(CString.EMPTY)
      adw.Sort()
   END IF
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay( rte )
end try
RETURN li_ret
end function

public function integer of_unfilter (readonly powerobject apo);//===========================================================================
// Function: of_UnFilter
// Access  : public
//---------------------------------------------------------------------------
// Description: DataWindow Filter Free
// Note:
//---------------------------------------------------------------------------
// Parameters:
// apo      필터 해제할 datawindow, datastore...
//---------------------------------------------------------------------------
// Return: integer
// 1  = 필터 해제 성공
// -1 = 필터 해제 실패
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
integer  li_ret = 1
string   ls_null

SetNull(ls_null)

IF NOT of_Isservicableobject( apo ) THEN RETURN -1

try
   IF apo.DYNAMIC FilteredCount() > 0 THEN
      apo.DYNAMIC SetFilter( ls_null )
      li_ret = apo.DYNAMIC Filter()
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN li_ret
end function

public function integer of_update (readonly powerobject apo);RETURN of_Update(apo, TRUE)
end function

public function integer of_update (readonly powerobject apo, readonly boolean ab_autocommit);/*------------------------------------------------------------------------------------------------*
   integer  of_Update( powerobject apo, boolean ab_autocommit )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 Update Properties를 이용해서 Data를 Update한다.
  -------------------------------------------------------------------------------------------------
   Parameters:
   powerobject       apo            : DataWindow 명
   boolean           ab_autocommit  : Auto Commit 여부
 *------------------------------------------------------------------------------------------------*/
RETURN of_Update(apo, SQLCA, ab_autocommit)
end function

public function integer of_update (readonly powerobject apo, readonly transaction atr, readonly boolean ab_autocommit);/*------------------------------------------------------------------------------------------------*
   integer  of_Update( powerobject apo,  transaction atr, boolean ab_autocommit )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 Update Properties를 이용해서 Data를 Update한다.
  -------------------------------------------------------------------------------------------------
   Parameters:
   powerobject       apo            : DataWindow 명
   transaction       atr            : Transaction 명
   boolean           ab_autocommit  : Auto Commit 여부
 *------------------------------------------------------------------------------------------------*/
integer  li_ret
long     n, ll_bound
string   ls_table
string   ls_column[], ls_types[]

IF NOT of_IsServicableObject(apo) THEN RETURN -1

try
   // Update Properties > Update Table Name을 얻는다.
   ls_table = of_getUpdateTable(apo)

   IF of_IsEmpty( ls_table ) THEN
      MessageBox( "확인", "Update할 수 없는 DataWindow입니다.~r~n해당 DataWindow의 Update Properties를 확인하세요!", Exclamation! )
      RETURN 0
   END IF

   // Updatable Columns에서 Primary Key값이 누락되었으면..
   ll_bound = of_Getprimarykeys(apo, ls_column, ls_types)
   FOR n = 1 to ll_bound
      IF apo.DYNAMIC Describe(ls_column[n] + ".Update") = CString.NO THEN
         MessageBox( "확인", "Updatable Columns에서 Primary Key값이 누락되어 Update할 수 없습니다.~r~n해당 DataWindow의 Update Properties를 확인하세요!", Exclamation! )
         RETURN 0
      END IF
   NEXT

   // DataWindow Update
   li_ret = apo.DYNAMIC UPDATE()

   IF li_ret = 1 THEN
      IF ab_autocommit THEN
         li_ret = of_commit(atr)
      END IF
   ELSE
      li_ret = of_rollback(atr)
   END IF
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay(rte)
end try
RETURN li_ret
end function

public subroutine of_setdisponly (readonly powerobject apo, readonly boolean ab_disponly);/*------------------------------------------------------------------------------------------------*
   of_SetDispOnly(powerobject apo, boolean ab_disponly)
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 모든 컬럼을 DisplayOnly로 변경 ( column값 선택 및 복사 가능 )
  -------------------------------------------------------------------------------------------------
   Parameters:
 *------------------------------------------------------------------------------------------------*/
long     n, ll_count
string   ls_columns[]
string   ls_style, ls_mod, ls_mode

IF NOT of_IsServicableObject(apo) THEN RETURN
try
   IF ab_disponly THEN
      ls_mode = CString.YES
   ELSE
      ls_mode = CString.NO
   END IF
   // Column Count
   ll_count = of_GetVisibleColumns( apo, ls_columns )

   ls_mod = CString.EMPTY
   FOR n = 1 to ll_count
      // Edit, EditMask등 체크.
      ls_style = of_GetColumnEditStyle( apo, ls_columns[n] )
/*
      ls_mod = ".Background.Color=~"" + &
                  STRING( CColor.WINDOW_BACKGROUND ) + &
                  "~tif (isRowNew(), " + STRING( CColor.ALTERNATE ) + &
                  ", " + STRING( CColor.TRANSPARENT ) + ")~""
*/
      ls_mod += CString.SPACE + ls_columns[n] + "." + ls_style + ".DisplayOnly='" + ls_mode + "'"
   NEXT
   IF NOT of_IsEmpty( ls_mod ) THEN
      apo.DYNAMIC Modify( ls_mod )
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

public function integer of_setdwclear (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
    of_setDWClear ( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  화면상의 전체 DataWindow에 Sort Mark Clear & DataWindwo Reset
 *------------------------------------------------------------------------------------------------*/
integer            li_mode
long               ll_ctr_cnt, i, k
string             ls_object[] = { "dw_list", "dw_main", "dw_source", "u_dw", "u_dwo" }
string             ls_args[]
DataWindow         ldw
UserObject         luo
Tab                ltab
Window             lw
ClassDefinition    lcd_windef, lcd_winparent
n_svc_pb           lnv_pb

try
   choose case apo.TypeOf()
      case DataWindow!
         k = 1
         ldw = apo
         lcd_windef = apo.ClassDefinition
         lcd_winparent = lcd_windef.Ancestor

         // Ancestor DataWindow 명이 Array List에 포함되면...
         IF of_StringPosArray(lcd_winparent.Name, ls_object) > 0 THEN
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
         FOR i = ll_ctr_cnt to 1 STEP -1
            k += of_setDWClear( luo.control[i] )
         NEXT
      case Tab!
         ltab = apo
         ll_ctr_cnt = UpperBound( ltab.control )
         FOR i = ll_ctr_cnt to 1 STEP -1
            k += of_setDWClear( ltab.control[i] )
         NEXT
      case Window!
         lw = apo
         ll_ctr_cnt = UpperBound( lw.control )
         FOR i = ll_ctr_cnt to 1 STEP -1
            k += of_setDWClear( lw.control[i] )
         NEXT
   end choose
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try

RETURN k
end function

public function string of_createdataobject (powerobject apo, string as_sql, transaction atr, readonly boolean ab_rownum);//===========================================================================
// Function: of_CreateDataObject (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  value     powerobject  apo
//  value     string       as_sql
//  value     transaction  atr
//  readonly  boolean      ab_rownum
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
integer  li_rtn, li_colTabsequence
long     row, rowcnt
string   sql_syntax, errers, new_syntax, ls_objects, ls_colname[], ls_type[], ls_band

IF NOT IsValid(apo)       THEN RETURN "데이타 윈도우가 없습니다."
IF gfn.of_IsEmpty(as_sql) THEN RETURN "SQL문를 작성후 작업하세요"
IF NOT IsValid(atr)       THEN RETURN "접속된 DataBase가 없습니다."

// 앞 공백을 지운다.
DO WHILE left(as_sql, 1) = ' '
   as_sql = mid(as_sql, 2)
LOOP

// Select 문을 검사한다.
IF Upper(left(as_sql, Len('select'))) <> Upper('select') THEN RETURN "SELECT 문장이 아닙니다."

// 행번호를 생성한다.
IF ab_RowNum THEN
   as_sql = "Select " + "Rownum = 0," + CString.CR_NL + mid(as_sql, 8)
END IF

sql_syntax = ''; errers = '' ; new_syntax = ''
sql_syntax = as_sql
new_syntax = atr.syntaxFromSQL(sql_syntax, "Style(Type=Grid)", errers)

IF Len(errers) > 0 THEN RETURN errers

li_rtn = apo.DYNAMIC CREATE(new_syntax, errers)

IF li_rtn = -1 THEN
   EXECUTE IMMEDIATE :as_sql USING atr;
   sql_syntax = "SQL Scrip Error" + CString.CR_NL
   sql_syntax += "작성된 SQL 형식이 잘못되었습니다." + CString.CR_NL
   sql_syntax += "PB Message: " + errers + CString.CR_NL
   sql_syntax += "DB Message: "
   sql_syntax += atr.sqlerrtext
   ROLLBACK USING atr;
   RETURN sql_syntax
END IF

try
   apo.DYNAMIC Modify("DataWindow.detail.height=68")
   apo.DYNAMIC Modify("DataWindow.header.height=136")
   apo.DYNAMIC reset()
   apo.DYNAMIC SetTransObject( atr )
   rowcnt = apo.DYNAMIC Retrieve()
   // DW 모양 꾸미기
   li_rtn = of_getobjects( apo, ls_colname, ls_type )
   li_colTabsequence = 0; row = 0
   IF rowcnt > 0 THEN
      DO WHILE TRUE
         row ++
         IF row > li_rtn THEN EXIT
         IF RIGHT(ls_colname[row], 2) = "_t" THEN
            apo.DYNAMIC Modify(ls_colname[row]+'.height = ' + apo.DYNAMIC Describe("DataWindow.header.height"))
         END IF

         ls_band = apo.DYNAMIC Describe(ls_colname[row] + ".band")
         IF ls_type[row] = "text" THEN
            apo.DYNAMIC Modify(ls_colname[row]+'.border="6"')
            apo.DYNAMIC Modify(ls_colname[row]+'.background.mode="2"')
            apo.DYNAMIC Modify(ls_colname[row]+'.background.color="67108864"')
         ELSE
            IF ls_colname[row] <> "RowNum" THEN
               li_colTabsequence += 10
               apo.DYNAMIC Modify(ls_colname[row]+'.tabsequence=' + string(li_colTabsequence))
               apo.DYNAMIC Modify(ls_colname[row]+'.background.mode="2"')
               apo.DYNAMIC Modify(ls_colname[row]+'.background.color="536870912~tif(currentrow() = getrow(),rgb(200,225,215),rgb(255,255,255))"')
            END IF
         END IF
         apo.DYNAMIC Modify(ls_colname[row]+'.font.face="굴림"')
         apo.DYNAMIC Modify(ls_colname[row]+'.font.height="-10"')
      LOOP
   END IF
   // 행번호 넣기
   IF ab_RowNum THEN
      FOR row = 1 to rowcnt
         apo.DYNAMIC SetItem(row, "Rownum", row)
      NEXT
      apo.DYNAMIC Modify('RowNum_t.Text = "행번호"')
      apo.DYNAMIC Modify('RowNum_t.height = ' + apo.DYNAMIC Describe("DataWindow.header.height"))
      apo.DYNAMIC Modify('RowNum.height = ' + apo.DYNAMIC Describe("DataWindow.header.height"))
      apo.DYNAMIC Modify('RowNum.width = 180')
      apo.DYNAMIC Modify('RowNum.alignment="0"')
      apo.DYNAMIC Modify('RowNum.tabsequence=32766')
      apo.DYNAMIC Modify('RowNum.border="6"')
      apo.DYNAMIC Modify('RowNum.background.mode="2"')
      apo.DYNAMIC Modify('RowNum.background.color="67108864"')
   END IF
catch (RunTimeError rte)
   errers = STRING(of_systemerrordisplay(rte))
end try

RETURN errers
end function

public function string of_createdataobject (powerobject apo, string as_sql);//===========================================================================
// Function: of_CreateDataObject (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  value     powerobject  apo
//  value     string       as_sql
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
RETURN of_CreateDataObject(apo, as_sql, SQLCA, FALSE)
end function

on n_svc_dwutils.create
call super::create
end on

on n_svc_dwutils.destroy
call super::destroy
end on

