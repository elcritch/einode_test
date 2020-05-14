
NIMBLE := _nimble
NIMLIB := $(shell nim dump file.json 2>&1 | tail -n1)
NIMCACHE := $(shell basename `pwd`)
ARDUINO_BOARD := esp32:esp32:wesp32
ARDUINO_LINKAGE := arduinoCppLinkage
# Unsure about this, since we compiled it ourself maybe it's not important
NIM_CPU := arm
NIM_PROGRAM := einode_test.nim

all: nim
	arduino-cli compile --build-properties compiler.cpp.extra_flags="-fpermissive "  --fqbn $(ARDUINO_BOARD) -v $(PWD)/$(NIMCACHE)/

# --debugger:native \
		# --embedsrc:on \
		# -d:nimOldCaseObjects \
		# --assertions:on \
		# --define:standaloneHeapSize=92160 \

nim: 
	echo "NIMCACHE: " $(NIMCACHE)
	nim cpp \
		--cpu:$(NIM_CPU) \
		-d:debug \
		-d:PageSize=256 \
		-d:cpu16 \
		--os:any \
		-d:use_malloc \
		--gc:arc \
		--debugger:native \
		--exceptions:goto \
		--no_main \
		--dead_code_elim:on \
		--threads:off \
		--tls_emulation:off \
		--verbosity:3 \
		--multimethods:on \
		-d:spryMathNoRandom \
		--stackTrace:on \
		--lineTrace:on \
		-d:no_signal_handler \
		-d:$(ARDUINO_LINKAGE) \
		--nim_cache:"$(PWD)/$(NIMCACHE)" \
		--nimble_path:"$(NIMBLE)/pkgs" \
		--compile_only \
		--gen_script \
		$(NIM_PROGRAM)

	# @echo ls $(NIMCACHE)/*.cpp 
	cp -v $(NIMLIB)/nimbase.h  $(PWD)/$(NIMCACHE)/nimbase.h
	ln -sfv ../$(NIM_PROGRAM) $(PWD)/$(NIMCACHE)/$(NIM_PROGRAM)
	ln -sfv ../$(NIM_PROGRAM:.nim=.ino) $(PWD)/$(NIMCACHE)/$(NIM_PROGRAM:.nim=.ino)
	ls $(NIMCACHE)/*.cpp | sed 's/.cpp/.h/' | cat -
	ls $(NIMCACHE)/*.cpp | sed 's/.cpp/.h/' | xargs -I%% touch %%
	# ls $(NIMCACHE)/*.cpp | xargs -I%% ln -sf %% ./

upload:
	arduino-cli upload --fqbn $(ARDUINO_BOARD) -p $(device) $(PWD)/$(NIMCACHE)/

upload:
	arduino-cli upload --fqbn $(ARDUINO_BOARD) -p $(device) $(PWD)/$(NIMCACHE)/

clean:
	rm -Rf $(NIMCACHE)
	rm -f *.bin *.elf
	rm -f *.cpp *.h

distclean: clean
	arduino-cli cache clean
	rm -Rf _nimble 

deps:
	nimble install -y --nimbleDir:"_nimble" https://github.com/elcritch/einode.git
	rm -Rf $(NIMBLE)/bin/temp_file $(NIMBLE)/bin/tempfile_seeder

