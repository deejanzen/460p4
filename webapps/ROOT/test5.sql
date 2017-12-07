SELECT (SUM(yuanma.Part.Price) + yuanma.Department.basePrice) as totalCost
FROM (yuanma.ContractOrder
LEFT JOIN yuanma.Build ON yuanma.ContractOrder.OrderNo=yuanma.Build.OrderNo
LEFT JOIN yuanma.Part ON yuanma.Build.PartNo=yuanma.Part.PartNo
LEFT JOIN yuanma.Department ON yuanma.ContractOrder.DeptName=yuanma.Department.DeptName
GROUP BY yuanma.ContractOrder.OrderNo;