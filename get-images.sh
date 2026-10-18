#!/usr/bin/env bash
# Downloads the KLAS images from the Wix draft into ./images
# Run from inside the klas-website folder:  bash get-images.sh
set -u
mkdir -p images
BASE="https://static.wixstatic.com/media"
fail=0

get () {  # $1 = output name, $2 = Wix file id
  local ext="${2##*.}"
  local url="$BASE/$2/v1/fit/w_1600,h_1600,q_85/$1.$ext"
  if curl -fsSL -o "images/$1.$ext" "$url"; then
    echo "ok    images/$1.$ext"
  else
    echo "FAIL  $1  ($url)"; fail=1
  fi
}

get hero            ef3cbe_93f9ade9ac8343e48dd0226dc8b61fd5~mv2.jpg
get milestones      ef3cbe_bfc43708694b4b1d96e0747b20894320~mv2.png
get vision          ef3cbe_7dbf2e0118ab4bd58bc1dd92811cf590~mv2.jpg

get client-hyundai  ef3cbe_fa57adda27584fd5aa24408c139c5954~mv2.png
get client-kia      ef3cbe_4c07b868d3d44d119d22fdd6b22841f5~mv2.png
get client-smr      ef3cbe_40f77415aea647f9a6926fb5c9129125~mv2.png
get client-kiml     ef3cbe_be4ebbc4fd1940b5ae81c15e75b6d402~mv2.png
get client-aptiv    ef3cbe_95cca8cbdace42a4a2f9e096cbf7c10d~mv2.png
get client-mae      ef3cbe_5c285e332ce04e49ba6a1ad17331a9ea~mv2.png

get core-1          ef3cbe_f94126ee85a54333ac1ed84459cc3a1e~mv2.png
get core-2          ef3cbe_60ba5539f37d4554ac5fc620b6e7c82b~mv2.png
get core-3          ef3cbe_744ce7f4795f4768a95221277ec35a82~mv2.png

get machine-1       ef3cbe_c8a00e92371e4eb6a171a1e0e662004c~mv2.jpg
get machine-2       ef3cbe_9bea900cee4d4493b51cfb19232f3b7b~mv2.jpg
get machine-3       ef3cbe_c79986205c224900ab30fc3114e12aaf~mv2.png
get ancillary       ef3cbe_2ae9c747a04942cfa164a4a42fc9f55a~mv2.png
get test-equipment  ef3cbe_53923ba944dd44d5a721bb191db0c910~mv2.png

get high-volume     ef3cbe_e9d992dd3da54029a83bfff6ae8db77b~mv2.png
get high-volume-1   ef3cbe_62ef9755fb5c4c408053ec670615d105~mv2.png
get high-volume-2   ef3cbe_0d8a674972124b429ab5c8bac9835ac8~mv2.png

get inspection-1    ef3cbe_52469a81b9b8470ea6be86610a292e2f~mv2.png
get inspection-2    ef3cbe_24847b6dc8804af4b5bac251c8076b54~mv2.png
get inspection-3    ef3cbe_374a6484bbb540a487031e0049912c7b~mv2.png
get inspection-4    ef3cbe_12d02437678f4f518e192b376c941144~mv2.png
get enhancement     ef3cbe_e5a7877e38f14737a9b6e8317f8c968f~mv2.png

get cert-1          ef3cbe_163b470dc13e40519493b51759f007ff~mv2.jpg
get cert-2          ef3cbe_f1849a90364a4ee19996ff4e12a0a09b~mv2.jpg
get cert-3          ef3cbe_062797000ab74509af9ff3ab6bc00ad3~mv2.jpg
get cert-4          ef3cbe_1a22f51d61284260b1566a07347721a3~mv2.jpg
get cert-5          ef3cbe_d47248de5cab4266b73f38e8a062c893~mv2.jpg

get award-1         ef3cbe_6457022a19dd46858693ce5b3a7ee2df~mv2.png
get award-2         ef3cbe_f82f179d98584157bcdd06c21c75e508~mv2.png

echo
if [ "$fail" = 0 ]; then echo "All images downloaded."; else echo "Some images failed. Check the Wix site is published and try again."; fi
