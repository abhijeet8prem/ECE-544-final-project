# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DOWN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LEFT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUMBER_OF_CHANNELS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RIGHT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "UP" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DOWN { PARAM_VALUE.DOWN } {
	# Procedure called to update DOWN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DOWN { PARAM_VALUE.DOWN } {
	# Procedure called to validate DOWN
	return true
}

proc update_PARAM_VALUE.LEFT { PARAM_VALUE.LEFT } {
	# Procedure called to update LEFT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LEFT { PARAM_VALUE.LEFT } {
	# Procedure called to validate LEFT
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_CHANNELS { PARAM_VALUE.NUMBER_OF_CHANNELS } {
	# Procedure called to update NUMBER_OF_CHANNELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_CHANNELS { PARAM_VALUE.NUMBER_OF_CHANNELS } {
	# Procedure called to validate NUMBER_OF_CHANNELS
	return true
}

proc update_PARAM_VALUE.RIGHT { PARAM_VALUE.RIGHT } {
	# Procedure called to update RIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RIGHT { PARAM_VALUE.RIGHT } {
	# Procedure called to validate RIGHT
	return true
}

proc update_PARAM_VALUE.UP { PARAM_VALUE.UP } {
	# Procedure called to update UP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.UP { PARAM_VALUE.UP } {
	# Procedure called to validate UP
	return true
}


proc update_MODELPARAM_VALUE.UP { MODELPARAM_VALUE.UP PARAM_VALUE.UP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.UP}] ${MODELPARAM_VALUE.UP}
}

proc update_MODELPARAM_VALUE.DOWN { MODELPARAM_VALUE.DOWN PARAM_VALUE.DOWN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DOWN}] ${MODELPARAM_VALUE.DOWN}
}

proc update_MODELPARAM_VALUE.LEFT { MODELPARAM_VALUE.LEFT PARAM_VALUE.LEFT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LEFT}] ${MODELPARAM_VALUE.LEFT}
}

proc update_MODELPARAM_VALUE.RIGHT { MODELPARAM_VALUE.RIGHT PARAM_VALUE.RIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RIGHT}] ${MODELPARAM_VALUE.RIGHT}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_CHANNELS { MODELPARAM_VALUE.NUMBER_OF_CHANNELS PARAM_VALUE.NUMBER_OF_CHANNELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_CHANNELS}] ${MODELPARAM_VALUE.NUMBER_OF_CHANNELS}
}

