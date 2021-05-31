PROJECT=raspb-app
OUTPUT=build

OBJ=$(wildcard *.c)

default: $(OUTPUT) $(PROJECT)

$(OUTPUT):
	mkdir -p $@

$(PROJECT): $(OBJ)
	$(CC) $? -o $(OUTPUT)/$@

clean:
	rm -rf $(OUTPUT)

docker-build:
	docker build -t $(PROJECT) .

docker-run:
	docker run -it $(PROJECT) /bin/bash