/// utilty to reserve n G bytes of memory on the system.
use std::env;
use std::{thread, time};

fn main() {
    let args: Vec<String> = env::args().collect();

    println!("{:?}", args);

    if args.len() != 2 {
        println!("reserve n G of memories");
        println!("usage: mem_reserve n");
        return;
    }

    let g: usize = args[1].parse().unwrap();

    let size: usize = (g * 1024 * 1024 * 1024) / 4 as usize;
    println!("allocating start {:?}G, {}", g, size);
    let mut v: Vec<i32> = vec![1; size];
    println!("allocating finished.");

    println!("looping");
    loop {
        for x in v.iter_mut() {
            *x = *x + 1;
            if *x == 255 {
                *x = 0;
            }
            //println!("val: {}", x);
            thread::sleep(time::Duration::from_millis(10));
        }
    }
}
