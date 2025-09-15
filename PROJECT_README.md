# 🏥 AI BAsed Patient Monitoring System

A **cloud-native, real-time patient monitoring platform** that ingests, processes, and analyzes vital signs from connected medical devices. The system not only provides **real-time monitoring dashboards** but also delivers **predictive insights** powered by machine learning, enabling **early detection of potential health issues**.

---

## 🚀 Key Features

- **Real-Time Monitoring**: Continuous ingestion of patient vitals from IoT/edge devices.  
- **Predictive Insights**: ML-driven early warning system for detecting potential health risks.  
- **Microservices Architecture**: Independent, scalable services for edge ingestion, backend APIs, ML inference, and frontend dashboards.  
- **Cloud-Native Deployment**: Fully containerized with Kubernetes + Helm for deployment across cloud platforms.  
- **Streaming Pipeline**: Kafka for event streaming, Redis for fast pub/sub, TimescaleDB for time-series storage.  
- **User-Friendly Dashboards**: Modern Next.js frontend for clinicians and operators.  
- **Secure & Extensible**: Authentication, role-based APIs, modular services, and CI/CD integration.  

---

## 📂 Repository Structure  

```
patient-monitoring-app/
├── edge-gateway/
├── backend-ingestion/
├── model-serving/
├── frontend/
├── infra/
├── .github/workflows/
├── LICENSE
├── PROJECT_README.md
└── Makefile
```

---

## 🛠️ Tech Stack  

- **Edge & Backend**: Python, FastAPI, Kafka, Redis, TimescaleDB  
- **Model Serving**: PyTorch/TensorFlow, FastAPI  
- **Frontend**: Next.js, React, TypeScript, TailwindCSS  
- **Infra**: Docker, Kubernetes, Helm, GitHub Actions (CI/CD)  

---

## ⚙️ Setup Guide  

### 1️⃣ Clone Repository  
```bash
git clone https://github.com/RajatJurel45/AI-Based-Patient-Monitoring-System.git
cd AI-Based-Patient-Monitoring-System
```

### 2️⃣ Local Development (with Docker Compose)  
*(Optional before Kubernetes deployment)*  
```bash
docker-compose up --build
```

### 3️⃣ Cloud Deployment (Kubernetes + Helm)  
```bash
kubectl apply -f infra/k8s/namespace.yaml
helm install patient-monitoring infra/helm/patient-monitoring-chart
```

---

## 🔮 Predictive Insights  

The system includes a **model-serving service** that powers:  
- **Risk scoring** (e.g., cardiac arrest, respiratory failure).  
- **Anomaly detection** on vital signs.  
- **Alerts & notifications** for clinicians.  

Models are trained in `model-serving/training/` and deployed via `model-serving/app.py`.  

---

## 🏗️ System Architecture  

### ASCII Diagram  

```
                ┌────────────────────┐
                │   IoT Devices       │
                │ (Vitals Sensors)    │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │   Edge Gateway      │
                │ (device_emulator)   │
                └─────────┬──────────┘
                          │ Kafka
                          ▼
                ┌────────────────────┐
                │ Backend Ingestion   │
                │  • APIs (FastAPI)   │
                │  • Kafka Consumer   │
                │  • Redis Pub/Sub    │
                │  • TimescaleDB      │
                └─────────┬──────────┘
                          │
         ┌────────────────┴────────────────┐
         ▼                                 ▼
┌────────────────────┐            ┌────────────────────┐
│   Model Serving     │            │   Frontend (UI)     │
│  • Preprocess       │            │  • Next.js Dashboard│
│  • Inference (ML)   │            │  • Live Waveforms   │
│  • Predictive Alerts│            │  • Alerts/Insights  │
└─────────┬──────────┘            └─────────┬──────────┘
          │                                   │
          └───────────────────────────────────┘
                        REST/gRPC APIs
```

### Visual Diagram  

A PNG/SVG version of this architecture is included in `docs/architecture.png` for presentations and technical documentation.  

---

## 👩‍💻 Contributing  

1. Fork the repo & create a feature branch.  
2. Follow the coding style and add tests.  
3. Submit a PR for review.  

---

## 📜 License  

This project is licensed under the **MIT License**.  
