#!/bin/sh
while true; do
	if FN=$(inotifywait -e close_write,moved_to --format %f ./information-flow.dot); then
		./bin/dot-output.sh information-flow.dot
	fi
done