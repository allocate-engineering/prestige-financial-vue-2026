<script lang="ts" setup>
import { initializeApp } from 'firebase/app'
import { getAuth, onAuthStateChanged } from 'firebase/auth'
import { onMounted } from 'vue'
import LoginPage from '@/pages/LoginPage.vue'
import { useMainStore } from '@/store'

const mainStore = useMainStore()

onMounted(() => {
  const firebaseConfig = {
    apiKey: import.meta.env.VITE_APP_FIREBASE_API_KEY,
    authDomain: import.meta.env.VITE_APP_FIREBASE_AUTH_DOMAIN,
  }

  const firebaseApp = initializeApp(firebaseConfig)
  mainStore.firebase = firebaseApp

  // Exposed for debugging / e2e access from the browser console.
  window.__PRESTIGE__ = { firebase: firebaseApp }

  const auth = getAuth(firebaseApp)

  onAuthStateChanged(auth, (oauth) => {
    mainStore.currentUser = oauth
    mainStore.globalLoading = false
  })

  setTimeout(() => {
    mainStore.globalLoading = false
  }, 5000)
})
</script>

<template>
  <div class="flex w-full grow flex-col items-start justify-start">
    <div id="modal-target" class="z-[100]" />
    <header class="flex w-full min-w-full self-start bg-header px-20 text-[48px] text-brand">
      <div class="flex items-center">
        <img src="@/assets/logo.png" class="mr-2.5 h-10"> Prestige Financial Solutions
      </div>
    </header>

    <div id="sign-in-area" />

    <main v-if="mainStore.globalLoading" class="flex h-full grow flex-col items-center justify-center">
      <img src="@/assets/puff.svg" class="h-[100px]">
    </main>

    <main v-else class="min-h-full w-full grow px-10 py-5">
      <div v-if="mainStore.currentUser">
        currently logged in user: {{ mainStore.currentUser.email }}
      </div>
      <router-view v-if="mainStore.currentUser" />
      <LoginPage v-else />
    </main>

    <footer class="mx-auto flex w-full max-w-full flex-row items-center justify-center border-t-2 border-divider px-[10%] py-2.5 text-center text-sm">
      <div class="grow">
        &copy; Allocate Next Ventures
      </div>
      <div class="justify-self-end opacity-50" />
    </footer>
  </div>
</template>
