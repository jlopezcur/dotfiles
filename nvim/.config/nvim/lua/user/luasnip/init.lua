local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local types = require "luasnip.util.types"
local rep = require "luasnip.extras".rep
local snippet = ls.parser.parse_snippet

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{"🤔", "Comment"}}
      }
    }
  },
  enable_autosnippets = true
}

ls.add_snippets(
  "javascript",
  {
    snippet("im", "import { $2 } from '$1';"),
    snippet("ex", "export * from '$1';"),
    snippet("co", "console.log('$1');"),
    snippet("exp", "export const ${1:name} = (${2:params}) => $3;"),
    snippet("for", "for (let ${1:i} = 0; $1 < ${2:length}; $1++) {\n\t$3\n}"),
    s(
      "des",
      {
        t("describe('"),
        i(1, "test"),
        t(
          {
            "', () => {",
            "\tconst cases = [",
            "\t\t['Case 1', {}, []],",
            "\t\t['Case 2', {}, []],",
            "\t];",
            "",
            "\tit.each(cases)('%s', (_title, args, expected) => {",
            "\t\texpect("
          }
        ),
        i(2, "func"),
        t(
          {
            "(args)).toEqual(expected);",
            "\t});",
            "});"
          }
        )
      }
    )
  }
)

ls.add_snippets(
  "javascriptreact",
  {
    s(
      "re",
      {
        t(
          {
            "import React from 'react';",
            "import PropTypes from 'prop-types';",
            "",
            "export const "
          }
        ),
        i(1, "Component"),
        t(" = ({ "),
        i(2, "prop"),
        t({" }) => {", "\t"}),
        i(3),
        t({"", "};", "", ""}),
        rep(1),
        t({".propTypes = {", "\t"}),
        rep(2),
        t({": PropTypes.string,", ""}),
        t({"};"})
      }
    )
  }
)

ls.add_snippets(
  "typescriptreact",
  {
    s(
      "re",
      {
        t(
          {
            "import React from 'react';",
            "",
            "interface Props {",
            "\tparam1: string;",
            "}",
            "",
            "export const "
          }
        ),
        i(1, "Component"),
        t(
          {
            ": React.RC<Props> = (props: Props) => {",
            "\treturn <div>{props.chilren}</div>;",
            "};"
          }
        )
      }
    )
  }
)

ls.add_snippets(
  "tex",
  {
    snippet("list", "\\begin{${1|enumerate,itemize|}}\n\t\\item ${2:item}\n\\end{$1}")
  }
)

ls.filetype_extend("javascriptreact", {"javascript"})
ls.filetype_extend("typescript", {"javascript"})
ls.filetype_extend("typescriptreact", {"javascript"})

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
