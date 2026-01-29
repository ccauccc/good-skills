import { Button } from '@/components/ui/button'
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from '@/components/ui/card'

function App() {
  return (
    <div className="min-h-screen bg-background p-8">
      <h1 className="text-4xl font-bold mb-6 text-foreground">{{PROJECT_NAME}}</h1>
      <Card className="max-w-md">
        <CardHeader>
          <CardTitle>Welcome</CardTitle>
          <CardDescription>
            Your new React app is ready. Start building!
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <p className="text-muted-foreground">
            Edit <code className="bg-muted px-1 py-0.5 rounded">src/App.tsx</code> to get started.
          </p>
          <Button>Get Started</Button>
        </CardContent>
      </Card>
    </div>
  )
}

export default App