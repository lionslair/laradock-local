#!/bin/sh
echo "Init SQS default queues"

awslocal sqs create-queue --queue-name cineq-local-default --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-broadcast --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-scout --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-ffmpeg --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-import --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-event-sourcing --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-campaign-schedule --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-permanent-generator --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-billing --attributes VisibilityTimeout=3600
awslocal sqs create-queue --queue-name cineq-local-export --attributes VisibilityTimeout=3600
