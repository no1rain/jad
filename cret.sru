$PBExportHeader$cret.sru
$PBExportComments$Return Value Constants
forward
global type cret from nonvisualobject
end type
end forward

global type cret from nonvisualobject
end type
global cret cret

type variables
//return values
//CONSTANT int SUCCESS = 1
//CONSTANT int FAILURE = -1
//CONSTANT int NO_ACTION = 0

//linkage values
CONSTANT int PREVENT_ACTION = 2
CONSTANT int CONTINUE_ACTION = 0
end variables

on cret.create
call super::create
TriggerEvent( this, "constructor" )
end on

on cret.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

