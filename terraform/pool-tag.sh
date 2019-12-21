#!/bin/bash

vm_ids=$(cs --region=prod getInstancePool id=${1} zoneid=1128bd56-b4d9-4ac6-a7b9-c715b187ce11 | jq '.instancepool[0].virtualmachines | map(.id) | join(",")')

cs --region=prod createTags resourceids=${vm_ids} resourcetype=UserVm tags[0].key=ansible_groups tags[0].value=${2}
