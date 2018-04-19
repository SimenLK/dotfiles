#!/bin/bash

current_output=$(pacmd list-cards | grep "active profile: " \
				| cut -d ' ' -f 3- \
				| cut -d '<' -f 2 \
				| cut -d '>' -f 1)

current_output_cut=$(echo $current_output | cut -d ':' -f 2)

new_output="jack shit"

pacmd list-cards | grep output:| while read stream; do
	outputs=$(echo $stream | cut -d ' ' -f 1 | cut -d '+' -f 1)

	if [ "$outputs" != "$current_output" ]; then
		candidate=$(echo $outputs | cut -d ':' -f 2)

		if [[ $candidate = "hdmi-stereo" && $candidate != $current_output_cut ]]; then
			new_output="output:$candidate"
			prompt "Change output to $new_output?" "pacmd set-card-profile 0 $new_output"
			break
		elif [[ $candidate = "analog-stereo" && $candidate != $current_output_cut ]]; then
			new_output="output:$candidate"
			prompt "Change output to $new_output?" "pacmd set-card-profile 0 $new_output"
			break
		fi; 
	fi;
done

