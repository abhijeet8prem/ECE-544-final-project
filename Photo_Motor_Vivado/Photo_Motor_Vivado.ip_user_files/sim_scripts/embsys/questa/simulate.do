onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib embsys_opt

do {wave.do}

view wave
view structure
view signals

do {embsys.udo}

run -all

quit -force
