RNDR = rndr
SHDR = sdrc
VIEW = eog

SHDR_SRC= matte.sl spotlight.sl bubbly.sl bake_areas.sl ptocclude.sl
SHDR_OBJ=${SHDR_SRC:.sl=.sdr}

%.sdr: %.sl
	@${SHDR} $<
 
all: bake final notify

bake: ${SHDR_OBJ}
	@echo "    RNDR  $@.rib"
	@${RNDR} $@.rib

final: ${SHDR_OBJ}
	@echo "    RNDR  $@.rib"
	@${RNDR} $@.rib

display:
	@echo " DISPLAY"
	@${VIEW} *.tiff

notify:
	@echo "Render Complete"
	@notify-send "Render Complete"
	
clean:
	@echo " CLEAN"
	@${RM} ${SHDR_OBJ} 
