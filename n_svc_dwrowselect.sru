$PBExportHeader$n_svc_dwrowselect.sru
$PBExportComments$DataWindow Row Selection & Head service
forward
global type n_svc_dwrowselect from n_svc_dw
end type
end forward

global type n_svc_dwrowselect from n_svc_dw
end type
global n_svc_dwrowselect n_svc_dwrowselect

type variables
Private:
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

CONSTANT string GAP = "120"
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
public subroutine of_clicked (readonly datawindow adw, readonly long al_row, readonly dwobject adwo, readonly integer ai_selectmode, ref str_rowselect astr)
public subroutine of_clicked (readonly datawindow adw, string as_object, ref str_dwheader astr_headers[], readonly str_dwheader astr_exclude[])
public subroutine of_dwmousemove (readonly datawindow adw, readonly integer ai_xpos, readonly integer ai_ypos, readonly long al_row, readonly string as_dwoname, ref str_dwheader astr_headers[], readonly str_dwheader astr_exclude[], readonly boolean ab_mousedown, ref boolean ab_mousecaptured, readonly boolean ab_allowhot, ref long al_anchor, ref long al_sizeindex)
public function integer of_getheaderindex (readonly string as_dwoname, readonly str_dwheader astr_headers[])
public function integer of_getheaderindex (readonly string as_dwoname, readonly string as_headers[])
public subroutine of_hotheader (readonly datawindow adw, readonly string as_dwoname, readonly str_dwheader astr_headers[])
public subroutine of_invertselection (readonly datawindow adw)
public function long of_isbetween (readonly datawindow adw, integer ai_xpos, integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[])
public function boolean of_isexcluded (readonly string as_header, readonly str_dwheader astr_exclude[])
public function boolean of_isheader (readonly string as_dwoname, readonly str_dwheader astr_headers[])
public function boolean of_isinheader (readonly datawindow adw, readonly integer xpos, readonly integer ypos)
public function integer of_makedw (readonly datawindow adw, ref str_dwheader astr_headers[])
public function long of_markanchor (readonly datawindow adw, readonly integer ai_xpos, readonly integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[])
public subroutine of_pressheader (readonly datawindow adw, readonly str_dwheader astr_header, readonly boolean ab_press)
public subroutine of_readme ()
public subroutine of_resizeheader (readonly datawindow adw, readonly integer ai_index, long al_xpos, ref str_dwheader astr_headers[], ref long al_anchor)
public subroutine of_resizelines (readonly datawindow adw, readonly str_dwheader headers[])
public subroutine of_rowfocuschanged (readonly datawindow adw, readonly long al_currentrow, readonly integer ai_selectmode, ref str_rowselect astr)
public subroutine of_selectrow (readonly datawindow adw, readonly long al_row, readonly integer ai_selectmode, ref str_rowselect astr, readonly boolean ab_isclicked)
public function integer of_settheme (readonly datawindow adw, readonly str_dwheader astr_headers[])
public subroutine of_showsortarrows (readonly datawindow adw, readonly str_dwheader astr_headers[])
public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[])
public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[], readonly boolean ab_reset)
end prototypes

public subroutine of_clicked (readonly datawindow adw, readonly long al_row, readonly dwobject adwo, readonly integer ai_selectmode, ref str_rowselect astr);// of_clicked(this, row, dwo, #mode, str_rowselect)
IF NOT IsValid(adw) THEN RETURN
try
   IF al_row <= 0 THEN RETURN
   IF ai_selectmode <= 0 THEN RETURN

   // store clicked row
   astr.currentclickedrow = al_row

   // Call Event OR Function
   of_SelectRow(adw, al_row, ai_selectmode, astr, TRUE)

   // set as current row
   IF adw.GetRow() <> al_row THEN
      adw.SetRow(al_row)
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public subroutine of_clicked (readonly datawindow adw, string as_object, ref str_dwheader astr_headers[], readonly str_dwheader astr_exclude[]);boolean  lb_found, lb_controlkey
long     n, ll_count
string   ls_sort, ls_cols[], ls_type[], ls_sorttype

IF NOT IsValid(adw) THEN RETURN
try
   // Less Then One Return
   IF adw.RowCount() <= 1 THEN RETURN

   // skip astr_excluded
   IF of_isexcluded(as_object, astr_exclude) THEN RETURN

   as_object = Mid(as_object, 1, Len(as_object) - 2)

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

   // cf. of_resizeheader()
   //adw.EVENT ue_rowchanged()

   IF lb_controlkey THEN adw.SetRedraw(FALSE)
   of_ShowSortArrows(adw, astr_headers)
   IF lb_controlkey THEN adw.SetRedraw(TRUE)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public subroutine of_dwmousemove (readonly datawindow adw, readonly integer ai_xpos, readonly integer ai_ypos, readonly long al_row, readonly string as_dwoname, ref str_dwheader astr_headers[], readonly str_dwheader astr_exclude[], readonly boolean ab_mousedown, ref boolean ab_mousecaptured, readonly boolean ab_allowhot, ref long al_anchor, ref long al_sizeindex);boolean  lb_Release
long     llc, n, ll_lt, ll_rt, ll_lindex
string   ls_l, ls_r
string   lslx, lslw, lsrx
ulong    ul_hWnd
n_svc_win32 lnw

IF NOT IsValid(adw) THEN RETURN

try
   IF of_IsInHeader(adw, ai_xpos, ai_ypos) THEN
      IF NOT ab_MouseCaptured THEN
         // Capture mouse input.
         ul_hWnd = lnw.SetCapture(Handle(adw))
         ab_MouseCaptured = TRUE
      END IF
   ELSE
      IF ab_MouseCaptured THEN
         // Release the mouse capture.
         lb_Release = lnw.ReleaseCapture()
         IF lb_Release THEN ab_MouseCaptured = FALSE
      END IF
   END IF

   // Skip if excluded column
   IF of_IsExcluded(as_dwoname, astr_exclude) THEN RETURN

   // Hot Header
   IF ab_allowhot THEN
      IF NOT ab_mousedown THEN
         of_HotHeader(adw, as_dwoname, astr_headers)
      ELSE
         of_HotHeader(adw, CString.EMPTY, astr_headers)
      END IF
   END IF

   // Check if we are at header band
   IF as_dwoname = CString.EMPTY THEN RETURN

   IF NOT ab_mousedown THEN
      al_SizeIndex = of_IsBetween(adw, ai_xpos, ai_ypos, astr_headers, astr_exclude)
      IF al_SizeIndex = -1 THEN
         SetPointer(Arrow!)
      ELSE
         SetPointer(SizeWE!)
      END IF
   ELSE
      IF al_SizeIndex > 0 THEN
         SetPointer(SizeWE!)
         of_ResizeHeader(adw, al_SizeIndex, ai_xpos, astr_headers, al_anchor)
      END IF
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public function integer of_getheaderindex (readonly string as_dwoname, readonly str_dwheader astr_headers[]);long  n, ll_count

ll_count = UpperBound(astr_headers)
FOR n = 1 to ll_count
   IF as_dwoname = astr_headers[n].header THEN RETURN n
NEXT

RETURN -1
end function

public function integer of_getheaderindex (readonly string as_dwoname, readonly string as_headers[]);long  n, ll_count

ll_count = UpperBound(as_headers)
FOR n = 1 to ll_count
   IF as_dwoname = as_headers[n] THEN RETURN n
NEXT

RETURN -1
end function

public subroutine of_hotheader (readonly datawindow adw, readonly string as_dwoname, readonly str_dwheader astr_headers[]);long     ll_index, ll
string   ls_mod, lsw, lsx

IF NOT IsValid(adw) THEN RETURN
try
   IF NOT of_IsHeader(as_dwoname, astr_headers) THEN
      ls_mod  = CDWBase.HEADBAR + ".Visible=0"
      ls_mod += CString.SPACE + CDWBase.HOTTBAR + ".Visible=0"
   ELSE
      // is it hot already?
      ls_mod  = CDWBase.HEADBAR + ".Visible=1"
      ls_mod += CString.SPACE + CDWBase.HOTTBAR + ".Visible=1"

      ll_index = of_GetHeaderIndex(as_dwoname, astr_headers)
      IF ll_index > 0 THEN
         ll = LONG(adw.Describe(astr_headers[ll_index].header + ".x"))
         ll = UnitsToPixels(ll, XUnitsToPixels!)
         lsx = STRING(PixelsToUnits(ll, XPixelsToUnits!))

         lsw = STRING(LONG(adw.Describe(astr_headers[ll_index].header + ".width")) + 4)
         ls_mod += CString.SPACE + CDWBase.HEADBAR + ".x=" + lsx
         ls_mod += CString.SPACE + CDWBase.HEADBAR + ".width=" + lsw
         ls_mod += CString.SPACE + CDWBase.HOTTBAR + ".x=" + lsx
         ls_mod += CString.SPACE + CDWBase.HOTTBAR + ".width=" + lsw
      END IF
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
finally
   adw.Modify(ls_mod)
end try
end subroutine

public subroutine of_invertselection (readonly datawindow adw);long  n, ll_count

ll_count = adw.RowCount()

adw.SetRedraw(FALSE)
FOR n = 1 to ll_count
   adw.SelectRow(n, NOT adw.IsSelected(n))
NEXT
adw.SetRedraw(TRUE)
end subroutine

public function long of_isbetween (readonly datawindow adw, integer ai_xpos, integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[]);boolean  lb
long     llc, lle, n, m

try
   ai_xpos = PixelsToUnits(ai_xpos, XPixelsToUnits!)
   ai_ypos = PixelsToUnits(ai_ypos, YPixelsToUnits!)

   IF ai_ypos > LONG(adw.Describe("Datawindow.Header.Height")) THEN RETURN -1

   llc = UpperBound(astr_headers)
   lle = UpperBound(astr_exclude)

   ai_xpos += LONG(adw.Describe("Datawindow.HorizontalScrollPosition"))
   FOR n = 1 to llc
      lb = FALSE
      FOR m = 1 to lle
         IF astr_headers[n].header = astr_exclude[m].header THEN
            lb = TRUE
            EXIT
         END IF
      NEXT
      IF lb THEN CONTINUE
      IF ai_xpos >= astr_headers[n].lgap AND ai_xpos <= astr_headers[n].rgap THEN RETURN n
   NEXT
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
RETURN -1
end function

public function boolean of_isexcluded (readonly string as_header, readonly str_dwheader astr_exclude[]);long  n, ll_count

ll_count = UpperBound(astr_exclude)

FOR n = 1 to ll_count
   IF as_header = astr_exclude[n].header THEN RETURN TRUE
NEXT

RETURN FALSE
end function

public function boolean of_isheader (readonly string as_dwoname, readonly str_dwheader astr_headers[]);long  n, ll_count

// check name
IF Pos(as_dwoname, CDWBase.HEADBAR) > 0 THEN RETURN TRUE

ll_count = UpperBound(astr_headers)

FOR n = 1 to ll_count
   IF as_dwoname = astr_headers[n].header THEN RETURN TRUE
NEXT

RETURN FALSE
end function

public function boolean of_isinheader (readonly datawindow adw, readonly integer xpos, readonly integer ypos);long  llx, lly

llx = PixelsToUnits(xpos, XPixelsToUnits!)
lly = PixelsToUnits(ypos, YPixelsToUnits!)

IF ((llx < 0) OR (lly < 0)) THEN RETURN FALSE

RETURN (lly <= LONG(adw.Describe("Datawindow.Header.height")) AND (llx <= adw.width))
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
string   ls_cols[], ls_columns[], ls_types[], ls_head[]
string   ls_mod, lsw
string   ls_dwstyle, ls_headerheight, ls_percenty, ls_liney, ls_sepheight
string   ls_NormalFile, ls_HotFile, ls_Error

IF NOT IsValid(adw) THEN RETURN 0

try
   // make sure it's a tabular DW
   ls_dwstyle = of_GetDWStyle(adw)
   IF NOT(ls_dwstyle="0" OR ls_dwstyle="1") THEN RETURN -1

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
               STRING(CColor.WHITE) &
               })


   // Reset headers
   str_dwheader   lstr_empty[]

   astr_headers = lstr_empty

   of_GetBandControls(adw, ls_columns, ls_head)
   ll_count = of_Ordercolumnsbypositionx(adw, ls_cols)
   FOR n = 1 to ll_count
      astr_headers[n].header = ls_cols[n] + "_t"
      astr_headers[n].column = ls_cols[n]

      // 컬럼명과 동일한 타이틀이 존재하지 않으면...
      IF of_StringPosArray(astr_headers[n].header, ls_head) <= 0 THEN
         MessageBox("확인", astr_headers[n].column + " 컬럼의 타이틀을 확인하세요!", Exclamation!)
         CONTINUE
      END IF

      // Flatten and not bold
      ls_mod += CString.SPACE + astr_headers[n].header + ".Border=0 " &
             +  astr_headers[n].header + ".Background.Mode=1 " &
             +  astr_headers[n].header + ".Font.Face='" + Gstr_System.TitlebarFontName + "' " &
             +  astr_headers[n].header + ".Font.Height='-" + Gstr_System.TitlebarFonSize + "'"
      ls_mod += CString.SPACE + astr_headers[n].header + ".Y=" + ls_percenty
      ls_mod += CString.SPACE + astr_headers[n].header + ".Height=" + ls_headerheight

      // Set Positions
      lsw = adw.Describe(astr_headers[n].header + ".width")
      IF NOT IsNumber(lsw) THEN lsw = GAP
      llw = LONG(lsw)
      //IF llw < ((LENA(adw.Describe(astr_headers[n].header + ".Text")) * 40)+ LONG(GAP)) THEN
      //   llw = ((LENA(adw.Describe(astr_headers[n].header + ".Text")) * 40)+ LONG(GAP))
      //END IF
      IF n = 1 THEN
         // Header Position
         ls_mod += CString.SPACE + astr_headers[n].header + ".X=" + STRING(20)
         // Column Position
         ls_mod += CString.SPACE + astr_headers[n].column + ".X=" + STRING(20)

         llx = llw + 20
      ELSE
         ls_mod += CString.SPACE + astr_headers[n].header + ".X=" + STRING(llx)
         ls_mod += CString.SPACE + astr_headers[n].column + ".X=" + STRING(llx)

         llx += llw
      END IF
      // Get Previous Header x location and width
      //ls_mod += CString.SPACE + astr_headers[n].header + ".width=" + STRING(llw)
      ls_mod += CString.SPACE + astr_headers[n].column + ".width=" + STRING(llw)

      astr_headers[n].lgap = llx - size_tolerance
      astr_headers[n].rgap = llx + size_tolerance
   NEXT
   ls_NormalFile = ".\Bmp\headerline.bmp"
   ls_HotFile = ".\Bmp\headerhotline.bmp"

   // DataWindow Header Band & Head Text(jaddwheader) Color 지정
   ls_mod += CString.SPACE + "Datawindow.Header.Color=" + STRING(Gstr_System.TitlebarBackgroundNormal)
   ls_mod += CString.SPACE + CDWBase.HEADBAR + ".Background.Color=" + STRING(Gstr_System.TitlebarBackgroundHot)
   ls_mod += CString.SPACE + CDWBase.LINEBAR + ".FileName='" + ls_NormalFile + "'"
   ls_mod += CString.SPACE + CDWBase.HOTTBAR + ".FileName='" + ls_HotFile + "'"

   ls_Error = adw.Modify(ls_mod)

   IF NOT of_IsEmpty(ls_Error) THEN
      MessageBox("Modify Error!", ls_Error, StopSign!)
   END IF

   // DataWindow Head Color Modify
   of_SetTheme(adw, astr_headers)

   // position z order
   adw.SetPosition(CDWBase.LINEBAR, "header", TRUE)
   adw.SetPosition(CDWBase.HEADBAR, "header", TRUE)
   FOR n = 1 to ll_count
      adw.SetPosition(astr_headers[n].header, "header", TRUE)
   NEXT
   adw.SetPosition(CDWBase.HOTTBAR, "header", TRUE)

   of_ResizeLines(adw, astr_headers)
catch (RunTimeError rte)
   li_ret = of_SystemErrorDisplay( rte )
end try
RETURN li_ret
end function

public function long of_markanchor (readonly datawindow adw, readonly integer ai_xpos, readonly integer ai_ypos, readonly str_dwheader astr_headers[], readonly str_dwheader astr_exclude[]);long  ll_index

ll_index = of_IsBetween(adw, ai_xpos, ai_ypos, astr_headers, astr_exclude)

IF ll_index <> -1 THEN
   RETURN ai_xpos + UnitsToPixels(LONG(adw.Describe("Datawindow.HorizontalScrollPosition")), XUnitsToPixels!)
END IF

RETURN -1
end function

public subroutine of_pressheader (readonly datawindow adw, readonly str_dwheader astr_header, readonly boolean ab_press);long     llp, llpx, ll_color
string   ls_mod, ls_vis

try
   IF ab_press THEN
      ll_color = RGB(210, 210, 210)
      ls_vis = "0"
   ELSE
      ll_color = Gstr_System.TitlebarBackgroundHot
      ls_vis = "1"
   END IF

   ls_mod = CString.EMPTY
   IF adw.Describe(CDWBase.HEADBAR + ".Visible") = "1" THEN
      ls_mod += CDWBase.HOTTBAR + ".Visible='" + ls_vis + "'"
   END IF
   ls_mod += CString.SPACE + CDWBase.HEADBAR + ".Background.Color=" + STRING(ll_color)

   llp = LONG(adw.Describe("Datawindow.Header.Height")) * .15

   IF ab_press THEN
      llpx = UnitsToPixels(LONG(adw.Describe(astr_header.header + ".X")), XUnitsToPixels!)
      ls_mod += CString.SPACE + astr_header.header + ".X=" + STRING(PixelsToUnits(llpx + 1, XPixelsToUnits!))
      ls_mod += CString.SPACE + astr_header.header + ".Y=" + STRING(llp + 4)
   ELSE
      IF INTEGER(adw.Describe(astr_header.header + ".Y")) > llp THEN
         llpx = UnitsToPixels(LONG(adw.Describe(astr_header.header + ".X")), XUnitsToPixels!)
         ls_mod += CString.SPACE + astr_header.header + ".X=" + STRING(PixelsToUnits(llpx - 1, XPixelsToUnits!))
         ls_mod += CString.SPACE + astr_header.header + ".Y=" + STRING(llp)
      END IF
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
finally
   adw.Modify(ls_mod)
end try
end subroutine

public subroutine of_readme ();/****
// DataWindow Row Select Function

of_clicked()
of_rowfocuschanged()
of_selectrow()
of_invertselection() // 미사용
****/


/****
// DataWindow Head Function

Instance Variable
of_dwmousemove()
of_makedw()
of_IsBetween()
of_IsExcluded()
of_IsHeader()
of_IsInHeader()
of_GetHeaderIndex()
of_PressHeader()
of_ResizeHeader()
of_ResizeLines()
of_ShowSortArrows()

위의 모든 함수의 Arguments의 DataWindow를 u_dw?로 변경함이 지당함.
DataWindow ue_xxx Event 2개 주석처리..
Theme관련 주석처리.
Head Height고정...
****/
end subroutine

public subroutine of_resizeheader (readonly datawindow adw, readonly integer ai_index, long al_xpos, ref str_dwheader astr_headers[], ref long al_anchor);long     ll_newwidth, ll_inc, llx, llc, n, llw, lls
string   ls_mod
string   lsx, ls_column

IF al_anchor = -1 THEN RETURN

try
   al_xpos += UnitsToPixels(LONG(adw.Describe("Datawindow.HorizontalScrollPosition")), XUnitsTopixels!)

   llx = LONG(adw.Describe(astr_headers[ai_index].header + ".x"))
   // header resize
   llw = UnitsToPixels(LONG(adw.Describe(astr_headers[ai_index].header + ".width")), XUnitsToPixels!)
   ll_inc = al_xpos - al_anchor
   ll_newwidth = llw + ll_inc
   ll_newwidth = PixelsToUnits(ll_newwidth, XPixelsToUnits!)
   IF ll_newwidth <= MINWIDTH THEN RETURN
   ls_mod = astr_headers[ai_index].header + ".width=" + STRING(ll_newwidth)

   // column resize
   ls_column = astr_headers[ai_index].column
   llw = UnitsToPixels(LONG(adw.Describe(ls_column + ".width")), XUnitsToPixels!)
   ll_newwidth = llw + ll_inc
   ll_newwidth = PixelsToUnits(ll_newwidth, XPixelsToUnits!)
   ls_mod += CString.SPACE + ls_column + ".width=" + STRING(ll_newwidth)
   astr_headers[ai_index].lgap = (llx + ll_newwidth) - size_tolerance
   astr_headers[ai_index].rgap = (llx + ll_newwidth) + size_tolerance

   // set new al_anchor
   al_anchor = al_xpos

   llc = UpperBound(astr_headers)

   IF ai_index < llc THEN
      lls = ai_index + 1
      ll_inc = PixelsToUnits(ll_inc, XPixelsToUnits!)
      FOR n = lls to llc
         lsx = adw.Describe(astr_headers[n].header + ".x")
         llw = LONG(adw.Describe(astr_headers[n].header + ".width"))
         llx = LONG(lsx) + ll_inc
         astr_headers[n].lgap = (llx + llw) - size_tolerance
         astr_headers[n].rgap = (llx + llw) + size_tolerance
         ls_mod += CString.SPACE + astr_headers[n].header + ".x=" + STRING(llx)
         ls_column = astr_headers[n].column
         lsx = adw.Describe(ls_column + ".x")
         ls_mod += CString.SPACE + ls_column + ".x=" + STRING(LONG(lsx) + ll_inc)
      NEXT
   END IF

   // one-hit modify
   adw.SetRedraw(FALSE)
   adw.Modify(ls_mod)

   // fire event
   // cf. of_clicked()
   //adw.EVENT ue_headersizing(ai_index)

   // resize line
   of_ShowSortArrows(adw, astr_headers)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
finally
   adw.SetRedraw(TRUE)
end try
end subroutine

public subroutine of_resizelines (readonly datawindow adw, readonly str_dwheader headers[]);long     ll, ll_totw
string   ls_mod

try
   ll = UpperBound(headers)

   ll_totw = LONG(adw.Describe(headers[ll].header + ".x")) + LONG(adw.Describe(headers[ll].header + ".width"))
   IF ll_totw + 48 < adw.width THEN
      ll_totw = adw.width - 10
//      IF adw.HScrollBar THEN adw.HScrollBar = FALSE
   ELSE
//      IF NOT adw.HScrollBar THEN adw.HScrollBar = TRUE
   END IF

   ls_mod = CDWBase.LINEBAR + ".width=" + STRING(ll_totw)

   adw.Modify(ls_mod)

   of_ShowSortArrows(adw, headers)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public subroutine of_rowfocuschanged (readonly datawindow adw, readonly long al_currentrow, readonly integer ai_selectmode, ref str_rowselect astr);// of_rowfocuschanged(this, currentrow, 1, str_rowselect)
IF NOT IsValid(adw) THEN RETURN
try
   IF al_currentrow <= 0 THEN RETURN
   IF ai_selectmode <= 0 THEN RETURN

   // No Twice Clicked
   //IF astr.prevrow = al_currentrow THEN RETURN

   // SelectRow
   of_SelectRow(adw, al_currentrow, ai_selectmode, astr, TRUE)

   // Reset clicked row
   astr.currentclickedrow = 0

   // Call Event OR Function
   //adw.DYNAMIC of_selectrow(adw, al_currentrow)
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
end try
end subroutine

public subroutine of_selectrow (readonly datawindow adw, readonly long al_row, readonly integer ai_selectmode, ref str_rowselect astr, readonly boolean ab_isclicked);long  n

try
   choose case ai_selectmode
      case 1
         IF adw.IsSelected(al_row) THEN RETURN
         adw.SelectRow(0, FALSE)
         adw.SelectRow(al_row, TRUE)
      case 2
         IF KeyDown(KeyShift!) THEN
            // Reset selection
            adw.SelectRow(0, FALSE)
            // shift pressed
            IF astr.AnchorRow = 0 THEN
               adw.SelectRow(al_row, TRUE)
            ELSE
               adw.SetRedraw(FALSE)
               IF astr.AnchorRow > al_row THEN
                  FOR n = astr.AnchorRow to al_row STEP -1
                     adw.SelectRow(n, TRUE)
                  NEXT
               ELSE
                  FOR n = astr.AnchorRow to al_row
                     adw.SelectRow(n, TRUE)
                  NEXT
               END IF
               adw.SetRedraw(TRUE)
            END IF
         ELSEIF KeyDown(KeyControl!) THEN
            // control pressed
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
catch (RunTimeError rte)
   of_SystemErrorDisplay(rte)
finally
   astr.prevrow = al_row
   astr.prevrowcount = adw.RowCount()
end try
end subroutine

public function integer of_settheme (readonly datawindow adw, readonly str_dwheader astr_headers[]);RETURN 1
end function

public subroutine of_showsortarrows (readonly datawindow adw, readonly str_dwheader astr_headers[]);boolean  lb_mod
long     n, ll_count, ll_x, ll_w, ll_h, ll_color
string   ls_cols[], ls_sort[], ls_mod
string   ls_shade, ls_arrow, ls_arrownum, ls_header, ls_sorttype

IF NOT IsValid(adw) THEN RETURN

try
   // Destroy arrows
   IF of_sortarrowsclear(adw, astr_headers) <= 0 THEN RETURN

   // Set Shade Color[Vertical Column Color]
   // cf. of_pressheader
   ll_color = CColor.WHITE_SMOKE // 3790332

   // Create Sort Arrows
   ll_count = of_GetSort(adw, ls_cols, ls_sort)
   FOR n = 1 to ll_count
      // Build arrow
      ls_header = ls_cols[n] + "_t"
      IF NOT of_isheader(ls_header, astr_headers) THEN CONTINUE

      // Flag draw
      lb_mod = TRUE
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
      ll_x = LONG(adw.Describe(ls_header + ".X"))
      ll_w = LONG(adw.Describe(ls_header + ".width"))
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

public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[]);RETURN of_sortarrowsclear(adw, astr_headers, FALSE)
end function

public function integer of_sortarrowsclear (readonly datawindow adw, readonly str_dwheader astr_headers[], readonly boolean ab_reset);/*------------------------------------------------------------------------------------------------*
   of_sortarrowsclear(dw_1)
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  모든 컬럼을 투명하게
 *------------------------------------------------------------------------------------------------*/
integer  li_ret = 1
long     n, ll_count
string   ls_shade, ls_arrow, ls_arrownum, ls_mod

IF NOT IsValid(adw) THEN RETURN 0

try
   // destroy arrows
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

on n_svc_dwrowselect.create
call super::create
end on

on n_svc_dwrowselect.destroy
call super::destroy
end on

