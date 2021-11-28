

xml="<?xml version=\"1.0\"?>"
xml+="<time>$(echo $(TZ=UTC-8 date '+%Y-%m-%d %H:%M:%S'))</time>"

package_name="ryzen-controller"
scoop_manifest_url="https://raw.githubusercontent.com/ScoopInstaller/Extras/master/bucket/$package_name.json"
content=$(curl $scoop_manifest_url)
scoop_version=$(echo $content | grep -o -P "\"version\":\\s+\"[\\d.]+\"" | grep -o -P "[\\d.]+")

# fallback (workaround while the manifest is not merged yet)
if scoop_version == ""
then
    scoop_version="2.5.3"
fi

# The release page is obfuscated with Jscrambler. Therefore some trick is needed to track the version.
checkver_url="https://gitlab.com/ryzen-controller-team/ryzen-controller/-/tags?sort=name_desc&format=atom"
content=$(curl $checkver_url)
release_version=$(echo $content | grep -o -P "ryzen-controller/-/tags/[\\d.]+" | head -1 | grep -o -P "[\\d.]+")

# compare version


for i in $(seq 1 10)
do
    echo $i
done

mkdir ./pages/ryzen-controller -p
echo $xml > ./pages/ryzen-controller/version.xml