<script lang="ts" setup>
import { ref } from 'vue'
import { useMainStore } from '@/store'
import { logger } from '@/utils/logger'

const mainStore = useMainStore()

const email = ref('qesandbox@gmail.com')
const password = ref('')

async function loginEmailPassword(): Promise<void> {
  try {
    await mainStore.loginEmailPass({ email: email.value, password: password.value })
  } catch (ex) {
    logger.error(ex.message)
  }
}
</script>

<template>
  <div>
    <div class="mb-2.5">
      email: <input id="email" v-model="email" class="field" type="text" label="Email">
    </div>
    <div class="mb-2.5">
      password: <input id="password" v-model="password" class="field" type="text" label="Password">
    </div>

    <div class="mb-5">
      username is: qesandbox@gmail.com
    </div>
    <div class="mb-5">
      password is: test123
    </div>
    <button id="sign-in-button-manual" class="btn mx-auto" type="button" @click="loginEmailPassword">
      login with email and password
    </button>
  </div>
</template>