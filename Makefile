PROJECT=raspb-app
OUTPUT=build
PROJECT_DIR=$(shell pwd)

CC=arm-linux-gnueabi-gcc

OBJ=$(wildcard *.c)

default: $(OUTPUT) $(PROJECT)

$(OUTPUT):
	mkdir -p $@

$(PROJECT): $(OBJ)
	$(CC) $? -o $(OUTPUT)/$@

docker-build:
	docker build -t $(PROJECT) .

docker-run: docker-build
	docker run -v $(PROJECT_DIR)/$(OUTPUT):/$(PROJECT)/$(OUTPUT) $(PROJECT) make -C raspb-app

clean: docker-build
	docker run -v $(PROJECT_DIR)/$(OUTPUT):/$(PROJECT)/$(OUTPUT) $(PROJECT) rm -f /$(PROJECT)/$(OUTPUT)/$(PROJECT)
	rm -rf $(OUTPUT)

docker-it: docker-build
	docker run -v $(PROJECT_DIR)/$(OUTPUT):/$(PROJECT)/$(OUTPUT) -it $(PROJECT)