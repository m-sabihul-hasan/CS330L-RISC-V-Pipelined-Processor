library verilog;
use verilog.vl_types.all;
entity Data_Memory is
    port(
        Mem_Addr        : in     vl_logic_vector(63 downto 0);
        Write_Data      : in     vl_logic_vector(63 downto 0);
        clk             : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        Read_Data       : out    vl_logic_vector(63 downto 0)
    );
end Data_Memory;
