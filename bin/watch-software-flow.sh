#!/bin/sh
while true; do
	if FN=$(inotifywait -e close_write,moved_to --format %f ./software-flow.dot); then
		dot -Tsvg software-flow.dot > software-flow.svg
	fi
done