#! /bin/bash

RE='([0-9]+)\.([0-9]+)\.([0-9]+)\+?([0-9]+)?'

lastVersion="$1"

if [ -z "$2" ]
then
  nextVersion=$lastVersion
else
  nextVersion="$2"
fi

LAST_UAT_BUILD_NUMBER=`echo $lastVersion | sed -E "s/$RE/\4/"`

NEXT_VERSION_MAJOR=`echo $nextVersion | sed -E "s/$RE/\1/"`
NEXT_VERSION_MINOR=`echo $nextVersion | sed -E "s/$RE/\2/"`
NEXT_VERSION_PATCH=`echo $nextVersion | sed -E "s/$RE/\3/"`

NEW_BUILD_NUMBER=$((LAST_UAT_BUILD_NUMBER + 70100))
echo "$NEXT_VERSION_MAJOR.$NEXT_VERSION_MINOR.$NEXT_VERSION_PATCH+$NEW_BUILD_NUMBER"