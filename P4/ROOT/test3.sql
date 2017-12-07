SELECT subq1.custno, SUM(subq2.sumPrice)+SUM(subq2.basePrice) as totalSpent
FROM (SELECT yuanma.customer.custno, yuanma.ContractOrder.orderno
FROM (yuanma.customer
JOIN yuanma.Contract on yuanma.Customer.custNo=yuanma.Contract.custno
JOIN yuanma.ContractOrder on yuanma.ContractOrder.contrNo=yuanma.Contract.contrNo)
WHERE yuanma.ContractOrder.status!='Inactive') subq1
JOIN
(SELECT SUM(yuanma.Part.Price) as sumPrice, yuanma.Department.basePrice, yuanma.ContractOrder.OrderNo
FROM (yuanma.ContractOrder
LEFT JOIN yuanma.Build ON yuanma.ContractOrder.OrderNo=yuanma.Build.OrderNo
LEFT JOIN yuanma.Part ON yuanma.Build.PartNo=yuanma.Part.PartNo
LEFT JOIN yuanma.Department ON yuanma.ContractOrder.DeptName=yuanma.Department.DeptName)
GROUP BY yuanma.ContractOrder.OrderNo, yuanma.Department.basePrice) subq2
ON subq1.orderno=subq2.orderno
GROUP BY subq1.custno
ORDER BY totalSpent DESC;