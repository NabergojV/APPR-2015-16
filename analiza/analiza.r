# 4. faza: Analiza podatkov

## Priseljeni, starostne skupine skupaj, državljanstvo skupaj, ločeno po spolu:

priseljenimoski <- priseljeni %>% filter(starostna.skupina == "25-29 let") %>% 
                    filter(državljanstvo=="Selitve - SKUPAJ")  %>%
                    filter(spol=="Moški")

g <- ggplot(priseljenimoski, aes(x=leto, y=stevilka)) + geom_point()
print(g)

h<- g + geom_smooth(method = "lm")
print(h)

kv <- lm(data =priseljenimoski , stevilka ~ leto + I(leto^2))
kv <- g + geom_smooth(method = "lm", formula = y ~ x + I(x^2))
print(kv)

