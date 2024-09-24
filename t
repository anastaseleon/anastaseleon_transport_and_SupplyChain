Expression for "Set variable" value:
If( length(filter(variables('varGroupedItems'), item()?['Attribute A'] eq items('Apply_to_each')?['Attribute A'])) eq 0,
    union(variables('varGroupedItems'), array(addProperty(json('{}'), 'Attribute A', items('Apply_to_each')?['Attribute A'], 'Count', 1))),
    setProperty(variables('varGroupedItems'), 'Count', add(filter(variables('varGroupedItems'), item()?['Attribute A'] eq items('Apply_to_each')?['Attribute A'])[0]['Count'], 1))
)