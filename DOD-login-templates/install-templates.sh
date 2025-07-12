#!/bin/bash
# Templates are already created, with the DOD banner set in the correct spot.
# Just run the script to apply the templates to the login screen.
oc create secret generic error-template --from-file=errors.html -n openshift-config
oc create secret generic login-template --from-file=login.html -n openshift-config
oc create secret generic providers-template --from-file=providers.html -n openshift-config
oc patch oauths cluster --type=json -p='[ { "op": "add", "path": "/spec/templates", "value": { "error": { "name": "error-template" }, "providerSelection": { "name": "providers-template" }, "login": { "name": "login-template" } } } ]'
