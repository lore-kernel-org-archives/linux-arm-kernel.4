Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7342B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pKibRtnb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIlInLX0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2k2NEly1JslwutfN2kmamMP4TPSeSDUKck630Kcz9aM=; b=pKibRtnbin+fXweTE5MuTRf2Bp
	DxpYS9IzA0OTApWjCBmhypNNZgCzTVUZrJMoYs6EeDboij4gV68c2r5bDayA9JwFVC9W4yPqecdNv
	mhlb8O/n0RUa5ckj7FaOQmGFeDg84MQChL/Kh/RfXhHaz3Dbrdn1FfrD2BNZGdFhO5SHhOkefyzy7
	fvsg6ONi+wM+S8LQaoGNWh9fCTj0ZqOch8W/qtZLni6QxsNqw/WQo2Y1dqlLKVKWDy167T/Ada1oF
	m38rYg4ZtRRU1/sCXz+xLvCRHOoJ6uw3XSX6SscFMafaDYKJryXLZdtFztD5/IpK0mRTUtUFRWZ5e
	B2hY8vzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Ov-00000003XuD-04f6;
	Mon, 16 Nov 2026 18:25:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Ou-00000003Xu3-1D6X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:25:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE7C74465C;
	Mon, 16 Nov 2026 18:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450671F000C4;
	Mon, 16 Nov 2026 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853555;
	bh=2k2NEly1JslwutfN2kmamMP4TPSeSDUKck630Kcz9aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hIlInLX0k4w7S9z9er1Q+mK2xoyvxq3xh+z63yVdJBnNG1U7r51BKt1DyyHsOsN0w
	 RP8jV9+5ZAmahdrePt1/3Fw0FSSqn0IBhBwctzCVpF103eFLuQwKqdqaAjiGS0ch19
	 SNJpB+sZgd+hzNoOlCS6wbYEZz1qkbUBtbKY5/2qh84NMplyZPHvuh1raEQ9ESeFiZ
	 bKh+WRf9x/Ya98gQj2KbEnNNcAowoEc868bUukPvDhhi16J+nsVPMwo5rV4DOa3CG7
	 umXc4/9dXU1ezRRtaQZLBXRbuJTxTKZanti9GZe9i2zyHSy9mHe2uqPMv+6dIxK+Og
	 bWhd6VF0CntMw==
Date: Mon, 16 Nov 2026 18:25:52 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Chengyu Liu <lui2012qwq@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
Message-ID: <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116084211.3066460-2-cristian.marussi@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 08:42:10AM +0000, Cristian Marussi wrote:
> From: Chengyu Liu <lui2012qwq@gmail.com>
> 
> scmi_reboot_notifier() calls cancel_delayed_work_sync() while holding
> sc->state_mtx, but the work it waits on - scmi_forceful_work_func() -
> takes the same mutex.  If a forceful transition work is in flight when
> the reboot notifier fires, the notifier holds the lock and waits for
> the callback while the callback waits for the lock: deadlock, and the
> reboot wedges.
> 
> Moving the cancel outside the lock is not sufficient on its own, as the
> callback also calls unregister_reboot_notifier() unconditionally, which
> blocks on the reboot chain rwsem (down_write vs. the in-progress
> chain's down_read) while the notifier waits for the callback - the
> deadlock would just move to a different lock.  Fix both sides:
> 
> - Notifier: compute the decision under state_mtx, drop the lock, then
>   cancel.  A callback that slips in between sees state ==
>   SCMI_SYSPOWER_REBOOTING (not IN_PROGRESS), skips the forceful
>   request and finishes, so the cancel cannot miss it.  (The callback's
>   own system_state early-return does not cover a work item that
>   started before the reboot began: kernel_restart_prepare() runs the
>   notifier chain before setting system_state.)
> 
> - Callback: only unregister the reboot notifier when actually forcing
>   the transition - that is the only case that needs it, because the
>   forceful kernel_restart()/kernel_power_off() would otherwise
>   re-enter scmi_reboot_notifier and self-deadlock on state_mtx.  When
>   the state is not IN_PROGRESS there is nothing to force, and skipping
>   the unregister keeps the callback from blocking on the reboot chain
>   rwsem while the notifier waits for it.
> 
> Found by static analysis.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
> [Cristian: drop lock before triggering forceful reboot (needs_forceful)]
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  .../firmware/arm_scmi/scmi_power_control.c    | 26 ++++++++++++++-----
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
> index e791a206768c..e0680e33180e 100644
> --- a/drivers/firmware/arm_scmi/scmi_power_control.c
> +++ b/drivers/firmware/arm_scmi/scmi_power_control.c
> @@ -121,6 +121,7 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
>  				unsigned long reason, void *__unused)
>  {
>  	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
> +	bool cancel_work;
>  
>  	mutex_lock(&sc->state_mtx);
>  	switch (reason) {
> @@ -138,11 +139,18 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
>  		break;
>  	}
>  
> -	if (sc->state == SCMI_SYSPOWER_REBOOTING) {
> +	cancel_work = sc->state == SCMI_SYSPOWER_REBOOTING;
> +	mutex_unlock(&sc->state_mtx);
> +
> +	if (cancel_work) {
>  		dev_dbg(sc->dev, "Reboot in progress...cancel delayed work.\n");
> +		/*
> +		 * cancel_delayed_work_sync() waits for a running
> +		 * scmi_forceful_work_func(), which takes state_mtx - it must
> +		 * not be called with the lock held.
> +		 */
>  		cancel_delayed_work_sync(&sc->forceful_work);

Sashiko still complains about the deadlock.

How about changing this to non-sync cancel_delayed_work() so that it doesn't
wait and deadlock like it complains ?

>  	}
> -	mutex_unlock(&sc->state_mtx);
>  
>  	return NOTIFY_OK;
>  }
> @@ -181,6 +189,7 @@ static void scmi_forceful_work_func(struct work_struct *work)
>  {
>  	struct scmi_syspower_conf *sc;
>  	struct delayed_work *dwork;
> +	bool needs_forceful;
>  
>  	if (system_state > SYSTEM_RUNNING)
>  		return;
> @@ -188,13 +197,16 @@ static void scmi_forceful_work_func(struct work_struct *work)
>  	dwork = to_delayed_work(work);
>  	sc = dwork_to_sconf(dwork);
>  
> -	dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
>  	mutex_lock(&sc->state_mtx);
> -	/* avoid deadlock by unregistering reboot notifier first */
> -	unregister_reboot_notifier(&sc->reboot_nb);
> -	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS)
> -		scmi_request_forceful_transition(sc);
> +	needs_forceful = sc->state == SCMI_SYSPOWER_IN_PROGRESS;
>  	mutex_unlock(&sc->state_mtx);
> +
> +	if (needs_forceful) {
> +		dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
> +		/* avoid deadlock by unregistering reboot notifier first */
> +		unregister_reboot_notifier(&sc->reboot_nb);

And re-evaluate needs_forceful again here after un-registration before
calling below forced transition ?

-- 
Regards,
Sudeep

