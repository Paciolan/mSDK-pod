#!/bin/bash
set -e

# CodePush Key
export CP_KEY="CodePushDeploymentKey"
export CP_VAL="uPVI6pGwsfoDuvtDsW9Nowbdtyqy4ac28013-8b5f-417a-ae75-8591e4b3b579"

export PLIST_BUDDY="/usr/libexec/PlistBuddy"
export CURRENT_PWD="$PWD"
export PROJECT_DIR=$(
    cd "../../"
    pwd
)

cd $CURRENT_PWD

export PROJECT_FILE=$(find "$PROJECT_DIR" -maxdepth 1 -name "*.xcodeproj" | tail -1)
export XCODE_FILENAME=$(basename -- "$PROJECT_FILE")
export PROJECT_NAME="${XCODE_FILENAME%.*}"
export PLIST="$PROJECT_DIR/$PROJECT_NAME/Info.plist"

# Check for 'CodePushDeploymentKey' Key/Value
$PLIST_BUDDY -c "print :CodePushDeploymentKey" $PLIST 2>/dev/null
export EXIT_CODE=$?

if [ "$EXIT_CODE" -eq 0 ]; then # Update CodePush Key/Val
    $PLIST_BUDDY -c "Set :$CP_KEY string $CP_VAL" $PLIST
else # Add CodePush Key/Val
    $PLIST_BUDDY -c "Add :$CP_KEY string $CP_VAL" $PLIST
fi
