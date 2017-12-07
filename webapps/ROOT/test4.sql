SELECT yuanma.Department.deptName, yuanma.Department.model, COUNT(yuanma.ContractOrder.orderNo) as activeOrderCount
FROM (yuanma.Department
LEFT JOIN yuanma.ContractOrder
ON yuanma.Department.deptName=yuanma.ContractOrder.deptName)
WHERE yuanma.ContractOrder.status='Active'
GROUP BY yuanma.Department.deptName, yuanma.Department.model
ORDER BY activeOrderCount DESC;