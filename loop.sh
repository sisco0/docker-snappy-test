cd snappy
for buildtype in Release Debug
do
  for branch in master ppc-optimize;
  do
    echo "$branch: $buildtype"
    git checkout $branch 2> /dev/null > /dev/null
    cmake -Bbuild_$branch_$buildtype -DCMAKE_BUILD_TYPE=$buildtype . > /dev/null 2> /dev/null
    make -C build_$branch_$buildtype -j`nproc` > /dev/null 2> /dev/null
    time ./build_$branch_$buildtype/snappy_benchmark
  done
done
