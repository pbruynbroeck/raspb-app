PROJECT=app
OUTPUT=build

OBJ=$(wildcard *.c)

default: $(OUTPUT) $(PROJECT)

$(OUTPUT):
	mkdir -p $@

$(PROJECT): $(OBJ)
	$(CC) $? -o $(OUTPUT)/$@

clean:
	rm -rf $(OUTPUT)