ARG=
run:
	rails s -b 0.0.0.0

webpack:
	./bin/webpack-dev-server

install:
	bundle install; yarn install

update:
	bundle update

create:
	@rails db:create:all

migrate:
	@rails db:migrate

rubocop:
	rubocop --safe-auto-correct

seed:
	rails db:seed

console:
	rails console

document-generate:
	rake docs:generate

teste:
	@echo "Executa todos os testes. Você pode usar parametros como tags para testar apenas os testes marcados. Ex: ARG='spec/models/contact_spec.rb', ARG='--tag type:model', ARG='--tag ~type:resquest', ARG='--tag slow', ARG='--tag ~slow'"
	bin/rspec $(ARG);

reset:
	bundle install; rails db:drop:all db:create:all db:migrate

rollback:
	rails db:rollback

erd:
	rake erd orientation=horizontal inheritance=true notation=bachman title='iAuction - ERD (Entity Relationship Diagram)' filename='doc/erd-iauction' attributes=foreign_keys,content exclude="FriendlyId::Slug"

diagrams:
	rake diagram:all

erd-models:
	railroady -i -M | dot -Tsvg > doc/models.svg