CV_NAME = cv
BUILD_DIR = build
PREVIEW_DIR = $(BUILD_DIR)/preview

all: pdf

pdf: $(BUILD_DIR)/$(CV_NAME).pdf

$(BUILD_DIR)/$(CV_NAME).pdf: $(CV_NAME).tex
	@mkdir -p $(BUILD_DIR)
	lualatex --output-directory=$(BUILD_DIR) --interaction=nonstopmode $(CV_NAME).tex
	lualatex --output-directory=$(BUILD_DIR) --interaction=nonstopmode $(CV_NAME).tex
	@echo "==> PDF generado exitosamente en $(BUILD_DIR)/$(CV_NAME).pdf"

preview: pdf
	@mkdir -p $(PREVIEW_DIR)
	pdftoppm -png -r 150 $(BUILD_DIR)/$(CV_NAME).pdf $(PREVIEW_DIR)/page
	@echo "==> Vistas previas generadas exitosamente en $(PREVIEW_DIR)/"

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(CV_NAME).aux $(CV_NAME).log $(CV_NAME).out $(CV_NAME).fls $(CV_NAME).fdb_latexmk $(CV_NAME).synctex.gz $(CV_NAME).pdf
	rm -rf preview

.PHONY: all pdf preview clean
