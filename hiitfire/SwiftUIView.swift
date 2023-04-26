import SwiftUI

struct ContentView: View {
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count = 0
    @State var isTimerRunning = false
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 150, height: 150)
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 150, height: 150)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1.0))
                Text("\(count)")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
            }
            .padding(.bottom, 50)
            
            HStack {
                if !isTimerRunning {
                    Button(action: {
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        self.isTimerRunning = true
                    }) {
                        Text("Start")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        self.timer.upstream.connect().cancel()
                        self.isTimerRunning = false
                    }) {
                        Text("Stop")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                
                Button(action: {
                    self.timer.upstream.connect().cancel()
                    self.count = 0
                    self.isTimerRunning = false
                    self.progress = 0.0
                }) {
                    Text("Reset")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                
            }.padding()
        }
        .onReceive(timer) { _ in
            if self.isTimerRunning {
                self.count += 1
                self.progress = CGFloat(Double(self.count) / 60.0) // Convierte segundos a minutos
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

