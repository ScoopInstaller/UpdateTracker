
xml="<?xml version=\"1.0\"?>"
xml+="<time>$(echo $(TZ=UTC-8 date '+%Y-%m-%d %H:%M:%S'))</time>"

checkver_url="https://gitlab.com/ryzen-controller-team/ryzen-controller/-/tags?sort=name_desc&format=atom"
checkver_url_content=$(curl checkver_url)

# ryzen-controller/-/tags/2.5.4
if [ $checkver_url_content !=~ "ryzen-controller/-/tags/([\\d.]+)" ]
then
    echo "Cannot match regex on checkver_url"
    exit 1
fi
echo $BASH_REMATCH[1]

mkdir ./pages/ryzen-controller -p
echo $xml > ./pages/ryzen-controller/version.xml