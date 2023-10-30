#object={"a":{"b":{"c":"d"}}}
object={"x":{"y":{"z":"a"}}}
#key="a/b/c"
key="x/y/z"
keys=[]
for i in str(key):
    if i!="/":
        keys.append(i)
k=0
def getValue(keys,object,k):
    if len(keys)>0:
        obj=object[keys[k]]
        keys.remove(keys[k])
        return getValue(keys,obj,k)
    else:
        return object
value=getValue(keys,object,k)
print("Value is:",value)