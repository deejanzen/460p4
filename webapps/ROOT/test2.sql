SELECT yuanma.customer.custno, yuanma.ContractOrder.orderno
FROM (yuanma.customer
JOIN yuanma.Contract on yuanma.Customer.custNo=yuanma.Contract.custno
JOIN yuanma.ContractOrder on yuanma.ContractOrder.contrNo=yuanma.Contract.contrNo)
WHERE yuanma.ContractOrder.status!='Inactive';