syntax clear
syntax case match
"**************************************** DIVER *************************************************
" syntax keyword group keywords
syntax match first_line /^[A-Z0-9_]*,[A-Z0-9_,]*/
syntax match stage /^STAGE\s*/ nextgroup=stage_name
syntax match stage_name /[a-zA-Z0-9_]*\s*/ contained nextgroup=stage_file,x_v_list  "yinon

syntax match stage_file /[a-zA-Z0-9_/*.{}$]*\s*/ contained nextgroup=x_v_list2 "yinon

syntax match execute /^EXEC.*/ "nextgroup=execute_name
"syntax match execute_name /[a-zA-Z0-9_./]*\s*/ contained

syntax match substage /^SUBSTAGE\s/ nextgroup=substage_name
syntax match substage_name /[a-zA-Z0-9_.]*\s*/ contained
syntax keyword listfile LIST_FILE

syntax match linecomment /#.*$/
"syntax region allcomment start="/\*" end="\*/"
syntax match var1 /\$[a-zA-Z_]*/
syntax match var2 /\${[a-zA-Z_]*}/
syntax match x_v_list /\s*[XV]=[A-Z0-9_,]*/  contained "yinon
syntax match out_comm /\s*OUT*/ 
syntax match x_v_list2 /\s*[XV]=[A-Z0-9_,]*/ contained "yinon
"syntax match file /\/\w*$/
syntax match dir /\/\s*$/
syntax match star /\*/

"*************************************** RABBIT ********************************************
syntax match header /^I\/O.*/
syntax match header /^Signal .*/
syntax match output /output/
syntax match input / input/
syntax match inout /^inout/

syntax match output_Terminal /^OUTPUT/
syntax match input_Terminal /^INPUT/
syntax match inout_Terminal /^INOUT/

syntax match start_module /^Module\s*/ nextgroup=module_name
syntax match module_name /[a-zA-Z0-9_/*.{}$]*\s*/ contained nextgroup=instance
syntax match instance /\s*Instance\s*/ contained nextgroup=instance_name
syntax match instance_name /[a-zA-Z0-9_/*.{}$]*\s*#.*$/  contained 

syntax match nc_pin /NC/
syntax match nc_bus /[0-9]*{NC}/
syntax match rbt_nc_pin /RBT_NC/
syntax match rbt_nc_bus /[0-9]*{RBT_NC}/
syntax match tbd /TBD/

syntax match rbt_vcc_pin /RBT_VCC/
syntax match rbt_vcc_bus /[0-9]*{RBT_VCC}/
syntax match rbt_gnd_pin /RBT_GND/
syntax match rbt_gnd_bus /[0-9]*{RBT_GND}/

syntax match end_module /^@@@.*/
"************************************* DIVER LIST ******************************************
highlight link first_line Include
highlight link stage Statement
highlight link stage_name Statement
highlight link stage_file character 
highlight link substage Type
"highlight link substage_name Type
highlight link execute Special 
highlight link execute_name  Special
highlight link listfile Constant
highlight link linecomment Comment
"highlight link allcomment Comment
highlight link var1 String
highlight link var2 String
highlight link x_v_list Include
highlight link out_comm Include
highlight link x_v_list2 Include
"highlight link file Error
highlight link dir Error
highlight link star String
"************************************* RABBIT LIST *****************************************
highlight link start_module Constant
highlight link module_name Constant
highlight link instance Constant
highlight link instance_name Constant
highlight link hComment Constant
highlight link input Statement
highlight link output Statement
highlight link inout Statement
highlight link input_Terminal Type
highlight link output_Terminal Type
highlight link inout_Terminal Type

highlight link header Include
highlight link end_module Error
highlight link nc_pin String
highlight link nc_bus String
highlight link rbt_nc_pin Include
highlight link rbt_nc_bus Include
highlight link tbd Error
highlight link rbt_vcc_pin Statement
highlight link rbt_vcc_bus Statement
highlight link rbt_gnd_pin Statement
highlight link rbt_gnd_bus Statement

