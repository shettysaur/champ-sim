log_csv=./results_50M/FNL5-MMA9_16kb_metrics.csv ;
`rm -rf $log_csv` ;
`echo "TRACE,IPC,L1I_MISS_LATENCY,L1I_ACCESS,L1I_MISS,L1I_LOAD_ACCESS,L1I_LOAD_MISS,L1I_PREFETCH_TOTAL,L1I_PREFETCH_USEFULL,L2C_ACCESS" >> $log_csv`;
# `echo "\n" >> $log_csv`;
for results in results_50M/FNL5-MMA9_16kb/*.txt ;
do 
    
    PERF=`grep -r $results -e "CPU 0 cumulative IPC"`;
    
    IPC=`grep "CPU 0 cumulative IPC" $results | cut '-d:' '-f2' | xargs | cut '-d ' '-f1'` ;
 
    L1I_latency=`grep "L1I AVERAGE MISS LATENCY" $results | cut '-d:' '-f2' | xargs | cut '-d ' '-f1'` ;

    L1I_ACCESS=`grep "L1I TOTAL" $results | cut '-d:' '-f2' | xargs | cut '-d ' '-f1'` ;
    
    L1I_MISS=`grep "L1I TOTAL" $results | cut '-d:' '-f4' | xargs` ;

    L1I_LOAD_ACCESS=`grep "L1I LOAD" $results | cut '-d:' '-f2' | xargs | cut '-d ' '-f1'` ;
    
    L1I_LOAD_MISS=`grep "L1I LOAD" $results | cut '-d:' '-f4' | xargs` ;

    L1I_PREFETCH_TOTAL=`grep "L1I PREFETCH  REQUESTED" $results | cut '-d:' '-f2' | xargs | cut '-d ' '-f1'` ;

    L1I_PREFETCH_USEFULL=`grep "L1I PREFETCH  REQUESTED" $results | cut '-d:' '-f4' | xargs | cut '-d ' '-f1'` ;

    L2C_ACCESS=`grep "L2C TOTAL" $results | cut '-d:' '-f2' | xargs | cut '-d ' '-f1'` ;
   

    results=${results##*/}
    echo "${results%%.*},$IPC,$L1I_latency,$L1I_ACCESS,$L1I_MISS,$L1I_LOAD_ACCESS,$L1I_LOAD_MISS,$L1I_PREFETCH_TOTAL,$L1I_PREFETCH_USEFULL,$L2C_ACCESS" >> $log_csv;


done
