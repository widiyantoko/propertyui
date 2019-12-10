<div class="modal property-modal fade modal-verification-email" tabindex="-1" role="dialog" aria-labelledby="carModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="carModalLabel">
                    ${message(code: 'account.resentVerification.label', default: 'Link reset verifikasi')}
                </h5>
            </div>
            <div class="modal-body">
                <div class="row modal-raw">
                    <div class="col-lg-7 modal-right">
                        <div class="modal-right-content bg-white">
                            <section>
                                <h3>${message(code: 'account.verificationSent.label', default: 'Link verifikasi telah dikirimkan ke {0}', args: [user?.email])}</h3>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn button-sm button-theme" data-dismiss="modal" aria-label="Close">Ok</button>
            </div>
        </div>
    </div>
</div>