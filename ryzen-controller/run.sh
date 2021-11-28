
xml="<?xml version=\"1.0\"?>"
xml+="<time>$(echo $(TZ=UTC-8 date '+%Y-%m-%d %H:%M:%S'))</time>"

mkdir ./pages/ryzen-controller -p

echo $xml > ./pages/ryzen-controller/version.xml