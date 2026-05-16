
using PhyloNetworks
using SNaQ
using PhyloPlots
using CSV
using DataFrames
using PhyloPlots #run PhyloPlots two times to start
# read in CFs
buckyCF = readtableCF("_CF_all_species.csv")

# read tree
tre = readnewick("camponotus_focal_astral.tre")

# run SNAQ
net0 = snaq!(tre, buckyCF, hmax=0, runs=10, filename="net0_snaq")
net1 = snaq!(net0, buckyCF, hmax=1, runs=10, filename="net1_snaq")
net2 = snaq!(net1, buckyCF, hmax=2, runs=10, filename="net2_snaq")
net3 = snaq!(net2, buckyCF, hmax=3, runs=10, filename="net3_snaq")
net4 = snaq!(net3, buckyCF, hmax=4, runs=10, filename="net4_snaq")
net5 = snaq!(net4, buckyCF, hmax=5, runs=10, filename="net5_snaq")
net6 = snaq!(net5, buckyCF, hmax=6, runs=10, filename="net6_snaq")
net7 = snaq!(net6, buckyCF, hmax=7, runs=10, filename="net7_snaq")

# look at network files to check pseudo-likelihoods and choose which 
# network(s) to plot and bootstrap

# will visualize networks with 1-2 hybridizations (net1, net2)

# read in network
net1 = readnewick("net1_snaq.out") 
net2 = readnewick("net2_snaq.out") 
net3 = readnewick("net3_snaq.out") 
net4 = readnewick("net4_snaq.out") 
net5 = readnewick("net5_snaq.out") 
net6 = readnewick("net6_snaq.out") 
net7 = readnewick("net7_snaq.out") 

# root
rootatnode!(net1, "new")
rootatnode!(net2, "new")
rootatnode!(net3, "new")
rootatnode!(net4, "new")
rootatnode!(net5, "new")
rootatnode!(net6, "new")
rootatnode!(net7, "new")

# plot
plot(net1, showgamma=true);
plot(net2, showgamma=true);
plot(net3, showgamma=true);
plot(net4, showgamma=true);
plot(net5, showgamma=true);
plot(net6, showgamma=true);
plot(net7, showgamma=true);
