# add-role-multiple-farms


Example script that uses a template to create the same farm role across multiple farms.

### exmplate teamplate file
```
{
   "networking": {
    "networks": [
      {
        "id": ""
        }
     ],
    "subnets": [
      {
        "id": ""
      }
    ]
   },
   "advancedConfiguration": {
     "disableAgentIptablesManagement": false,
     "disableAgentNtpManagement": false,
     "rebootAfterHostInit": false
   },
   "scaling": {
     "minInstances": 1,
     "enabled": false,
     "maxInstances": 1
   },
   "alias": "",
   "role": {
     "id": ""
   },
   "cloudFeatures": {
     "type": "AwsCloudFeatures"
   },
   "launchIndex": 1,
   "security": {
     "securityGroups": [{"id": ""}]
   },
   "availabilityZones": [],
   "cloudLocation": "",
   "instanceType": {
       "id": ""
   },
   "cloudPlatform": "ec2"
 }
```
### Update the variables used to match your environment
export key_id=xxxx
export secret_key=xxx
export config=/demo.yml
export vpcid='vpc-xxx'
export roleid='11111'
export cloudLocation='us-west-1'
export subnet='subnet-d11111'
export insttype='t2.small'
export farmSG='sg-0000000'


### run createroles.sh
