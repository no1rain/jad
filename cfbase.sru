$PBExportHeader$cfbase.sru
$PBExportComments$Framework Base Object Constants
forward
global type cfbase from nonvisualobject
end type
end forward

global type cfbase from nonvisualobject
end type
global cfbase cfbase

type variables
//Base Objects
CONSTANT string DataStore = "n_ds"
CONSTANT string Transaction = "n_tr"
CONSTANT string UserObject = "u_base"
CONSTANT string CommandButton = "u_cb"
CONSTANT string CheckBox = "u_cbx"
CONSTANT string DropDownListBox = "u_ddlb"
CONSTANT string DropDownPictureListBox = "u_ddplb"
CONSTANT string Datawindow = "u_dw"
CONSTANT string DatawindowForm = "u_dw_form"
CONSTANT string EditMask = "u_em"
CONSTANT string Graph = "u_gr"
CONSTANT string GroupBox = "u_gb"
CONSTANT string HorizontalProgressBar = "u_hpb"
CONSTANT string HorizontalScrollBar = "u_hsb"
CONSTANT string HorizontalTrackBar = "u_htb"
CONSTANT string ListBox = "u_lb"
CONSTANT string Icon = "u_icon"
CONSTANT string Listview = "u_lv"
CONSTANT string MultiLineEdit = "u_mle"
CONSTANT string Picture = "u_p"
CONSTANT string PictureButton = "u_pb"
CONSTANT string PictureHyperlink = "u_phl"
CONSTANT string PictureListbox = "u_plb"
CONSTANT string RadioButton = "u_rb"
CONSTANT string Rebar = "u_rebar"
CONSTANT string RichTextEdit = "u_rte"
CONSTANT string StaticHyperLink = "u_shl"
CONSTANT string SingleLineEdit = "u_sle"
CONSTANT string StaticText = "u_st"
CONSTANT string Tab = "u_tab"
CONSTANT string Tabpage = "u_tabpage"
CONSTANT string Toolbar = "u_toolbar"
CONSTANT string Treeview = "u_tv"
CONSTANT string UOContainer = "u_container"
CONSTANT string VerticalProgressBar = "u_vpb"
CONSTANT string VerticalScrollBar = "u_vsb"
CONSTANT string VerticalTrackBar = "u_vtb"
CONSTANT string WindowBase = "w_base"
CONSTANT string WindowMain = "w_main"
end variables
on cfbase.create
call super::create
TriggerEvent( this, "constructor" )
end on

on cfbase.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

