#import "Class.typ": *


#show: ieee.with(
  title: [#text(smallcaps("Lab #3: Web Application with Genie"))],
  /*
  abstract: [
    #lorem(10).
  ],
  */
  authors:
  (
    (
      name: "Abdelbacet Mhamdi",
      department: [Senior-lecturer, Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "a-mhamdi",
    ),

   
    (
      name: "Saada Iheb",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "saadaiheb5",
    ),
    (
      name: "Nahdi Asma",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "nahdiasma2",
    ),
 
   

  )
  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)

= Introduction
In this lab, we will using *Genie* framework in Julia to control some paramaters of a sine wave, given some adjustble parameters.for that we gonna need to employ julia REPL as in fig1
#figure(
	image("Images/REPL.png", width: 100%, fit: "contain"),
	caption: "Julia REPL"
	) <fig:repl>

= Application 
In this lab we gonna need two support programme to add , change and  generate some sine parametre in GenieFramework beside following the steps underneath .
 #rect(fill: green)[The first programme "app.jl"]
#let code=read("../Codes/web-app/app.jl")
#raw(code, lang: "julia")
#rect(fill: green)[the second programme is "app jl .html"]

#let code=read("../Codes/web-app/app.jl.html")
#raw(code, lang: "html")
#rect(fill: red)[First step:GenieFramework]
- copy the path of web app 
```julia
julia> cd("C:\\Users\\doctor\\Desktop\\infodev\\Codes\\web-app")
```

- Openning Genie in julia REPL
```julia
julia> using GenieFramework
julia> Genie.loadapp() # Load app
```
#figure(
  image("Images\GENIE.PNG", width: 70%),
  caption: [
    Genie oppening
  ],
)
- Gettin GenieFramework link(http://127.0.0.1:8000) by typing this code in julia 
```julia 
julia> up() # Start server```
- copy the link in the browser to get the graphical interface as in figure 3

#figure(
	image("Images/FIRST.png", width: 80%),
	caption: "Genie gaphical interface ",
) 
#rect(fill: red)[Second step:Adjust the phase]
- adding the phase to "app.jl"
```julia 
using GenieFramework
@genietools

@app begin
    
    @in N::Int32 = 1000
    @in amp::Float32 = 0.25
    @in freq::Int32 = 1
    @in ph ::Float32 = 0
    @out my_sine = PlotData()

    @onchange N, amp, freq,ph , begin
        x = range(0, 1, length=N)
        y = amp*sin.(2*π*freq*x.+ph)
        
        my_sine = PlotData(x=x, 
                           y=y, 
                           plot=StipplePlotly.Charts.PLOT_TYPE_LINE)
    end

end
    
@page("/", "app.jl.html")

```
- adding phase to "app jl.html "
```julia 
<div class="st-col col-12 col-sm st-module">
        <p><b>phase</b></p>
	<q-slider v-model="freq" 
		:min="-3.14" :max="3.14" 
		:step="0.314" :label="true"> 
	</q-slider>
    </div>
  
```
- the result in genie graphical interface :
#figure(
	image("Images/PHASE.png", width: 80%),
	caption: "Adding phase parameter",
) 
#rect(fill: red)[third step:Adjust the offset]
- adding the offset to "app.jl"
```julia 
using GenieFramework
@genietools

@app begin
    
    @in N::Int32 = 1000
    @in amp::Float32 = 0.25
    @in freq::Int32 = 1
    @in ph ::Float32 = 0
    @in off::Float32 = 0
    @out my_sine = PlotData()

    @onchange N, amp, freq,ph , begin
        x = range(0, 1, length=N)
   y = amp*sin.(2*π*freq*x.+ph).+off
        
        my_sine = PlotData(x=x, 
                           y=y, 
                           plot=StipplePlotly.Charts.PLOT_TYPE_LINE)
    end

end
    
@page("/", "app.jl.html")

```
- adding offset to "app jl.html "
```julia 
<div class="st-col col-12 col-sm st-module">
        <p><b>offset</b></p>
	<q-slider v-model="freq" 
		:min="-0.5" :max="1" 
		:step="0.1" :label="true"> 
	</q-slider>
    </div>
  
```
- the result in genie graphical interface :
#figure(
	image("Images/offset.png", width: 80%),
	caption: "Adding the offset parameter",
) 