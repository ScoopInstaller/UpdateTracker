
xml="<?xml version=\"1.0\"?>"
xml+="<time>$(echo $(TZ=UTC-8 date '+%Y-%m-%d %H:%M:%S'))</time>"

checkver_page="https://gitlab.com/ryzen-controller-team/ryzen-controller/-/tags?sort=name_desc&format=atom"
checkver_page_content=$(curl $checkver_page)

# ryzen-controller/-/tags/2.5.4
if [checkver_page !=~ "ryzen-controller/-/tags/([\\d.]+)"] {
    echo "Cannot match regex on $checkver_page"
    exit 1
}
echo $BASH_REMATCH[1]

mkdir ./pages/ryzen-controller -p
echo $xml > ./pages/ryzen-controller/version.xml