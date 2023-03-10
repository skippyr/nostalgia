# Metadata
name=nostalgia
comment=A 32x32 cursor for X11 with retro shape

# Characteristics
# Default: 140000
inner_color=140000
# Default: fdebab
border_color=fdebab

# Directories
repository_directory=$(shell pwd)
scripts_directory=${repository_directory}/scripts
configurations_directory=${repository_directory}/configurations
source_images_directory=${repository_directory}/source_images
images_directory=${repository_directory}/images
distribution_directory=${repository_directory}/${name}
installation_directory=/usr/share/icons/${name}

build:
	${scripts_directory}/build.sh "${name}" "${comment}" "${configurations_directory}" "${source_images_directory}" "${images_directory}" "${distribution_directory}" "${inner_color}" "${border_color}"

install:
	${scripts_directory}/install.sh "${distribution_directory}" "${installation_directory}"

uninstall:
	${scripts_directory}/uninstall.sh "${installation_directory}"

.PHONY: build install uninstall
