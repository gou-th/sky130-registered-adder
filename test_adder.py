import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, ClockCycles
import random

@cocotb.test()
async def test_random(dut):

    clock = Clock(dut.clk, 10, units="ns")  # 10ns clock 
    cocotb.start_soon(clock.start())

    dut.a.value = 0
    dut.b.value = 0
    
    dut.rst.value = 0
    await ClockCycles(dut.clk, 50) 
    dut.rst.value = 1

    await ClockCycles(dut.clk, 5)

    for i in range(20):
        a_val = random.randint(0, 100)
        b_val = random.randint(0, 100)
        
        dut.a.value = a_val
        dut.b.value = b_val
        
        await ClockCycles(dut.clk, 2)
        await Timer(1, units="ns") 

        raw_sum = dut.sum.value.binstr
        
        if 'x' in raw_sum.lower():
            dut._log.error(f"Cycle {i}: sum is STILL UNKNOWN! Value: {raw_sum}")
        else:
            real_sum = int(dut.sum.value)
            expected_sum = (a_val + b_val) & 0xFF
            
            if real_sum == expected_sum:
                dut._log.info(f"PASS: {a_val} + {b_val} = {real_sum}")
            else:
                dut._log.error(f"FAIL: {a_val} + {b_val} = {real_sum} (Exp: {expected_sum})")
                assert real_sum == expected_sum