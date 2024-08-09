target = ws28xx

#pin definitions
pin_def = icepindef.pcf
device = up5k
pack = sg48

#serial upload to target
upload: $(target).bin
	iceprog $<

#convert icestorm ascii bitstream to binary
all: $(target).asc
	icepack $< $(target).bin

#place and route
$(target).asc: $(pin_def) $(target).json
	nextpnr-ice40				\
		--top $(target)			\
		--up5k				\
		--json $(filter-out $<,$^)	\
		--asc $@			\
		--pcf $<			\
		--package $(pack)

#--freq $(freq)			\

#synthesize vcode to json file
$(target).json: $(target).v
	yosys -p 'synth_ice40 -json $@' $<

cleanall:
	rm *.asc *.json *.bin

clean:
	rm *.asc *.json

.PHONY: upload all clean cleanall
