export key_id=xxxx
export secret_key=xxx
export config=/demo.yml
export vpcid='vpc-xxx'
export roleid='11111'
export cloudLocation='us-west-1'
export subnet='subnet-d11111'
export insttype='t2.small'
export farmSG='sg-0000000'

# set farm ids to sue
farms=( 2650 2651 )

# build the role with variables
cat farm-role.json | jq '.alias=env.FName'| jq '.networking.networks[].id=env.vpcid'|jq '.networking.subnets[].id=env.subnet' | jq '.role.id=env.roleid' | jq '.cloudLocation=env.cloudLocation'| jq '.instanceType.id=env.insttype' |jq '.security.securityGroups[].id=env.farmSG'  > buildrole.json

for x in "${farms[@]}"
do
  echo $x
  export farmroleid=`scalr-ctl --key_id $key_id --secret_key $secret_key --config $config farm-roles create --farmId $x --stdin < buildrole.json | jq '.data.id'`
  echo $farmroleid
done
