# Metadata
name=nostalgia
comment=A 32x32 cursor for X11 with retro shape

# Directories
repository_directory=$(shell pwd)
scripts_directory=${repository_directory}/scripts
configurations_directory=${repository_directory}/configurations
distribution_directory=${repository_directory}/${name}
installation_directory=/usr/share/icons/${name}

build:
	${scripts_directory}/build.sh "${name}" "${comment}" "${configurations_directory}" "${distribution_directory}"

install:
	mv "${distribution_directory}" "${installation_directory}"

uninstall:
	rm -rf "${installation_directory}"

.PHONY: build install uninstall
