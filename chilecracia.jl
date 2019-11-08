
#this code not compile. It's a reesume of commands for processing .csv files of chilecracia


using DataFrames

select  = readtable("data_survey_dump.csv")
 name = readtable("chilecracia_ids.tsv")

select  = dropmissing(select, disallowmissing=true)
name  = dropmissing(name, disallowmissing=true)

 select=[select.selected]
select=select[1]

#verificar si name.id es array{Int64,1}

d=Dict([(i,count(x->x==i,select)) for i in name.id])    #veces seleccionado

A = Array{Float64,2}(undef, 129, 1)
 for i = 1:129
       A[i]=get(d,i,0)
       end
pie([name.nombre_corto],[A] , title = "some pie")




-----------------------			#other code


bar([data.name],[data.rate],xrotation=90, xticks=(1:109,data.name),xtickfont = font(4, "Courier"),dpi=170)

#plot
