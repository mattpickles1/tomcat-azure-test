<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Security-Policy" content="default-src 'self' https://*.azurewebsites.net;">
        <meta name="referrer" content="no-referrer">
        <meta name="robots" content="noindex,nofollow">
        <title>Azure App Service</title>
    </head>           
<body>
    <div class="container">
        <header>
            <h1>Azure App Service</h1>
            <p>Environment: ${environment}</p>
            <p>Region: ${region}</p>
        </header>
        
        <main>
            <section class="status">
                <h2>System Status</h2>
                <p>Current Time: <%= new Date() %></p>
                <p>Server: <%= request.getServerName() %></p>
                <p>Instance ID: ${instanceId}</p>
            </section>
            
            <section class="monitoring">
                <h2>Monitoring</h2>
                <div id="health-metrics">
                    <script>
                        fetch('/api/health')
                            .then(response => response.json())
                            .then(data => {
                                document.getElementById('health-metrics').innerHTML = `
                                    <p>Memory Usage: ${data.memory}%</p>
                                    <p>CPU Usage: ${data.cpu}%</p>
                                    <p>Response Time: ${data.responseTime}ms</p>
                                `;
                            });
                    </script>
                </div>
            </section>
        </main>
        
        <footer>
            <p>© ${year} Your Company</p>
            <p>Build Version: ${buildVersion}</p>
        </footer>
    </div>
    
    <script src="scripts/app.js"></script>
    <script>
        // Azure Monitor integration
        const appInsights = window.appInsights || function(config) {
            const r = Math.random().toString(36).substring(7, 12);
            config = config || {};
            config.enableDebugLogging = false;
            config.enablePerf = true;
            window.appInsights = {
                queue: [],
                trackPageView: function(name) {
                    this.queue.push({ t: 'pageview', name: name });
                },
                trackEvent: function(name, properties) {
                    this.queue.push({ t: 'event', name: name, properties: properties });
                },
                trackMetric: function(name, value) {
                    this.queue.push({ t: 'metric', name: name, value: value });
                }
            };
            const s = document.createElement('script');
            s.src = 'https://az416426.vo.msecnd.net/scripts/b/ai.2.min.js';
            s.onload = function() {
                const i = window.appInsights;
                i.initialize(config);
                i.queue.forEach(function(t) {
                    if (t.t === 'pageview') i.trackPageView(t.name);
                    else if (t.t === 'event') i.trackEvent(t.name, t.properties);
                    else if (t.t === 'metric') i.trackMetric(t.name, t.value);
                });
            };
            document.getElementsByTagName('head')[0].appendChild(s);
        };
        appInsights({
            instrumentationKey: '${appInsightsKey}'
        });
        appInsights.trackPageView('Home');
    </script>
</body>
</html>
        
