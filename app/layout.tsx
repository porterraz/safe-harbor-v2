import type { Metadata, Viewport } from 'next'
import { Nunito, DM_Sans } from 'next/font/google'

import './globals.css'

const _nunito = Nunito({
  subsets: ['latin'],
  variable: '--font-nunito',
})

const _dmSans = DM_Sans({
  subsets: ['latin'],
  variable: '--font-dm-sans',
})

export const metadata: Metadata = {
  title: 'SafeHarbor - Anonymous Mental Health Support for Students',
  description:
    'A privacy-first mental health companion for university students. No account needed. Track your mood, find resources, and get help when you need it.',
}

export const viewport: Viewport = {
  themeColor: '#6b9a7d',
  width: 'device-width',
  initialScale: 1,
  maximumScale: 1,
  userScalable: false,
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en" className={`${_nunito.variable} ${_dmSans.variable}`}>
      <body className="font-sans antialiased">{children}</body>
    </html>
  )
}
