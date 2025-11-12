#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

DIR="docs/process"
if [[ ! -d "$DIR" ]]; then
  echo "Not found: $DIR" >&2
  exit 1
fi

rename_one(){
  local pat="$1" tgt="$2"
  local src
  src=$(compgen -G "$DIR/$pat" | head -n1 || true)
  if [[ -n "$src" ]]; then
    echo "mv: $src -> $DIR/$tgt"
    mv "$src" "$DIR/$tgt"
  else
    echo "skip: pattern '$pat' not found" >&2
  fi
}

rename_one '1.*.jpg'       '01-cold-storage.jpg'
rename_one '2.*.jpg'       '02-infeed-gate-open.jpg'
rename_one '3.*.jpg'       '03-pre-cleaner.jpg'
rename_one '4.*.jpg'       '04-hopper-scale.jpg'
rename_one '5.*.jpg'       '05-silo.jpg'
rename_one '6.*.jpg'       '06-mini-pre-cleaner.jpg'
rename_one '7.*.jpg'       '07-destoner.jpg'
rename_one '8.*.jpg'       '08-husker.jpg'
rename_one '9.*.jpg'       '09-brown-separator.jpg'
rename_one '10.*.jpg'      '10-brown-destoner.jpg'
rename_one '11.*.jpg'      '11-brown-color-sorter.jpg'
rename_one '12.*.jpg'      '12-whitener.jpg'
rename_one '13.*.jpg'      '13-polisher.jpg'
rename_one '14.*.jpg'      '14-white-destoner.jpg'
rename_one '15.*.jpg'      '15-vibratory-separator.jpg'
rename_one '16.*.jpg'      '16-white-color-sorter.jpg'
rename_one '17.*.jpg'      '17-foreign-matter-separator.jpg'
rename_one '18.*.jpg'      '18-head-rice-separator.jpg'
rename_one '19.*.jpg'      '19-rinse-free-processor.jpg'
rename_one '20.*.jpg'      '20-automatic-packer.jpg'
rename_one '21.*.jpg'      '21-metal-detector.jpg'
rename_one '22.*.jpg'      '22-checkweigher.jpg'
rename_one '23.*.jpg'      '23-robot-arm.jpg'
rename_one '24.*랩*.jpg'   '24-wrapper.jpg'         # 랩/래핑기
rename_one '25.*.jpg'      '25-outbound-room.jpg'

echo "Done."
