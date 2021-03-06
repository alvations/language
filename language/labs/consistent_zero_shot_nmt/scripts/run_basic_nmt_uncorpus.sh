# coding=utf-8
# Copyright 2018 The Google AI Language Team Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#!/bin/bash

NAME=basic-multilingual-nmt-uncorpus-exp1
PROBLEM=translate_uncorpus_exp1
MODEL=basic_multilingual_nmt
CONF=basic_gnmt_luong_att_multi

OUT_DIR=$1
DATA_DIR=$2

rm -rf $OUT_DIR

python -m language.labs.consistent_zero_shot_nmt.bin.t2t_trainer \
  --problem=$PROBLEM \
  --model=$MODEL \
  --hparams="" \
  --hparams_set=$CONF \
  --data_dir=$DATA_DIR \
  --train_steps=10000 \
  --output_dir=$OUT_DIR \
  --schedule=train_and_evaluate \
  --local_eval_frequency=1000 \
  --alsologtostderr
