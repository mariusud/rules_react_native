"""A minimal rule that records Metro bundle inputs for tutorial development."""

def _metro(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".out")
    content = "Entry point: {}\nPlatform: {}\nSources:\n{}\n".format(
        ctx.file.entry_point.path,
        ctx.attr.platform,
        "\n".join([src.path for src in ctx.files.srcs]),
    )
    ctx.actions.write(
        output = out,
        content = content,
    )
    return [DefaultInfo(files = depset([out]))]

metro_binary = rule(
    implementation = _metro,
    attrs = {
        "entry_point": attr.label(allow_single_file = True, mandatory = True),
        "srcs": attr.label_list(allow_files = True),
        "platform": attr.string(
            mandatory = True,
            values = ["ios", "android"],
        ),
    },
)
