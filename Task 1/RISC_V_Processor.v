module RISC_V_Processor
(
	input clk,
	input reset
);

	wire [63:0] PC_in;
	wire [63:0] PC_out;

	Program_Counter PC
	(
		.clk(clk),
		.reset(reset),
		.PC_In(PC_in),
		.PC_Out(PC_out)
	);

	wire [63:0] adder_1_out;

	Adder ADDER_1
	(
		.a(PC_out),
		.b(64'd4),
		.out(adder_1_out)
	);

	wire [31:0] instruction;

	Instruction_Memory IM
	(
		.Inst_Address(PC_out),
		.Instruction(instruction)
	);

	wire [6:0] Opcode;
	wire [4:0] Rd;
	wire [2:0] Funct3;
	wire [4:0] Rs1;
	wire [4:0] Rs2;
	wire [6:0] Funct7;
		
	instruction_parser IP
	(
		.instruction(instruction),
		.opcode(Opcode),
		.rd(Rd),
		.funct3(Funct3),
		.rs1(Rs1),
		.rs2(Rs2),
		.funct7(Funct7)
	);

	wire [63:0] Imm_Data;
		
	immediate_data_extractor IDE
	(
		.instruction(instruction),
		.imm_data(Imm_Data)
	);

	wire branch;
	wire Mem_Read;
	wire Mem_to_Reg;
	wire [1:0] ALU_Op;
	wire Mem_Write;
	wire ALU_Src;
	wire Reg_Write;
		
	Control_Unit CU
	(
		.Opcode(Opcode),
		.Branch(branch),
		.MemRead(Mem_Read),
		.MemtoReg(Mem_to_Reg),
		.ALUOp(ALU_Op),
		.MemWrite(Mem_Write),
		.ALUSrc(ALU_Src),
		.RegWrite(Reg_Write)
	);

	wire [63:0] read_data1;
	wire [63:0] read_data2;
	wire [63:0] write_data;

	registerFile RF
	(
		.WriteData(write_data),
		.RS1(Rs1),
		.RS2(Rs2),
		.RD(Rd),
		.RegWrite(Reg_Write),
		.clk(clk),
		.reset(reset),
		.ReadData1(read_data1),
		.ReadData2(read_data2)
	);

	wire [63:0] mux_1_out;

	mux_2x1 MUX_1
	(
		.a(read_data2),
		.b(Imm_Data),
		.sel(ALU_Src),
		.data_out(mux_1_out)
	);

	wire [63:0] B;
	assign B = Imm_Data << 1;
	wire [63:0] adder_2_out;

	Adder ADDER_2
	(
		.a(PC_out),
		.b(B),
		.out(adder_2_out)
	);
	 
	wire [3:0] funct;
	assign funct = {instruction[30], instruction[14:12]};
	wire [3:0] operation;
	 
	ALU_Control AC
	(
		.ALUOp(ALU_Op),
		.Funct(funct),
		.Operation(operation)
	);

	wire zero;
	wire [63:0] result;

	ALU_64_bit ALU
	(
		.a(read_data1),
		.b(mux_1_out),
		.ALUOp(operation),
		.Zero(zero),
		.Result(result)
	);

	wire mux2_sel;
	assign mux2_sel = branch & zero;

	mux_2x1 MUX_2
	(
		.a(adder_1_out),
		.b(adder_2_out),
		.sel(mux2_sel),
		.data_out(PC_in)
	);

	wire [63:0] read_data;

	Data_Memory DM
	(
		.Mem_Addr(result),
		.Write_Data(read_data2),
		.clk(clk),
		.MemWrite(Mem_Write),
		.MemRead(Mem_Read),
		.Read_Data(read_data)
	);

	mux_2x1 MUX_3
	(
		.a(read_data),
		.b(result),
		.sel(Mem_to_reg),
		.data_out(write_data)
	);
	
	always @(posedge clk) 
		begin
			$monitor("PC_In = ", PC_in, ", PC_Out = ", PC_out, ", Instruction = %b", instruction,
            ", Opcode = %b", Opcode, ", Funct3 = %b", Funct3, ", rs1 = %d", Rs1,
            ", rs2 = %d", Rs2, ", rd = %d", Rd, ", funct7 = %b", Funct7,
            ", ALUOp = %b", ALU_Op, ", imm_value = %d", Imm_Data, ", Operation = %b", operation);
		end

endmodule
