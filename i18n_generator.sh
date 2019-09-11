# bin/sh
# Design By BachVQ

# Color Shell
RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHTGREEN='\033[1;32m'
LIGHTCYAN='\033[1;36m'
NC='\033[0m' # No Color
PURPLE='\033[1;35m'


echo "${RED}-----------STEP 1: Remove all File Form Lang------------${NC}"
echo "${RED}REMOVING${NC}"
rm -rf lib/assets/lang/*
echo "${RED}DONE${NC}"

echo "${LIGHTCYAN}---------STEP 2: Generate Root File Language--------------${NC}"
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/assets/lang lib/app/localizations.dart
echo "${LIGHTCYAN}---------DONE--------------${NC}"
# Create File From Root Localization File
echo "${LIGHTCYAN}---------STEP 3: Generate For All SupportLanguages From ${PURPLE}Setting.json${LIGHTCYAN}--------------${NC}"
cd lib/assets/lang
for la in `jq "."supportLanguages"" ../../../setting.json | jq -r '.[]'`; do
    echo "${LIGHTCYAN}Generating ${la} lang${NC}"
    cp intl_messages.arb intl_v_${la}.arb
done
cd ../../../

# Generate Dart File From Intl File
echo "${GREEN}---------------STEP 4: Creating DartFile-----------------${NC}"
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/assets/lang --no-use-deferred-loading lib/app/localizations.dart lib/assets/lang/intl_v_*.arb
echo "${GREEN}---------------Generate DONE-----------------${NC}"