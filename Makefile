.PHONY: all

init:
	opam install --deps-only .
	dune build

run:
	docker run --rm -d --name todolist_postgres -p 5432:5432 postgres:12
	sleep 3
	dune exec migrate
	dune exec rollback

clean:
	docker rm -f todolist_postgres
