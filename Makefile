STANDALONE_CONTAINER=<リポジトリ名>-standalone-1
SPREADSHEET_CONTAINER=<リポジトリ名>-spreadsheet-1

standalone-login:
	docker exec -it $(STANDALONE_CONTAINER) clasp login

spreadsheet-login:
	docker exec -it $(SPREADSHEET_CONTAINER) clasp login

standalone-build:
	docker exec -it $(STANDALONE_CONTAINER) npm run build

spreadsheet-build:
	docker exec -it $(SPREADSHEET_CONTAINER) npm run build

standalone-deploy:
	docker exec -it $(STANDALONE_CONTAINER) npm run deploy

spreadsheet-deploy:
	docker exec -it $(SPREADSHEET_CONTAINER) npm run deploy

standalone-open:
	docker exec -it $(STANDALONE_CONTAINER) npm run open

spreadsheet-open:
	docker exec -it $(SPREADSHEET_CONTAINER) npm run open

standalone-lint:
	docker exec -it $(STANDALONE_CONTAINER) npm run lint

spreadsheet-lint:
	docker exec -it $(SPREADSHEET_CONTAINER) npm run lint

standalone-test:
	docker exec -it $(STANDALONE_CONTAINER) npm run test

spreadsheet-test:
	docker exec -it $(SPREADSHEET_CONTAINER) npm run test
