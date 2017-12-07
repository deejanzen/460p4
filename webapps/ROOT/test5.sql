SELECT subq2.deptName, sum(subq2.totalCost) as totalProductValue
FROM (SELECT yuanma.ContractOrder.deptName, (SUM(yuanma.Part.Price) + yuanma.Department.basePrice) as totalCost
FROM (yuanma.ContractOrder
LEFT JOIN yuanma.Build ON yuanma.ContractOrder.OrderNo=yuanma.Build.OrderNo
LEFT JOIN yuanma.Part ON yuanma.Build.PartNo=yuanma.Part.PartNo
LEFT JOIN yuanma.Department ON yuanma.ContractOrder.DeptName=yuanma.Department.DeptName)
GROUP BY yuanma.ContractOrder.OrderNo, yuanma.Department.basePrice, yuanma.ContractOrder.deptName) subq2
WHERE subq2.deptName='deptName'
GROUP BY subq2.deptName;