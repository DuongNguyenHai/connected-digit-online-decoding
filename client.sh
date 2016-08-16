#!/bin/bash

# Duong - Tuan : August 16 2016
# src/client-online
# Client will read audio.wav file and send information for server-dnn-online through TCP-IP
#
# There are 2 run-modes :
#	-	./client.sh : decoding an audio file was list in audio/waw.scp
#	-	.client.sh 'audio/test.wav'	: decoding directly audio was addressed in terminal
#
# INFOR CONFIG:
#	TCP-IP PORT : 5010


# export PATH to run client-online from everywhere
export PATH=`pwd`/src:$PATH

if [[ "$#" -ne 1 ]]; then
	echo ">>> Decoding an audio file was listed in audio/wav.scp <<<"
	client-online localhost 5010 "scp,p:audio/wav.scp"
else
	AUDIO=$1
	echo ">>> Decoding file : $1 <<<"
	client-online localhost 5010 "scp,p:echo utterance $AUDIO|"
fi