<script setup lang="ts">
import { onBeforeMount, ref } from 'vue'
import { getTopStocks } from '@/api/getTopStocks'
import TopStocksItem from '@/components/TopStocksItem.vue'
import TopStocksSummaryItem from '@/components/TopStocksSummaryItem.vue'

const topStocks = ref(null)
const totalMarketCap = getKeySum('market_cap')
const minPriceFilter = ref(0)

function getKeySum(key: string): number {
  return topStocks.value.reduce((acc, cur) => {
    return acc + cur[key]
  }, 0)
}

function getOldestAndNewestIPOs(): string {
  const stocksSorted = topStocks.value.toSorted((a, b) => {
    return a.ipo.getTime() - b.ipo.getTime()
  }) ?? []

  const first = stocksSorted[0].ipo
  const last = stocksSorted[stocksSorted.length - 1].ipo
  return [first, last]
}

onBeforeMount(() => {
  getTopStocks().then(res => {
    topStocks.value = res
  })
})
</script>

<template>
  <div class="m-2.5 flex flex-col gap-6 rounded-[5px] bg-surface p-6">
    <div class="mb-3 flex flex-col gap-1.5">
      <div class="mb-2 flex flex-col">
        <div class="text-2xl">
          Filters
        </div>
        <div>
          Filters apply to summary items and list
        </div>
      </div>
      <div class="flex flex-col gap-1">
        <label class="font-semibold" for="min-price">Min Price</label>
        <input id="min-price" v-model="minPriceFilter" class="field" type="number">
      </div>
    </div>
    <div class="flex justify-between">
      <TopStocksSummaryItem label="Total Volume" :value="getKeySum('volume')" />
      <TopStocksSummaryItem :value="totalMarketCap" />
      <TopStocksSummaryItem label="Average Stock Price" :value="getKeySum('price') / topStocks?.length" />
      <TopStocksSummaryItem label="Oldest IPO" :value="getOldestAndNewestIPOs()[0]" />
      <TopStocksSummaryItem label="Newest IPO" :value="getOldestAndNewestIPOs()[1]" />
    </div>
    <div class="flex flex-col gap-1.5">
      <TopStocksItem v-for="stock in topStocks.filter((stock) => stock.price > minPriceFilter)" :item="stock" />
    </div>
  </div>
</template>