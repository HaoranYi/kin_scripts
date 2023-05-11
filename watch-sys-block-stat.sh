watch --difference=cummulative --interval=1 '(echo device read_IOs read_merges read_sectors read_ticks write_IOs write_merges write_sectors write_ticks in_flight io_ticks time_in_queue; for file in /sys/block/*/stat; do echo -n $file; cat $file; done) | column -t'
# OUTPUTS:
#device                 read_IOs  read_merges  read_sectors  read_ticks  write_IOs  write_merges  write_sectors  write_ticks  in_flight  io_ticks  time_in_queue
#/sys/block/dm-0/stat   116962    0            2212746       314096      7705653    0             150218536      609670232    0          644428    610921004
#/sys/block/dm-1/stat   116479    0            2208882       313324      7686986    0             150218536      609676068    0          644616    611418072
#/sys/block/dm-2/stat   302       0            2416          780         0          0             0              0            0          148       780
#/sys/block/sda/stat    91181     26273        2217246       74876       7314854    388030        150261802      16954364     0          575820    17027784
#/sys/block/sr0/stat    0         0            0             0           0          0             0              0            0          0         0

iostat -kx 2
# OUTPUTS:
#avg-cpu:  %user   %nice %system %iowait  %steal   %idle
#           9.33    0.00    1.96   13.13    0.01   75.57
#
#Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
#vda               0.08   734.82    0.70  185.17    12.04  4602.65    49.66     5.23   28.16   21.68   28.18   2.90  53.88
#dm-0              0.00     0.00    0.78  920.05    12.03  4602.62    10.02     1.55    1.68   22.49    1.67   0.59  53.88
#dm-1              0.00     0.00    0.00    0.01     0.01     0.03     8.00     0.02 2134.33   19.56 2536.63  33.06   0.03

vmstat 2 10
# OUTPUTS:
#procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
# r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
# 2  1   8748 1596992 665208 5201064    0    0     3  1156    1   11  9  2 76 13
# 0  0   8748 1596736 665208 5201064    0    0     0   166  468  959  1  0 95  4
# 0  0   8748 1596736 665208 5201064    0    0     0    26  449 1044  2  0 96  2
# 1  0   8748 1578964 665208 5201068    0    0     0  4664  693 1179 14  3 79  4

mpstat 2 10
# OUTPUTS:
#05:56:51 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest   %idle
#05:56:53 PM  all    1.76    0.00    0.25    1.51    0.00    0.00    0.00    0.00   96.48
#05:56:55 PM  all    2.01    0.00    0.38    2.26    0.00    0.00    0.00    0.00   95.36
#05:56:57 PM  all    1.25    0.00    0.13    0.38    0.00    0.00    0.00    0.00   98.24

dstat --top-io --top-bio
# OUTPUTS:
#----most-expensive---- ----most-expensive----
#     i/o process      |  block i/o process
#bash       3624B   41B|bash       2462B  137B
#bash         79k  956B|
#bash       1487k   45k|
#bash          1B   25B|
#bash          4B  193B|
#grep         27M    0 |
#grep         42M    0 |
#grep         16M    0 |
#grep         18M    0 |
#grep         36M    0 |
#grep         33M    0 |
#bash        214M   49B|

dstat --time --io --mem --net --load --fs --vm --disk-util --disk-tps --freespace --top-io --top-bio-adv
# OUTPUTS:
#----system---- --io/total- ------memory-usage----- -net/total- ---load-avg--- --filesystem- -----virtual-memory---- vda- -dsk/total- -----/----------/dev--------/run-------/boot--- ----most-expensive---->
#     time     | read  writ| used  buff  cach  free| recv  send| 1m   5m  15m |files  inodes|majpf minpf alloc  free|util|reads writs| used  free: used  free: used  free: used  free|     i/o process      >
#04-04 17:18:27|   0     0 |2100M  542M 5102M  146M|  48k   50k|1.41 1.33 1.27| 2432    208k|   0     6   357   341 |   0|   0     0 |33.9G  155G:4096B 3937M: 256k 1578M:61.6M  166M|blablablabl1418k   50k>
#04-04 17:18:28|   0     0 |2100M  542M 5102M  146M|  35k   28k|1.41 1.33 1.27| 2432    208k|   0     9   295   322 |   0|   0     0 |33.9G  155G:4096B 3937M: 256k 1578M:61.6M  166M|blablablabl1051k   25k>
#04-04 17:18:29|   0  7.00 |2100M  542M 5102M  146M|  24k   25k|1.41 1.33 1.27| 2432    208k|   0     4   343   309 |13.6|   0     7 |33.9G  155G:4096B 3937M: 256k 1578M:61.6M  166M|blablablabl 595k   21k>
#04-04 17:18:30|   0     0 |2100M  542M 5102M  146M| 474B  975B|1.41 1.33 1.27| 2432    208k|   0     3   281   280 |   0|   0     0 |33.9G  155G:4096B 3937M: 256k 1578M:61.6M  166M|blablablabl 228k    0 >
#04-04 17:18:31|   0  3.00 |2100M  542M 5102M  146M|1484B 1181B|1.41 1.33 1.27| 2432    208k|   0     0   281   279 |7.20|   0     3 |33.9G  155G:4096B 3937M: 256k 1578M:61.6M  166M|SCREEN      688B  626B>
#04-04 17:18:32|   0     0 |2100M  542M 5102M  146M|  23k   25k|1.30 1.31 1.27| 2432    208k|   0     5   289   309 |   0|   0     0 |33.9G  155G:4096B 3937M: 256k 1578M:61.6M  166M|blablablabl 823k   21k>
