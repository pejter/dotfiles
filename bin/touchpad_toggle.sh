#!/bin/bash
status=`synclient | grep TouchpadOff | awk '{print $3}'`
echo $status
if [[ $status -eq 0 ]]; then
	synclient TouchpadOff=1
else
	synclient TouchpadOff=0
fi