-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--
--

--  sourcing pywal colors as seen in 
--  https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/pywal.lua

local sep = package.config:sub(1, 1)
local wal_colors_path = table.concat({ os.getenv('HOME'), '.cache', 'wal', 'colors.sh' }, sep)
local wal_colors_file = io.open(wal_colors_path, 'r')

if wal_colors_file == nil then
  modules.utils_notices.add_notice('wal-lush: ' .. wal_colors_path .. ' not found')
  error('')
end

local ok, wal_colors_text = pcall(wal_colors_file.read, wal_colors_file, '*a')
wal_colors_file:close()

if not ok then
  modules.utils_notices.add_notice('wal-lush: ' .. wal_colors_path .. ' could not be read: ' .. wal_colors_text)
  error('')
end

local c = {}

for line in vim.gsplit(wal_colors_text, '\n') do
  if line:match("^[a-z0-9]+='#[a-fA-F0-9]+'$") ~= nil then
    local i = line:find('=')
    local key = line:sub(0, i - 1)
    local value = line:sub(i + 2, #line - 1)
    c[key] = value
  end
end

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl
-- defined colors
local c1 = hsl(c.color1)
local c2 = hsl(c.color2)
local c3 = hsl(c.color3)
local c4 = hsl(c.color4)
local c5 = hsl(c.color5)
local c6 = hsl(c.color6)
local c7 = hsl(c.color7)
local c8 = hsl(c.color8)
local c9 = hsl(c.color9)
local cd1 = c1.da(30)
local cd2 = c2.da(30)
local cd3 = c3.da(30)
local cd4 = c4.da(30)
local cd5 = c5.da(30)
local cd6 = c6.da(30)
local cd7 = c7.da(30)
local cd8 = c8.da(30)
local cd9 = c9.da(30)
local cdd9 = c9.da(60)
local cl1 = c1.li(30)
local cl2 = c2.li(30)
local cl3 = c3.li(30)
local cl4 = c4.li(30)
local cl5 = c5.li(30)
local cl6 = c6.li(30)
local cl7 = c7.li(30)
local cl8 = c8.li(30)
local cl9 = c9.li(30)

local crd = hsl(0,30,35)
local crl = hsl(0,60,65)
local cgd = hsl(75,30,35)
local cgl = hsl(75,60,60)
local cyd = hsl(55,30,35)
local cyl = hsl(55,65,65)
local cyyd = hsl(55,70,20)
local cyyl = hsl(55,70,40)
local grey = hsl(0,0,65)
local shade2 = hsl(50,50,50)


-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
    print('file loaded')
  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    Comment      { fg = c8, gui = "italic" }, -- any comment
    ColorColumn  { bg = cdd9, fg = c4 }, -- used for the columns set with 'colorcolumn'
    Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { bg = cd1, fg = c3 }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { fg = cd6 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = cdd9 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = c4 }, -- directory names (and other special names in listings)
    DiffAdd      { bg = cgd, fg = cgl, gui = "bold" }, -- diff mode: Added line |diff.txt|
    DiffChange   { bg = cyd, fg = cyl, gui = "bold" }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { bg = crd, fg = crl, gui = "bold"  }, -- diff mode: Deleted line |diff.txt|
    DiffText     { bg = cl6, fg = cd6, gui = "bold" }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = c3, gui = "italic" }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { bg = cd2, fg = c5 }, -- error messages on the command line
    VertSplit    { bg = cd9, fg = c1 }, -- the column separating vertically split windows
    Folded       { bg = c1, fg = cd7 }, -- line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    -- SignColumn   { }, -- column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { fg = c4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { bg = cd9, fg = cl4.li(15) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { bg = cd3, fg = c4 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = Question.fg }, -- |more-prompt|
    NonText      { fg = c8 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = c5.li(50) }, -- normal text
    NormalFloat  { bg = c4, fg = c9 }, -- Normal text in floating windows.
    -- NormalN     { }, -- normal text in non-current windows
    Pmenu        { bg = c1, fg = c7 }, -- Popup menu: normal item.
    PmenuSel     { bg = c4, fg = c.color0 }, -- Popup menu: selected item.
    PmenuSbar    { fg = c.color0, fg = c4  }, -- Popup menu: scrollbar.
    PmenuThumb   { fg = c4 }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = cl4, gui = "bolditalic" }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = cl6, fg = c3, gui = "bolditalic" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.

    SpecialKey   { fg = Directory.fg }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { sp = c1 ,gui = "boldundercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    SpellCap     { sp = c3, gui = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { sp = c4, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { sp = c5, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine   { }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    Title        { fg = c6 }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = c2, fg = c7 }, -- Visual mode selection
    VisualNOS    { bg = c6, fg = c8 }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { bg = c7 , fg = c3, gui = "bold"}, -- warning messages
    Whitespace   { fg = c7 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = c3 }, -- (preferred) any constant
    String         { fg = c2 }, --   a string constant: "this is a string"
    Character      { fg = c2 }, --  a character constant: 'c', '\n'
    Number         { fg = cl2 }, --   a number constant: 234, 0xff
    Boolean        { fg = c6 }, --  a boolean constant: TRUE, false
    Float          { fg = c2.li(20) }, --    a floating point constant: 2.3e10

    Identifier     { fg = cl1 }, -- (preferred) any variable name
    Function       { fg = c1, gui = "bolditalic" }, -- function name (also: methods for classes)

    Statement      { fg = c3 }, -- (preferred) any statement
    Conditional    { fg = cl3, gui = "bolditalic" }, --  if, then, else, endif, switch, etc.
    Repeat         { fg = cd3, gui = "bolditalic" }, --   for, do, while, etc.
    Label          { fg = cl3, gui = "underline"  }, --    case, default, etc.
    Operator       { fg = c3  }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = c3  }, --  any other keyword
    Exception      { fg = c3, gui = "bold"  }, --  try, catch, throw

    PreProc        { fg = c5 }, -- (preferred) generic Preprocessor
    Include        { fg = c5 }, --  preprocessor #include
    Define         { fg = c5  }, --   preprocessor #define
    Macro          { fg = c5  }, --    same as Define
    PreCondit      { fg = c5  }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = c4 }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    Structure      { Type }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { fg = c7 }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Added more Groups
    htmlTag       { fg = c7, gui = "bold" },
    htmlEndTag    { fg = c7, gui = "bold" },
    -- htmlTagName  { },
    -- htmlLink     { },
    -- htmlBold     { },
    -- htmlItalic   { },
    -- htmlH1       { },
    -- htmlH2       { },
    -- htmlH3       { },
    -- htmlH4       { },
    -- htmlH5       { },
    -- htmlH6       { },
    NERDTreeDirSlash { fg = c4 },
    NERDTreeExecFile { fg = c7 },
    IndentBlanklineIndent1 { fg = c1 },
    IndentBlanklineIndent2 { fg = c2 },
    IndentBlanklineIndent3 { fg = c3 },
    IndentBlanklineIndent4 { fg = c4 },
    IndentBlanklineIndent5 { fg = c5 },
    IndentBlanklineIndent6 { fg = c6 },
    -- End of added groups


    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    Todo           { bg = cyyl, fg = cyyd, gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- used for highlighting "text" references
    -- LspReferenceRead            { } , -- used for highlighting "read" references
    -- LspReferenceWrite           { } , -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
    -- TSCharacter          { } , -- Character literals: `'a'` in C.
    -- TSComment            { } , -- Line comments and block comments.
    -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    -- TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
    -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
    -- TSConstructor        { } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    -- TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    -- TSFunction           { } , -- Function calls and definitions.
    -- TSFuncBuiltin        { } , -- Built-in functions: `print` in Lua.
    -- TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    -- TSKeyword            { } , -- Keywords that don't fit into other categories.
    -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
    -- TSLabel              { } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSMethod             { } , -- Method calls and definitions.
    -- TSNamespace          { } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSProperty           { } , -- Same as `TSField`.
    -- TSPunctDelimiter     { } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    -- TSPunctBracket       { } , -- Brackets, braces, parentheses, etc.
    -- TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    -- TSString             { } , -- String literals.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    -- TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    -- TSTag                { } , -- Tags like HTML tag names.
    -- TSTagAttribute       { } , -- HTML tag attributes.
    -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
    -- TSText               { } , -- Non-structured text. Like text in a markup language.
    -- TSStrong             { } , -- Text to be represented in bold.
    -- TSEmphasis           { } , -- Text to be represented with emphasis.
    -- TSUnderline          { } , -- Text to be represented with an underline.
    -- TSStrike             { } , -- Strikethrough text.
    -- TSTitle              { } , -- Text that is part of a title.
    -- TSLiteral            { } , -- Literal or verbatim text.
    -- TSURI                { } , -- URIs like hyperlinks or email addresses.
    -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    -- TSDanger             { } , -- Text representation of a danger note.
    -- TSType               { } , -- Type (and class) definitions and annotations.
    -- TSTypeBuiltin        { } , -- Built-in types: `i32` in Rust.
    -- TSVariable           { } , -- Variable names that don't fit into other categories.
    -- TSVariableBuiltin    { } , -- Variable names defined by the language: `this` or `self` in Javascript.
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
