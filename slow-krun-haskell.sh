make deps
make build-haskell
echo "Finished building..."
echo "Executing: ./kwasm run --backend haskell wrc20.test"
./kwasm run --backend haskell wrc20.test
