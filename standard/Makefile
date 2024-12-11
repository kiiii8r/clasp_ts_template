define PROJECT_TASKS
$(1)-build:
	cd projects/$(1) && npm run build

$(1)-deploy:
	cd projects/$(1) && npm run deploy

$(1)-test:
	cd projects/$(1) && npm run test

$(1)-lint:
	cd projects/$(1) && npm run lint
endef

$(eval $(call PROJECT_TASKS,project_name_1))
$(eval $(call PROJECT_TASKS,project_name_2))