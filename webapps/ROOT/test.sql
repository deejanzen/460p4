SELECT yuanma.Part.PartNo, yuanma.Part.PartName, yuanma.Part.Price
FROM (yuanma.Build
JOIN yuanma.Part ON yuanma.Build.partNo=yuanma.Part.PartNo)
WHERE yuanma.Build.ORDERNO='ORD0001';