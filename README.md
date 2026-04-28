<!-- MeshOS Keygen -- drop-in widget. Paste anywhere. -->
<div id="meshos-keygen" style="font-family:monospace;max-width:420px;padding:1rem;background:#0a0f0a;color:#c8ffcf;border:1px solid #39ff7c;border-radius:4px;">
  <div style="color:#39ff7c;margin-bottom:0.5rem;font-size:0.85rem;letter-spacing:0.1em;">MESHOS KEYGEN</div>
  <input id="mk-in" type="text" placeholder="android id / device id"
         style="width:100%;padding:0.5rem;background:#000;color:#39ff7c;border:1px solid #1a2a1a;font-family:inherit;box-sizing:border-box;" />
  <button id="mk-go"
          style="margin-top:0.5rem;width:100%;padding:0.5rem;background:transparent;color:#39ff7c;border:1px solid #39ff7c;font-family:inherit;cursor:pointer;letter-spacing:0.1em;">GENERATE</button>
  <div id="mk-out"
       style="margin-top:0.75rem;padding:0.5rem;background:#000;min-height:1.5rem;text-align:center;letter-spacing:0.2em;color:#39ff7c;"></div>
</div>
<script>
(function(){
  function gen(id){
    var s = id.replace(/[:\- \\]/g, ''), h = 0;
    for (var i = 0; i < s.length; i++) h = (h * 33 + s.charCodeAt(i)) >>> 0;
    var b = [((h >>> 24) & 0xFF) ^ 0x4D,
             ((h >>> 16) & 0xFF) ^ 0x43,
             ((h >>>  8) & 0xFF) ^ 0x50,
             ( h         & 0xFF) ^ 0x50];
    return b.map(function(x){ return x.toString(16).padStart(2, '0'); }).join('');
  }
  var i = document.getElementById('mk-in'),
      b = document.getElementById('mk-go'),
      o = document.getElementById('mk-out');
  function run(){
    var v = i.value.trim();
    o.textContent = v ? gen(v) : '// enter an id';
  }
  b.addEventListener('click', run);
  i.addEventListener('keydown', function(e){ if (e.key === 'Enter') run(); });
})();
</script>
