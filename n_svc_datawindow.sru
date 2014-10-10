$PBExportHeader$n_svc_datawindow.sru
$PBExportComments$DataWindow Service Sets
forward
global type n_svc_datawindow from n_svc_dw
end type
end forward

global type n_svc_datawindow from n_svc_dw
end type

type variables
Protected:

CONSTANT long REQUIRED_LABEL_COLOR = CColor.LINK
CONSTANT long REQUIRED_COLUMN_COLOR = CColor.REQUIRED_BACKGROUND_COLOR
CONSTANT long REQUIRED_FAILED_LABEL_COLOR = CColor.RED
CONSTANT long AUTOSIZE_PAD = 192

Private:

string   is_keycolumn[]
//cache directory
CONSTANT string CACHE_DIRECTORY = "JADCache"

//prefix-suffix
CONSTANT string HEADER = "dwheader"
CONSTANT string LINES = "line"
CONSTANT string NORMAL = "_n"
CONSTANT string HOT = "_h"

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
CONSTANT string HOT_BACKGROUND_SYNTAX = 'CREATE text(band=header alignment="0" text="{2}" border="0" color="0" x="{3}" y="{4}" height="{6}" width="{5}" html.valueishtml="0"  name={1} visible="0"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="0" background.color="{7}")'

CONSTANT string F_EXT = ".bmp"

//CONSTANT string GRAYSEP1 = "gsep1_"
//CONSTANT string GRAYSEP2 = "gsep2_"

CONSTANT string GAP =  "8"  // 컬럼을 벋어나는 범위...(48)
CONSTANT long MINWIDTH = 64
CONSTANT long SIZE_TOLERANCE = 24

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
2 - color
3 - x
*/
CONSTANT string SEP = "text(band=foreground alignment='0' text='' border='0' color='{2}' x='{3}' y='12' height='{4}' width='4' html.valueishtml='0'  name={1} visible='1'  font.face='Marlett' font.height='-12' font.weight='400'  font.family='0' font.pitch='2' font.charset='2' background.mode='0' background.color='{2}')"// pointer='SizeWE!')"
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

CONSTANT string ARROW_ASCENDING = "t"
CONSTANT string ARROW_DESCENDING = "u"
CONSTANT string HEADER_HEIGHT = "80"
CONSTANT string ARROW_SUFFIX = "_arrow"
CONSTANT string ARROW_NUMSUFFIX = "_arrow_num"
CONSTANT string SHADE_SUFFIX = "_shade"
end variables

forward prototypes
public subroutine of_resetvalidate (readonly powerobject apo, readonly string as_validatecolumns[])
public function integer of_validatefields (readonly powerobject apo, readonly string as_validatecolumns[], ref string as_errorcolumns[], ref long al_rows[], ref string as_messages[])
public subroutine of_initvalidatefields (readonly powerobject apo, ref string as_columns[])
public function integer of_ignoredatetimeerror (powerobject apo, long al_row, string as_colname)
public subroutine of_editmode (readonly powerobject apo, readonly string as_taborders, readonly string as_validatecolumns[], readonly boolean ab_editmode, readonly boolean ab_standarddddw)
public subroutine of_editmode (readonly powerobject apo, readonly string as_taborders, readonly string as_validatecolumns[], readonly boolean ab_editmode)
public subroutine of_alternaterowcolor (readonly powerobject apo)
public subroutine of_alternaterowcolor (readonly powerobject apo, readonly boolean ab_alternate, readonly long al_alternatecolor)
public function boolean of_isheader (readonly string as_dwoname, readonly str_dwheader astr_headers[])
public function boolean of_isinheader (powerobject apo, readonly integer xpos, readonly integer ypos)
public subroutine of_showsortarrows (readonly powerobject apo, readonly str_dwheader astr_headers[])
public function boolean of_isexcluded (readonly string as_header, readonly str_dwheader astr_exclude[])
public function long of_isbetween (readonly powerobject apo, integer ai_xpos, integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[])
public subroutine of_clicked (readonly powerobject apo, string as_object, ref str_dwheader astr_headers[], ref str_dwheader astr_exclude[])
public subroutine of_dwmousemove (readonly powerobject apo, readonly integer ai_xpos, readonly integer ai_ypos, readonly long al_row, readonly string as_dwoname, ref str_dwheader astr_headers[], readonly str_dwheader astr_exclude[], readonly boolean ab_mousedown, ref boolean ab_mousecaptured, readonly boolean ab_allowhot, ref long al_anchor, ref long al_sizeindex)
public function integer of_getheaderindex (readonly string as_dwoname, readonly str_dwheader astr_headers[])
public function integer of_getheaderindex (readonly string as_dwoname, readonly string as_headers[])
public subroutine of_hotheader (readonly powerobject apo, readonly string as_dwoname, readonly str_dwheader astr_headers[])
protected function string of_getlinehotname ()
protected function string of_getlinenormalname ()
public subroutine of_resizelines (readonly datawindow adw, readonly str_dwheader headers[])
public subroutine of_resizeheader (readonly datawindow adw, integer ai_index, long al_xpos, ref str_dwheader astr_headers[], ref long al_anchor)
public subroutine of_pressheader (readonly datawindow adw, readonly str_dwheader astr_header, readonly boolean ab_press)
public function integer of_makedw (u_dw adw, ref str_dwheader astr_headers[])
public function long of_markanchor (readonly datawindow adw, readonly integer ai_xpos, readonly integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[])
public subroutine of_flushcache ()
protected function string of_getheadercachedirectory ()
public function integer of_settheme (readonly datawindow adw, readonly str_dwheader astr_headers[])
public subroutine of_clicked (readonly datawindow adw, readonly long al_row, readonly integer ai_selectionmode, ref dwobject adwo, ref str_dwrowselect astr)
public subroutine of_selectrow (readonly datawindow adw, readonly long al_row, readonly integer ai_selectionmode, ref str_dwrowselect astr, readonly boolean ab_isclicked)
public subroutine of_rowfocuschanged (readonly datawindow adw, readonly long al_currentrow, readonly integer ai_selectionmode, ref str_dwrowselect astr)
public subroutine of_invertselection (readonly datawindow adw)
public function integer of_unfilter (readonly powerobject apo)
public subroutine of_setoriginal (datawindow adw)
public function integer of_setcolumn (readonly powerobject apo, long al_row, readonly string as_colname)
public subroutine of_setdefaultcolor (powerobject apo)
public function boolean of_ismodified (readonly datawindow adw[])
public subroutine of_requiredcolor (readonly powerobject apo)
public function long of_required (readonly powerobject apo, ref long al_modifycnt[])
public function string of_gettext (readonly powerobject apo, string as_column)
public function string of_getcolumnstatus (readonly powerobject apo, long al_row, string as_column)
public function long of_required (readonly powerobject apo)
public function boolean of_isgroupband (readonly powerobject apo, ref long al_height)
public function long of_getbands (readonly powerobject apo, ref string as_bands[])
public function integer of_setheadtextbgcolor (readonly powerobject apo, readonly string as_color)
public function integer of_setheadtextcolor (readonly powerobject apo, readonly string as_color)
public subroutine of_gridoption (readonly powerobject apo)
public function string of_getcolumninitial (readonly powerobject apo, string as_column)
public function string of_getcolumninitial (readonly powerobject apo, long al_colid)
public function long of_setcolumnclear (readonly powerobject apo)
public function integer of_commit (readonly transaction atr)
public function integer of_commit ()
public function integer of_rollback (readonly transaction atr)
public function integer of_rollback ()
public subroutine of_settitleimage (readonly powerobject apo)
public function integer of_update (readonly powerobject apo, readonly transaction atr, readonly boolean ab_autocommit)
public function integer of_update (readonly powerobject apo, readonly boolean ab_autocommit)
public function integer of_update (readonly powerobject apo)
public subroutine of_settoggle (readonly powerobject apo, readonly dwobject dwo)
public subroutine of_settransdata (readonly powerobject apo, readonly string as_dataobject, readonly transaction atr)
public function string of_setvalue (readonly powerobject apo, readonly long al_row)
public function integer of_sorticoncreate (readonly powerobject apo)
public function integer of_sorticonclear (readonly powerobject apo)
public function string of_findcolumn (readonly datawindow adw, readonly string as_position)
public function string of_createdatawindow (readonly powerobject apo, string as_sql, transaction atr, readonly boolean ab_rownum)
public function long of_getheight (readonly powerobject apo)
public function string of_getheadername (readonly powerobject apo, readonly string as_column)
public function string of_getheadername (readonly powerobject apo, readonly string as_column, readonly string as_suffix)
public subroutine of_setsplit (readonly powerobject apo, readonly string as_column)
end prototypes

public subroutine of_resetvalidate (readonly powerobject apo, readonly string as_validatecolumns[]);long     n, ll_bound
string   ls_mod

ll_bound = UpperBound(as_validatecolumns)

IF NOT of_Isservicableobject( apo ) THEN RETURN

// Reset all columns
ls_mod = CString.EMPTY
for n = 1 to ll_bound
   ls_mod += as_validatecolumns[n] + "_t.Color=" + STRING(REQUIRED_LABEL_COLOR)
   IF n < ll_bound THEN ls_mod += " "
next

apo.DYNAMIC Modify(ls_mod)
end subroutine

public function integer of_validatefields (readonly powerobject apo, readonly string as_validatecolumns[], ref string as_errorcolumns[], ref long al_rows[], ref string as_messages[]);any      la_ret
long     n, ll_upper, ll_count, ll_rows, ll_ctr
string   ls_str

apo.DYNAMIC AcceptText()

ll_count = apo.DYNAMIC RowCount()
ll_upper = UpperBound(as_validatecolumns)

IF ll_upper <= 0 THEN RETURN 0

for ll_rows = 1 to ll_count
   for n = 1 to ll_upper
      la_ret = of_GetItemAny( apo, ll_rows, as_validatecolumns[n] )

      IF of_IsEmpty( la_ret ) THEN
         // set the buddy label color to failed
         apo.DYNAMIC Modify( as_validatecolumns[n] + "_t.Color=" + string(REQUIRED_FAILED_LABEL_COLOR) )

         // increment counter
         ll_ctr ++

         // check if there is an embedded error message
         ls_str = of_GetTagKeyword( apo, as_validatecolumns[n], "ERRMSG" )
         IF of_IsEmpty( ls_str ) THEN
            // Let's get the text of the
            // column's buddy label instead
            ls_str = trim(apo.DYNAMIC Describe(as_validatecolumns[n] + "_t.Text"))
            IF of_IsEmpty(ls_str) THEN
               ls_str = as_validatecolumns[n]
            ELSE
               // remove any colons (":")
               IF right(ls_str, 1) = ":" THEN
                  ls_str = mid(ls_str, 1, LEN(ls_str) - 1)
               END IF
            END IF
         END IF
         // store failed validation
         al_rows[ll_ctr] = ll_rows
         as_errorcolumns[ll_ctr] = as_validatecolumns[n]
         as_messages[ll_ctr] = ls_str
      ELSE
         // return buddy label color
         apo.DYNAMIC Modify( as_validatecolumns[n] + "_t.Color=" + string(REQUIRED_LABEL_COLOR) )
      END IF
   next
next

IF ll_count <= 0 THEN
   of_ResetValidate( apo, as_validatecolumns )
END IF

RETURN ll_ctr
end function

public subroutine of_initvalidatefields (readonly powerobject apo, ref string as_columns[]);long     ll_count, n, m, c
string   ls_empty[], ls_col
string   ls_types[], ls_mod

// init validation for following edit types
ls_types = {"edit", &
            "editmask", &
            "ddlb", &
            "dddw", &
            "checkbox", &
            "column"}

ll_count = this.of_GetColumnCount(apo)

for n = 1 to ll_count
   ls_col = '#' + STRING(n)
   for m = 1 to 6
      IF apo.DYNAMIC Describe(ls_col + "." + ls_types[m] + ".Required") = CString.YES THEN
         c ++
         as_columns[c] = apo.DYNAMIC Describe(ls_col + ".Name")
         ls_mod += as_columns[c] + "." + ls_types[m] + ".Required=" + CString.NO + CString.SPACE &
                 + as_columns[c] + "_t.Color=" + STRING(REQUIRED_LABEL_COLOR) + CString.SPACE &
                 + as_columns[c] + ".Background.Mode =0 " + CString.SPACE &
                 + as_columns[c] + ".Background.Color=" + STRING(REQUIRED_COLUMN_COLOR) + CString.SPACE
         EXIT
      END IF
   next
next

// one-hit modify
apo.DYNAMIC Modify(ls_mod)
end subroutine

public function integer of_ignoredatetimeerror (powerobject apo, long al_row, string as_colname);long     ll_ret
string   ls_dbtype

try
   ls_dbtype = of_getColumnDatatype(apo, as_colname)
   choose case ls_dbtype
      case CDWDataType.DATE
         date     ld
         SetNull(ld)
         apo.DYNAMIC SetItem(al_row, as_colname, ld)
         ll_ret = 3
      case CDWDataType.DATETIME
         datetime ldt
         SetNull(ldt)
         apo.DYNAMIC SetItem(al_row, as_colname, ldt)
         ll_ret = 3
      case CDWDataType.TIME
         time     lt
         SetNull(lt)
         apo.DYNAMIC SetItem(al_row, as_colname, lt)
         ll_ret = 3
      case else
         ll_ret = 2
   END CHOOSE
catch (RuntimeError ex)
   //swallow exception
finally
   RETURN ll_ret
end try
end function

public subroutine of_editmode (readonly powerobject apo, readonly string as_taborders, readonly string as_validatecolumns[], readonly boolean ab_editmode, readonly boolean ab_standarddddw);long     ll_count, n, ll_labelcolor, ll_backcolor, ll_dwbackcolor
string   ls_mod, ls_backmode, ls_weight

IF ab_editmode THEN
   of_SetTabSequence(apo, as_taborders)
   of_Removedropdownarrows(apo, FALSE)
//   IF ab_standarddddw THEN of_Standarddddw(apo)
   ll_labelcolor = REQUIRED_LABEL_COLOR
   ll_backcolor = REQUIRED_COLUMN_COLOR
   ll_dwbackcolor = CColor.WINDOW_BACKGROUND
   ls_backmode = "0"
   ls_weight = "400"
ELSE
   of_RemoveTabSequence(apo)
   of_Removedropdownarrows(apo, TRUE)
   ll_labelcolor = CColor.WINDOW_TEXT
   ll_backcolor = CColor.WINDOW_BACKGROUND
   ll_backcolor = CColor.WINDOW_BACKGROUND
   ll_dwbackcolor = CColor.BUTTON_FACE
   ls_backmode = "1"
   ls_weight = "400"
END IF

ll_count = UpperBound(as_validatecolumns)

for n = 1 to ll_count
   ls_mod += as_validatecolumns[n] + "_t.Color=" + STRING(ll_labelcolor) + CString.SPACE &
          +  as_validatecolumns[n] + "_t.Font.Weight=" + ls_weight + CString.SPACE &
          +  as_validatecolumns[n] + ".Background.Mode =" + ls_backmode + CString.SPACE &
          +  as_validatecolumns[n] + ".Background.Color=" + STRING(ll_backcolor) + CString.SPACE
next

ls_mod += "Datawindow.Color=" + STRING(ll_dwbackcolor)

// one-hit modify
apo.DYNAMIC Modify(ls_mod)
end subroutine

public subroutine of_editmode (readonly powerobject apo, readonly string as_taborders, readonly string as_validatecolumns[], readonly boolean ab_editmode);of_editmode( apo, as_taborders, as_validatecolumns, ab_editmode, FALSE )
end subroutine

public subroutine of_alternaterowcolor (readonly powerobject apo);of_alternaterowcolor( apo, TRUE, CColor.ALTERNATE )
end subroutine

public subroutine of_alternaterowcolor (readonly powerobject apo, readonly boolean ab_alternate, readonly long al_alternatecolor);string   ls_mod

IF NOT of_isservicableobject( apo ) THEN RETURN

IF ab_alternate THEN
   ls_mod = "Datawindow.Detail.Color=~"" + &
               STRING(CColor.WINDOW_BACKGROUND) + &
               "~tif (mod(getrow(), 2) = 0, " + STRING(al_alternatecolor) + &
               ", " + STRING(CColor.TRANSPARENT) + ")~""
ELSE
   ls_mod = "Datawindow.Detail.Color=" + STRING(CColor.TRANSPARENT)
END IF

apo.DYNAMIC Modify(ls_mod)
end subroutine

public function boolean of_isheader (readonly string as_dwoname, readonly str_dwheader astr_headers[]);long  n, ll_bound

// check name
IF Pos(as_dwoname, HEADER) > 0 THEN RETURN TRUE

ll_bound = UpperBound(astr_headers)
for n = 1 to ll_bound
   IF as_dwoname = astr_headers[n].header THEN RETURN TRUE
next

RETURN FALSE


end function

public function boolean of_isinheader (powerobject apo, readonly integer xpos, readonly integer ypos);long  ll1, ll2

ll1 = PixelsToUnits(ypos, YPixelsToUnits!)
ll2 = PixelsToUnits(xpos, XPixelsToUnits!)

IF ll1 < 0 THEN RETURN FALSE
IF ll2 < 0 THEN RETURN FALSE

RETURN ll1 <= LONG(apo.DYNAMIC Describe("Datawindow.Header.height"))// AND (ll2 <= apo.DYNAMIC width)
end function

public subroutine of_showsortarrows (readonly powerobject apo, readonly str_dwheader astr_headers[]);boolean  lb_mod
long     n, ll_count, ll_x, ll_w, ll_h, ll_color, ll_height
string   ls_cols[], ls_sort[], ls_mod, ls_modtmp
string   ls_shade, ls_arrow, ls_arrownum, ls_header, ls_sorttype, ls_amod
string   ls_x, ls_w
DataWindow        ldw

IF NOT of_isservicableobject( apo ) THEN RETURN

IF TypeOf( apo ) = DataWindow! THEN
   ldw = apo
   ll_height = ldw.Height
END IF

// set shade color
ll_color = CColor.WHITE_SMOKE

// destroy arrows
ll_count = UpperBound(astr_headers)
for n = 1 to ll_count
   // arrows
   ls_arrow = astr_headers[n].column + ARROW_SUFFIX
   ls_mod = "DESTROY " + ls_arrow
   apo.DYNAMIC Modify(ls_mod)

   ls_arrownum = astr_headers[n].column + ARROW_NUMSUFFIX
   ls_mod = "DESTROY " + ls_arrownum
   apo.DYNAMIC Modify(ls_mod)

   ls_shade = astr_headers[n].column + SHADE_SUFFIX
   ls_mod = "DESTROY " + ls_shade
   apo.DYNAMIC Modify(ls_mod)
next

// create sort arrows
ll_count = of_getsort( apo, ls_cols, ls_sort )
for n = 1 to ll_count
   // build arrow
   ls_header = ls_cols[n] + "_t"
   IF NOT of_isheader(ls_header, astr_headers) THEN CONTINUE

   // flag draw
   lb_mod = TRUE
   ls_arrow = ls_cols[n] + ARROW_SUFFIX

   // get coord
   ll_x = LONG(apo.DYNAMIC Describe(ls_header + ".X")) + LONG(apo.DYNAMIC Describe(ls_header + ".width")) - 80

   // get sort type
   IF ls_sort[n] = "A" THEN
      ls_sorttype = ARROW_ASCENDING
   ELSE
      ls_sorttype = ARROW_DESCENDING
   END IF
   ls_mod = "CREATE " + of_Format(ARROW, {ls_arrow, STRING(ll_x), ls_sorttype})
   apo.DYNAMIC Modify(ls_mod)

   // build arrow numbers
   IF ll_count > 1 THEN
      ls_arrownum = ls_cols[n] + ARROW_NUMSUFFIX
      ll_x -= 16
      ls_mod = "CREATE " + of_Format(ARROW_NUM, {ls_arrownum, STRING(ll_x), STRING(n)})
      apo.DYNAMIC Modify(ls_mod)
   END IF

   // build shade
   ls_shade = ls_cols[n] + SHADE_SUFFIX
   // get coord
   ll_x = LONG(apo.DYNAMIC Describe(ls_header + ".X")) - LONG(GAP)
   ll_w = LONG(apo.DYNAMIC Describe(ls_header + ".width")) + LONG(GAP)
   ll_h = LONG(apo.DYNAMIC Describe("Datawindow.Detail.height")) + 30 //off-set
   ll_h *= apo.DYNAMIC RowCount()
   IF ll_h < ll_height THEN ll_h = ll_height
   ls_mod = "CREATE " + of_Format(SHADE, {ls_shade, STRING(ll_x), STRING(ll_w), STRING(ll_h), STRING(ll_color)})
   apo.DYNAMIC Modify(ls_mod)
next
end subroutine

public function boolean of_isexcluded (readonly string as_header, readonly str_dwheader astr_exclude[]);long  n, ll_bound

ll_bound = UpperBound(astr_exclude)
for n = 1 to ll_bound
   IF as_header = astr_exclude[n].header THEN RETURN TRUE
next

RETURN FALSE
end function

public function long of_isbetween (readonly powerobject apo, integer ai_xpos, integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[]);boolean  lb
long     n, m, ll_b, ll_c

ai_xpos = PixelsToUnits(ai_xpos, XPixelsToUnits!)
ai_ypos = PixelsToUnits(ai_ypos, YPixelsToUnits!)

IF ai_ypos > LONG(apo.DYNAMIC Describe("Datawindow.Header.Height")) THEN RETURN -1

ll_b = UpperBound(astr_headers)
ll_c = UpperBound(astr_exclude)

ai_xpos += LONG(apo.DYNAMIC Describe("Datawindow.HorizontalScrollPosition"))

for n = 1 to ll_b
   lb = FALSE
   for m = 1 to ll_c
      IF astr_headers[n].header = astr_exclude[m].header THEN
         lb = TRUE
         EXIT
      END IF
   next
   IF lb THEN CONTINUE
   IF ai_xpos >= astr_headers[n].lgap AND ai_xpos <= astr_headers[n].rgap THEN RETURN n
next

RETURN -1
end function

public subroutine of_clicked (readonly powerobject apo, string as_object, ref str_dwheader astr_headers[], ref str_dwheader astr_exclude[]);boolean  lb_found, lb_controlkey
long     n, ll_count
string   ls_sort, ls_cols[], ls_type[], ls_sorttype

// skip astr_excluded
IF of_isexcluded(as_object, astr_exclude) THEN RETURN

as_object = mid(as_object, 1, LEN(as_object) - 2)

lb_controlkey = KeyDown(KeyControl!)

// get prev sort
ll_count = of_GetSort( apo, ls_cols, ls_type )
IF ll_count > 0 THEN
   for n = 1 to ll_count
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
   next
   IF lb_controlkey AND NOT lb_found THEN
      ls_sort += ", " + as_object + " A"
   ELSE
      IF NOT lb_found THEN ls_sort = as_object + " A"
   END IF
ELSE
   ls_sort = as_object + " A"
END IF

apo.DYNAMIC SetSort(ls_sort)
apo.DYNAMIC Sort()

apo.DYNAMIC EVENT ue_rowchanged()

IF lb_controlkey THEN apo.DYNAMIC SetRedraw(FALSE)
this.of_ShowSortArrows(apo, astr_headers)
IF lb_controlkey THEN apo.DYNAMIC SetRedraw(TRUE)
end subroutine

public subroutine of_dwmousemove (readonly powerobject apo, readonly integer ai_xpos, readonly integer ai_ypos, readonly long al_row, readonly string as_dwoname, ref str_dwheader astr_headers[], readonly str_dwheader astr_exclude[], readonly boolean ab_mousedown, ref boolean ab_mousecaptured, readonly boolean ab_allowhot, ref long al_anchor, ref long al_sizeindex);long        n, llc, ll_lt, ll_rt, ll_lindex
string      ls_l, ls_r
string      lslx, lslw, lsrx
n_svc_win32 lnw

IF of_IsInHeader(apo, ai_xpos, ai_ypos) THEN
   IF NOT ab_MouseCaptured THEN
      ab_MouseCaptured = TRUE
      lnw.SetCapture(Handle(apo))
   END IF
ELSE
   IF ab_MouseCaptured THEN
      ab_MouseCaptured = FALSE
      lnw.Releasecapture()
   END IF
END IF

// skip if excluded column
IF of_IsExcluded(as_dwoname, astr_exclude) THEN RETURN

// hot header ( 불필요 - 이넘대문에 색상변경 발생 )
//IF ab_allowhot THEN
//   IF NOT ab_mousedown THEN
//      of_HotHeader(apo, as_dwoname, astr_headers)
//   ELSE
//      of_HotHeader(apo, CString.EMPTY, astr_headers)
//   END IF
//END IF

// check if we are at header band
IF as_dwoname = CString.EMPTY THEN RETURN

IF NOT ab_mousedown THEN
   al_SizeIndex = of_IsBetween(apo, ai_xpos, ai_ypos, astr_headers, astr_exclude)
   IF al_SizeIndex = -1 THEN
      SetPointer(Arrow!)
   ELSE
      SetPointer(SizeWE!)
   END IF
ELSE
   IF al_SizeIndex > 0 THEN
      SetPointer(SizeWE!)
      of_ResizeHeader(apo, al_SizeIndex, ai_xpos, astr_headers, al_anchor)
   END IF
END IF
end subroutine

public function integer of_getheaderindex (readonly string as_dwoname, readonly str_dwheader astr_headers[]);long     n, ll_bound

ll_bound = UpperBound(astr_headers)
for n = 1 to ll_bound
   IF as_dwoname = astr_headers[n].header THEN RETURN n
next
RETURN -1
end function

public function integer of_getheaderindex (readonly string as_dwoname, readonly string as_headers[]);long     n, ll_bound

ll_bound = UpperBound(as_headers)
for n = 1 to ll_bound
   IF as_dwoname = as_headers[n] THEN RETURN n
next
RETURN -1
end function

public subroutine of_hotheader (readonly powerobject apo, readonly string as_dwoname, readonly str_dwheader astr_headers[]);long     ll_color, ll_count, n, ll_color2
long     llt
string   ls_mod
string   ls_x, ls_h, ls_w

IF NOT of_IsHeader(as_dwoname, astr_headers) THEN
   ls_mod  = HEADER + ".Visible=0"
   ls_mod += CString.SPACE + HEADER + LINES + HOT + ".Visible=0"
ELSE
   // is it hot already?
   long     ll_index, ll
   string   lsw, lsx

   ls_mod = HEADER + ".Visible=1"
   ls_mod += CString.SPACE + of_GetLineHotName() + ".Visible=1"

   ll_index = of_GetHeaderIndex(as_dwoname, astr_headers)
   IF ll_index > 0 THEN
      ll = LONG(apo.DYNAMIC Describe(astr_headers[ll_index].header + ".x"))
      ll = UnitsToPixels(ll - LONG(GAP), XUnitsToPixels!)
      lsx = STRING(PixelsToUnits(ll, XPixelsToUnits!))

      lsw = STRING(LONG(apo.DYNAMIC Describe(astr_headers[ll_index].header + ".width")) + LONG(GAP) + 4)
      ls_mod += CString.SPACE + HEADER + ".x=" + lsx
      ls_mod += CString.SPACE + HEADER + ".width=" + lsw
      ls_mod += CString.SPACE + of_GetLineHotName() + ".x=" + lsx
      ls_mod += CString.SPACE + of_GetLineHotName() + ".width=" + lsw
   END IF
END IF

apo.DYNAMIC Modify(ls_mod)
end subroutine

protected function string of_getlinehotname ();RETURN HEADER + LINES + HOT
end function

protected function string of_getlinenormalname ();RETURN HEADER + LINES + NORMAL
end function

public subroutine of_resizelines (readonly datawindow adw, readonly str_dwheader headers[]);long     ll, n, llt, llp, ll_totw
string   lsx, lsw, lsw2, ls_mod

ll = UpperBound(headers)

ll_totw = LONG(adw.Describe(headers[ll].header + ".x")) + LONG(adw.Describe(headers[ll].header + ".width"))

IF ll_totw + 48 < adw.width THEN 
   ll_totw = adw.width + 48
   IF adw.HScrollBar THEN adw.HScrollBar = FALSE
ELSE
   IF NOT adw.HScrollBar THEN adw.HScrollBar = TRUE
END IF
lsw = STRING(ll_totw)

ls_mod = of_GetLineNormalName() + ".width=" + lsw

// position separators
//for n = 1 to ll
//   llt = LONG(adw.Describe(headers[n].header + ".X")) + LONG(adw.Describe(headers[n].header + ".Width"))
//   llp = UnitsToPixels(llt, XUnitsToPixels!)
//   lsw = STRING(llt)
//   lsx = STRING(PixelsToUnits(llp - 1, XPixelsToUnits!))
//   ls_mod += " " + GRAYSEP1 + headers[n].header + ".X=" + lsx
//
//   lsx = STRING(PixelsToUnits(llp - 2, XPixelsToUnits!))
//   ls_mod += " " + GRAYSEP2 + headers[n].header + ".X=" + lsx
//next

adw.Modify(ls_mod)
of_ShowSortArrows(adw, headers)
end subroutine

public subroutine of_resizeheader (readonly datawindow adw, integer ai_index, long al_xpos, ref str_dwheader astr_headers[], ref long al_anchor);long     ll_newwidth, ll_inc, llx, llc, n, llw, lls
string   lsx, ls_column
string   ls_mod

IF al_anchor = -1 THEN RETURN

al_xpos += UnitsToPixels(LONG(adw.Describe("Datawindow.HorizontalScrollPosition")), XUnitsTopixels!)

llx = LONG(adw.Describe(astr_headers[ai_index].header + ".x"))

//header resize
llw = UnitsToPixels(LONG(adw.Describe(astr_headers[ai_index].header + ".width")), XUnitsToPixels!)
ll_inc = al_xpos - al_anchor
ll_newwidth = llw + ll_inc
ll_newwidth = PixelsToUnits(ll_newwidth, XPixelsToUnits!)
IF ll_newwidth <= MINWIDTH THEN RETURN
ls_mod = astr_headers[ai_index].header + ".width=" + STRING(ll_newwidth)

//column resize
ls_column = astr_headers[ai_index].column
llw = UnitsToPixels(LONG(adw.Describe(ls_column + ".width")), XUnitsToPixels!)
ll_newwidth = llw + ll_inc
ll_newwidth = PixelsToUnits(ll_newwidth, XPixelsToUnits!)
ls_mod += " " + ls_column + ".width=" + STRING(ll_newwidth)
astr_headers[ai_index].lgap = (llx + ll_newwidth) - size_tolerance
astr_headers[ai_index].rgap = (llx + ll_newwidth) + size_tolerance
//set new al_anchor
al_anchor = al_xpos

llc = UPPERBOUND(astr_headers)

IF ai_index < llc THEN
   lls = ai_index + 1
   ll_inc = PixelsToUnits(ll_inc, XPixelsToUnits!)
   for n = lls to llc
      lsx = adw.Describe(astr_headers[n].header + ".x")
      llw = LONG(adw.Describe(astr_headers[n].header + ".width"))
      llx = LONG(lsx) + ll_inc
      astr_headers[n].lgap = (llx + llw) - size_tolerance
      astr_headers[n].rgap = (llx + llw) + size_tolerance
      ls_mod += " " + astr_headers[n].header + ".x=" + STRING(llx)
      ls_column = astr_headers[n].column
      lsx = adw.Describe(ls_column + ".x")
      ls_mod += " " + ls_column + ".x=" + STRING(LONG(lsx) + ll_inc)
   next
END IF

// one-hit modify
adw.SetRedraw(FALSE)
adw.Modify(ls_mod)

// fire event
adw.DYNAMIC EVENT ue_headersizing(ai_index)

// resize line
of_ResizeLines(adw, astr_headers)
adw.SetRedraw(TRUE)
end subroutine

public subroutine of_pressheader (readonly datawindow adw, readonly str_dwheader astr_header, readonly boolean ab_press);long     ll_color, llpx
string   ls_val, ls_mod, ls_vis

IF ab_press THEN
   ll_color = RGB(210, 210, 210)
   ls_vis = "0"
ELSE
//   n_svc_mgr   lnv_svc
//   n_svc_theme lnv_t
//   str_theme   lstr
//
//   lnv_svc.of_LoadSvc(lnv_t, CSvc.THEME)
//   lstr = lnv_t.of_GetTheme()
//   ll_color = lstr.ListviewBackgroundHot
   ls_vis = "1"
END IF

IF adw.Describe(HEADER + ".Visible") = "1" THEN
   ls_mod += of_GetLineHotName() + ".Visible='" + ls_vis + "'"
END IF
ls_mod += CString.SPACE + HEADER + ".Background.Color=" + STRING(ll_color)

long  llp

llp = LONG(adw.Describe("Datawindow.Header.Height")) * .15

IF ab_press THEN
   llpx = UnitsToPixels(LONG(adw.Describe(astr_header.header + ".X")), XUnitsToPixels!)
   ls_mod += " " + astr_header.header + ".X=" + STRING(PixelsToUnits(llpx + 1, XPixelsToUnits!))
   ls_mod += " " + astr_header.header + ".Y=" + STRING(llp + 4)
ELSE
   IF INTEGER(adw.Describe(astr_header.header + ".Y")) > llp THEN
      llpx = UnitsToPixels(LONG(adw.Describe(astr_header.header + ".X")), XUnitsToPixels!)
      ls_mod += " " + astr_header.header + ".X=" + STRING(PixelsToUnits(llpx - 1, XPixelsToUnits!))
      ls_mod += " " + astr_header.header + ".Y=" + STRING(llp)
   END IF
END IF

adw.Modify(ls_mod)
end subroutine

public function integer of_makedw (u_dw adw, ref str_dwheader astr_headers[]);long        ll_count, n, llx, llw
string      ls_path, ls_filename
string      ls_headerheight, ls_percenty, ls_liney, ls_sepheight
string      ls_mod, ls_cols[], lsw, lsx

// make sure it's a tabular DW
//IF of_GetDWStyle(adw) <> CDWProc.DEFAULT THEN RETURN -1
IF integer( of_GetDWStyle(adw) ) > 1 THEN RETURN -1

//IF adw.#FixedHeaderHeight THEN
   ls_headerheight = HEADER_HEIGHT
//ELSE
   ls_headerheight = adw.Describe("Datawindow.Header.Height")
//END IF

ls_mod = "Datawindow.Header.Height=" + ls_headerheight

ls_percenty = STRING(LONG(ls_headerheight) * .15, "#,##0")

ls_liney = STRING(PixelsToUnits( &
                  UnitsToPixels(LONG(ls_headerheight), YUnitsToPixels!) - 3, &
                  YPixelsToUnits!))

ls_sepheight = STRING(PixelsToUnits( &
                      UnitsToPixels(LONG(ls_headerheight), YUnitsToPixels!) - 9, &
                      YPixelsToUnits!))

//normal line
/*
 1 = dwobjname
 2 = filename
 3 = x
 4 = yes
 5 = width
 6 = height
*/
ls_mod += " " + of_Format(NORMAL_LINE_SYNTAX, &
            {&
            of_GetLineNormalName(), &
            CString.EMPTY, &
            "0", &
            ls_liney, &
            "4", &
            STRING(PixelsToUnits(3, YPixelsToUnits!)) &
            })

//hot line
/*
 1 = dwobjname
 2 = filename
 3 = x
 4 = y
 5 = width
 6 = height
*/
ls_mod += " " + of_Format(HOT_LINE_SYNTAX, &
            {&
            of_GetLineHotName(), &
            CString.EMPTY, &
            "0", &
            ls_liney, &
            "4", &
            STRING(PixelsToUnits(3, YPixelsToUnits!)) &
            })

//header
/*
 1 - name
 2 - text
 3 - x
 4 - y
 5 - width
 6 - height
 7 - color
*/
ls_mod += " " + of_Format(HOT_BACKGROUND_SYNTAX, &
            {&
            HEADER, &
            CString.EMPTY, &
            "0", &
            "0", &
            "4", &
            ls_headerheight, &
            STRING(CColor.WHITE) &
            })

//reset headers
str_dwheader   lstr_empty[]

astr_headers = lstr_empty

ll_count = of_GetVisibleColumns(adw, ls_cols, CDWBand.DETAIL, TRUE, TRUE)
for n = 1 to ll_count
   astr_headers[n].header = ls_cols[n] + "_t"
   astr_headers[n].column = ls_cols[n]

   // flatten and not bold
   ls_mod += " " + astr_headers[n].header + ".Border=0 " + astr_headers[n].header + ".Background.Mode=1 " + astr_headers[n].header + ".Font.Weight=400"
   ls_mod += " " + astr_headers[n].header + ".Y=" + ls_percenty//12"
   ls_mod += " " + astr_headers[n].header + ".Height=" + ls_headerheight

   // set positions
   lsw = adw.Describe(astr_headers[n].header + ".width")
   IF NOT ISNUMBER(lsw) THEN lsw = GAP

   IF n = 1 THEN
      ls_mod += " " + astr_headers[n].header + ".X=" + GAP
      llx = LONG(GAP)
      ls_mod += " " + ls_cols[n] + ".X=" + STRING(LONG(GAP) / 2)
      llx += LONG(lsw)
      llw = LONG(lsw)// - (LONG(GAP) / 8)
      ls_mod += " " + ls_cols[n] + ".width=" + STRING(llw)
   ELSE
      // get previous header x location and width
      lsx = adw.Describe(astr_headers[n].header + ".X")
      llx += LONG(GAP)
      ls_mod += " " + astr_headers[n].header + ".X=" + STRING(llx)
      ls_mod += " " + ls_cols[n] + ".X=" + STRING(llx - (LONG(GAP) / 2))
      llx += LONG(lsw)
      llw = LONG(lsw)
      ls_mod += " " + ls_cols[n] + ".width=" + STRING(llw)
   END IF
   astr_headers[n].lgap = llx - size_tolerance
   astr_headers[n].rgap = llx + size_tolerance

   // header separators
//   lsx = STRING(llx)
//   ls_mod += " CREATE " + of_format(SEP, {GRAYSEP1 + astr_headers[n].header, "0", lsx, ls_sepheight})
//   lsx = STRING(LONG(lsx) - 4)
//   ls_mod += " CREATE " + of_format(SEP, {GRAYSEP2 + astr_headers[n].header, "0", lsx, ls_sepheight})
next

ls_mod = adw.Modify(ls_mod)

// position z order
//for n = 1 to ll_count
//   adw.SetPosition(GRAYSEP1 + astr_headers[n].header, "header", TRUE)
//   adw.SetPosition(GRAYSEP2 + astr_headers[n].header, "header", TRUE)
//next
adw.SetPosition(of_GetLineNormalName(), "header", TRUE)
adw.SetPosition(HEADER, "header", TRUE)
for n = 1 to ll_count
   adw.SetPosition(astr_headers[n].header, "header", TRUE)
next
adw.SetPosition(of_GetLineHotName(), "header", TRUE)

of_ResizeLines(adw, astr_headers)

RETURN 1
end function

public function long of_markanchor (readonly datawindow adw, readonly integer ai_xpos, readonly integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[]);long  ll_index

ll_index = of_IsBetween(adw, ai_xpos, ai_ypos, astr_headers, astr_exclude)

IF ll_index <> -1 THEN
   RETURN ai_xpos + UnitsToPixels(LONG(adw.Describe("Datawindow.HorizontalScrollPosition")), XUnitsToPixels!)
END IF

RETURN -1
end function

public subroutine of_flushcache ();//===========================================================================
// Function: of_Flushcache (public )
// Object: n_svc_dwlv
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  
//---------------------------------------------------------------------------
// Returns: (none)
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string      ls_path

//flush header cache and delete directory
n_svc_file  lnv_f

ls_path = of_GetHeaderCacheDirectory()

lnv_f.of_DelTree(ls_path)
end subroutine

protected function string of_getheadercachedirectory ();string      ls_path
n_svc_file  lnv_f

ls_path = lnv_f.of_GetTempPath()
ls_path = lnv_f.of_CombinePath(ls_path, CACHE_DIRECTORY + "_" + GetApplication().AppName)

//create directory
IF NOT DirectoryExists(ls_path) THEN
   CreateDirectory(ls_path)
END IF

RETURN ls_path
end function

public function integer of_settheme (readonly datawindow adw, readonly str_dwheader astr_headers[]);string      ls_path, ls_filenamenorm, ls_filenamehot
n_svc_file  lnv_f

ls_path = of_GetHeaderCacheDirectory()

//ls_filenamenorm = HEADER + LINES + STRING(astr.ThemeID) + NORMAL + F_EXT
//ls_filenamenorm = lnv_f.of_CombinePath(ls_path, ls_filenamenorm)

/*
IF NOT FileExists(ls_filenamenorm) THEN
   lnv_r.of_MakeHeaderLine(anv_svc, &
      astr.listviewline1normal, &
      astr.listviewline2normal, &
      astr.listviewline3normal, &
      ls_filenamenorm)
END IF
*/
//ls_filenamehot = HEADER + LINES + STRING(astr.ThemeID) + HOT + F_EXT
//ls_filenamehot = lnv_f.of_CombinePath(ls_path, ls_filenamehot)

/*
IF NOT FileExists(ls_filenamehot) THEN
   lnv_r.of_MakeHeaderLine(anv_svc, &
      astr.listviewline1hot , &
      astr.listviewline2hot , &
      astr.listviewline3hot, &
      ls_filenamehot)
END IF
*/
string   ls_mod
//
//ls_mod = "Datawindow.Header.Color=" + STRING(astr.ListviewBackgroundNormal)
//ls_mod += " " + HEADER + ".Background.Color=" + STRING(astr.ListviewBackgroundHot)
//ls_mod += " " + of_GetLineNormalName() + ".FileName='" + ls_filenamenorm + "'"
//ls_mod += " " + of_GetLineHotName() + ".FileName='" + ls_filenamehot + "'"
//
//// separator
//long     n, ll_count
//
//ll_count = UPPERBOUND(astr_headers)
//for n = 1 to ll_count
//   ls_mod += " " + GRAYSEP1 + astr_headers[n].header + ".Background.Color=" + STRING(astr.ListviewSeparator2)
//   ls_mod += " " + GRAYSEP2 + astr_headers[n].header + ".Background.Color=" + STRING(astr.ListviewSeparator1)
//next

adw.Modify(ls_mod)

RETURN 1
end function

public subroutine of_clicked (readonly datawindow adw, readonly long al_row, readonly integer ai_selectionmode, ref dwobject adwo, ref str_dwrowselect astr);IF NOT ISVALID(adw) THEN RETURN
IF NOT ISVALID(adwo) THEN RETURN
IF al_row <= 0 THEN RETURN

// store clicked row
astr.currentclickedrow = al_row

this.of_SelectRow(adw, al_row, ai_selectionmode, astr, TRUE)

// set as current row
IF adw.GetRow() <> al_row THEN
   adw.SetRow(al_row)
END IF
end subroutine

public subroutine of_selectrow (readonly datawindow adw, readonly long al_row, readonly integer ai_selectionmode, ref str_dwrowselect astr, readonly boolean ab_isclicked);long  n, ll_count

choose case ai_selectionmode
   case 1   //CDWRowSelect.SINGLE
      IF adw.IsSelected(al_row) THEN RETURN
      adw.SelectRow(0, FALSE)
      adw.SelectRow(al_row, TRUE)
   case 2   //CDWRowSelect.MULTIPLE
      IF ab_isclicked THEN
         adw.SelectRow(al_row, NOT adw.IsSelected(al_row))
      END IF
   case 3   //CDWRowSelect.EXTENDED
      IF KeyDown(KeyShift!) THEN
         // Shift pressed

         // Reset selection
         adw.SelectRow(0, FALSE)
         IF astr.AnchorRow = 0 THEN
            adw.SelectRow(al_row, TRUE)
         ELSE
            adw.SetRedraw(FALSE)
            IF astr.AnchorRow > al_row THEN
               for n = astr.AnchorRow to al_row STEP -1
                  adw.SelectRow(n, TRUE)
               next
            ELSE
               for n = astr.AnchorRow to al_row
                  adw.SelectRow(n, TRUE)
               next
            END IF
            adw.SetRedraw(TRUE)
         END IF
      ELSEIF KeyDown(KeyControl!) THEN
         // Control pressed
         IF ab_isclicked THEN
            adw.SelectRow(al_row, NOT adw.IsSelected(al_row))
            astr.AnchorRow = al_row
         END IF
      ELSE
         astr.AnchorRow = al_row
         adw.SelectRow(0, FALSE)
         adw.SelectRow(al_row, TRUE)
      END IF
end choose

astr.prevrow = al_row
astr.prevrowcount = adw.RowCount()
end subroutine

public subroutine of_rowfocuschanged (readonly datawindow adw, readonly long al_currentrow, readonly integer ai_selectionmode, ref str_dwrowselect astr);IF NOT ISVALID(adw) THEN RETURN
IF al_currentrow <= 0 THEN RETURN

this.of_SelectRow(adw, al_currentrow, ai_selectionmode, astr, FALSE)

// Reset clicked row
astr.currentclickedrow = 0
end subroutine

public subroutine of_invertselection (readonly datawindow adw);long  n, ll_count

ll_count = adw.RowCount()

adw.SetRedraw(FALSE)
for n = 1 to ll_count
   adw.SelectRow(n, NOT adw.IsSelected(n))
next
adw.SetRedraw(TRUE)
end subroutine

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

IF apo.DYNAMIC FilteredCount() > 0 THEN
   apo.DYNAMIC SetFilter( ls_null )
   li_ret = apo.DYNAMIC Filter()
END IF
RETURN li_ret
end function

public subroutine of_setoriginal (datawindow adw);//===========================================================================
// Function: of_setOriginal( public )
//---------------------------------------------------------------------------
// Description: DataWindow 수정 전으로 원복
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  value   DataWindow  adw
//---------------------------------------------------------------------------
// Returns: (None)
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
long   ll_tcnt, ll_rcnt

IF NOT IsValid( adw ) THEN RETURN

ll_rcnt = adw.RowCount()

IF ll_rcnt < 1 THEN RETURN

ll_tcnt = of_GetColumnCount(adw)

adw.SetRedraw( FALSE )
adw.Object.Data[1,1,ll_rcnt,ll_tcnt] = adw.Object.Data.Original[1,1,ll_rcnt,ll_tcnt]
adw.ResetUpdate()
adw.SetRedraw( TRUE )
end subroutine

public function integer of_setcolumn (readonly powerobject apo, long al_row, readonly string as_colname);long    n, ll_rcnt, ll_tcnt
string  ls_column

ll_rcnt = apo.DYNAMIC RowCount()

IF ll_rcnt = 0 THEN RETURN -1

IF IsNull(al_row) OR al_row <= 0 OR al_row > ll_rcnt THEN
   al_row = ll_rcnt
END IF

ls_column = as_colname

// Focusing 불가이면..
IF apo.DYNAMIC Describe( ls_column + ".Visible" ) = "0" OR &
   apo.DYNAMIC Describe( ls_column + ".Protect" ) = "1" OR &
   apo.DYNAMIC Describe( ls_column + ".TabSequence" ) = "0" THEN
   // DataWindow의 컬럼의 총 갯수.
   ll_tcnt = of_GetColumnCount(apo)

   DO WHILE ll_tcnt > n
      n ++
      ls_column = of_getcolumnname(apo, n)
      IF apo.DYNAMIC Describe( ls_column + ".Visible" ) = "1" THEN
         IF NOT (apo.DYNAMIC Describe( ls_column + ".Protect" ) = "1" OR &
                 apo.DYNAMIC Describe( ls_column + ".TabSequence" ) = "0") THEN
            EXIT
         END IF
      END IF
   LOOP
END IF

apo.DYNAMIC ScrollToRow( al_row )
apo.DYNAMIC SetRow( al_row )
apo.DYNAMIC SetColumn( ls_column )
apo.DYNAMIC SetFocus()

RETURN 1
end function

public subroutine of_setdefaultcolor (powerobject apo);/*------------------------------------------------------------------------------------------------*
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

ll_colcnt = of_GetColumnCount(apo)

ls_readonly = apo.DYNAMIC Describe("DataWindow.ReadOnly") // "Yes"/"No"

apo.DYNAMIC SetRedraw( FALSE )
for ll_idx = 1 to ll_colcnt
   ll_tabseq = long(apo.DYNAMIC Describe( "#" + string(ll_idx) + ".TabSequence" ))

   IF apo.DYNAMIC Describe( "#" + string(ll_idx) + ".Protect" ) = "1" OR &
      apo.DYNAMIC Describe( "#" + string(ll_idx) + ".TabSequence" ) = "0" THEN
      lb_disable = TRUE
   ELSE
      lb_disable = FALSE
   END IF

   // Background Mode가 Transparent이면 그 mode를 해제한다.
   apo.DYNAMIC Modify("#" + string(ll_idx) + ".Background.Mode='2'")

   IF Lower(ls_readonly) = "yes" THEN
      apo.DYNAMIC Modify( "#" + string(ll_idx) + ".Background.color ='12632256'" )
   ELSE
      IF lb_disable THEN
         apo.DYNAMIC Modify( "#" + string(ll_idx) + ".Background.color ='12632256'" )
      ELSE
         apo.DYNAMIC Modify( "#" + string(ll_idx) + ".Background.color ='16777215'" )
      END IF
   END IF
next
apo.DYNAMIC SetRedraw( TRUE )
end subroutine

public function boolean of_ismodified (readonly datawindow adw[]);//===========================================================================
// Function: of_IsModified (public )
//---------------------------------------------------------------------------
// Description: 변경된 DataWindow 가 있는지 체크.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly DataWindow adw
//---------------------------------------------------------------------------
// Returns: Boolean
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
long  n, ll_idx, ll_bound

ll_bound = UPPERBOUND( adw )

n = 0
for ll_idx = 1 to ll_bound
   adw[ ll_idx ].AcceptText()
   IF n <> 1 THEN
      IF (adw[ ll_idx ].DeletedCount() + adw[ ll_idx ].ModifiedCount() ) > 0 THEN
         n = 1
         EXIT
      END IF
   END IF
next

IF n = 0 THEN
   RETURN FALSE
ELSE
   RETURN TRUE
END IF
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

try
   ll_bound = of_GetColumnCount( apo )

   apo.DYNAMIC Modify ("DataWindow.Detail.Height.AutoSize=yes")

   for n = 1 to ll_bound
      // Get Column Name
      ls_column = of_GetColumnName( apo, n )

      // Edit, EditMask등 체크.
      ls_style  = of_GetColumnEditStyle( apo, ls_column )

      // Primary Key Column Color 지정.
      IF Lower(apo.DYNAMIC Describe( ls_column + ".Key" )) = "yes" THEN
         apo.DYNAMIC Modify( ls_column + ".Background.Mode='0'")
         apo.DYNAMIC Modify( ls_column + ".Background.color='" + String(CColor.LIGHT_PINK) + "'" )
      ELSE
         IF Lower(apo.DYNAMIC Describe( ls_column + "." + ls_style + ".Required" )) = "yes" THEN
            apo.DYNAMIC Modify( ls_column + ".Background.Mode='0'")
            apo.DYNAMIC Modify( ls_column + ".Background.color='" + String(CColor.YELLOW) + "'" )
         END IF
      END IF
   next
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

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

         for n = 1 to ll_tcnt
            // Get Column Name
            ls_column = of_GetColumnName( apo, n )

            ls_data = STRING( of_GetItemAny( apo, ll_row, ls_column ) )

            ls_coltype = of_GetColumnDatatype( apo, ls_column )
            choose case ls_coltype
               case "decimal", "long", "number", "real"
                  IF IsNull( ls_data ) THEN  // OR ls_data = "0"
                     ls_data = ""
                  END IF
               case else
            end choose

            // Edit, EditMask등 체크.
            ls_style  = of_GetColumnEditStyle( apo, ls_column )

            IF of_IsEmpty( ls_data ) THEN
               // If Required Checked
               IF Lower(apo.DYNAMIC Describe(ls_column + "." + ls_style + ".Required")) = "yes" THEN
                  ls_tag = apo.DYNAMIC Describe( ls_column + ".Tag" )

                  IF of_IsEmpty( ls_tag ) OR of_IsErrorString(ls_tag) THEN
                     ls_tag = of_getText( apo, ls_column )

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
         next
      END IF
   LOOP WHILE ll_row > 0
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
finally
   al_modifycnt = p
end try
RETURN (p[1] + p[2])
end function

public function string of_gettext (readonly powerobject apo, string as_column);// of_getText( "cpny_cd" )
string   ls_colName

IF of_IsEmpty( as_column ) THEN RETURN as_column

ls_colName = apo.DYNAMIC Describe(as_column + "_t.text")

IF of_IsEmpty( ls_colName ) OR of_IsErrorString( ls_colName ) THEN
   ls_colName = as_column
END IF
RETURN ls_colName
end function

public function string of_getcolumnstatus (readonly powerobject apo, long al_row, string as_column);//===========================================================================
// Function: of_GetColumnStatus( dw_1, 2, "code" )
//---------------------------------------------------------------------------
// Description: 컬럼 또는 데이타윈도의 상태여부 체크.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  powerobject apo
//  readonly  long        al_row
//  readonly  string      as_column
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string         ls
dwitemstatus   ldws

IF IsNull( al_row ) OR al_row <= 0 THEN RETURN ls

IF of_IsEmpty( as_column ) THEN
   ldws = apo.DYNAMIC GetItemStatus( al_row, 0, Primary! )
ELSE
   ldws = apo.DYNAMIC GetItemStatus( al_row, as_column, Primary! )
END IF

choose case ldws
   case New!
      ls = "NEW"
   case NewModified!
      ls = "NEWMODIFY"
   case DataModified!
      ls = "DATAMODIFY"
   case NotModified!
      ls = "NOTMODIFY"
end choose
RETURN ls
end function

public function long of_required (readonly powerobject apo);long     p[]

RETURN of_Required( apo, p )
end function

public function boolean of_isgroupband (readonly powerobject apo, ref long al_height);/*------------------------------------------------------------------------------------------------*
   boolean of_IsGroupBand( powerobject apo, ref long al_height )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   Grid에서 Group 사용 여부
  -------------------------------------------------------------------------------------------------
   Parameters:
   long              al_height        :
 *------------------------------------------------------------------------------------------------*/
boolean  lb_band = FALSE
long     n, ll_bound, ll_height
string   ls_bands[]

try
   // Get DataWindow Bands
   ll_bound = of_GetBands( apo, ls_bands )

   ll_height = 0
   for n = 1 to ll_bound
      IF Pos( Lower(ls_bands[n]), "trailer" ) > 0 THEN
         IF NOT lb_band THEN
            lb_band = TRUE
         END IF
         ll_height = ll_height + Long( apo.DYNAMIC Describe("DataWindow." + ls_bands[n] + ".Height") )
      END IF
   next

   // Group Style DW 스크롤시 보이는 회색선 제거
   IF ll_height > 40 THEN apo.DYNAMIC Modify("DataWindow.HideGrayLine='yes'")
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
RETURN lb_band
end function

public function long of_getbands (readonly powerobject apo, ref string as_bands[]);//===========================================================================
// Function: of_GetBands (public )
//---------------------------------------------------------------------------
// Description: DataWindow의 Band를 구한다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//                     powerobject   apo
//    reference        string        as_bands[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string  ls_bands

ls_bands = apo.DYNAMIC Describe( CString.BANDS )

of_parseToArray( ls_bands, CString.TAB, as_bands )

RETURN UpperBound( as_bands )
end function

public function integer of_setheadtextbgcolor (readonly powerobject apo, readonly string as_color);/*------------------------------------------------------------------------------------------------*
   of_setHeadTextBgColor ( powerobject apo, string as_color )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - DataWindow Head BackgroundColor & Head Object Color 변경
                                - of_setHeadTextBgColor( dw_1, "RED" )
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
long     n, ll_rcnt
string   ls_HTextColor, ls_Title, ls_syntax

try
   ls_HTextColor = string ( gfn.of_PBColor( as_color ) )

   // Text Object 수를 구함.
//   ll_rcnt = ids_TList.RowCount()
//   ls_syntax = CString.SPACE
//
//   for n = 1 to ll_rcnt
//      ls_Title = ids_TList.GetItemString( n, "colname" )
//      ls_syntax = ls_syntax + ls_Title + ".Background.Color='" + STRING( ls_HTextColor ) + "'"
//      ls_syntax = ls_syntax + ls_Title + '.Font.Face="' + FONT_NAME + '"' + ls_Title + '.Font.Height="-' + FONT_SIZE + '" '
//   next
   IF NOT of_IsEmpty( ls_syntax ) THEN
      apo.DYNAMIC Modify( ls_syntax )
   END IF
catch (RunTimeError rte)
   li_ret = of_systemerrordisplay( rte )
end try
RETURN li_ret
end function

public function integer of_setheadtextcolor (readonly powerobject apo, readonly string as_color);/*------------------------------------------------------------------------------------------------*
   integer of_headerTextColor ( powerobject apo, string as_color )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - 상단 정렬 취소 작업
                                - of_headerTextColor( "RED" )
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
long     n, ll_rcnt
string   ls_Title, ls_HTextColor

IF of_IsEmpty( as_color ) THEN RETURN -1

try
   ls_HTextColor = string ( gfn.of_PBColor( as_color ) )

//   ll_rcnt = ids_TList.RowCount()
//   for n = 1 to ll_rcnt
//      ls_Title = ids_TList.GetItemString( n, "colname" )
//      IF left(ls_Title, Len("BackIMAGE_")) <> "BackIMAGE_" AND &
//         right(ls_Title, Len("_sort")) <> "_sort" THEN
//         Modify(ls_Title + ".BackGround.Color=" + ls_HTextColor)
//      END IF
//   next
catch (RunTimeError rte)
   li_ret = of_systemerrordisplay ( rte )
end try
RETURN li_ret
end function

public subroutine of_gridoption (readonly powerobject apo);long     n, ll_bound
string   ls_syntax

try
//   IF #DwMode = 1 THEN
      // Grid DataWindow이면 selected mouse / column moving turn off 하기.
//      IF ii_DWProcessing = 1 THEN
         apo.DYNAMIC Modify("DataWindow.Grid.ColumnMove=No")
         apo.DYNAMIC Modify("DataWindow.Selected.Mouse=No")
//      END IF

//      IF #HeadColor THEN
//         apo.DYNAMIC Modify("DataWindow.Header.Color=" + HEAD_COLOR)

         // Head Text Background Color Clear
         of_setHeadTextBGColor( apo, string(CColor.TRANSPARENT) )

         // Object 수를 구함.
//         ll_bound = ids_CList.RowCount()
//         ls_syntax = CString.SPACE
//         for n = 1 to ll_bound
//            ls_syntax = ls_syntax + ids_CList.GetItemString(n, "colname") + '.Font.Face="' + FONT_NAME + '"' + ids_CList.GetItemString(n, "colname") + '.Font.Height="-' + FONT_SIZE + '" '
//         next

         IF NOT of_IsEmpty( ls_syntax ) THEN
            apo.DYNAMIC Modify( ls_syntax )
         END IF
//      END IF
      // Set Row Color Per Two Row
//      IF #ALTERNATE THEN
         of_alternaterowcolor(apo)
//      END IF
//   END IF
catch (RunTimeError rte)
   of_systemerrordisplay( rte )
end try
end subroutine

public function string of_getcolumninitial (readonly powerobject apo, string as_column);RETURN apo.DYNAMIC Describe( as_column + ".Initial" )
end function

public function string of_getcolumninitial (readonly powerobject apo, long al_colid);RETURN of_getColumnInitial( apo, of_GetColumnName(apo, al_colid) )
end function

public function long of_setcolumnclear (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
   long of_setColumnClear ( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  모든 컬럼을 투명하게
 *------------------------------------------------------------------------------------------------*/
 long       ll_row, ll_exit = 0
 string     ls_objects, ls_col

 try
   ls_objects = apo.DYNAMIC Describe( CString.OBJECTS )

   DO WHILE TRUE
      IF Pos(ls_objects, CString.TAB) > 0 THEN
         ls_col = Left(ls_objects, Pos(ls_objects, CString.TAB) - 1)
         ls_objects = Mid(ls_objects, Pos(ls_objects, CString.TAB) + 1)
      ELSE
         ls_col  = ls_objects
         ll_exit = 1
      END IF
      IF apo.DYNAMIC Describe(ls_col + ".visible") = "1" AND &
         apo.DYNAMIC Describe(ls_col + ".band")    = "detail" THEN
         apo.DYNAMIC Modify(ls_col + ".Background.Mode='1'")
      END IF
      IF ll_exit > 0 THEN EXIT
   LOOP
 catch (RunTimeError rte)
   ll_row = of_SystemErrorDisplay( rte )
 end try
 RETURN ll_row
end function

public function integer of_commit (readonly transaction atr);COMMIT USING atr;
RETURN 1
end function

public function integer of_commit ();RETURN of_commit( SQLCA )
end function

public function integer of_rollback (readonly transaction atr);ROLLBACK USING atr;
RETURN -1
end function

public function integer of_rollback ();RETURN of_rollback( SQLCA )
end function

public subroutine of_settitleimage (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
   of_setTitleImage( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 Title에 Image를 집어 넣는다.
   of_setTitleImage( dw_1 )
  -------------------------------------------------------------------------------------------------
   Parameters:
 *------------------------------------------------------------------------------------------------*/
long     ll_XPosition
string   ls_temp, ls_column, ls_path

try
//   IF ii_DWProcessing > 1 THEN RETURN

   // Grid Title Header의 높이가 50미만이면...
   IF long( apo.DYNAMIC Describe("DataWindow.Header.Height") ) < 50 THEN RETURN


   // Get Grid Last Column
//   ls_column = of_FindColumn( "LAST" )

   IF of_IsEmpty( ls_column ) THEN RETURN

   // Last Column X Position & Width를 구한다.
   ll_XPosition = long(apo.DYNAMIC Describe(ls_column + ".x")) + long(apo.DYNAMIC Describe(ls_column + ".width"))

//   ls_path = #TImagePath
   ls_temp = ' CREATE bitmap(band=header filename="' + ls_path + '" x="0~t0" y="0" height="100" width="' + &
            string( ll_XPosition ) + '" border="0" name=p_title visible="1" )'

   //헤더바 생성
   apo.DYNAMIC Modify( "DESTROY p_title" )
   apo.DYNAMIC Modify( ls_temp )

   //맨뒤로 보낸다
   apo.DYNAMIC SetPosition( "p_title", "Header", FALSE )
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

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
string   ls_tname

try
   // Update Properties > Update Table Name을 얻는다.
   ls_tname = of_getUpdateTable( apo )

   IF of_IsEmpty( ls_tname ) THEN
      MessageBox( "확인", "Update할 수 없는 DataWindow입니다.~r~n해당 DataWindow의 Update Properties를 확인하세요!", Exclamation! )
      RETURN 0
   END IF

   // Updatable Columns에서 Primary Key값이 누락되었으면..
   ll_bound = UpperBound( is_keycolumn )
   for n = 1 to ll_bound
      IF apo.DYNAMIC Describe(is_keycolumn[n] + ".Update") = "no" THEN
         MessageBox( "확인", "Updatable Columns에서 Primary Key값이 누락되어 Update할 수 없습니다.~r~n해당 DataWindow의 Update Properties를 확인하세요!", Exclamation! )
         RETURN 0
      END IF
   next

   // DataWindow Update
   li_ret = apo.DYNAMIC Update()

   IF li_ret = 1 THEN
      IF ab_autocommit THEN
         li_ret = of_commit( atr )
      END IF
   ELSE
      li_ret = of_rollback( atr )
   END IF
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay( rte )
end try
RETURN li_ret
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
RETURN of_Update( apo, SQLCA, ab_autocommit )
end function

public function integer of_update (readonly powerobject apo);RETURN of_Update( apo, TRUE )
end function

public subroutine of_settoggle (readonly powerobject apo, readonly dwobject dwo);/*------------------------------------------------------------------------------------------------*
   of_SetToggle( powerobject apo, dwobject dwo )
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow의 Column에 한글, 영문 기본값을 설정한다.
   of_setToggle( this, dwo )
  -------------------------------------------------------------------------------------------------
   Parameters:
   dwobject             dwo         : Column명을 추출하기 위해 dwobject
 *------------------------------------------------------------------------------------------------*/
try
//   IF Pos( #KColumns, dwo.Name ) > 0 THEN
//      gfn.of_Toggle( apo, "KOR" )
//   END IF
//   IF Pos( #EColumns, dwo.Name ) > 0 THEN ===> DW내부함수로...
//      gfn.of_Toggle( apo, "ENG" )
//   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

public subroutine of_settransdata (readonly powerobject apo, readonly string as_dataobject, readonly transaction atr);IF of_IsEmpty( as_dataobject ) THEN RETURN

// DataObject 설정.
//apo.DataObject = as_dataobject   ==> DW 내부함수로...

//SetTransObject( ATR )

// DataWindow Column 정보 읽기
// Get DataWindow Object (Title, Column)
//of_getObjects( apo )

// DataWindow 를 포함한 Window 찾기
//of_GetParentWindow( iw_parent )
//
//// DataWindow Read-Only
//IF #ReadOnly THEN
//   of_Readonly()
//END IF

// FreeForm DataWindow
//IF #DwMode = 2 THEN
//   HScrollBar = FALSE
//   VScrollBar = FALSE
//
//   // 필수입력항목 컬럼색상 지정..
//   of_RequiredColor( apo )
//END IF

// Then No Grid
//IF #DwMode <> 1 THEN RETURN

// DataWindow Type 구하기.
//ii_DWProcessing = integer(Describe( CString.PROCESSING ))

// Grid DataWindow가 아니면 리턴. [위의 연장이나 위에서 놓치면...]
//IF ii_DWProcessing > 1 THEN RETURN

// Column Moving & Mouse Selection turn off 하기.
of_GridOption(apo)

// Set Title Image
//IF #TitleImage THEN
//   of_SetTitleImage()
//END IF

// Multi-Select이면 RowSelect이다.
//IF #MultiSelect THEN
//   #RowSelect = #MultiSelect
//END IF

// Head Sort
//IF #HeadSort THEN
//   of_SortIconCreate()
//END IF
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

try
   ls_sysdate = gfn.of_Sysdate()
   ls_status  = left(of_GetColumnStatus(apo, al_row, CString.EMPTY), 3)

   IF ls_status = "NEW" THEN
      // Default
      IF of_IsObjectValid( apo, "cpny_cd" ) THEN
         of_setItem( apo, al_row, "cpny_cd", gs_CustID )
      END IF
      IF of_IsObjectValid( apo, "reg_id" ) THEN
         of_setItem( apo, al_row, "reg_id", gs_UserID )
      END IF
      IF of_IsObjectValid( apo, "reg_dte" ) THEN
         of_setItem( apo, al_row, "reg_dte", ls_sysdate )
      END IF
   END IF

   IF of_IsObjectValid( apo, "upd_id" ) THEN
      of_setItem( apo, al_row, "upd_id", gs_UserID )
   END IF
   IF of_IsObjectValid( apo, "upd_dte" ) THEN
      of_setItem( apo, al_row, "upd_dte", ls_sysdate )
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
   SetNull( ls_status )
end try
RETURN ls_status
end function

public function integer of_sorticoncreate (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
   integer  of_SortIconCreate ( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - 상단 Title부분에 그림 만들기
                                - of_SortIconCreate( )
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
long     n, ll_rcnt
string   ls_col, ls_Modify, ls_err
string   c_x, c_y, c_w, c_h

try
   c_y = "6" //Describe(ls_col+".y")
   c_h = apo.DYNAMIC Describe("DataWindow.Header.Height") //Describe(ls_col+".height")

//   ll_rcnt = ids_CList.RowCount()
//   for n = 1 to ll_rcnt
//      ls_col = ids_CList.GetItemString(n, "colname")
//
//      IF right(ls_col, Len(CString.SUFFIX)) = CString.SUFFIX THEN
//         ls_col = left(ls_col, Len(ls_col) - Len(CString.SUFFIX) )
//      END IF

      c_x = apo.DYNAMIC Describe( ls_col + ".x" )
      c_w = apo.DYNAMIC Describe( ls_col + ".width" )

      ls_Modify = 'Create Text('
      ls_Modify += 'band=header'
      ls_Modify += ' alignment="0"'
      ls_Modify += ' text=""'
      ls_Modify += ' border="0"'
      ls_Modify += ' color="8421504"'
      ls_Modify += ' x="'+c_x+'"'
      ls_Modify += ' y="'+c_y+'"'
      ls_Modify += ' height="'+c_h+'"'
      ls_Modify += ' width="'+c_w+'"'
      ls_Modify += ' html.valueishtml="0"'
      ls_Modify += ' name='+ls_col+'_sort'
      ls_Modify += ' visible="1"'
      ls_Modify += ' font.face="Arial"'
      ls_Modify += ' font.height="-9"'
      ls_Modify += ' font.weight="400"'
      ls_Modify += ' font.family="2"'
      ls_Modify += ' font.pitch="2"'
      ls_Modify += ' font.charset="0"'
      ls_Modify += ' background.mode="1"'
      ls_Modify += ' background.color="553648127"'
      ls_Modify += ')'

      ls_err = apo.DYNAMIC Modify( ls_Modify )
//   next
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay( rte )
end try
RETURN li_ret
end function

public function integer of_sorticonclear (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
   integer of_SortIconclear ( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Date(yyyy-mm-dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011-04-01                   - 상단 정렬 취소 작업
                                - of_SortIconclear( )
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
long     ll_row, ll_exit
string   ls_objects, ls_col

try
   ls_objects = apo.DYNAMIC Describe( CString.OBJECTS )

   DO WHILE TRUE
      IF Pos(ls_objects, CString.TAB) > 0 THEN
         ls_col = left(ls_objects, Pos(ls_objects, CString.TAB) - 1)
         ls_objects = mid(ls_objects, Pos(ls_objects, CString.TAB) + 1)
      ELSE
         ls_col = ls_objects
         ll_exit = 1
      END IF
      IF apo.DYNAMIC Describe(ls_col + ".Type")    = "text" AND &
         apo.DYNAMIC Describe(ls_col + ".Visible") = "1" AND &
         apo.DYNAMIC Describe(ls_col + ".Band")    = "header" THEN
         IF right(ls_col, Len(CString.SORT)) = CString.SORT THEN
            apo.DYNAMIC Modify(ls_col + '.Text=""')
         END IF
      END IF
      IF ll_exit > 0 THEN EXIT
   LOOP
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay( rte )
finally
   apo.DYNAMIC SetSort( CString.EMPTY )
   apo.DYNAMIC Sort()
end try
RETURN li_ret
end function

public function string of_findcolumn (readonly datawindow adw, readonly string as_position);/*------------------------------------------------------------------------------------------------*
   string of_FindColumn( datawindow adw, string as_Position ) 'FIRST' / 'LAST'
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   First, Last Column Find
  -------------------------------------------------------------------------------------------------
   Parameters:
   datawindow           adw
   string               as_position  컬럼의 위치.
 *------------------------------------------------------------------------------------------------*/
long     ll_pos, ll_positionX
string   ls_objects, ls_col, ls_type, ls_visible, ls_band, ls_FindColumn

try
   ls_objects = adw.Describe( CString.OBJECTS )
   IF of_IsEmpty(ls_objects) THEN
      ls_FindColumn = CString.EMPTY
   ELSE
      choose case Upper(as_position)
         case "F", "FIRST", "S", "START"
            ll_positionX = 1234567890
         case "L", "LAST", "E", "END"
            ll_positionX = 0
      end choose
      ls_objects += CString.TAB
      ll_pos = Pos( ls_objects, CString.TAB )
      DO WHILE ll_pos > 0
         ls_col = Left( ls_objects, ll_pos - 1 )
         IF adw.Describe( ls_col + ".type" )    = "column" AND &
            adw.Describe( ls_col + ".visible" ) = "1" AND &
            adw.Describe( ls_col + ".band" )    = "detail" THEN
            choose case Upper(as_position)
               case "F", "FIRST", "S", "START"
                  IF ll_positionX > long(adw.Describe(ls_col + ".x")) THEN
                     ll_positionX = long(adw.Describe(ls_col + ".x"))
                     ls_FindColumn = ls_col
                  END IF
               case "L", "LAST", "E", "END"
                  IF ll_positionX < long(adw.Describe(ls_col + ".x")) THEN
                     ll_positionX = long(adw.Describe(ls_col + ".x"))
                     ls_FindColumn = ls_col
                  END IF
            end choose
         END IF
         ls_objects = mid( ls_objects, ll_pos + Len(CString.TAB) )
         ll_pos = Pos( ls_objects, CString.TAB )
      LOOP
   END IF
catch (RunTimeError rte)
   of_systemerrordisplay( rte )
end try
RETURN ls_FindColumn
end function

public function string of_createdatawindow (readonly powerobject apo, string as_sql, transaction atr, readonly boolean ab_rownum);//===========================================================================
// Function: of_CreateDatawindow (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  value     powerobject  ads
//  value     string       as_sql
//  value     string       atr
//  readonly  boolean      ab_rownum
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
integer  li_rtn, li_colTabsequence
long     row, rowcnt
string   sql_syntax, errers, new_syntax, ls_objects, ls_colname[], ls_type[], ls_band

IF NOT IsValid(apo)              THEN RETURN "데이타 윈도우가 없습니다."
IF of_IsEmpty(as_sql)            THEN RETURN "SQL문를 작성후 작업하세요"
IF NOT IsValid(atr)              THEN RETURN "접속된 DataBase가 없습니다."
//EXECUTE IMMEDIATE "SELECT GetDate()" USING ATR;
//IF TRANS.Sqlcode = -1                THEN RETURN ATR.sqlerrtext

// 앞 공백을 지운다.
DO WHILE left(as_sql, 1) = ' '
   as_sql = mid(as_sql, 2)
LOOP
// Select 문을 검사한다.
IF Upper(Left(as_sql, Len('select'))) <> Upper('select') THEN RETURN "SELECT 문장이 아닙니다."
// 행번호를 생성한다.
IF ab_RowNum THEN
   as_sql = "Select " + "Rownum = 0," + CString.CR_NL + mid(as_sql, 8)
END IF

sql_syntax = ''; errers = '' ; new_syntax = ''
sql_syntax = as_sql
new_syntax = ATR.syntaxFromSQL(sql_syntax, "Style(Type=Grid)", errers)

IF Len(errers) > 0 THEN RETURN errers

li_rtn = apo.DYNAMIC Create(new_syntax, errers)

IF li_rtn = -1 THEN
   EXECUTE IMMEDIATE :as_sql USING ATR;
   sql_syntax = "SQL Scrip Error" + CString.CR_NL
   sql_syntax += "작성된 SQL 형식이 잘못되었습니다." + CString.CR_NL
   sql_syntax += "PB Message: " + errers + CString.CR_NL
   sql_syntax += "DB Message: "
   sql_syntax += atr.sqlerrtext
   ROLLBACK USING ATR;
   RETURN sql_syntax
END IF

TRY
   SetPointer ( HourGlass! )
   apo.DYNAMIC Modify("DataWindow.detail.height=68")
   apo.DYNAMIC Modify("DataWindow.header.height=136")
   apo.DYNAMIC reset()
   apo.DYNAMIC SetTransObject( ATR )
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
      for row = 1 to rowcnt
         apo.DYNAMIC SetItem(row, "Rownum", row)
      Next
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
   SetPointer ( Arrow! )
CATCH (RunTimeError Err)
   errers = string( gfn.of_systemerrordisplay ( Err ) )
END TRY
RETURN errers
end function

public function long of_getheight (readonly powerobject apo);/*------------------------------------------------------------------------------------------------*
   long of_GetHeight ( powerobject apo )
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  DataWindow의 전체 높이를 구한다.
 *------------------------------------------------------------------------------------------------*/
integer  li_Bands, n
long     ll_Height, ll_Detail
string   ls_DWBands, ls_Band[]

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ls_DWBands = apo.DYNAMIC Describe( CString.BANDS )

li_Bands = of_parseToArray( ls_DWBands, CString.TAB, ls_Band )

for n = 1 to li_Bands
   IF ls_Band[n] <> "detail" THEN
      ll_Height += long(apo.DYNAMIC Describe( "DataWindow." + &
                        ls_Band[n] + ".Height" ))
   END IF
next

ll_Detail = apo.DYNAMIC RowCount() * &
            long(apo.DYNAMIC Describe("DataWindow.Detail.Height"))

ll_Height += ll_Detail

RETURN ll_Height
end function

public function string of_getheadername (readonly powerobject apo, readonly string as_column);//===========================================================================
// Function: of_GetHeaderName ( public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    string      as_column
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
RETURN of_GetHeaderName( apo, as_column, CString.SUFFIX )
end function

public function string of_getheadername (readonly powerobject apo, readonly string as_column, readonly string as_suffix);//===========================================================================
// Function: of_GetHeaderName ( public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    string      as_column
//  value    string      as_suffix
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string  ls_colhead

// Try using the column header.
ls_colhead = apo.DYNAMIC Describe( as_column + as_suffix + ".Text" )
IF ls_colhead = "" OR of_iserrorstring( ls_colhead ) THEN
   ls_colhead = as_column
END IF

// Remove undesired characters.
ls_colhead = of_GlobalReplace( ls_colhead, "~r~n", " " )
ls_colhead = of_GlobalReplace( ls_colhead, "~t", " " )
ls_colhead = of_GlobalReplace( ls_colhead, "~r", " " )
ls_colhead = of_GlobalReplace( ls_colhead, "~n", " " )
ls_colhead = of_GlobalReplace( ls_colhead, "_", " " )
ls_colhead = of_GlobalReplace( ls_colhead, "~"", "" )
ls_colhead = of_GlobalReplace( ls_colhead, "~'", "" )
ls_colhead = of_GlobalReplace( ls_colhead, "~~", "" )

// WordCap string.
ls_colhead = apo.DYNAMIC Describe ( "Evaluate('WordCap(~"" + ls_colhead + "~")',0)" )

RETURN ls_colhead
end function

public subroutine of_setsplit (readonly powerobject apo, readonly string as_column);//===========================================================================
// Function: of_setsplit (public )
//---------------------------------------------------------------------------
// Description: excel 틀고정 기능.
// Note: DataWindow 자체 기능으로 추가 바람..
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//  readonly   Strng          as_column
//---------------------------------------------------------------------------
// Returns: (none)
//===========================================================================
integer  li_x, li_width
string   ls_pos

IF NOT of_IsServicableObject(apo) THEN RETURN
IF of_IsEmpty(as_column) THEN RETURN

li_x = integer(apo.DYNAMIC Describe(as_column + ".x"))
li_width = integer(apo.DYNAMIC Describe(as_column + "width"))

ls_pos = string( li_x + li_width )

apo.DYNAMIC Modify( "DataWindow.HorizontalScrollSplit='" + ls_pos + "'" )
end subroutine

on n_svc_datawindow.create
call super::create
end on

on n_svc_datawindow.destroy
call super::destroy
end on

