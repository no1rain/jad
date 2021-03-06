$PBExportHeader$n_svc_dw.sru
$PBExportComments$DataWindow Basic Function Sets
forward
global type n_svc_dw from n_svc_base
end type
end forward

global type n_svc_dw from n_svc_base
end type
global n_svc_dw n_svc_dw

forward prototypes
public function string of_buildcolumnvaluestring (readonly powerobject apo, readonly long al_colid, readonly string as_value, readonly boolean ab_matchcase)
public function string of_buildcolumnvaluestring (readonly powerobject apo, readonly string as_column, readonly string as_value, readonly boolean ab_matchcase)
public function boolean of_columnexists (powerobject apo, string as_column)
public function integer of_createstringdatastore (readonly powerobject apo, ref datastore ads)
public function integer of_createstringdatastore (readonly powerobject apo, ref datastore ads, readonly boolean ab_includehide)
public function integer of_createstringdatastore (readonly powerobject apo, ref datastore ads, readonly boolean ab_includehide, readonly boolean ab_adddata)
public function long of_findrow (readonly powerobject apo, readonly long al_colid, readonly string as_value)
public function long of_findrow (readonly powerobject apo, readonly long al_colid, readonly string as_value, long al_startrow)
public function long of_findrow (readonly powerobject apo, readonly string as_column, readonly string as_value)
public function long of_findrow (readonly powerobject apo, readonly string as_column, readonly string as_value, long al_startrow)
public function long of_getbandcontrols (readonly powerobject apo, ref string as_details[], ref string as_headers[])
public function long of_getbandcontrols (readonly powerobject apo, string as_band_name, ref string as_controls[])
public function long of_getbands (readonly powerobject apo, ref string as_bands[])
public function long of_getcolumncount (readonly powerobject apo)
public function string of_getcolumndatatype (readonly powerobject apo, readonly long al_colid)
public function string of_getcolumndatatype (readonly powerobject apo, readonly string as_column)
public function string of_getcolumndisplayvalue (readonly powerobject apo, readonly long al_row, readonly long al_colid)
public function string of_getcolumndisplayvalue (readonly powerobject apo, readonly long al_row, readonly string as_column)
public function string of_getcolumneditstyle (readonly powerobject apo, readonly long al_colid)
public function string of_getcolumneditstyle (readonly powerobject apo, readonly string as_column)
public function string of_getcolumnid (readonly powerobject apo, readonly string as_column)
public function string of_getcolumninitial (readonly powerobject apo, long al_colid)
public function string of_getcolumninitial (readonly powerobject apo, string as_column)
public function string of_getcolumnname (readonly powerobject apo, readonly long al_colid)
public function long of_getcolumns (readonly powerobject apo, ref string as_colnames[], ref string as_datatypes[])
public function long of_getcomputedfields (readonly powerobject apo, ref string as_name[], ref string as_datatype[])
public function string of_getdwstyle (readonly datawindow adw)
public function long of_getheight (readonly powerobject apo)
public function string of_getitem (readonly powerobject apo, long al_row, long al_colid)
public function string of_getitem (readonly powerobject apo, long al_row, long al_colid, dwbuffer adw_buffer, boolean ab_orig_value)
public function string of_getitem (readonly powerobject apo, long al_row, string as_column)
public function string of_getitem (readonly powerobject apo, long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value)
public function any of_getitemany (readonly powerobject apo, long al_row, long al_colid)
public function any of_getitemany (readonly powerobject apo, long al_row, long al_colid, dwbuffer adw_buffer, boolean ab_orig_value)
public function any of_getitemany (readonly powerobject apo, long al_row, string as_column)
public function any of_getitemany (readonly powerobject apo, long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value)
public function long of_getobjects (readonly powerobject apo, ref string as_name[], ref string as_type[])
public function long of_getprimarykeys (readonly powerobject apo, ref string as_names[], ref string as_datatypes[])
public function long of_getprimarykeyvalues (readonly powerobject apo, readonly long al_row, ref string as_values[])
public function string of_getproperties (readonly powerobject apo, readonly string as_column, readonly string as_separator)
public function long of_getretrievalarguments (readonly powerobject apo, ref string as_argnames[], ref string as_datatypes[])
public function long of_getsort (readonly powerobject apo, ref string as_colnames[], ref string as_sortdirection[])
public function string of_gettabsequence (readonly powerobject apo)
public function string of_gettext (readonly powerobject apo, string as_column)
public function string of_getupdatetable (readonly powerobject apo)
public function long of_getvisiblecolumns (readonly powerobject apo, ref string as_colnames[])
public function long of_getvisiblecolumns (readonly powerobject apo, ref string as_colnames[], readonly string as_bandname, readonly boolean ab_includecomputed)
public function boolean of_isobjectvalid (readonly powerobject apo, readonly string as_objname)
public function boolean of_isobjectvisible (readonly powerobject apo, readonly string as_objname)
protected function boolean of_isservicableobject (readonly powerobject apo)
public function long of_ordercolumnsbypositionx (readonly powerobject apo, ref string as_colnames[])
public subroutine of_removedropdownarrows (readonly powerobject apo, readonly boolean ab_set)
public subroutine of_removetabsequence (readonly powerobject apo)
public function integer of_saveas (readonly powerobject apo)
public function integer of_saveas (readonly powerobject apo, readonly string as_fullpath, readonly saveastype asa_type)
public subroutine of_setbackgroundmode (readonly powerobject apo)
public subroutine of_setbackgroundmode (readonly powerobject apo, readonly string as_mode)
public function integer of_setitem (readonly powerobject apo, long al_row, long al_colid, string as_value)
public function integer of_setitem (readonly powerobject apo, long al_row, string as_column, string as_value)
public subroutine of_settabsequence (readonly powerobject apo, readonly string as_tabsequence)
public function long of_totalselectedrows (readonly powerobject apo)
public function string of_gettagkeyword (readonly powerobject apo, readonly long al_colid, readonly string as_key)
public function string of_gettagkeyword (readonly powerobject apo, readonly string as_col, readonly string as_key)
end prototypes

public function string of_buildcolumnvaluestring (readonly powerobject apo, readonly long al_colid, readonly string as_value, readonly boolean ab_matchcase);//===========================================================================
// Function: of_Buildcolumnvaluestring (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  Long         al_colid
//  readonly  String       as_value
//  readonly  Boolean      ab_matchcase
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

// Get Column Name
ls_colname = of_GetColumnName(apo, al_colid)

// Check if Valid Colid
IF isnull(ls_colname) THEN RETURN ls_colname

RETURN of_BuildColumnValueString(apo, ls_colname, as_value, ab_matchcase)
end function

public function string of_buildcolumnvaluestring (readonly powerobject apo, readonly string as_column, readonly string as_value, readonly boolean ab_matchcase);//===========================================================================
// Function: of_Buildcolumnvaluestring (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  String       as_column
//  readonly  String       as_value
//  readonly  Boolean      ab_matchcase
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   lst, lss

IF NOT of_IsServicableObject(apo) THEN RETURN lss

IF of_IsEmpty(as_column) THEN RETURN lss

// get datatype
lst = of_GetColumnDatatype(apo, as_column)

IF of_IsEmpty(lst) THEN RETURN lss

choose case lst
   case "char"
      IF ab_matchcase THEN
         lss = "{1} = '{2}'"
      ELSE
         lss = "lower({1}) = '{2}'"
      END IF
   case "date"
      lss = "{1} = date('{2}')"
   case "time"
      lss = "{1} = time('{2}')"
   case "datetime", "timestamp"
      lss = "{1} = datetime('{2}')"
   case "decimal", "double", "int", "long", "number", "real", "ulong"
      lss = "{1} = {2}"
end choose

IF ab_matchcase THEN
   lss = of_Format( lss, {as_column, as_value} )
ELSE
   lss = of_Format( lss, {as_column, lower(as_value)} )
END IF

IF isnull(as_value) AND lst = "char" THEN
   lss = "(isnull(" + as_column + ") OR trim(" + as_column + ") = '')"
END IF
RETURN lss
end function

public function boolean of_columnexists (powerobject apo, string as_column);//===========================================================================
// Function: of_columnexists (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  String       as_column
//---------------------------------------------------------------------------
// Returns: Boolean
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean  lb_exists
string   ls_exists

IF NOT of_IsServicableObject(apo) THEN RETURN FALSE

IF of_IsEmpty(as_column) THEN RETURN FALSE

ls_exists = apo.DYNAMIC Describe( as_column + '.Id' )

IF of_IsErrorString(ls_exists) THEN
   lb_exists = FALSE
ELSE
   lb_exists = TRUE
END IF

RETURN lb_exists
end function

public function integer of_createstringdatastore (readonly powerobject apo, ref datastore ads);RETURN of_createstringdatastore( apo, ads, FALSE )
end function

public function integer of_createstringdatastore (readonly powerobject apo, ref datastore ads, readonly boolean ab_includehide);RETURN of_createstringdatastore( apo, ads, ab_includehide, FALSE )
end function

public function integer of_createstringdatastore (readonly powerobject apo, ref datastore ads, readonly boolean ab_includehide, readonly boolean ab_adddata);//===========================================================================
// Function: of_Createstringdatastore (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//  reference  DataStore      ads
//  readonly   boolean        ab_includehide
//  readonly   boolean        ab_adddata
//---------------------------------------------------------------------------
// Returns: Integer
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     n, ll_count, ll_rcount, m, ll_id
string   ls_colnames[], ls_coltypes[], ls_dtype
string   ls_syntax, ls_coldef, ls_x, ls_w, ls_txt

CONSTANT string dwsyntax = 'release 10.5;datawindow(units=0 timer_interval=0 color=1090519039 processing=1 HTMLDW=no print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.prompt=no print.buttons=no print.preview.buttons=no grid.lines=0 ) header(height=80 color="536870912" ) summary(height=0 color="536870912" ) footer(height=0 color="536870912" ) detail(height=92 color="536870912" ) table('
CONSTANT string coldef = ' column=(type=char(255) updatewhereclause=no name={1} dbname="{1}")'
CONSTANT string coludf = ' column=(type=number updatewhereclause=yes name={1} dbname="{1}" initial="0")'
CONSTANT string header = ' text(band=header alignment="2" text="{2}" border="0" color="33554432" x="{3}" y="8" height="64" width="{4}" name={1} font.face="Arial" font.height="-10" font.weight="400" font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912")'
// 1=name, 2=text, 3=x, 4=width
CONSTANT string column = ' column(band=detail id={2} alignment="0" tabsequence=10 border="0" color="33554432" x="{3}" y="8" height="76" width="{4}" format="[general]" name={1} edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes font.face="Arial" font.height="-10" font.weight="400" font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912")'

IF NOT of_IsServicableObject(apo) THEN RETURN -1

// If Non-Visible Column Contain...
IF ab_includehide THEN
   ll_count = of_Getcolumns( apo, ls_colnames, ls_coltypes )
ELSE
   ll_count = of_GetVisibleColumns(apo, ls_colnames, "detail", TRUE)
END IF

ls_syntax = ""
ls_coldef = ""
FOR n = 1 to ll_count
   // skip icon column
   IF ls_colnames[n] = "icon_col" THEN CONTINUE
   // If Only Visible Column...
   IF NOT ab_includehide THEN
      // check if in detail band
      IF apo.DYNAMIC Describe(ls_colnames[n] + ".Band") <> "detail" THEN CONTINUE
   END IF

   // column table
   ls_dtype = of_GetColumnDataType( apo, ls_colnames[n] )
   choose case ls_dtype
      case "decimal", "double", "int", "long", "number", "ulong"
         ls_coldef += of_Format(coludf, {ls_colnames[n]})
      case else
         ls_coldef += of_Format(coldef, {ls_colnames[n]})
   end choose

   // columns
   ls_x = apo.DYNAMIC Describe(ls_colnames[n] + ".X")
   ls_w = apo.DYNAMIC Describe(ls_colnames[n] + ".width")
   ll_id ++
   ls_syntax += of_Format(column, {ls_colnames[n], STRING(ll_id), ls_x, ls_w})

   // headers
   ls_txt = apo.DYNAMIC Describe(ls_colnames[n] + "_t.text")
   IF of_IsErrorString(ls_txt) THEN ls_txt = ls_colnames[n]
   ls_syntax += of_Format(header, {ls_colnames[n] + "_t", ls_txt, ls_x, ls_w})
NEXT

ls_syntax = dwsyntax + ls_coldef + ")" + ls_syntax

// create datastore
IF NOT IsValid(ads) THEN ads = CREATE n_ds

IF ads.CREATE(ls_syntax, ls_x) = -1 THEN
   DESTROY ads
   RETURN -1
END IF
ads.Reset()

IF ab_adddata THEN
   // load rows as as string into new datastore
   ll_rcount = apo.DYNAMIC RowCount()
   FOR n = 1 to ll_rcount
      ads.InsertRow(0)
      FOR m = 1 to ll_count
         IF ls_colnames[m] = "icon_col" THEN CONTINUE
         ls_x = trim(of_GetcolumnDisplayValue(apo, n, ls_colnames[m]))
         IF of_IsErrorString(ls_x) THEN ls_x = CString.EMPTY
         IF NOT of_IsobjectValid( ads, ls_colnames[m] ) THEN CONTINUE
         of_setitem( ads, n, ls_colnames[m], ls_x )
      NEXT
   NEXT
END IF
RETURN 1
end function

public function long of_findrow (readonly powerobject apo, readonly long al_colid, readonly string as_value);//===========================================================================
// Function: of_Findrow (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  Long         al_colid
//  readonly  String       as_value
//---------------------------------------------------------------------------
// Returns: Long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

ls_colname = of_GetColumnName(apo, al_colid)

RETURN of_FindRow(apo, ls_colname, as_value)
end function

public function long of_findrow (readonly powerobject apo, readonly long al_colid, readonly string as_value, long al_startrow);//===========================================================================
// Function: of_Findrow (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  Long         al_colid
//  readonly  String       as_value
//  value     Long         al_startrow
//---------------------------------------------------------------------------
// Returns: Long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

ls_colname = of_GetColumnName(apo, al_colid)

RETURN of_FindRow(apo, ls_colname, as_value, al_startrow)
end function

public function long of_findrow (readonly powerobject apo, readonly string as_column, readonly string as_value);//===========================================================================
// Function: of_Findrow (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  String       as_column
//  readonly  String       as_value
//---------------------------------------------------------------------------
// Returns: Long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
RETURN of_FindRow(apo, as_column, as_value, 1)
end function

public function long of_findrow (readonly powerobject apo, readonly string as_column, readonly string as_value, long al_startrow);//===========================================================================
// Function: of_Findrow (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  String       as_column
//  readonly  String       as_value
//  value     Long         al_startrow
//---------------------------------------------------------------------------
// Returns: Long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
IF NOT of_IsServicableObject(apo) THEN RETURN -1

RETURN apo.DYNAMIC Find( &
         of_BuildColumnValueString(apo, as_column, as_value, TRUE), &
         al_startrow, apo.DYNAMIC RowCount())
end function

public function long of_getbandcontrols (readonly powerobject apo, ref string as_details[], ref string as_headers[]);long     n, ll_count
string   ls_Objs, ls_Band, ls_empty[]

IF NOT of_IsServicableObject(apo) THEN RETURN 0

try
   // ref variable initial
   as_details = ls_empty
   as_headers = ls_empty

   ls_Objs = apo.DYNAMIC Describe( CString.OBJECTS )

   ll_count = of_ParseToArray( ls_objs, CString.TAB, ls_empty )

   FOR n = 1 to ll_count
      IF apo.DYNAMIC Describe(ls_empty[n] + ".Visible") <> "1" THEN CONTINUE
      ls_Band = apo.DYNAMIC Describe(ls_empty[n] + ".band")
      choose case ls_Band
         case "detail"
            as_details[UpperBound(as_details[])+1] = ls_empty[n]
         case "header"
            as_headers[UpperBound(as_headers[])+1] = ls_empty[n]
         case else
      end choose
   NEXT
catch (RunTimeError rte)
   MessageBox("Error!", rte.getMessage(), StopSign!)
end try
RETURN UpperBound(as_details[])
end function

public function long of_getbandcontrols (readonly powerobject apo, string as_band_name, ref string as_controls[]);// Band에 있는 오브젝트수를 구한다?
long     n, ll_count
string   ls_empty[]

as_controls = ls_empty
MessageBox( 'n_svc_dw', 'of_getbandcontrols>n_svc_regexp 주석처리...' )
//n_svc_regexp lnv_regex
//lnv_regex = CREATE n_svc_regexp
//
//lnv_regex.Initialize( "([^\t]+)", TRUE, FALSE)
//
//ll_count = lnv_regex.Search(apo.DYNAMIC Describe("Datawindow.visualobjects"))
//FOR n = 1 to ll_count
//   IF apo.DYNAMIC Describe(lnv_regex.Match(n) + ".band") = as_band_name  THEN
//      as_controls[UpperBound(as_controls[])+1 ] = lnv_regex.Match(n)
//   END IF
//NEXT
//DESTROY lnv_regex

RETURN UpperBound(as_controls[])
end function

public function long of_getbands (readonly powerobject apo, ref string as_bands[]);//===========================================================================
// Function: of_GetBands (public )
//---------------------------------------------------------------------------
// Description: DataWindow의 Band를 구한다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//    readonly         powerobject   apo
//    reference        string        as_bands[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_bands

ls_bands = apo.DYNAMIC Describe( CString.BANDS )

of_parseToArray( ls_bands, CString.TAB, as_bands )

RETURN UpperBound( as_bands )
end function

public function long of_getcolumncount (readonly powerobject apo);//===========================================================================
// Function: of_Getcolumncount (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//---------------------------------------------------------------------------
// Returns: Long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ls = apo.DYNAMIC Describe(CString.COLUMN_COUNT)

IF NOT isnumber(ls) OR isnull(ls) THEN ls = "-1"

RETURN LONG(ls)
end function

public function string of_getcolumndatatype (readonly powerobject apo, readonly long al_colid);//===========================================================================
// Function: of_Getcolumndatatype (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  Long         al_colid
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

// Get Column Name
ls_colname = of_GetColumnName(apo, al_colid)

// Check if Valid Colid
IF isnull(ls_colname) THEN RETURN ls_colname

RETURN of_GetColumnDatatype(apo, ls_colname)
end function

public function string of_getcolumndatatype (readonly powerobject apo, readonly string as_column);//===========================================================================
// Function: of_Getcolumndatatype (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  String       as_column
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   lsr

IF NOT of_IsobjectValid(apo, as_column) THEN RETURN lsr

lsr = lower(apo.DYNAMIC Describe(as_column + ".ColType"))

IF Pos( lsr, "(" ) > 0 THEN
   lsr = left( lsr, Pos( lsr, "(" ) - 1 )
END IF

IF of_IsErrorString( lsr ) THEN SetNull( lsr )

RETURN lsr
end function

public function string of_getcolumndisplayvalue (readonly powerobject apo, readonly long al_row, readonly long al_colid);//===========================================================================
// Function: of_Getcolumndisplayvalue (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  Long         al_row
//  readonly  Long         al_colid
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

// Get Column Name
ls_colname = of_GetColumnName(apo, al_colid)

// Check if Valid Colid
IF isnull(ls_colname) THEN RETURN ls_colname

RETURN of_GetColumnDisplayValue(apo, al_row, ls_colname)
end function

public function string of_getcolumndisplayvalue (readonly powerobject apo, readonly long al_row, readonly string as_column);//===========================================================================
// Function: of_Getcolumndisplayvalue (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  Long         al_row
//  readonly  String       as_column
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_ret

IF NOT of_IsServicableObject(apo) THEN RETURN ls_ret

ls_ret = apo.DYNAMIC Describe( &
           "evaluate('lookupdisplay(" + as_column + ")'," + STRING(al_row) + ")" &
           )

RETURN ls_ret
end function

public function string of_getcolumneditstyle (readonly powerobject apo, readonly long al_colid);//===========================================================================
// Function: of_Getcolumneditstyle (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  readonly Long        al_colid
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

// Get Column Name
ls_colname = of_GetColumnName(apo, al_colid)

// Check if Valid Colid
IF isnull(ls_colname) THEN RETURN ls_colname

RETURN of_GetColumnEditStyle(apo, ls_colname)
end function

public function string of_getcolumneditstyle (readonly powerobject apo, readonly string as_column);//===========================================================================
// Function: of_Getcolumneditstyle (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  readonly String      as_column
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   lsr

IF NOT of_IsServicableObject(apo) THEN RETURN lsr

RETURN lower(apo.DYNAMIC Describe(as_column + ".Edit.Style"))
end function

public function string of_getcolumnid (readonly powerobject apo, readonly string as_column);string   ls_column

IF NOT of_IsServicableObject(apo) THEN
   SetNull(ls_column)
   RETURN ls_column
END IF

// get column name
ls_column = trim(apo.DYNAMIC Describe(as_column + ".ID"))

// Set null if invalid colid
IF of_IsEmpty(ls_column) OR of_IsErrorString(ls_column) THEN
   SetNull(ls_column)
END IF

RETURN ls_column
end function

public function string of_getcolumninitial (readonly powerobject apo, long al_colid);RETURN of_getColumnInitial(apo, of_GetColumnName(apo, al_colid))
end function

public function string of_getcolumninitial (readonly powerobject apo, string as_column);RETURN apo.DYNAMIC Describe(as_column + ".Initial")
end function

public function string of_getcolumnname (readonly powerobject apo, readonly long al_colid);//===========================================================================
// Function: of_Getcolumnname (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  Long         al_colid
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_column

IF NOT of_IsServicableObject(apo) THEN
   SetNull(ls_column)
   RETURN ls_column
END IF

// get column name
ls_column = trim(apo.DYNAMIC Describe("#" + STRING(al_colid) + ".Name"))

// Set null if invalid colid
IF of_IsEmpty(ls_column) OR of_IsErrorString(ls_column) THEN
   SetNull(ls_column)
END IF

RETURN ls_column
end function

public function long of_getcolumns (readonly powerobject apo, ref string as_colnames[], ref string as_datatypes[]);//===========================================================================
// Function: of_Getcolumns (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject apo
//  reference  String      as_colnames[]
//  reference  String      as_datatypes[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// of_Getcolumns( apo, as_colnames, as_datatypes )
//===========================================================================
long  c, n, ll_tcnt

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ll_tcnt = of_GetColumnCount(apo)

FOR n = 1 to ll_tcnt
   c ++
   as_colnames [c] = apo.DYNAMIC Describe( "#" + STRING(n) + ".Name" )
   as_datatypes[c] = of_getcolumndatatype(apo, as_colnames[c])
NEXT

RETURN c
end function

public function long of_getcomputedfields (readonly powerobject apo, ref string as_name[], ref string as_datatype[]);//===========================================================================
// Function: of_Getcomputedfields (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject apo
//  reference  String      as_name[]
//  reference  String      as_datatype[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
long     c, n, ll_count
string   ls_names[], ls_types[]

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ll_count = of_GetObjects(apo, ls_names, ls_types)

FOR n = 1 to ll_count
   IF ls_types[n] <> "compute" THEN CONTINUE
   c ++
   as_name[c] = ls_names[n]
   as_datatype[c] = of_GetColumnDataType(apo, ls_names[n])
NEXT

RETURN c
end function

public function string of_getdwstyle (readonly datawindow adw);//===========================================================================
//===========================================================================
// Function: of_Getdwstyle (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly DataWindow adw
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
RETURN adw.Describe(CString.PROCESSING)
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

FOR n = 1 to li_Bands
   IF ls_Band[n] <> "detail" THEN
      ll_Height += long(apo.DYNAMIC Describe( "DataWindow." + &
                        ls_Band[n] + ".Height" ))
   END IF
NEXT

ll_Detail = apo.DYNAMIC RowCount() * &
            long(apo.DYNAMIC Describe("DataWindow.Detail.Height"))

ll_Height += ll_Detail

RETURN ll_Height
end function

public function string of_getitem (readonly powerobject apo, long al_row, long al_colid);//===========================================================================
// Function: of_GetItem (public )
//---------------------------------------------------------------------------
// Description: Column의 값을 가져온다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    Long        al_row
//  value    Long        al_colid
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

ls_colname = of_getColumnName( apo, al_colid )

RETURN of_GetItem( apo, al_row, ls_colname, Primary!, FALSE )
end function

public function string of_getitem (readonly powerobject apo, long al_row, long al_colid, dwbuffer adw_buffer, boolean ab_orig_value);//===========================================================================
// Function: of_GetItem (public )
//---------------------------------------------------------------------------
// Description: Column의 값을 가져온다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject  apo
//  value    Long         al_row
//  value    Long         al_colid
//  value    dwbuffer     adw_buffer
//  value    boolean      ab_orig_value
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

ls_colname = of_getColumnName( apo, al_colid )

RETURN of_GetItem( apo, al_row, ls_colname, adw_buffer, ab_orig_value )
end function

public function string of_getitem (readonly powerobject apo, long al_row, string as_column);//===========================================================================
// Function: of_GetItem (public )
//---------------------------------------------------------------------------
// Description: Column의 값을 가져온다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  value     Long         al_row
//  value     String       as_column
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
RETURN of_GetItem( apo, al_row, as_column, Primary!, FALSE )
end function

public function string of_getitem (readonly powerobject apo, long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value);//===========================================================================
// Function: of_GetItem (public )
//---------------------------------------------------------------------------
// Description: Column의 값을 가져온다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject  apo
//  value    Long         al_row
//  value    string       as_column
//  value    dwbuffer     adw_buffer
//  value    boolean      ab_orig_value
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean  lb_editmask_used
long     ll_pos
string   ls_col_format, ls_col_mask, ls_string_format, ls_string, ls_savestring
string   ls_coltype, ls_editstyle
string   ls_computeexp, ls_evaluateexp
string   edit_codetable, editmask_codetable

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

ls_col_format = apo.DYNAMIC Describe ( as_column + ".format" )
ls_col_mask   = apo.DYNAMIC Describe ( as_column + ".editmask.mask")

IF of_IsErrorString(ls_col_mask) THEN
   ls_string_format = ls_col_format
ELSE
   ls_string_format = ls_col_mask
   lb_editmask_used = TRUE
END IF

IF of_IsErrorString(ls_string_format) THEN
   ls_string_format = CString.EMPTY
ELSE
   ll_pos = Pos( ls_string_format, CString.TAB )
   IF ll_pos > 0 THEN
      IF left( ls_string_format, 1 ) = "~"" Then
         ls_string_format = mid( ls_string_format, 2, ll_pos - 2 )
      ELSE
         ls_string_format = left( ls_string_format, ll_pos - 1 )
      END IF
   END IF
END IF

ls_coltype = of_GetColumnDataType( apo, as_column )
choose case lower( ls_coltype )
   case "char"
      IF lb_editmask_used  THEN
         ls_string_format = of_GlobalReplace( ls_string_format, "^", "@" ) //Lowercase
         ls_string_format = of_GlobalReplace( ls_string_format, "!", "@")  //Uppercase
         ls_string_format = of_GlobalReplace( ls_string_format, "#", "@" ) //Number
         ls_string_format = of_GlobalReplace( ls_string_format, "a", "@" ) //Aplhanumeric
         ls_string_format = of_GlobalReplace( ls_string_format, "x", "@" ) //Any Character
      END IF
      ls_string = apo.DYNAMIC GetItemString( al_row, as_column, adw_buffer, ab_orig_value )
      ls_string = STRING( ls_string, ls_string_format )
   case "date"
      date ld_date
      ld_date = apo.DYNAMIC GetItemDate( al_row, as_column, adw_buffer, ab_orig_value )
      IF len(ls_string_format) > 0 THEN
         ls_string = STRING( ld_date, ls_string_format )
      ELSE
         ls_string = STRING(ld_date)
      END IF
   case "datetime"
      datetime ldtm_datetime
      ldtm_datetime = apo.DYNAMIC GetItemDateTime( al_row, as_column, adw_buffer, ab_orig_value )
      IF len(ls_string_format) > 0 THEN
         ls_string = STRING( ldtm_datetime, ls_string_format )
      ELSE
         ls_string = STRING(ldtm_datetime)
      END IF
   case "decimal"
      decimal ldec_decimal
      ldec_decimal = apo.DYNAMIC GetItemDecimal( al_row, as_column, adw_buffer, ab_orig_value )
      IF len(ls_string_format) > 0 THEN
         ls_string = STRING( ldec_decimal, ls_string_format )
      ELSE
         ls_string = STRING(ldec_decimal)
      END IF
   case "number", "double", "real"
      double ldbl_double
      ldbl_double = apo.DYNAMIC GetItemNumber( al_row, as_column, adw_buffer, ab_orig_value )
      IF len(ls_string_format) > 0 THEN
         ls_string = STRING( ldbl_double, ls_string_format )
      ELSE
         ls_string = STRING( ldbl_double )
      END IF
   case "long", "ulong", "int"
      long ll_long
      ll_long = apo.DYNAMIC GetItemNumber( al_row, as_column, adw_buffer, ab_orig_value )
      IF len(ls_string_format) > 0 THEN
         ls_string = STRING( ll_long, ls_string_format )
      ELSE
         ls_string = STRING( ll_long )
      END IF
   case "time", "timestamp"
      time ltm_time
      ltm_time = apo.DYNAMIC GetItemTime( al_row, as_column, adw_buffer, ab_orig_value )
      IF len(ls_string_format) > 0 THEN
         ls_string = STRING( ltm_time, ls_string_format )
      ELSE
         ls_string = STRING( ltm_time )
      END IF
end choose

/*  Can only provide the display value if we are looking for the current value */
IF NOT ab_orig_value Then
   // -- Look Up Display values. --
   IF adw_buffer = Primary! THEN
      ls_editstyle = lower(apo.DYNAMIC Describe( as_column + ".Edit.Style" ))
      edit_codetable = lower(apo.DYNAMIC Describe ( as_column + ".Edit.CodeTable" ))
      editmask_codetable = lower(apo.DYNAMIC Describe ( as_column + ".EditMask.CodeTable" ))

      IF ls_editstyle="dddw" OR ls_editstyle="ddlb" OR ls_editstyle="radiobuttons" OR &
         edit_codetable = "yes" OR editmask_codetable = "yes" THEN
         ls_evaluateexp = "Evaluate('LookUpDisplay(" + as_column + ")', " + STRING(al_row) + ")"
         ls_string = apo.DYNAMIC Describe(ls_evaluateexp)
      ELSEIF ls_editstyle = "checkbox" THEN
         ls_evaluateexp = "Evaluate('LookUpDisplay(" + as_column + ")', " + STRING(al_row) + ")"
         ls_string = ls_string + "~t" + apo.DYNAMIC Describe(ls_evaluateexp)
      END IF
   END IF
END IF
RETURN ls_string
end function

public function any of_getitemany (readonly powerobject apo, long al_row, long al_colid);//===========================================================================
// Function: of_Getitemany (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    Long        al_row
//  value    Long        al_colid
//---------------------------------------------------------------------------
// Returns: Any
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

// Get Column Name
ls_colname = of_GetColumnName(apo, al_colid)

// Check if Valid Colid
IF isnull(ls_colname) THEN RETURN ls_colname

RETURN of_GetItemAny( apo, al_row, ls_colname, Primary!, FALSE )
end function

public function any of_getitemany (readonly powerobject apo, long al_row, long al_colid, dwbuffer adw_buffer, boolean ab_orig_value);//===========================================================================
// Function: of_GetItemAny (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    Long        al_row
//  value    Long        al_colid
//  value    dwbuffer    adw_buffer
//  value    boolean     ab_orig_value
//---------------------------------------------------------------------------
// Returns: Any
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

// Get Column Name
ls_colname = of_GetColumnName(apo, al_colid)

// Check if Valid Colid
IF isnull(ls_colname) THEN RETURN ls_colname

RETURN of_GetItemAny( apo, al_row, ls_colname, adw_buffer, ab_orig_value )
end function

public function any of_getitemany (readonly powerobject apo, long al_row, string as_column);//===========================================================================
// Function: of_Getitemany (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject    apo
//  value    Long           al_row
//  value    String         as_column
//---------------------------------------------------------------------------
// Returns: Any
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
RETURN of_GetItemAny( apo, al_row, as_column, Primary!, FALSE )
end function

public function any of_getitemany (readonly powerobject apo, long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value);//===========================================================================
// Function: of_GetItemAny (public )
//---------------------------------------------------------------------------
// Description: Column의 값을 가져온다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    Long        al_row
//  value    string      as_column
//  value    dwbuffer    adw_buffer
//  value    boolean     ab_orig_value
//---------------------------------------------------------------------------
// Returns: string
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
any      la_ret
decimal  ld
string   ls_dtype

IF NOT of_IsServicableObject(apo) THEN RETURN la_ret

ls_dtype = of_GetColumnDataType(apo, as_column)
choose case ls_dtype
   case "char"
      la_ret = apo.DYNAMIC GetItemString(al_row, as_column, adw_buffer, ab_orig_value)
   case "decimal"
      ld = apo.DYNAMIC GetItemDecimal(al_row, as_column, adw_buffer, ab_orig_value)
      RETURN ld
   case "int", "long", "number", "real", "ulong"
      la_ret = apo.DYNAMIC GetItemNumber(al_row, as_column, adw_buffer, ab_orig_value)
   case "date"
      la_ret = apo.DYNAMIC GetItemDate(al_row, as_column, adw_buffer, ab_orig_value)
   case "datetime"
      la_ret = apo.DYNAMIC GetItemDateTime(al_row, as_column, adw_buffer, ab_orig_value)
   case "time", "timestamp"
      la_ret = apo.DYNAMIC GetItemTime(al_row, as_column, adw_buffer, ab_orig_value)
   case else
      SetNull(la_ret)
end choose

RETURN la_ret
end function

public function long of_getobjects (readonly powerobject apo, ref string as_name[], ref string as_type[]);//===========================================================================
// Function: of_Getobjects (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  reference String as_name[]
//  reference String as_type[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
long     c
string   ls_objs

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ls_objs = apo.DYNAMIC Describe( CString.OBJECTS )

DO WHILE NOT of_IsEmpty(ls_objs)
   c ++
   as_name[c] = of_GetToken( ls_objs, CString.TAB ) // "~t"
   as_type[c] = apo.DYNAMIC Describe(as_name[c] + ".Type")
LOOP

RETURN c
end function

public function long of_getprimarykeys (readonly powerobject apo, ref string as_names[], ref string as_datatypes[]);//===========================================================================
// Function: of_Getprimarykeys (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject apo
//  reference String      as_names[]
//  reference String      as_datatypes[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
long     n, c, ll_count

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ll_count = of_GetColumnCount(apo)

FOR n = 1 to ll_count
   IF lower(apo.DYNAMIC Describe("#" + STRING(n) + ".Key")) = CString.YES THEN
      c ++
      as_names    [c] = of_getColumnName( apo, n )
      as_datatypes[n] = of_GetColumnDataType(apo, as_names[c])
   END IF
NEXT
RETURN c
end function

public function long of_getprimarykeyvalues (readonly powerobject apo, readonly long al_row, ref string as_values[]);//===========================================================================
// Function: of_Getprimarykeyvalues (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//  readonly   Long           al_row
//  reference  String         as_values[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     n, ll_count
string   ls_names[], ls_types[]

IF NOT IsValid(apo) THEN RETURN -1

ll_count = of_GetPrimaryKeys(apo, ls_names, ls_types)

FOR n = ll_count to 1 STEP -1
   as_values[n] = STRING(of_GetItemAny(apo, al_row, ls_names[n]))
NEXT

RETURN ll_count
end function

public function string of_getproperties (readonly powerobject apo, readonly string as_column, readonly string as_separator);//===========================================================================
// Function : of_GetProperties (public )
// Object   : n_svc_dw
//---------------------------------------------------------------------------
// Description: DataWindow Column의 Text 또는 Tag의 값을 가져온다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//  readonly   string         as_column
//  readonly   string         as_separator
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string   ls_tag, ls_ret

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

try
   choose case as_separator
      case "tag"
         ls_tag = ".Tag"
      case "text"
         ls_tag = "_t.text"
      case else
         ls_tag = "_t.text"
   end choose

   ls_ret = apo.DYNAMIC Describe(as_column + ls_tag)

   IF of_IsEmpty( ls_ret ) OR of_IsErrorString( ls_ret ) THEN
      ls_ret = as_column
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try

RETURN ls_ret
end function

public function long of_getretrievalarguments (readonly powerobject apo, ref string as_argnames[], ref string as_datatypes[]);//===========================================================================
// Function: of_Getretrievalarguments (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//  reference  String         as_argnames[]
//  reference  String         as_datatypes[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     c, ll_pos
string   ls_argstring, ls_tmp

ls_argstring = apo.DYNAMIC Describe( CString.ARGUMENTS )

IF of_IsErrorString(ls_argstring) THEN RETURN -1

DO
   ls_tmp = of_gettoken(ls_argstring, Char(10))

   IF ls_tmp <> CString.EMPTY THEN
      c ++
      ll_pos = Pos(ls_tmp, CString.TAB)
      as_argnames [c] = mid(ls_tmp, 1, ll_pos - 1)
      as_datatypes[c] = mid(ls_tmp, ll_pos + 1)
   END IF
LOOP WHILE ls_argstring <> CString.EMPTY

RETURN c
end function

public function long of_getsort (readonly powerobject apo, ref string as_colnames[], ref string as_sortdirection[]);//===========================================================================
// Function: of_Getsort (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject apo
//  reference  String      as_colnames[]
//  reference  String      as_sortdirection[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     n, ll_count
string   ls_ret, ls_p[]

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ls_ret = apo.DYNAMIC Describe(CString.SORTS)

IF of_IsErrorString(ls_ret) THEN RETURN -1

of_ParseToArray(ls_ret, ",", ls_p)

ll_count = UpperBound(ls_p)

FOR n = 1 TO ll_count
   as_colnames     [n] = trim(mid(ls_p[n], 1, len(ls_p[n]) - 1))
   as_sortdirection[n] = right(ls_p[n], 1)
NEXT

RETURN ll_count
end function

public function string of_gettabsequence (readonly powerobject apo);//===========================================================================
// Function: of_Gettabsequence (public )
// Object: n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     n, ll_count
string   ls_ret, ls_colnames[]

IF NOT of_IsServicableObject(apo) THEN RETURN ls_ret

ll_count = of_GetVisibleColumns(apo, ls_colnames)

FOR n = 1 to ll_count
   ls_ret += apo.DYNAMIC Describe(ls_colnames[n] + ".TabSequence")
   IF n <> ll_count THEN ls_ret += ","
NEXT

RETURN ls_ret
end function

public function string of_gettext (readonly powerobject apo, string as_column);/*------------------------------------------------------------------------------------------------*
   string of_getText(powerobject apo, string as_column)
  -------------------------------------------------------------------------------------------------
   Description :                    Date : 2014-03-25            Author : PowerBuilder
  -------------------------------------------------------------------------------------------------
   DataWindow에서 column name + "_t"의 Text값을 읽는다.
  -------------------------------------------------------------------------------------------------
   Parameters:
   powerobject       apo          :  찾고자 하는 오브젝트를 포함한 DataWindow
   string            as_column    :  찾고자 하는 오브젝트
 *------------------------------------------------------------------------------------------------*/
string   ls_text

IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

try
   ls_text = apo.DYNAMIC Describe(as_column + "_t.text")

   IF of_IsEmpty(ls_text) OR of_IsErrorString(ls_text) THEN
      ls_text = as_column
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
RETURN ls_text
end function

public function string of_getupdatetable (readonly powerobject apo);//===========================================================================
// Function: of_Getupdatetable (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
IF NOT of_IsServicableObject(apo) THEN RETURN CString.EMPTY

RETURN apo.DYNAMIC Describe(CString.UPDATETABLE)
end function

public function long of_getvisiblecolumns (readonly powerobject apo, ref string as_colnames[]);//===========================================================================
// Function: of_Getvisiblecolumns (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject apo
//  reference String      as_colnames[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
RETURN  of_GetVisibleColumns(apo, as_colnames, CString.EMPTY, FALSE)
end function

public function long of_getvisiblecolumns (readonly powerobject apo, ref string as_colnames[], readonly string as_bandname, readonly boolean ab_includecomputed);//===========================================================================
// Function: of_Getvisiblecolumns (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject apo
//  reference String      as_colnames[]
//  readonly  Boolean     ab_includecomputed
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author : PowerBuilder
//===========================================================================
long     c, n, ll_count
string   ls_tmp

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ll_count = of_GetColumnCount(apo)

FOR n = 1 to ll_count
   IF apo.DYNAMIC Describe("#" + STRING(n) + ".Visible") = "1" THEN
      IF of_IsEmpty(as_bandname) THEN
         c ++
         as_colnames[c] = apo.DYNAMIC Describe("#" + STRING(n) + ".Name")
      ELSE
         ls_tmp = apo.DYNAMIC Describe("#" + STRING(n) + ".Band")
         IF lower(ls_tmp) = lower(as_bandname) THEN
            c ++
            as_colnames[c] = apo.DYNAMIC Describe("#" + STRING(n) + ".Name")
         END IF
      END IF
   END IF
NEXT

// computed fields
IF ab_includecomputed THEN
   string   ls_computes[], ls_dtypes[]

   ll_count = of_GetComputedFields(apo, ls_computes, ls_dtypes)

   FOR n = 1 to ll_count
      IF apo.DYNAMIC Describe(ls_computes[n] + ".Visible") = "1" THEN
         IF of_IsEmpty(as_bandname) THEN
            c ++
            as_colnames[c] = ls_computes[n]
         ELSE
            ls_tmp = apo.DYNAMIC Describe(ls_computes[n] + ".Band")
            IF lower(ls_tmp) = lower(as_bandname) THEN
               c ++
               as_colnames[c] = ls_computes[n]
            END IF
         END IF
      END IF
   NEXT
END IF
RETURN c
end function

public function boolean of_isobjectvalid (readonly powerobject apo, readonly string as_objname);//===========================================================================
// Function: of_isobjectvalid (public )
//---------------------------------------------------------------------------
// Description: DataWindow에서 Object를 찾는다.
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  powerObject  apo
//  readonly  string       as_objname  찾고자 하는 오브젝트
//---------------------------------------------------------------------------
// Returns: Boolean
//---------------------------------------------------------------------------
// Author : PowerBuilder
//===========================================================================
string   ls_objs

IF NOT of_IsServicableObject(apo) THEN RETURN FALSE

try
   ls_objs = apo.DYNAMIC Describe(CString.OBJECTS)

   IF Pos(ls_objs, as_objname) > 0 THEN RETURN TRUE
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try

RETURN FALSE
end function

public function boolean of_isobjectvisible (readonly powerobject apo, readonly string as_objname);//===========================================================================
// Function: of_Isobjectvisible (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly  PowerObject  apo
//  readonly  String       as_objname
//---------------------------------------------------------------------------
// Returns: Boolean
//---------------------------------------------------------------------------
// Author : PowerBuilder
//===========================================================================
boolean  lb_ret
string   ls_ret

IF NOT of_IsServicableObject(apo) THEN RETURN lb_ret

ls_ret = apo.DYNAMIC Describe(as_objname + ".Visible")

choose case lower(ls_ret)
   case "1", "yes"
      lb_ret = TRUE
end choose

RETURN lb_ret
end function

protected function boolean of_isservicableobject (readonly powerobject apo);//===========================================================================
// Function: of_Isservicableobject (protected )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//---------------------------------------------------------------------------
// Returns: Boolean
//---------------------------------------------------------------------------
// Author : PowerBuilder
//===========================================================================
boolean  lb = FALSE

IF IsValid(apo) THEN
   choose case apo.TypeOf()
      case Datawindow!, Datastore!, DatawindowChild!
         lb = TRUE
   end choose
END IF

RETURN lb
end function

public function long of_ordercolumnsbypositionx (readonly powerobject apo, ref string as_colnames[]);//===========================================================================
// Function: of_Ordercolumnsbypositionx (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description: Grid Type DW의 Column의 위치값(x)값으로 Sort
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//  reference  string         as_colnames[]
//---------------------------------------------------------------------------
// Returns: long
//---------------------------------------------------------------------------
// Author : (Yeyi) Gabriel B. Abulencia
//===========================================================================
boolean  lb_swap
long     llx1, llx2, m
long     ll_count, ll_innercount, n
string   ls_temp

IF NOT of_IsServicableObject(apo) THEN RETURN 0

ll_count = UpperBound(as_colnames)
IF ll_count <= 0 THEN
   ll_count = of_GetVisibleColumns(apo, as_colnames, "detail", TRUE)
END IF
ll_innercount = ll_count - 1

FOR n = 1 to ll_count
   lb_swap = FALSE

   FOR m = 1 to ll_innercount
      llx1 = LONG(apo.DYNAMIC Describe(as_colnames[m] + ".X"))
      llx2 = LONG(apo.DYNAMIC Describe(as_colnames[m + 1] + ".X"))
      IF llx1 > llx2 THEN
         lb_swap = TRUE
         ls_temp = as_colnames[m]
         as_colnames[m] = as_colnames[m + 1]
         as_colnames[m + 1] = ls_temp
      END IF
   NEXT

   IF NOT lb_swap THEN EXIT
NEXT

RETURN ll_count
end function

public subroutine of_removedropdownarrows (readonly powerobject apo, readonly boolean ab_set);//===========================================================================
// Function: of_Removedropdownarrows (public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly     PowerObject  apo
//  readonly     Boolean      ab_set
//---------------------------------------------------------------------------
// Returns: (none)
//---------------------------------------------------------------------------
// Author : PowerBuilder
//===========================================================================
long     n, ll_count
string   ls_cols[], ls_type, ls_mod
string   ls_arrow, ls_darrow

IF NOT of_IsServicableObject(apo) THEN RETURN

IF ab_set THEN
   ls_arrow = "no"
   ls_darrow = "yes"
ELSE
   ls_arrow = "yes"
   ls_darrow = "no"
END IF

ll_count = of_GetVisibleColumns(apo, ls_cols)

FOR n = 1 to ll_count
   ls_type = of_GetColumnEditstyle(apo, ls_cols[n])

   IF ls_type = "ddlb" OR ls_type = "dddw" THEN
      ls_mod += " " + ls_cols[n] + "." + ls_type + ".UseAsBorder='" + ls_arrow + "'"
      ls_mod += " " + ls_cols[n] + "." + ls_type + ".ShowList='" + ls_darrow + "'"
   END IF
NEXT

apo.DYNAMIC Modify(ls_mod)
end subroutine

public subroutine of_removetabsequence (readonly powerobject apo);//===========================================================================
// Function: of_Removetabsequence (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//---------------------------------------------------------------------------
// Returns: (none)
//---------------------------------------------------------------------------
// Author : (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     n, ll_count
string   ls_cols[], ls_mod

IF NOT of_IsServicableObject(apo) THEN RETURN

ll_count = of_GetVisibleColumns(apo, ls_cols)

ls_mod = CString.EMPTY
FOR n = 1 to ll_count
   ls_mod += " " + ls_cols[n] + ".TabSequence=0"
NEXT

apo.DYNAMIC Modify(ls_mod)
end subroutine

public function integer of_saveas (readonly powerobject apo);//===========================================================================
// Function: of_Saveas (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//---------------------------------------------------------------------------
// Returns: Integer
//---------------------------------------------------------------------------
// Author : (Yeyi) Gabriel B. Abulencia
//===========================================================================
string      ls_types, ls_path, ls_file
saveastype  lsa

IF NOT of_IsServicableObject(apo) THEN RETURN -1

IF apo.DYNAMIC RowCount() <= 0 THEN
   MessageBox("Save rows", "There are no rows to export.", Exclamation!)
   RETURN -1
END IF

ls_types  = "Text (Tab delimited) (*.TXT),*.TXT,"
ls_types += "CSV (Comma delimited) (*.CSV),*.CSV,"
ls_types += "Excel (*.XLS),*.XLS,"
ls_types += "XML (*.XML),*.XML,"
ls_types += "PDF (Portable Document Format) (*.PDF),*.PDF"

IF GetFileSaveName ( "Save Data As", &
    ls_path, ls_file, "TXT", &
    ls_types) <> 1 THEN RETURN -1

choose case upper(right(ls_file, 3))
   case "TXT"
      lsa = Text!
   case "CSV"
      lsa = CSV!
   case "XLS"
      lsa = Excel!
   case "XML"
      lsa = XML!
   case "PDF"
      lsa = PDF!
   case else
      lsa = Text!
end choose

RETURN of_SaveAs(apo, ls_path, lsa)
end function

public function integer of_saveas (readonly powerobject apo, readonly string as_fullpath, readonly saveastype asa_type);//===========================================================================
// Function: of_Saveas (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//  readonly   String         as_fullpath
//  readonly   SaveAsType     asa_type
//---------------------------------------------------------------------------
// Returns: Integer
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
Datastore   lds

IF NOT of_IsServicableObject(apo) THEN RETURN -1

IF of_CreateStringDatastore(apo, lds) = -1 THEN
   IF IsValid(lds) THEN DESTROY lds
   RETURN -1
END IF

RETURN lds.SaveAs( as_fullpath, asa_type, TRUE )
end function

public subroutine of_setbackgroundmode (readonly powerobject apo);of_SetBackgroundMode( apo, CString.ONN )
end subroutine

public subroutine of_setbackgroundmode (readonly powerobject apo, readonly string as_mode);/*------------------------------------------------------------------------------------------------*
   of_SetBackgroundMode(dw_1, CString.ONN)
  -------------------------------------------------------------------------------------------------
   Date(yyyy.mm.dd) Author        Description
  -------------------------------------------------------------------------------------------------
   2011.03.07       PowerBuilder  모든 컬럼을 투명하게
  -------------------------------------------------------------------------------------------------
   Note:  cf. of_columnclear()
 *------------------------------------------------------------------------------------------------*/
long     n, ll_count
string   ls_mod, ls_cols[]

IF NOT of_IsServicableObject(apo) THEN RETURN

try
   ll_count = of_Getvisiblecolumns(apo, ls_cols, "detail", TRUE)

   ls_mod = CString.EMPTY
   FOR n = 1 to ll_count
      ls_mod += ls_cols[n] + ".Background.Mode='" + as_mode + "'"
   NEXT
   IF NOT of_IsEmpty(ls_mod) THEN
      apo.DYNAMIC Modify(ls_mod)
   END IF
catch (RunTimeError rte)
   of_SystemErrorDisplay( rte )
end try
end subroutine

public function integer of_setitem (readonly powerobject apo, long al_row, long al_colid, string as_value);//===========================================================================
// Function: of_SetItem ( public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    long        al_row
//  value    long        al_colid
//  value    string      as_value
//---------------------------------------------------------------------------
// Returns: Integer
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
string   ls_colname

// Get Column Name
ls_colname = of_GetColumnName(apo, al_colid)

// Check if Valid Colid
IF of_IsEmpty( ls_colname ) THEN RETURN -1

RETURN of_SetItem(apo, al_row, ls_colname, as_value)
end function

public function integer of_setitem (readonly powerobject apo, long al_row, string as_column, string as_value);//===========================================================================
// Function: of_SetItem ( public )
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  value    long        al_row
//  value    string      as_column
//  value    string      as_value
//---------------------------------------------------------------------------
// Returns: Integer
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
integer  li_ret
decimal  ld
double   ldb
long     ll_val
real     lr_val
string   ls_dtype, ls_string_value

IF NOT of_IsServicableObject(apo) THEN RETURN -1

ls_dtype = of_GetColumnDataType( apo, as_column )
choose case ls_dtype
   case "char"
      li_ret = apo.DYNAMIC SetItem(al_row, as_column, as_value)
   case "date"
      li_ret = apo.DYNAMIC SetItem(al_row, as_column, DATE(as_value))
   case "datetime"
      li_ret = -1 //apo.DYNAMIC GetItemDateTime(al_row, as_column)
   case "decimal"
      /*  Replace formatting characters in passed string */
      ls_string_value = of_GlobalReplace(as_value, "$", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, ",", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, "(", "-")
      ls_string_value = of_GlobalReplace(ls_string_value, ")", "")

      IF Pos(ls_string_value, "%") > 0 THEN
         ls_string_value = of_GlobalReplace(ls_string_value, "%", "")
         ld = Dec(ls_string_value) / 100
      ELSE
         ld = Dec(ls_string_value)
      END IF
      li_ret = apo.DYNAMIC SetItem(al_row, as_column, ld)
   case "number", "double"
      /*  Replace formatting characters in passed string */
      ls_string_value = of_GlobalReplace(as_value, "$", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, ",", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, "(", "-")
      ls_string_value = of_GlobalReplace(ls_string_value, ")", "")

      IF Pos(ls_string_value, "%") > 0 THEN
         ls_string_value = of_GlobalReplace(ls_string_value, "%", "")
         ldb = Double(ls_string_value) / 100
      ELSE
         ldb = Double(ls_string_value)
      END IF
      li_ret = apo.DYNAMIC SetItem(al_row, as_column, ldb)
   case "int", "long", "ulong"
      /*  Replace formatting characters in passed string */
      ls_string_value = of_GlobalReplace(as_value, "$", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, ",", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, "(", "-")
      ls_string_value = of_GlobalReplace(ls_string_value, ")", "")

      IF Pos(ls_string_value, "%") > 0 THEN
         ls_string_value = of_GlobalReplace(ls_string_value, "%", "")
         ll_val = Long(ls_string_value) / 100
      ELSE
         ll_val = Long(ls_string_value)
      END IF
      li_ret = apo.DYNAMIC SetItem(al_row, as_column, ll_val)
   case "real"
      /*  Replace formatting characters in passed string */
      ls_string_value = of_GlobalReplace(as_value, "$", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, ",", "" )
      ls_string_value = of_GlobalReplace(ls_string_value, "(", "-")
      ls_string_value = of_GlobalReplace(ls_string_value, ")", "")

      IF Pos(ls_string_value, "%") > 0 THEN
         ls_string_value = of_GlobalReplace(ls_string_value, "%", "")
         lr_val = Real(ls_string_value) / 100
      ELSE
         lr_val = Real(ls_string_value)
      END IF
      li_ret = apo.DYNAMIC SetItem(al_row, as_column, lr_val)
   case "time", "timestamp"
      li_ret = apo.DYNAMIC SetItem(al_row, as_column, TIME(as_value))
   case else
      li_ret = -1
end choose

RETURN li_ret
end function

public subroutine of_settabsequence (readonly powerobject apo, readonly string as_tabsequence);//===========================================================================
// Function: of_Settabsequence (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject apo
//  readonly   String      as_tabsequence
//---------------------------------------------------------------------------
// Returns: (none)
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long     n, ll_count
string   ls_colnames[], ls, ls_tabs[]

IF NOT of_IsServicableObject(apo) THEN RETURN

of_ParseToArray(as_tabsequence, ",", ls_tabs)

ll_count = of_GetVisibleColumns(apo, ls_colnames)

IF UpperBound(ls_tabs) = ll_count THEN
   ls = CString.EMPTY
   FOR n = 1 to ll_count
      ls += " " + ls_colnames[n] + ".TabSequence=" + ls_tabs[n]
   NEXT
   apo.DYNAMIC Modify(ls)
END IF
end subroutine

public function long of_totalselectedrows (readonly powerobject apo);//===========================================================================
// Function: of_Totalselectedrows (public )
// Object  : n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly   PowerObject    apo
//---------------------------------------------------------------------------
// Returns: Long
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
long  ll_r, ll_ctr

IF NOT of_IsServicableObject(apo) THEN RETURN -1

DO
   ll_r = apo.DYNAMIC GetSelectedRow(ll_r)
   IF ll_r > 0 THEN ll_ctr ++
LOOP WHILE ll_r > 0

RETURN ll_ctr
end function

public function string of_gettagkeyword (readonly powerobject apo, readonly long al_colid, readonly string as_key);//===========================================================================
// Function: of_Gettagkeyword (public )
// Object: n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  readonly Long al_colid
//  readonly String as_key
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string   lsc

// Get Column Name
lsc = of_GetColumnName( apo, al_colid )

// Check if Valid Colid
IF ISNULL(lsc) THEN RETURN lsc

RETURN of_GetTagKeyword( apo, lsc, as_key )
end function

public function string of_gettagkeyword (readonly powerobject apo, readonly string as_col, readonly string as_key);//===========================================================================
// Function: of_Gettagkeyword (public )
// Object: n_svc_dw
//---------------------------------------------------------------------------
// Description:
// Note:
//---------------------------------------------------------------------------
// Parameters:
//  readonly PowerObject apo
//  readonly String as_col
//  readonly String as_key
//---------------------------------------------------------------------------
// Returns: String
//---------------------------------------------------------------------------
// Author: (Yeyi) Gabriel B. Abulencia
//===========================================================================
string   lst, lsk

IF NOT of_IsServicableObject(apo) THEN RETURN lsk

IF of_IsEmpty(as_key) THEN RETURN lsk

lst = apo.DYNAMIC Describe(as_col + ".Tag")

lsk = gfn.of_GetKeyValue(lst, as_key, ";")

RETURN lsk
end function

on n_svc_dw.create
call super::create
end on

on n_svc_dw.destroy
call super::destroy
end on

