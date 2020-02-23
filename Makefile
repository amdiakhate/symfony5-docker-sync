path = .docker
run:
	cd $(path) && docker-sync-stack start

clean:
	cd $(path) && docker-sync-stack clean
