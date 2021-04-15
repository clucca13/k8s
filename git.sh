GIT_TAGS=$(git tag)
TAG_SHA=$(for OUTPUT in $GIT_TAGS;do echo {"\""tag"\"":"\""$OUTPUT"\"", "\""sha"\"": "\""$(git rev-list -n 1 $OUTPUT)"\""},;done)
echo { "\""versions"\"" : [  $TAG_SHA  ]} > git.json
awk -v RS= '{ gsub(/,[[:space:]]*]/, "\n]", $0) }1' git.json | jq '.'
