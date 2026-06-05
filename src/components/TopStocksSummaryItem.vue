<script setup lang="ts">
defineProps<{ label: string, value: number }>()
</script>

<template>
  <div class="flex flex-col">
    <div class="font-bold">
      {{ label }}
    </div>
    <div class="text-[2rem]">
      {{ `$${value}`.toLocaleString() }}
    </div>
  </div>
</template>
