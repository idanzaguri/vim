syntax clear
syntax case match

"syntax match linecomment /#.*$/
syntax match warn1 /[Ww]arn.*/
syntax match ErrorString /Error.*/
syntax match ErrorString /ERROR\S\+/
syntax match ErrorString /Err.*/
syntax match ErrorString /\serror.*/
syntax match time /^#\s*\[RBT \d\d:\d\d:\d\d\]/
syntax match Lint /Lint-.*/

"*************************************** RABBIT ********************************************
"syntax match output /^output*/
"syntax match input /^input*/
"syntax match inout /^inout*/
"syntax match header /^Module.*/
"syntax match end_module /^@@@.*/

"highlight link linecomment Comment
highlight link warn1 String
highlight link Lint String
highlight link ErrorString Error
highlight link time Comment

"#highlight link input Statement
"#highlight link output Statement
"#highlight link inout Statement
"#highlight link header Include
"#highlight link end_module Error
