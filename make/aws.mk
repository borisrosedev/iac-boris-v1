.PHONY: aws.vpcs aws.kp.list aws.del.kp  aws.sub.list aws.del.sub
aws.vpcs:
	@aws ec2 describe-vpcs --query 'Vpcs[0].VpcId' --output text
aws.kp.list:
	@aws ec2 describe-key-pairs
aws.del.kp:
	@aws ec2 delete-key-pair --key-pair-id $(KEY_PAIR_ID)
aws.sub.list:
	@aws ec2 describe-subnets
aws.del.sub:
	@aws ec2 delete-subnet --subnet-id $(SUBNET_ID)
