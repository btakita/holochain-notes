#!/bin/sh
while true; do
	if FN=$(inotifywait -e close_write,moved_to --format %f ./information-flow.dot); then
		dot -Tsvg information-flow.dot > information-flow.svg
	fi
done