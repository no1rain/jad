$PBExportHeader$cdwband.sru
$PBExportComments$Datawindow band Constants
forward
global type cdwband from nonvisualobject
end type
end forward

global type cdwband from nonvisualobject
end type
global cdwband cdwband

type variables
//data types
CONSTANT string HEADER = "header"
CONSTANT string FOOTER = "footer"
CONSTANT string DETAIL = "detail"
CONSTANT string SuMMARY = "summary"
end variables

on cdwband.create
call super::create
TriggerEvent( this, "constructor" )
end on

on cdwband.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

