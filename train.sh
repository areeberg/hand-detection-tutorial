#!/bin/bash

usage()
{
    echo
    echo "Usage: ./trash.sh <model_name>"
    echo
    echo "where <model_name> could be one of the following:"
    echo "    ssd_mobilenet_v1_egohands"
    echo "    ssd_mobilenet_v2_egohands"
    echo "    ssdlite_mobilenet_v2_egohands"
    echo "    ssd_inception_v2_egohands"
    echo "    ssd_resnet50_v1_fpn_egohands"
    echo "    rfcn_resnet101_egohands"
    echo "    faster_rcnn_resnet50_egohands"
    echo "    faster_rcnn_resnet101_egohands"
    echo "    faster_rcnn_inception_v2_egohands"
    echo "    faster_rcnn_inception_resnet_v2_atrous_egohands"
    echo
    exit
}

if [ $# -ne 1 ]; then
    usage
fi

case $1 in
    ssd_mobilenet_v1_egohands | \
    ssd_mobilenet_v2_egohands | \
    ssdlite_mobilenet_v2_egohands | \
    ssd_inception_v2_egohands )
        NUM_TRAIN_STEPS=20000
        ;;
    ssd_resnet50_v1_fpn_egohands )
        NUM_TRAIN_STEPS=25000
        ;;
    rfcn_resnet101_egohands | \
    faster_rcnn_resnet50_egohands | \
    faster_rcnn_resnet101_egohands | \
    faster_rcnn_inception_v2_egohands | \
    faster_rcnn_inception_resnet_v2_atrous_egohands )
        NUM_TRAIN_STEPS=50000
        ;;
    * )
        usage
esac

MODEL_DIR=$1
MOD=$1
PIPELINE_CONFIG_PATH=${MOD}.config

# clear old training logs
rm -rf ${MODEL_DIR}

PYTHONPATH=`pwd`/content/models/research/:/content/models/research/slim \
    python3  /content/models/research/object_detection/model_main.py \
            --pipeline_config_path=/content/hand-detection-tutorial/configs/${PIPELINE_CONFIG_PATH} \
            --model_dir=${MODEL_DIR} \
            --num_train_steps=${NUM_TRAIN_STEPS} \
            --sample_1_of_n_eval_samples=1 \
            --alsologtostderr

