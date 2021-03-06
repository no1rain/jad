$PBExportHeader$n_svc_pb.sru
$PBExportComments$Powerbuilder Function Check
forward
global type n_svc_pb from n_svc_base
end type
end forward

global type n_svc_pb from n_svc_base autoinstantiate
end type

forward prototypes
public function scriptdefinition of_findmatchingevent (classdefinition acd_object, string as_eventname)
public function variabledefinition of_findmatchingvariable (classdefinition acd_object, string as_varname)
public function variabledefinition of_findmatchingvariable (scriptdefinition ascrd_object, string as_varname)
public function integer of_getancestorclasses (classdefinition acd_sourceclass, ref classdefinition acd_ancestorclass[])
public function integer of_getancestorclasses (string as_sourceclass, ref classdefinition acd_ancestorclass[])
public function window of_getparentwindow (readonly powerobject apo, readonly boolean ab_immediate)
public function long of_getwindowobjects (powerobject apo, ref windowobject awo[])
public function boolean of_hasevent (readonly powerobject apo, readonly string as_eventname)
public function boolean of_hasevent (readonly powerobject apo, readonly string as_eventname, readonly string as_args[])
public function boolean of_hasfunction (readonly powerobject apo, readonly string as_functionname)
public function boolean of_hasfunction (readonly powerobject apo, readonly string as_functionname, readonly string as_args[])
public function boolean of_isancestorclass (classdefinition acd_source, string as_ancestorclass)
public function boolean of_isancestorclass (string as_sourceclass, string as_ancestorclass)
public function boolean of_isdescendant (readonly string ancestor, readonly string cls)
public function boolean of_isdescendant (string as_ancestor, readonly classdefinition acd)
public function boolean of_iseventdefined (classdefinition acd_source, string as_eventname)
public function boolean of_iseventdefined (string as_classname, string as_eventname)
public function boolean of_iseventimplemented (classdefinition acd_source, string as_eventname)
public function boolean of_iseventimplemented (string as_classname, string as_eventname)
public function boolean of_isfcobject (readonly powerobject apo)
public function boolean of_isfunctiondefined (classdefinition acd_source, string as_functionname, string as_argtype[])
public function boolean of_isfunctiondefined (string as_classname, string as_functionname, string as_argtype[])
public function boolean of_isvalidclass (readonly string as_classname)
public subroutine of_pixelstounits (ref long al_x, ref long al_y)
public subroutine of_unitstopixels (ref long al_x, ref long al_y)
end prototypes

public function scriptdefinition of_findmatchingevent (classdefinition acd_object, string as_eventname);//===========================================================================
// Function: of_findMatchingEvent
// Access  : public
//---------------------------------------------------------------------------
// Description:
// Returns the scriptdefinition for a given eventname and classdefinition
//---------------------------------------------------------------------------
// Parameters:
// acd_object      classdefinition reference to find event for
// as_eventname    event name to find on class definition
//---------------------------------------------------------------------------
// Return: scriptdefinition
// NULL scriptdefinition will be returned if acd_object is not valid or if as_eventname
// could not be found.
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean           lb_found
int               li_scripts
int               li_cnt = 1
scriptdefinition  lscrd_object
scriptdefinition  lscrd_list[]

setnull (lscrd_object)

// Check class definition
IF NOT IsValid (acd_object) OR IsNull (acd_object) THEN
   RETURN lscrd_object
END IF

// Find event definition
lscrd_list[] = acd_object.scriptList[]
li_scripts = UpperBound (lscrd_list[])
DO WHILE li_cnt <= li_scripts AND NOT lb_found
   IF acd_object.scriptlist[li_cnt].name = as_eventname AND acd_object.scriptlist[li_cnt].kind = scriptevent! THEN
      lb_found = TRUE
   ELSE
      li_cnt ++
   END IF
LOOP

IF lb_found THEN
   lscrd_object = acd_object.scriptlist[li_cnt]
END IF
RETURN lscrd_object
end function

public function variabledefinition of_findmatchingvariable (classdefinition acd_object, string as_varname);//===========================================================================
// Function: of_findMatchingVariable
// Access  : public
//---------------------------------------------------------------------------
// Description:
// Finds a variabledefinition reference for the passed in variable name and classdefinition
//---------------------------------------------------------------------------
// Parameters:
// acd_object    classdefinition reference for variables that are to be found
// as_varname    variable name to find definition for
//---------------------------------------------------------------------------
// Return: variabledefinition
// If varname is not found on classdefinition or classdefinition is invalid, returns NULL
//
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean              lb_found
int                  li_variables
int                  li_cnt = 1
variabledefinition   lvrd_object
variabledefinition   lvrd_list[]

setnull (lvrd_object)

// Verify class definition
IF NOT IsValid (acd_object) OR isnull(acd_object) THEN
   RETURN lvrd_object
END IF

// Find matching variable
lvrd_list[] = acd_object.variablelist[]
li_variables = UpperBound (lvrd_list)
DO WHILE li_cnt <= li_variables AND NOT lb_found
   if acd_object.variablelist[li_cnt].name = as_varname THEN
      lb_found = TRUE
   ELSE
      li_cnt++
   END IF
LOOP
RETURN acd_object.variablelist[li_cnt]
end function

public function variabledefinition of_findmatchingvariable (scriptdefinition ascrd_object, string as_varname);//===========================================================================
// Function: of_findMatchingVariable
// Access  : public
//---------------------------------------------------------------------------
// Description:
// Finds a variabledefinition reference for the passed in variable name and classdefinition
//---------------------------------------------------------------------------
// Parameters:
// ascrd_object  scriptdefinition reference for variables that are to be found
// as_varname    variable name to find definition for
//---------------------------------------------------------------------------
// Return: variabledefinition
// If varname is not found on classdefinition or classdefinition is invalid, returns NULL
//
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean              lb_found
int                  li_variables
int                  li_cnt = 1
variabledefinition   lvrd_object
variabledefinition   lvrd_local[]
variabledefinition   lvrd_arg[]

setnull(lvrd_object)

// Verify script definition
IF NOT IsValid (ascrd_object) OR IsNull (ascrd_object) THEN
   RETURN lvrd_object
END IF

// Check for matching variable in arguments
lvrd_arg[] = ascrd_object.argumentList[]
li_variables = UpperBound (lvrd_arg[])
DO WHILE li_cnt <= li_variables AND NOT lb_found
   IF ascrd_object.argumentList[li_cnt].name = as_varname THEN
      lb_found = TRUE
   ELSE
      li_cnt ++
   END IF
LOOP
IF lb_found THEN
   RETURN ascrd_object.argumentList[li_cnt]
ELSE
   li_cnt = 1
END IF

// Check for matching variable in local variables
lvrd_local[] = ascrd_object.localVariableList[]
li_variables = UpperBound (lvrd_local[])
DO WHILE li_cnt <= li_variables AND NOT lb_found
   IF ascrd_object.localVariableList[li_cnt].name = as_varname THEN
      lb_found = TRUE
   ELSE
      li_cnt ++
   END IF
LOOP
IF lb_found THEN
   lvrd_object = ascrd_object.localVariableList[li_cnt]
END IF
RETURN lvrd_object
end function

public function integer of_getancestorclasses (classdefinition acd_sourceclass, ref classdefinition acd_ancestorclass[]);//===========================================================================
// Function: of_getAncestorClasses
// Access  : public
//---------------------------------------------------------------------------
// Description:
// Gets all ancestor classdefinitions of a given classdefinition.
// Classes are returned in ascending order (subclass to ancestor class)
//---------------------------------------------------------------------------
// Parameters:
// acd_sourceclass      classdefinition to get ancestor classes for
// acd_ancestorclass[]  ancestor classesdefinitions by reference
//---------------------------------------------------------------------------
// Return: integer
// Returns the number of ancestor classes
// Returns -1 if there is an error
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
int               li_cnt = 1
classdefinition   lcd_test
classdefinition   lcd_temp[]

// Check source classdefinition
IF NOT IsValid(acd_sourceclass) OR isnull(acd_sourceclass) THEN
   RETURN -1
END IF

// Clear the reference array
acd_ancestorclass[] = lcd_temp[]

// Get ancestor classes
lcd_test = acd_sourceclass.ancestor
DO WHILE IsValid(lcd_test)
   acd_ancestorclass[li_cnt] = lcd_test
   li_cnt++
   lcd_test = lcd_test.ancestor
LOOP
RETURN UpperBound (acd_ancestorclass[])
end function

public function integer of_getancestorclasses (string as_sourceclass, ref classdefinition acd_ancestorclass[]);//===========================================================================
// Function: of_getAncestorClasses
// Access  : public
//---------------------------------------------------------------------------
// Description:
// Gets all ancestor classdefinitions of a given classdefinition.
// Classes are returned in ascending order (subclass to ancestor class)
//---------------------------------------------------------------------------
// Parameters:
// as_sourceclass       classname to get ancestor classes for
// acd_ancestorclass[]  ancestor classesdefinitions by reference
//---------------------------------------------------------------------------
// Return: integer
// Returns the number of ancestor classes
// Returns -1 if there is an error
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
ClassDefinition   lcd_object

// Find sourceclass
lcd_object = findClassDefinition(as_sourceclass)

RETURN of_getAncestorClasses(lcd_object, acd_ancestorclass[])
end function

public function window of_getparentwindow (readonly powerobject apo, readonly boolean ab_immediate);window      w
powerobject lpo

lpo = apo.GetParent()

DO
   IF IsValid(lpo) THEN
      IF lpo.TypeOf() = window! THEN
         w = lpo
         IF IsValid(w.ParentWindow()) AND NOT ab_immediate THEN
            lpo = w.ParentWindow()
         ELSE
            RETURN w
         END IF
      ELSE
         lpo = lpo.GetParent()
      END IF
   ELSE
      EXIT
   END IF
LOOP WHILE TRUE
end function

public function long of_getwindowobjects (powerobject apo, ref windowobject awo[]);windowobject   lwo[]
window         lw_base
userobject     lu_base

try
   // check if supported parent object
   IF of_isdescendant(CFbase.WindowMain, apo.ClassDefinition) THEN
      // cast
      lw_base = apo
      lwo = lw_base.Control
   ELSEIF of_isdescendant(CFbase.UOContainer, apo.ClassDefinition) THEN
      // cast
      lu_base = apo
      lwo = lu_base.Control
   END IF
catch (RunTimeError rte)
   // an exception occurred
end try

awo = lwo

RETURN UpperBound(awo)
end function

public function boolean of_hasevent (readonly powerobject apo, readonly string as_eventname);string   ls_args[]

RETURN of_hasevent(apo, as_eventname, ls_args)
end function

public function boolean of_hasevent (readonly powerobject apo, readonly string as_eventname, readonly string as_args[]);long     n, m, ll_count, ll_argcount
ClassDefinition   lcd
ScriptDefinition  lsd

IF NOT ISVALID(apo) THEN RETURN FALSE

lcd = apo.ClassDefinition
lsd = lcd.FindMatchingFunction(as_eventname, as_args)

IF ISNULL(lsd) THEN
   // search
   ll_count = UpperBound(lcd.scriptlist)
   FOR n = 1 to ll_count
      IF lcd.scriptlist[n].Name = as_eventname THEN
         IF UpperBound(as_args) = 0 &
            AND UpperBound(lcd.scriptlist[n].ArgumentList) = 0 THEN
            lsd = lcd.scriptlist[n]
            EXIT
         // does the arg count match?
         ELSEIF UpperBound(as_args) <> UpperBound(lcd.scriptlist[n].ArgumentList)THEN
            CONTINUE
         ELSE
            // check args one by one
            ll_argcount = UpperBound(as_args)
            FOR m = 1 to ll_argcount
               IF as_args[m] <> lcd.scriptlist[n].ArgumentList[m].TypeInfo.DataTypeOf THEN
                  EXIT
               ELSE
                  IF m = ll_argcount THEN RETURN TRUE
               END IF
            NEXT
         END IF
      END IF
   NEXT
END IF

// still null
IF ISNULL(lsd) THEN RETURN FALSE

RETURN lsd.kind = ScriptEvent!
end function

public function boolean of_hasfunction (readonly powerobject apo, readonly string as_functionname);string   ls_args[]

RETURN of_hasfunction(apo, as_functionname, ls_args)
end function

public function boolean of_hasfunction (readonly powerobject apo, readonly string as_functionname, readonly string as_args[]);long     n, ll_count
ClassDefinition   lcd
ScriptDefinition  lsd

IF NOT ISVALID(apo) THEN RETURN FALSE

lcd = apo.ClassDefinition
lsd = lcd.FindMatchingFunction(as_functionname, as_args)

IF ISNULL(lsd) THEN
   // search
   ll_count = UpperBound(lcd.scriptlist)
   FOR n = 1 to ll_count
      IF lcd.scriptlist[n].Name = as_functionname THEN
         IF UpperBound(as_args) = 0 THEN
            lsd = lcd.scriptlist[n]
            EXIT
         ELSE
            // check for args
         END IF
      END IF
   NEXT
END IF

// still null
IF ISNULL(lsd) THEN RETURN FALSE

RETURN lsd.kind = ScriptFunction!
end function

public function boolean of_isancestorclass (classdefinition acd_source, string as_ancestorclass);//===========================================================================
// Function: of_IsAncestorClass
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if as_ancestorclass is an ancestor class of acd_source
// Note:
//---------------------------------------------------------------------------
// Parameters:
// acd_source        source classdefinition
// as_ancestorclass  ancestor classname
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = is ancestor
// FALSE = is not ancestor
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean           lb_ancestor
classdefinition   lcd_ancestor
classdefinition   lcd_test

// Validate classnames
IF NOT IsValid (acd_source) OR isnull(acd_source) THEN
   RETURN lb_ancestor
END IF

lcd_ancestor = FindClassDefinition (as_ancestorclass)
IF NOT IsValid(lcd_ancestor) OR isnull(lcd_ancestor) THEN
   RETURN lb_ancestor
END IF

// Check if there is an ancestor relationship
lcd_test = acd_source.ancestor

DO WHILE IsValid (lcd_test) AND NOT lb_ancestor
   IF lcd_test.name = lcd_ancestor.name THEN
      lb_ancestor = TRUE
   ELSE
      lcd_test = lcd_test.ancestor
   END IF
LOOP
RETURN lb_ancestor
end function

public function boolean of_isancestorclass (string as_sourceclass, string as_ancestorclass);//===========================================================================
// Function: of_IsAncestorClass
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if as_ancestorclass is an ancestor class of acd_source
// Note:
//---------------------------------------------------------------------------
// Parameters:
// as_sourceclass    source classname
// as_ancestorclass  ancestor classname
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = is ancestor
// FALSE = is not ancestor
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean           lb_ancestor
ClassDefinition   lcd_object

// Validate source classname
lcd_object = FindClassDefinition(as_sourceclass)

RETURN of_IsAncestorClass(lcd_object, as_ancestorclass)
end function

public function boolean of_isdescendant (readonly string ancestor, readonly string cls);boolean  lb_ancestor, lb_ret
ClassDefinition   lcd_object

try
   IF NOT of_isvalidclass(cls) THEN RETURN FALSE
   lcd_object = FindClassDefinition(lower(cls))
   IF NOT IsValid(lcd_object) THEN RETURN FALSE
   lb_ret = of_isdescendant(ancestor, lcd_object)
catch (runtimeerror err)
   lb_ret = FALSE
end try
RETURN lb_ret
end function

public function boolean of_isdescendant (string as_ancestor, readonly classdefinition acd);boolean  lb_ancestor, lb_ret
ClassDefinition   lcd_object

IF NOT IsValid(acd) THEN RETURN FALSE

as_ancestor = lower(as_ancestor)
IF as_ancestor = acd.name THEN RETURN TRUE

try
   lcd_object = acd.ancestor
   DO
      IF isnull(lcd_object) THEN RETURN FALSE
      IF lcd_object.name =  as_ancestor THEN
         lb_ret = TRUE
         EXIT
      ELSE
         lcd_object = lcd_object.ancestor
      END IF
   LOOP WHILE 1 = 1
catch (runtimeerror err)
   lb_ret = FALSE
end try

RETURN lb_ret
end function

public function boolean of_iseventdefined (classdefinition acd_source, string as_eventname);//===========================================================================
// Function: of_IsEventDefined
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if a event is defined for a class
// Note:
//---------------------------------------------------------------------------
// Parameters:
// acd_source      classdefinition to check if event is defined for
// as_eventname    event name to check if it is defined for acd_source
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = event is defined for class
// FALSE = event is not defined for class
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean           lb_found
int               li_scripts
int               li_cnt = 1
scriptdefinition  lscrd_object

// Check class definition
IF NOT IsValid(acd_source) OR isnull(acd_source) THEN
   RETURN lb_found
END IF

// Find event definition
li_scripts = UpperBound (acd_source.scriptlist)
DO WHILE li_cnt <= li_scripts AND NOT lb_found
   IF acd_source.scriptlist[li_cnt].name = as_eventname AND acd_source.scriptlist[li_cnt].kind = scriptevent! THEN
      lb_found = TRUE
   ELSE
      li_cnt++
   END IF
LOOP
RETURN lb_found
end function

public function boolean of_iseventdefined (string as_classname, string as_eventname);//===========================================================================
// Function: of_IsEventDefined
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if a event is defined for a class
// Note:
//---------------------------------------------------------------------------
// Parameters:
// as_classname    classname to check if event is defined for
// as_eventname    event name to check if it is defined for acd_source
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = event is defined for class
// FALSE = event is not defined for class
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
classdefinition   lcd_object

// Find class definition
lcd_object = FindClassDefinition(as_classname)

RETURN of_IsEventDefined(lcd_object, as_eventname)
end function

public function boolean of_iseventimplemented (classdefinition acd_source, string as_eventname);//===========================================================================
// Function: of_IsEventImplemented
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if a event is implemented (defined and scripted) for a class
// Note:
//---------------------------------------------------------------------------
// Parameters:
// acd_source        classdefinition to check if event is implemented for
// as_eventname      event name to check if it is implemented on acd_source
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = event is implemented for class
// FALSE = event is not implemented for class
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean           lb_found
boolean           lb_implemented
int               li_scripts
int               li_cnt = 1
scriptdefinition  lscrd_object

// Check class definition
IF NOT IsValid(acd_source) OR isnull(acd_source) THEN
   RETURN lb_found
END IF

// Find event definition
li_scripts = UpperBound (acd_source.scriptlist)

DO WHILE li_cnt <= li_scripts AND NOT lb_found
   IF acd_source.scriptlist[li_cnt].name = as_eventname AND acd_source.scriptlist[li_cnt].kind = scriptevent! THEN
      lb_found = TRUE
   ELSE
      li_cnt++
   END IF
LOOP

// Check if event is scripted
IF lb_found THEN
   lb_implemented = acd_source.scriptlist[li_cnt].isScripted
END IF
RETURN lb_implemented
end function

public function boolean of_iseventimplemented (string as_classname, string as_eventname);//===========================================================================
// Function: of_IsEventImplemented
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if a event is implemented (defined and scripted) for a class
// Note:
//---------------------------------------------------------------------------
// Parameters:
// as_classname      classname to check if event is implemented for
// as_eventname      event name to check if it is implemented on acd_source
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = event is implemented for class
// FALSE = event is not implemented for class
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
classdefinition   lcd_object

// Find class definition
lcd_object = FindClassDefinition(as_classname)

RETURN of_IsEventImplemented(lcd_object, as_eventname)
end function

public function boolean of_isfcobject (readonly powerobject apo);boolean  lb
string   lsc

IF isnull(apo) THEN RETURN FALSE

choose case apo.TypeOf()
   case CheckBox!
      lsc = Cfbase.CheckBox
   case CommandButton!
      lsc = Cfbase.CommandButton
   case DropDownListBox!
      lsc = Cfbase.DropdownListBox
   case DropDownPictureListBox!
      lsc = Cfbase.DropdownPictureListBox
   case Datawindow!
      lsc = Cfbase.Datawindow
   case Datastore!
      lsc = Cfbase.Datastore
   case EditMask!
      lsc = Cfbase.EditMask
   case Graph!
      lsc = Cfbase.Graph
   case GroupBox!
      lsc = Cfbase.GroupBox
   case HProgressBar!
      lsc = Cfbase.HorizontalProgressBar
   case HScrollbar!
      lsc = Cfbase.HorizontalScrollBar
   case HTrackbar!
      lsc = Cfbase.HorizontalTrackBar
   case ListBox!
      lsc = Cfbase.ListBox
   case Listview!
      lsc = Cfbase.Listview
   case MultiLineEdit!
      lsc = Cfbase.MultiLineEdit
   case Picture!
      lsc = Cfbase.Picture
   case PictureListBox!
      lsc = Cfbase.PictureListbox
   case PictureHyperLink!
      lsc = Cfbase.PictureHyperlink
   case RadioButton!
      lsc = Cfbase.RadioButton
   case RichTextEdit!
      lsc = Cfbase.RichTextEdit
   case SingleLineEdit!
      lsc = Cfbase.SingleLineEdit
   case StaticHyperLink!
      lsc = Cfbase.StaticHyperLink
   case StaticText!
      lsc = Cfbase.StaticText
   case Tab!
      lsc = Cfbase.Tab
   case Treeview!
      lsc = Cfbase.Treeview
   case UserObject!
      lsc = Cfbase.Userobject
   case VScrollBar!
      lsc = Cfbase.VerticalScrollBar
   case VProgressBar!
      lsc = Cfbase.VerticalProgressBar
   case VTrackBar!
      lsc = Cfbase.VerticalTrackBar
   case Window!
      lsc = Cfbase.WindowBase
   case else
      RETURN FALSE
end choose

try
   lb = of_isdescendant(lsc, apo.ClassDefinition)
catch (runtimeerror err)
   lb = FALSE
end try

RETURN lb
end function

public function boolean of_isfunctiondefined (classdefinition acd_source, string as_functionname, string as_argtype[]);//===========================================================================
// Function: of_IsFunctionDefined
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if a function is defined for a class
// Note:
//---------------------------------------------------------------------------
// Parameters:
// acd_source        classdefinition to check if function is defined for
// as_functionname   function name to check if it is defined on acd_source
// as_argtype[]      array of argument data types that are signature of as_functionname
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = function is defined for class
// FALSE = function is not defined for class
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
boolean  lb_found
scriptdefinition  lscrd_object

// Check class definition (Null)
IF NOT IsValid(acd_source) OR isnull(acd_source) THEN
   RETURN lb_found
END IF

// Find method definition
lscrd_object = acd_source.FindMatchingFunction(as_functionname, as_argtype[])
IF IsValid (lscrd_object) THEN
   lb_found = TRUE
END IF
RETURN lb_found
end function

public function boolean of_isfunctiondefined (string as_classname, string as_functionname, string as_argtype[]);//===========================================================================
// Function: of_IsFunctionDefined
// Access  : public
//---------------------------------------------------------------------------
// Description: Determines if a function is defined for a class
// Note:
//---------------------------------------------------------------------------
// Parameters:
// as_classname      classname to check if function is defined for
// as_functionname   function name to check if it is defined on acd_source
// as_argtype[]      array of argument data types that are signature of as_functionname
//---------------------------------------------------------------------------
// Return: boolean
// TRUE  = function is defined for class
// FALSE = function is not defined for class
//---------------------------------------------------------------------------
// Author: PowerBuilder
//===========================================================================
ClassDefinition   lcd_object

// Find class definition
lcd_object = FindClassDefinition(as_classname)

RETURN of_IsFunctionDefined(lcd_object, as_functionname, as_argtype[])
end function

public function boolean of_isvalidclass (readonly string as_classname);classdefinition   lcd_object

lcd_object = FindClassDefinition(lower(as_classname))

RETURN NOT isnull(lcd_object)
end function

public subroutine of_pixelstounits (ref long al_x, ref long al_y);al_x = PixelsToUnits(al_x, XPixelsToUnits!)
al_y = PixelsToUnits(al_y, YPixelsToUnits!)
end subroutine

public subroutine of_unitstopixels (ref long al_x, ref long al_y);al_x = UnitsToPixels(al_x, XUnitsToPixels!)
al_y = UnitsToPixels(al_y, YUnitsToPixels!)
end subroutine

on n_svc_pb.create
call super::create
end on

on n_svc_pb.destroy
call super::destroy
end on

