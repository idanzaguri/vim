" Vim syntax file for SystemC
"
" Maintainer:	Karthick Gururaj <stonnedsnake@yahoo.com>
" Last change:	Nov 30 2003
" Version:     1.0

set syn=cpp

" Macros in SystemC
syntax keyword sysC_Macro SC_PROTOCOL SC_CTHREAD SC_THREAD 
syntax keyword sysC_Macro SC_SLAVE SC_CTOR SC_METHOD SC_MODULE SC_HAS_PROCESS
syntax keyword sysC_Macro SC_FS SC_PS SC_NS SC_US SC_MS SC_SEC

" SystemC Functions
syntax match sysC_Func "\<get_value\ze\s*("
syntax match sysC_Func "\<post\ze\s*("
syntax match sysC_Func "\<trywait\ze\s*(" 
syntax match sysC_Func "\<kind\ze\s*("
syntax match sysC_Func "\<unlock\ze\s*("
syntax match sysC_Func "\<trylock\ze\s*("
syntax match sysC_Func "\<lock\ze\s*("
syntax match sysC_Func "\<num_available\ze\s*("
syntax match sysC_Func "\<nb_read\ze\s*("
syntax match sysC_Func "\<num_free\ze\s*(" 
syntax match sysC_Func "\<nb_write\ze\s*("
syntax match sysC_Func "\<negedge_event\ze\s*("
syntax match sysC_Func "\<posedge_event\ze\s*("
syntax match sysC_Func "\<default_event\ze\s*("
syntax match sysC_Func "\<value_change_event\ze\s*("
syntax match sysC_Func "\<watching\ze\s*("
syntax match sysC_Func "\<duty_cycle\ze\s*(" 
" syntax match sysC_Func "\<sensitive_neg\ze\s*("
" syntax match sysC_Func "\<sensitive_pos\ze\s*("
" syntax match sysC_Func "\<sensitive\ze\s*(" 
syntax match sysC_Func "\<name\ze\s*(" 
syntax match sysC_Func "\<period\ze\s*("
syntax match sysC_Func "\<negedge\ze\s*("
syntax match sysC_Func "\<posedge\ze\s*("
syntax match sysC_Func "\<neg\ze\s*(" 
syntax match sysC_Func "\<pos\ze\s*(" 
syntax match sysC_Func "\<event\ze\s*("
syntax match sysC_Func "\<initialize\ze\s*("
syntax match sysC_Func "\<dont_initialize\ze\s*(" 
syntax match sysC_Func "\<next_trigger\ze\s*("
syntax match sysC_Func "\<notify\ze\s*("
syntax match sysC_Func "\<wait\ze\s*(" 
syntax match sysC_Func "\<read\ze\s*("
syntax match sysC_Func "\<end_of_elaboration\ze\s*("
syntax match sysC_Func "\<write\ze\s*("
syntax match sysC_Func "\<sc_time_stamp\ze\s*(" 
syntax match sysC_Func "\<sc_main\ze\s*(" 
syntax match sysC_Func "\<sc_start\ze\s*("
syntax match sysC_Func "\<sc_trace\ze\s*("
syntax match sysC_Func "\<sc_trace_file\ze\s*(" 
syntax match sysC_Func "\<sc_stop\ze\s*("
syntax match sysC_Func "\<sc_set_time_resolution\ze\s*(" 
syntax match sysC_Func "\<sc_get_default_time_unit\ze\s*("
syntax match sysC_Func "\<sc_get_time_resolution\ze\s*(" 
syntax match sysC_Func "\<sc_set_default_time_unit\ze\s*("
"Rotem's additions
syntax match sysC_Func "\<sc_spawn_method\ze\s*("
syntax match sysC_Func "\<sc_process_join\ze\s*("

" These can be used as streams too
syntax keyword sysC_Func sensitive
syntax keyword sysC_Func sensitive_neg
syntax keyword sysC_Func sensitive_pos

" SystemC classes
syntax keyword sysC_Type sc_semaphore sc_mutex sc_fifo sc_buffer sc_prim_channel sc_port sc_interface
syntax keyword sysC_Type sc_link_mp sc_event sc_buffer sc_semaphore_if sc_semaphore sc_mutex_if sc_mutex
syntax keyword sysC_Type sc_fifo_in sc_fifo_out sc_fifo_out_if sc_fifo_in_if sc_fifo sc_signal_rv sc_signal
syntax keyword sysC_Type sc_inout_rv sc_out_rv sc_in_rv sc_inout sc_out sc_in sc_interface
syntax keyword sysC_Type sc_channel sc_port sc_out_clk sc_in_clk sc_inoutslave sc_outslave sc_inslave
syntax keyword sysC_Type sc_slave sc_inoutmaster sc_outmaster sc_inmaster sc_master sc_module_name sc_clock
syntax keyword sysC_Type sc_time sc_ufix sc_fix sc_ufixed sc_fixed sc_lv sc_bv
syntax keyword sysC_Type sc_biguint sc_bigint sc_uint sc_int sc_logic sc_bit sc_module
"Rotem's additions
"syntax match sysC_Type "<\d\+>"

" And the highlighting
hi! sysC_Func ctermfg=NONE guifg=cyan
hi! link sysC_Macro Constant
hi! link sysC_Type Type

"echohl Comment | echo "Detected SystemC file" | echohl None
