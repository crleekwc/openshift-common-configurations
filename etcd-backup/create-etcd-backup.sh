#!/bin/bash
oc new-project ocp-etcd-backup --description "Openshift Backup Automation Tool" --display-name "Backup ETCD Automation"
oc apply -f ./*
oc adm policy add-scc-to-user privileged -z openshift-backup
