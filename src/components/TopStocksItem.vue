<script setup lang="ts">
defineProps<{ item: any }>()
</script>

<template>
  <div class="flex flex-col gap-3 rounded-[5px] bg-card p-4">
    <div class="font-bold">
      <span>{{ item.symbol }}</span>
      <span> - {{ item.company_name }}</span>
      <div class="text-sm font-normal text-card-muted">
        {{ item.description }}
      </div>
    </div>
    <div class="flex flex-wrap gap-5">
      <div class="flex gap-1">
        <span class="font-semibold">Price</span>
        <span>{{ item.price }}</span>
      </div>
      <div class="flex gap-1">
        <span class="font-semibold">Exchange</span>
        <span>{{ item.exchange }}</span>
      </div>
      <div class="flex gap-1">
        <span class="font-semibold">Industry</span>
        <span>{{ item.industry }}</span>
      </div>
      <div class="flex gap-1">
        <span class="font-semibold">CEO</span>
        <span>{{ item.ceo }}</span>
      </div>
      <div class="flex gap-1">
        <span class="font-semibold">IPO</span>
        <span>{{ item.ipo }}</span>
      </div>
    </div>
  </div>
</template>
