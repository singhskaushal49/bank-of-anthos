.PHONY: deploy rollback status run

deploy:
	kubectl apply -f extras/jwt/jwt-secret.yaml
	kubectl apply -f kubernetes-manifests/

	kubectl set env deployment/userservice ENABLE_TRACING=false
	kubectl set env deployment/frontend ENABLE_TRACING=false
	kubectl set env deployment/contacts ENABLE_TRACING=false
	kubectl set env deployment/balancereader ENABLE_TRACING=false
	kubectl set env deployment/ledgerwriter ENABLE_TRACING=false
	kubectl set env deployment/transactionhistory ENABLE_TRACING=false

	kubectl rollout status deployment/userservice --timeout=300s
	kubectl rollout status deployment/frontend --timeout=300s
	kubectl rollout status deployment/contacts --timeout=300s
       -kubectl rollout status deployment/balancereader --timeout=900s
	kubectl rollout status deployment/ledgerwriter --timeout=300s
       -kubectl rollout status deployment/transactionhistory --timeout=900s

rollback:
	kubectl rollout undo deployment/userservice
	kubectl rollout undo deployment/frontend
	kubectl rollout undo deployment/contacts
	kubectl rollout undo deployment/balancereader
	kubectl rollout undo deployment/ledgerwriter
	kubectl rollout undo deployment/transactionhistory

run:
	kubectl port-forward service/frontend 8080:80

status:
	kubectl get pods
	kubectl get deployments
	kubectl get svc