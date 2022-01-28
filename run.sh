FILES="$PWD/ipc1_public/"*
for f in $FILES
        do
	out="$(basename $f)"
	echo "Processing $out file..."
	./run_champsim.sh hashed_perceptron-FNL5-MMA30-next_line-spp_dev-no-lru-1core 50 50 $out &
	done
