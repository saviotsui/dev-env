bucket=[[BUCKET_NAME]]
prefix=[[PREFIX]]
SRCFN=[[DUMP_FILE]]
FN=[[DELETE_FILE]]

echo $bucket
echo $prefix
echo $SRCFN
echo $FN

aws s3api list-object-versions --bucket "$bucket" --prefix "$prefix" --query "[Versions,DeleteMarkers][].{Key: Key, VersionId: VersionId}" > $SRCFN

rm $FN 2> /dev/null
s=0
c=`grep -c VersionId $SRCFN`

while [ $s -lt $c ]
do
        ((e=s+999))
        echo taking $s to $e
        (echo -n '{"Objects":';jq ".[$s:$e]" < $SRCFN 2>&1 | sed 's#]$#] , "Quiet":true}#') > $FN
        aws s3api delete-objects --bucket "$bucket" --delete file://$FN && rm $FN
        ((s=e+1))
        sleep 1
        # echo s is $s and e is $e
        # echo -n "."
done
