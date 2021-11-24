local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local types = require("luasnip.util.types")

-- Every unspecified option will be set to the default.
ls.config.set_config(
  {
    history = true,
    -- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = {{"choiceNode", "Comment"}}
        }
      }
    },
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true
  }
)

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
  return args[1]
end

ls.snippets = {
  all = {},
  javascript = {
    s("im", {t("import { "), i(0), t(" } from '"), i(1), t("';")}),
    s("exp", {t("export * from '"), i(1), t("';")}),
    s(
      "co",
      {
        t("const "),
        i(1, "name"),
        t(" = "),
        i(2, "value"),
        t(";")
      }
    ),
    s(
      "cof",
      {
        t("const "),
        i(1, "name"),
        t(" = ("),
        i(2),
        t({") => {", "\t"}),
        i(3),
        t({"", "};"})
      }
    ),
    s(
      "des",
      {
        t("import { "),
        i(2),
        t(" } from '"),
        i(1),
        t({"';", ""}),
        t(
          {
            "",
            "const cases = [",
            "\t[",
            "\t\t'Case 1',",
            "\t\t{},",
            "\t\t[]",
            "\t]",
            "];",
            ""
          }
        ),
        t({"", "describe('"}),
        f(copy, 2),
        t(
          {
            "', () => {",
            "\tit.each(cases)('%s', (_title, args, expected) => {",
            "\t\texpect("
          }
        ),
        f(copy, 2),
        t(
          {
            "(args)).toEqual(expected);",
            "\t});",
            "});"
          }
        )
      }
    )
  },
  javascriptreact = {
    s(
      "re",
      {
        t({"import React from 'react';", "import PropTypes from 'prop-types';"}),
        t({"", "", "export const "}),
        i(1, "Component"),
        t(" = ({ "),
        i(2, "prop"),
        t({" }) => {", "\t"}),
        i(3),
        t({"", "};", "", ""}),
        f(copy, 1),
        t({".propTypes = {", "\t"}),
        f(copy, 2),
        t({": PropTypes.string,", ""}),
        t({"};"})
      }
    )
  },
  rust = {},
  tex = {
    s(
      "enum",
      {
        t({"\\begin{enumerate}", "\t\\item "}),
        i(1, "Item"),
        t({"", "\\end{enumerate}"})
      }
    )
  }
}

ls.filetype_extend("javascriptreact", {"javascript"})
