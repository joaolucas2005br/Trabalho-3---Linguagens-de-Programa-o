GHC = ghc
BUILD = build
SRC_DIR = src
TARGET = Trabalho3

all:
	mkdir -p $(BUILD)
	$(GHC) -i$(SRC_DIR) \
		$(SRC_DIR)/main.hs \
		-outputdir $(BUILD) \
		-o $(TARGET)

run: all
	clear
	./$(TARGET)

clean:
	rm -rf $(BUILD)
	rm -f $(TARGET)

.PHONY: all run clean