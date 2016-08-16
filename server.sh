#!/bin/bash

# Duong - Tuan : August 16 2016
# src/server-dnn-online
# Server supports for dnn decoding. It can decoding multi clients simultaneously through TCP-IP
#
# RUN :
#	./server-dnn-online.sh
#
# INFOR CONFIG:
#	TCP-IP PORT : 5010


# export PATH to run server-dnn-online from everywhere
export PATH=`pwd`/src:$PATH

# run server-dnn-online
server-dnn-online --online=true --do-endpointing=true \
--config=exp/nnet2_online/nnet_ms_a_online/conf/online_nnet2_decoding.conf \
--max-active=7000 --beam=20.0 --lattice-beam=10.0 --acoustic-scale=0.1 \
--word-symbol-table=exp/tri3b-dnn/graph/words.txt exp/nnet2_online/nnet_ms_a_online/final.mdl \
exp/tri3b-dnn/graph/HCLG.fst 5010

