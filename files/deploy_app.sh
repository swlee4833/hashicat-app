<!doctype html>
<html lang="ko" data-theme="auto">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>MZ × Ghibli-Inspired • __PREFIX__</title>
    <meta name="description" content="부드러운 지브리 감성 + MZ 취향의 상큼한 랜딩 페이지. 플레이스홀더 이미지 연동." />
    <meta name="color-scheme" content="light dark" />
    <style>
      /* ===== Ghibli-inspired soft palette & MZ-friendly aesthetic ===== */
      :root{
        --sky:#bfe5ff;         /* 밝은 하늘색 */
        --sun:#ffdca8;         /* 햇살 */
        --leaf:#b7e4c7;        /* 연초록 */
        --blossom:#ffd6e7;     /* 벚꽃 핑크 */
        --ink:#0e1726;         /* 잉크색 텍스트 */
        --card:#ffffff;        /* 카드 배경 */
        --muted:#5b667a;       /* 보조 텍스트 */
        --accent:#4f8cff;      /* 포인트 (MZ 취향 쨍한 블루) */
        --shadow: 0 10px 30px rgba(14,23,38,.12);
        --radius: 18px;
        --maxw: 1120px;
      }
      @media (prefers-color-scheme: dark){
        :root{
          --sky:#0b1220;
          --sun:#2a2f3d;
          --leaf:#26453a;
          --blossom:#2f2430;
          --ink:#eaf1ff;
          --card:#141821;
          --muted:#9aa4b2;
          --accent:#7dd3fc;
          --shadow: 0 12px 36px rgba(0,0,0,.4);
        }
      }
      *{box-sizing:border-box}
      html,body{height:100%}
      body{
        margin:0; color:var(--ink); font-family:ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Noto Sans KR", Helvetica, Arial;
        line-height:1.6; -webkit-font-smoothing:antialiased; text-rendering:optimizeLegibility;
        background: linear-gradient(180deg, var(--sky) 0%, #e7f6ff 70%, #ffffff 100%);
      }
      /* gentle animated clouds */
      .clouds{
        position:fixed; inset:0; pointer-events:none; z-index:-1; opacity:.6;
        background:
          radial-gradient(ellipse at 10% 15%, rgba(255,255,255,.9) 0 30%, transparent 31%),
          radial-gradient(ellipse at 60% 10%, rgba(255,255,255,.8) 0 26%, transparent 27%),
          radial-gradient(ellipse at 80% 35%, rgba(255,255,255,.85) 0 22%, transparent 23%),
          radial-gradient(ellipse at 25% 40%, rgba(255,255,255,.9) 0 28%, transparent 29%),
          radial-gradient(ellipse at 70% 70%, rgba(255,255,255,.85) 0 24%, transparent 25%);
        animation: drift 60s linear infinite;
        filter:saturate(120%);
      }
      @keyframes drift{to{transform:translateX(-6%)}}

      .container{max-width:var(--maxw); margin:0 auto; padding:0 20px}

      header{
        position:sticky; top:0; backdrop-filter:saturate(180%) blur(10px);
        background: color-mix(in oklab, var(--sky), transparent 70%);
        border-bottom:1px solid rgba(0,0,0,.06);
      }
      .nav{display:flex; align-items:center; justify-content:space-between; height:72px}
      .brand{display:flex; align-items:center; gap:.8rem; font-weight:800}
      .brand-mark{
        width:40px; height:40px; border-radius:12px; display:grid; place-items:center; color:#0a2540;
        background: conic-gradient(from 220deg, var(--sun), var(--leaf), var(--blossom), var(--sun));
        box-shadow: var(--shadow);
      }
      .actions a{
        display:inline-block; padding:.7rem 1.1rem; border-radius:999px; text-decoration:none; font-weight:700;
        background: var(--accent); color:white; box-shadow: var(--shadow);
      }

      /* hero */
      .hero{ padding:clamp(2.5rem, 5vw, 6rem) 0; }
      .grid{ display:grid; gap:32px; grid-template-columns: 1.1fr 1fr; }
      @media (max-width: 980px){ .grid{ grid-template-columns:1fr } }
      h1{ font-size:clamp(2.2rem, 3.6vw, 3.2rem); line-height:1.15; margin:.2rem 0 1rem; letter-spacing:-.02em }
      .sub{ color:var(--muted); margin:0 0 1.6rem; max-width:60ch }
      .cta{ display:flex; gap:.8rem; flex-wrap:wrap }
      .btn{ display:inline-block; padding:.9rem 1.2rem; border-radius:14px; font-weight:800; text-decoration:none; }
      .btn.primary{ background:var(--accent); color:white; box-shadow: var(--shadow) }
      .btn.ghost{ background:transparent; color:var(--ink); border:1px solid rgba(0,0,0,.1) }

      /* card with hand-drawn feel */
      .card{ background:var(--card); border-radius:var(--radius); box-shadow: var(--shadow); overflow:hidden; border:1px solid rgba(0,0,0,.06) }
      figure{ margin:0 }
      .hero-img{ width:100%; height:auto; display:block; object-fit:cover }
      .meta{ padding:14px 16px; color:var(--muted); font-size:.95rem; }
      .mono{ font-family:ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Courier New", monospace }

      /* feature row */
      section#features{ padding: 56px 0 }
      .features{ display:grid; gap:18px; grid-template-columns:repeat(3,1fr) }
      @media (max-width: 980px){ .features{ grid-template-columns:1fr } }
      .feature{ background:var(--card); border-radius:16px; padding:22px; border:1px solid rgba(0,0,0,.06); box-shadow: var(--shadow) }
      .feature h3{ margin:.2rem 0 .4rem; font-size:1.15rem }

      footer{ padding:48px 0; color:var(--muted); border-top:1px solid rgba(0,0,0,.06) }
    </style>
  </head>
  <body>
    <div class="clouds" aria-hidden="true"></div>
    <header>
      <div class="container nav" role="navigation" aria-label="주요">
        <div class="brand">
          <div class="brand-mark" aria-hidden="true">RP</div>
          <div>__PREFIX__ · MZ × Ghibli</div>
        </div>
        <div class="actions">
          <a href="#features">자세히 보기</a>
        </div>
      </div>
    </header>

    <main>
      <section class="hero">
        <div class="container grid">
          <div>
            <h1>따뜻하고 몽환적인 랜딩, <br/>하지만 현대적으로.</h1>
            <p class="sub">지브리 감성의 부드러운 색감과 MZ 취향의 또렷한 타이포, 그리고 빠른 플레이스홀더 이미지를 결합했습니다. URL 파라미터나 템플릿 치환으로 이미지를 원하는 대로 바꾸세요.</p>
            <div class="cta">
              <a class="btn primary" href="#get-started">빠른 시작</a>
              <a class="btn ghost" href="#features">기능 보기</a>
            </div>
            <p id="get-started" class="sub" style="margin-top:1rem">기본 값은 <span class="mono">http://__PLACEHOLDER__/__WIDTH__/__HEIGHT__</span> 입니다. 배포 스크립트에서 토큰을 치환하거나, 주소창에 <span class="mono">?src=domain&w=1200&h=800&name=rockplace</span> 형태로 지정할 수 있습니다.</p>
          </div>
          <div class="card">
            <figure>
              <img id="heroImg" class="hero-img" src="http://__PLACEHOLDER__/__WIDTH__/__HEIGHT__" width="__WIDTH__" height="__HEIGHT__" alt="플레이스홀더 미리보기" loading="lazy" decoding="async" />
            </figure>
            <div class="meta mono" id="imgMeta">http://__PLACEHOLDER__/__WIDTH__/__HEIGHT__</div>
          </div>
        </div>
      </section>

      <section id="features">
        <div class="container">
          <div class="features">
            <article class="feature">
              <h3>지브리풍 컬러</h3>
              <p>하늘·햇살·초록·벚꽃을 모티프로 차분하고 따뜻한 색 조합. 다크 모드에서도 무드 유지.</p>
            </article>
            <article class="feature">
              <h3>MZ 타이포 & 카드</h3>
              <p>굵은 헤드라인, 둥근 코너, 섀도우로 트렌디함을 살렸습니다. 모든 요소는 반응형.</p>
            </article>
            <article class="feature">
              <h3>빠른 플레이스홀더</h3>
              <p>Unsplash/LoremFlickr/Picsum 등 어떤 소스든 도메인만 바꿔 즉시 적용 가능합니다.</p>
            </article>
          </div>
        </div>
      </section>
    </main>

    <footer role="contentinfo">
      <div class="container">© <span id="y"></span> __PREFIX__</div>
    </footer>

    <script>
      // URL 파라미터로 이미지 소스 제어 (?src=domain&w=1200&h=800&name=xxx)
      (function(){
        const q = new URLSearchParams(location.search);
        const src = q.get('src') || '__PLACEHOLDER__';
        const w = q.get('w') || '__WIDTH__';
        const h = q.get('h') || '__HEIGHT__';
        const name = q.get('name') || '__PREFIX__';
        const img = document.getElementById('heroImg');
        const meta = document.getElementById('imgMeta');
        const y = document.getElementById('y');
        y.textContent = new Date().getFullYear();
        const url = `http://${src}/${w}/${h}`;
        img.src = url; img.width = Number(w)||img.width; img.height = Number(h)||img.height;
        meta.textContent = url;
        document.title = `MZ × Ghibli • ${name}`;
      })();
    </script>
  </body>
</html>
