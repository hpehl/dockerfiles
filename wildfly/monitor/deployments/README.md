The grafana dashboard uses concrete host names. Before adding the data inputs, please rename
the host attached to `main-server-group` to `host1` and the host attached to `other-server-group`
to `host2`.

Use the following commands to get the necessary infos:

    :read-children-names(child-type=host)
    /host=<host1>/server=server-one:read-attribute(name=server-group)
    /host=<host2>/server=server-one:read-attribute(name=server-group)

then do

    /host=<host1>:write-attribute(name=name,value=host1)
    /host=<host2>:write-attribute(name=name,value=host2)

and finally

    reload --host=<generated host name1>
    reload --host=<generated host name2>
