#!/bin/bash

#PYTHONPATH=`pwd`/models/research:`pwd`/models/research/slim \
#    python3 create_kitti_tf_record.py \
#            --data_dir=egohands_kitti_formatted \
#            --output_path=data/egohands \
#            --classes_to_use=hand \
#            --label_map_path=data/egohands_label_map.pbtxt \
#            --validation_set_size=500

PYTHONPATH=`pwd`/models/research:`pwd`/models/research/slim \
    python3 /content/hand-detection-tutorial/create_kitti_tf_record.py \
            --data_dir=egohands_kitti_formatted \
            --output_path=/content/hand-detection-tutorial/data/egohands \
            --classes_to_use=hand \
            --label_map_path=/content/hand-detection-tutorial/data/egohands_label_map.pbtxt \
            --validation_set_size=500

