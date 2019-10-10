#!/usr/bin/env bash

set -e

( sleep 30 && \
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD && \
rabbitmqctl set_user_tags $RABBITMQ_USER administrator && \
rabbitmqctl set_permissions -p / $RABBITMQ_USER  ".*" ".*" ".*" ) & \
rabbitmq-server $@
