#!/bin/bash
cd $(dirname "${BASH_SOURCE}")
echo "Updating..."
find -type f \
	-not -name "_*.sh" \
	-not -path "*.git*" \
	-print \
	-exec cp ~/{} ./{} \;
echo "Returning to original directory"
cd -