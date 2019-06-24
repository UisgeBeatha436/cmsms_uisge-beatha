<div id="modalSearch" class="modal fade" tabindex="-1" role="dialog" aria-label="modalSearchTitle"  aria-hidden="true"> {* originaly was aria-labelledby (replaced all occurrences) *}
  <div class="modal-dialog modal-dialog-center" role="document">
    {* Modal content / modal needs to be on a different place than the section it's been called from *}
    <div class="modal-content" style="background-color: #5f8bb2;">
      <div class="modal-header">
        <h4 class="modal-title text-white">Zoek binnen Uisge Beatha</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h5 class="modal-title text-white">Populaire zoektermen</h5>
        <div id="queries" class="deep-purple-text"></div>
        <form action="zoeken" enctype="multipart/form-data" method="get" style="color:white;">
          <input class="form-control"  type="text" id="zoekForm" name="q" placeholder="Geef zoekterm in" required>
          <input type="submit" value="Ga" formaction="zoeken" id="submit" style="position: absolute; left: -9999px; width: 1px; height: 1px;" tabindex="-1">
          <div class="modal-footer">
            {* <button class="btn btn-primary btn-rounded" id="modalSearchSubmit" type="submit">Zoeken</button> *}
            <button class="btn btn-primary btn-rounded" id="submit" value="Ga" formaction="zoeken" type="submit">Zoeken</button>
            <button class="btn btn-rounded float-left" data-dismiss="modal" aria-hidden="true">Sluit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>