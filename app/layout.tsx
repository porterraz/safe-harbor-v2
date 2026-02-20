import type { Metadata, Viewport } from 'next'

import './globals.css'

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
    <html lang="en">
      <body className="font-sans antialiased">{children}</body>
    </html>
  )
}
