$PBExportHeader$cdwdatatype.sru
$PBExportComments$Datawindow Column Data Type Constants
forward
global type cdwdatatype from nonvisualobject
end type
end forward

global type cdwdatatype from nonvisualobject
end type
global cdwdatatype cdwdatatype

type variables
//data types
CONSTANT string CHAR = "char"
CONSTANT string DATE = "date"
CONSTANT string DATETIME = "datetime"
CONSTANT string DECIMAL = "decimal"
CONSTANT string INT = "int"
CONSTANT string LONG = "long"
CONSTANT string NUMBER = "number"
CONSTANT string REAL = "real"
CONSTANT string TIME = "time"
CONSTANT string TIMESTAMP = "timestamp"
CONSTANT string ULONG = "ulong"
end variables

on cdwdatatype.create
call super::create
TriggerEvent( this, "constructor" )
end on

on cdwdatatype.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

