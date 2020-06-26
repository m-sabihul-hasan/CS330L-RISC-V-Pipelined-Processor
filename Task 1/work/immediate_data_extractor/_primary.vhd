library verilog;
use verilog.vl_types.all;
entity immediate_data_extractor is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        imm_data        : out    vl_logic_vector(63 downto 0)
    );
end immediate_data_extractor;
