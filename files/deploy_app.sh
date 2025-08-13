#!/bin/bash
# Copyright (c) HashiCorp, Inc.
# Expert-grade single-file landing page generator (responsive + accessible)
# Required env: PLACEHOLDER, WIDTH, HEIGHT, PREFIX
# Optional env: TITLE, TAGLINE, THEME (auto|dark|light), CTA_TEXT, CTA_HREF

set -euo pipefail

: "${PLACEHOLDER:?PLACEHOLDER (e.g. source.unsplash.com or loremflickr.com) is required}"
: "${WIDTH:?WIDTH (e.g. 1200) is required}"
: "${HEIGHT:?HEIGHT (e.g. 800) is required}"
: "${PREFIX:?PREFIX (e.g. alice) is required}"

TITLE="${TITLE:-Meow!}"
TAGLINE="${TAGLINE:-A minimal web app with a customizable hero image.}"
THEME="${THEME:-auto}"         # auto | dark | light
CTA_TEXT="${CTA_TEXT:-Get Started}"
CTA_HREF="${CTA_HREF:-#features}"

install -d -m 0755 /var/www/html

cat > /var/www/html/index.html <<'EOM'
<!doctype html>
<html lang="ko" data-theme="auto">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>__TITLE__</title>
  <meta name="description" content="__TAGLINE__">
  <meta name="color-scheme" content="light dark">

  <!-- Open Graph -->
  <meta property="og:title" content="__TITLE__">
  <meta property="og:description" content="__TAGLINE__">
  <meta property="og:type" content="website">

  <style>
    /* ---- Design Tokens ---- */
    :root{
      --maxw: 1100px;
      --radius: 16px;
      --space-1: .5rem;  --space-2: .75rem; --space-3: 1rem; --space-4: 1.5rem;
      --space-5: 2rem;   --space-6: 3rem;   --space-7: 4rem;
      --font-sans: ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Noto Sans KR", Helvetica, Arial, "Apple SD Gothic Neo", "Malgun Gothic", "Segoe UI Emoji", "Segoe UI Symbol";
      /* Light */
      --bg: #0d0f12; --card: #141821; --muted: #778; --text: #eaf1ff; --accent: #7dd3fc; --border: #222838;
    }
    @media (prefers-color-scheme: light){
      :root[data-theme="auto"]{
        --bg: #f8fafc; --card:#ffffff; --muted:#667085; --text:#0b1220; --accent:#2563eb; --border:#e5e7eb;
      }
    }
    :root[data-theme="dark"]{
      --bg: #0d0f12; --card: #141821; --muted: #8891a1; --text: #eaf1ff; --accent: #7dd3fc; --border: #222838;
    }
    :root[data-theme="light"]{
      --bg: #f8fafc; --card:#ffffff; --muted:#667085; --text:#0b1220; --accent:#2563eb; --border:#e5e7eb;
    }

    /* ---- Base ---- */
    * { box-sizing: border-box; }
    html, body { height: 100%; }
    body{
      margin:0; background:var(--bg); color:var(--text); font-family:var(--font-sans);
      line-height:1.6; -webkit-font-smoothing:antialiased; text-rendering:optimizeLegibility;
    }
    a{ color: var(--accent); text-decoration: none; }
    a:hover{ text-decoration: underline; }
    .container{ max-width:var(--maxw); padding: 0 var(--space-4); margin: 0 auto; }

    /* ---- Header ---- */
    header{
      position: sticky; top:0; z-index: 10;
      backdrop-filter: saturate(180%) blur(10px);
      background: color-mix(in oklab, var(--bg), transparent 20%);
      border-bottom: 1px solid var(--border);
    }
    .nav{
      display:flex; align-items:center; justify-content:space-between; height:64px;
    }
    .brand{display:flex; align-items:center; gap: .75rem; font-weight:700;}
    .brand-mark{
      width:34px; height:34px; border-radius:10px; display:grid; place-items:center;
      background: linear-gradient(135deg, color-mix(in oklab, var(--accent), #fff 10%), color-mix(in oklab, var(--accent), #000 20%));
      box-shadow: 0 8px 24px color-mix(in oklab, var(--accent), #000 70%);
      color:#001018; font-weight:900;
    }
    .nav a.btn{
      display:inline-block; padding:.6rem 1rem; border:1px solid var(--border);
      background: color-mix(in oklab, var(--card), #000 2%);
      border-radius: 999px; text-decoration:none;
    }

    /* ---- Hero ---- */
    .hero{ padding: clamp(3rem, 6vw, 6rem) 0; }
    .hero-grid{
      display:grid; gap: var(--space-6);
      grid-template-columns: 1.1fr 1fr;
    }
    @media (max-width: 960px){
      .hero-grid{ grid-template-columns: 1fr; }
    }
    .h-title{ font-size: clamp(2rem, 3.5vw, 3rem); line-height:1.15; margin:0 0 var(--space-3); }
    .h-sub{ color: var(--muted); margin:0 0 var(--space-5); max-width: 60ch;}
    .cta{
      display:flex; gap: var(--space-3); flex-wrap: wrap;
    }
    .btn{
      display:inline-block; border:none; cursor:pointer; font-weight:700;
      border-radius: 14px; padding: .85rem 1.15rem;
      background: var(--accent); color: white; box-shadow: 0 8px 24px color-mix(in oklab, var(--accent), #000 70%);
    }
    .btn.secondary{
      background: transparent; color: var(--text); border: 1px solid var(--border); box-shadow:none;
    }

    /* ---- Card / Image ---- */
    .card{
      background: var(--card); border: 1px solid var(--border);
      border-radius: var(--radius); overflow: clip;
      box-shadow: 0 12px 32px rgba(0,0,0,.25);
    }
    figure{
      margin:0; display:grid; place-items:center; aspect-ratio: __WIDTH__ / __HEIGHT__;
      background: color-mix(in oklab, var(--card), #000 15%);
    }
    .hero-img{
      width: 100%; height: auto; display:block; object-fit: cover;
      aspect-ratio: __WIDTH__ / __HEIGHT__;
    }
    figcaption{
      padding: var(--space-3) var(--space-4); color: var(--muted); font-size:.95rem; border-top: 1px solid var(--border);
    }

    /* ---- Features ---- */
    section#features{ padding: var(--space-7) 0; }
    .features{
      display:grid; gap: var(--space-4);
      grid-template-columns: repeat(3, 1fr);
    }
    @media (max-width: 960px){
      .features{ grid-template-columns: 1fr; }
    }
    .feature{
      background: var(--card); border:1px solid var(--border); border-radius: var(--radius);
      padding: var(--space-5);
    }
    .feature h3{ margin:.25rem 0 var(--space-2); }
    .mono{ font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace; }

    /* ---- Footer ---- */
    footer{
      padding: var(--space-6) 0; color: var(--muted); border-top:1px solid var(--border);
    }
    .tiny{ font-size:.85rem; color: var(--muted); }
    .sr-only{ position:absolute; width:1px; height:1px; padding:0; margin:-1px; overflow:hidden; clip:rect(0,0,0,0); white-space:nowrap; border:0;}
  </style>
</head>
<body>
  <header>
    <div class="container nav" role="navigation" aria-label="주요">
      <div class="brand">
        <span class="brand-mark" aria-hidden="true">R</span>
        <span>__PREFIX__'s App</span>
      </div>
      <nav class="actions">
        <a class="btn" href="__CTA_HREF__">시작하기</a>
      </nav>
    </div>
  </header>

  <main>
    <section class="hero">
      <div class="container hero-grid">
        <div>
          <h1 class="h-title">__TITLE__</h1>
          <p class="h-sub">__TAGLINE__</p>
          <div class="cta">
            <a class="btn" href="__CTA_HREF__">__CTA_TEXT__</a>
            <a class="btn secondary" href="#about">자세히 보기</a>
          </div>
          <p class="tiny" style="margin-top:1rem;">테마: <span id="themeLabel">auto</span> · 이미지는 플레이스홀더로 동적으로 로드됩니다.</p>
        </div>

        <div class="card">
          <figure>
            <img
              class="hero-img"
              src="http://__PLACEHOLDER__/__WIDTH__/__HEIGHT__"
              width="__WIDTH__" height="__HEIGHT__"
              alt="동적으로 불러온 플레이스홀더 이미지"
              loading="lazy" decoding="async" />
            <figcaption>
              <span class="mono">http://__PLACEHOLDER__/__WIDTH__/__HEIGHT__</span>
            </figcaption>
          </figure>
        </div>
      </div>
    </section>

    <section id="features">
      <div class="container">
        <div class="features">
          <article class="feature">
            <h3>간단한 배포</h3>
            <p>단일 HTML 파일로 구성되어 Nginx/Apache 어디에서든 즉시 서비스 가능합니다.</p>
          </article>
          <article class="feature">
            <h3>접근성 고려</h3>
            <p>명도 대비, 대체 텍스트, 키보드 포커스 흐름 등 기본 접근성 원칙을 반영했습니다.</p>
          </article>
          <article class="feature">
            <h3>테마 지원</h3>
            <p><code class="mono">THEME=auto|dark|light</code> 로 강제 테마를 지정할 수 있습니다.</p>
          </article>
        </div>
        <div id="about" class="tiny" style="margin-top:1.25rem;">
          본 페이지는 데모용으로, 텍스트와 이미지를 원하는 내용으로 손쉽게 교체할 수 있습니다.
        </div>
      </div>
    </section>
  </main>

  <footer role="contentinfo">
    <div class="container">
      <div>© <span id="year"></span> __PREFIX__ • All rights reserved.</div>
    </div>
  </footer>

  <noscript><div class="container tiny">이 페이지는 자바스크립트 없이도 동작하지만, 일부 동적 표기가 제한됩니다.</div></noscript>

  <script>
    (function(){
      // Apply forced theme if set via data-theme attribute
      var html = document.documentElement;
      var forced = "__THEME__";
      if(["dark","light"].includes(forced)) html.setAttribute("data-theme", forced);
      document.getElementById("themeLabel").textContent = html.getAttribute("data-theme");
      document.getElementById("year").textContent = new Date().getFullYear();
      // Set OG image dynamically (not all crawlers will execute this)
      var og = document.querySelector('meta[property="og:image"]');
      if(!og){
        og = document.createElement('meta'); og.setAttribute('property','og:image');
        document.head.appendChild(og);
      }
      og.setAttribute('content', 'http://__PLACEHOLDER__/__WIDTH__/__HEIGHT__');
    })();
  </script>
</body>
</html>
EOM

# Post-process replacements (safe sed with delimiter '|')
sed -i \
  -e "s|__TITLE__|${TITLE//|/\\|}|g" \
  -e "s|__TAGLINE__|${TAGLINE//|/\\|}|g" \
  -e "s|__PLACEHOLDER__|${PLACEHOLDER//|/\\|}|g" \
  -e "s|__WIDTH__|${WIDTH//|/\\|}|g" \
  -e "s|__HEIGHT__|${HEIGHT//|/\\|}|g" \
  -e "s|__PREFIX__|${PREFIX//|/\\|}|g" \
  -e "s|__CTA_TEXT__|${CTA_TEXT//|/\\|}|g" \
  -e "s|__CTA_HREF__|${CTA_HREF//|/\\|}|g" \
  -e "s|__THEME__|${THEME//|/\\|}|g" \
  /var/www/html/index.html

echo "✔ Web page generated at /var/www/html/index.html"
