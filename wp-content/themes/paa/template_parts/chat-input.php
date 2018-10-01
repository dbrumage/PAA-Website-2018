 <div class="wrapper-user-input">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <form class="convFormDynamic modal-shadow" id="convForm" name="convForm" action="<?php bloginfo('url') ?>" method="get">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text logo"></span>
                            <span class="input-group-text hamburger-wrapper">
                            <button class="hamburger hamburger--boring" type="button">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                            </span>
                        </div>
                        <input autocomplete="off" class="form-control" id="userInput" name="q" placeholder="" type="text">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary button-submit" type="submit">
                                <div class="button-arrow"></div>
                            </button>
                        </div>
                    </div>
                </form>
                <?php include "menu.php"; ?>
            </div>
        </div>
    </div>
</div>