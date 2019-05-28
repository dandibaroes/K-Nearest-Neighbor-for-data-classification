function result = accuracy( realLabel , predictLabel)
    conf = useConfusionMatrix(realLabel,predictLabel);
    result = peformance(conf,1);
end