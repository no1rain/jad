$PBExportHeader$cstring.sru
$PBExportComments$String Constants
forward
global type cstring from nonvisualobject
end type
end forward

global type cstring from nonvisualobject
end type
global cstring cstring

type variables
Public:

CONSTANT string EMPTY = ""
CONSTANT string TAB = "~t"
CONSTANT string CR = "~r"
CONSTANT string NL = "~n"
CONSTANT string SUFFIX = "_t"
CONSTANT string CR_NL = CR + NL
CONSTANT string NEWLINE = CR + NL
CONSTANT string SPACE = " "
CONSTANT string SLASH = "/"
CONSTANT string BACKSLASH = "\"
CONSTANT string DATEFORMAT = "####-##-##"
CONSTANT string MINUS = "-"

CONSTANT string SORT = "_sort"
CONSTANT string YES = "yes"
CONSTANT string NO = "no"
CONSTANT string ONE = "1"
CONSTANT string OFF = "0"
CONSTANT string TAG_SEPARATOR = ";"
CONSTANT string ARGUMENTS = "DataWindow.Table.Arguments"
CONSTANT string BANDS = "Datawindow.Bands"
CONSTANT string COLUMN_COUNT = "Datawindow.Column.Count"
CONSTANT string OBJECTS = "DataWindow.Objects"
CONSTANT string PROCESSING = "Datawindow.Processing"
CONSTANT string READ_ONLY = "Datawindow.ReadOnly"
CONSTANT string SORTS = "Datawindow.Table.Sort"
CONSTANT string UPDATETABLE = "DataWindow.Table.UpdateTable"
end variables
on cstring.create
call super::create
TriggerEvent( this, "constructor" )
end on

on cstring.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

