
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/Crop_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width_bits" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {

work_mode:
unsigned.
Description: This module's working mode.

data_width:
unsigned.
Description: Data bit width.

im_width:
unsigned.
Description: Width of image.

im_height:
unsigned.
Description: Height of image.

im_width_bits:
unsigned.
Description: The bits of width of image.

}

  #Adding Page
  set Ports [ipgui::add_page $IPINST -name "Ports"]
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {
clk:
unsigned.
Description: Clock.
Range: None

rst_n:
unsigned.
Description: Reset, active low.
Range: None

top:
unsigned.
Description: Top of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.
Range: im_width_bits - 1 : 0

bottom:
unsigned.
Description: Bottom of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.
Range: im_width_bits - 1 : 0

left:
unsigned.
Description: Left of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.
Range: im_width_bits - 1 : 0

right:
unsigned.
Description: Right of the rang you want to crop.range:Depend on height of image, 0 - im_height-1.
Range: im_width_bits - 1 : 0

in_enable:
unsigned.
Description: Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: data_width - 1 : 0

in_count_x:
unsigned.
Description: Input pixel count for width.
Range: im_width_bits - 1 : 0

in_count_y:
unsigned.
Description: Input pixel count for height.
Range: im_width_bits - 1 : 0

out_ready:
unsigned.
Description: Output data ready, in both two mode, it will be high while the out_data can be read.
Range: None

out_data:
unsigned.
Description: Output data, it will be synchronous with out_ready.
Range: data_width - 1 : 0

out_count_x:
unsigned.
Description: Output pixel count for height.
Range: im_width_bits - 1 : 0

out_count_y:
unsigned.
Description: Output pixel count for height.
Range: im_width_bits - 1 : 0

}

  #Adding Page
  set Help [ipgui::add_page $IPINST -name "Help"]
  ipgui::add_static_text $IPINST -name "Copyright" -parent ${Help} -text {
Homepage for this project:
http://fil.dtysky.moe

Sources for this project:
https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
dtysky@outlook.com

My blog:
http://dtysky.moe

Copyright 2015, Tianyu Dai(dtysky). All Rights Reserved.
This project is free software and released under the GNU Lesser General Public License (LGPL).
}


}

proc update_PARAM_VALUE.im_width_bits { PARAM_VALUE.im_width_bits PARAM_VALUE.im_width PARAM_VALUE.im_height PARAM_VALUE.im_width_bits } {
	# Procedure called to update im_width_bits when any of the dependent parameters in the arguments change
	
	set im_width_bits ${PARAM_VALUE.im_width_bits}
	set im_width ${PARAM_VALUE.im_width}
	set im_height ${PARAM_VALUE.im_height}
	set values(im_width) [get_property value $im_width]
	set values(im_height) [get_property value $im_height]
	set values(im_width_bits) [get_property value $im_width_bits]
	set_property value [gen_USERPARAMETER_im_width_bits_VALUE $values(im_width) $values(im_height) $values(im_width_bits)] $im_width_bits
}

proc validate_PARAM_VALUE.im_width_bits { PARAM_VALUE.im_width_bits } {
	# Procedure called to validate im_width_bits
	return true
}

proc update_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to update data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to validate data_width
	return true
}

proc update_PARAM_VALUE.im_height { PARAM_VALUE.im_height } {
	# Procedure called to update im_height when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_height { PARAM_VALUE.im_height } {
	# Procedure called to validate im_height
	return true
}

proc update_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to update im_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to validate im_width
	return true
}

proc update_PARAM_VALUE.work_mode { PARAM_VALUE.work_mode } {
	# Procedure called to update work_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.work_mode { PARAM_VALUE.work_mode } {
	# Procedure called to validate work_mode
	return true
}


proc update_MODELPARAM_VALUE.work_mode { MODELPARAM_VALUE.work_mode PARAM_VALUE.work_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.work_mode}] ${MODELPARAM_VALUE.work_mode}
}

proc update_MODELPARAM_VALUE.data_width { MODELPARAM_VALUE.data_width PARAM_VALUE.data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width}] ${MODELPARAM_VALUE.data_width}
}

proc update_MODELPARAM_VALUE.im_width { MODELPARAM_VALUE.im_width PARAM_VALUE.im_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width}] ${MODELPARAM_VALUE.im_width}
}

proc update_MODELPARAM_VALUE.im_height { MODELPARAM_VALUE.im_height PARAM_VALUE.im_height } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_height}] ${MODELPARAM_VALUE.im_height}
}

proc update_MODELPARAM_VALUE.im_width_bits { MODELPARAM_VALUE.im_width_bits PARAM_VALUE.im_width_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width_bits}] ${MODELPARAM_VALUE.im_width_bits}
}

