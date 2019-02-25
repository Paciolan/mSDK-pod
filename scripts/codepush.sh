#!/bin/bash
set -e

PLIST_BUDDY = "/usr/libexec/PlistBuddy"
PLIST = "Pods/Target Support Files/#{target}/Info.plist"

$PLIST_BUDDY -c "Add :CodePushDeploymentKey string uPVI6pGwsfoDuvtDsW9Nowbdtyqy4ac28013-8b5f-417a-ae75-8591e4b3b579" "$PLIST"
