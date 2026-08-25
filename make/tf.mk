.PHONY: tf.fmt.ci tf.fmt tf.init.liu tf.ok tf.sec

tf.init.liu:
	@terraform -chdir=$(TF_ENV_DIR) init -lock=false -input=false -upgrade
tf.fmt:
	@terraform -chdir=$(INFRA_DIR) fmt -recursive -diff
tf.fmt.ci:
	@terraform -chdir=$(INFRA_DIR) fmt -recursive -check
tf.ok:
	@terraform -chdir=$(TF_ENV_DIR) validate
tf.sec:
	@trivy config $(INFRA_DIR) --exit-code 1 --severity=HIGH,CRITICAL
