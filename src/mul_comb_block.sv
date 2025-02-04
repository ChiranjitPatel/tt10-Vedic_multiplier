module mul_comb_block 
	(	clk_int,
		reset,
		rx_d_in,
		uart_tx_start,
		tx_d_out,
		uart_rx_valid,
		uart_tx_ready,
		loopback_test,
		protocol_select
	);
	
	input  logic clk_int;
	input  logic reset;
	input  logic rx_d_in;
	input  logic uart_tx_start;
	output logic tx_d_out;
	output logic uart_rx_valid;
	output logic uart_tx_ready;
	
	logic [7:0] uart_transmit_data;
	logic [7:0] uart_received_data;
	
	generate
	// Instantiate uart_rx 
		uart_rx 
		#(
			.baud_rate(24'd4000000),
			.clock_freq(28'd100000000)
		) 
		uart_rx_inst (
			.uart_clock(clk_int),
			.reset(reset),
			.uart_d_in(rx_d_in),
			.uart_d_out(uart_received_data),
			.uart_valid(uart_rx_valid)
		);
		
		// Instantiate uart_tx
		uart_tx 
		#(
			.baud_rate(24'd4000000),
			.clock_freq(28'd100000000)
		) 
		uart_tx_inst (
			.uart_clock(clk_int),
			.reset(reset),
			.uart_start(uart_tx_start),
			.uart_d_in(uart_transmit_data),
			.uart_d_out(tx_d_out),
			.uart_tx_ready(uart_tx_ready)
		);
		
		// Instantiate the 8-bit multiplier
		i8bit_mul 
		(
			.a(uart_received_data[7:0]),
			.b(uart_received_data;15:0]),
			.s(uart_transmit_data)
		);
		
		// Instantiate SPI
		spi_master_slave (
			.clk_spi(clk_int),           
			.reset(reset),
			.slave_rx_start,
			.slave_tx_start,
			.dout_miso(rx_d_in), 	
			.cs_bar,       
			.sclk,
			.din_mosi(tx_d_out),	
			.rx_valid,
			.tx_done
		);

	endgenerate
	
	
	
endmodule