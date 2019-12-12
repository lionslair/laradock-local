#!/bin/sh
echo "Init SQS default queues"

awslocal sqs create-queue --queue-name cineq-local-default
awslocal sqs create-queue --queue-name cineq-local-broadcast
awslocal sqs create-queue --queue-name cineq-local-scout
awslocal sqs create-queue --queue-name cineq-local-ffmpeg
awslocal sqs create-queue --queue-name cineq-local-import
awslocal sqs create-queue --queue-name cineq-local-event-sourcing
awslocal sqs create-queue --queue-name cineq-local-campaign-schedule
awslocal sqs create-queue --queue-name cineq-local-permanent-generator
awslocal sqs create-queue --queue-name cineq-local-billing
awslocal sqs create-queue --queue-name cineq-local-export
