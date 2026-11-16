Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEFA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5D5Jh1d1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yv/i2k/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pDsIq9Hj0Z1uudtdxnTWzZt023tFRmK4nYb/lSKU8Jc=; b=5D5Jh1d1gP3Efb5cjGl05qg4xN
	S9jf4Lj/kdO+91cCLDZ65tipqs6es3PUL/WIovoeQyVAzb+vWIzrh7qXVPc56xekYbYsZs69dA/5Q
	Q2im4WOTMpSWVpJrcGNgw2lw1XaX0d+vcxcYvDH/eIYx6tmn8zeMVMtX89mnBmpVMooDE/xFQnItr
	+AdfiVn5VjzDtBlpmYWXYAcO5sPJM1oBhCmSUUqbIm0ZPddrCrec+Hcoe7/4VcHB4G833NRp4SMhY
	ALmkM2ZikvD2THdsK1KiWYtm+n0XVGWREjlTPkOnvBkDGFL3f/jAvZXWnDbXteA80Wdy9MBcnIW4t
	86p69nPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1EG-00000003Vef-17j6;
	Mon, 16 Nov 2026 18:14:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1EE-00000003VeX-297v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08A78422A1;
	Mon, 16 Nov 2026 18:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E141F000C4;
	Mon, 16 Nov 2026 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852893;
	bh=pDsIq9Hj0Z1uudtdxnTWzZt023tFRmK4nYb/lSKU8Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yv/i2k/k8g3RNz005a766m5TmvJ/WBREV6tP5YrUGzqOECOaLgPdBqL2wOInmQI8M
	 9TJTbOzMiC1ZHhzaR/O+gIwuIov5o9pore6zuchZJGRWN3FpsIP3TjY0e4Cx5KNRZE
	 oXwZj9oU2mwaNBJGSgmszH4/QJqHP8h9kgn45oJPQ9HIR4EazbUkoWkRwtnoHGms97
	 Zpv053OurUMNSAi9JgJi2H41aUZitkZ87dkaS6UW9xOYyOtnuntQg5izG6wOermK62
	 ldRFRI/7YmX6i+VI8N3A1PZKrMRfO5PpcUYoFjEgIwBKldiLqUW0alm0FDUVGJPMGK
	 U2Wb8ddNmjnaw==
Date: Mon, 16 Nov 2026 18:14:50 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver
 removal
Message-ID: <20261116-merry-hypersonic-skink-91109c@sudeepholla>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-3-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116084211.3066460-3-cristian.marussi@arm.com>
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

On Mon, Nov 16, 2026 at 08:42:11AM +0000, Cristian Marussi wrote:
> Once a reboot is initiated following a graceful shutdown request received
> from the SCMI platform server there are a couple of registered notifiers
> and possibly a scheduled delayed work.
> 
> Take care to properly stop, unregister and cleanup all such resources
> when the driver is unbound.
> 
> Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-dbe4eba7-1520-40a1-92e8-8892b6e47c4b
> Tested-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  .../firmware/arm_scmi/scmi_power_control.c    | 76 +++++++++++++++++--
>  1 file changed, 70 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
> index e0680e33180e..b0a10fd92fa6 100644
> --- a/drivers/firmware/arm_scmi/scmi_power_control.c
> +++ b/drivers/firmware/arm_scmi/scmi_power_control.c

[...]

> @@ -296,6 +310,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
>  	struct scmi_system_power_state_notifier_report *er = data;
>  	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
>  
> +	guard(srcu)(&sc->dead_srcu);
> +	if (READ_ONCE(sc->dead))
> +		return NOTIFY_DONE;
> +
>  	if (er->system_state >= SCMI_SYSTEM_MAX ||
>  	    er->system_state == SCMI_SYSTEM_POWERUP) {
>  		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
> @@ -357,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
>  	if (!sc)
>  		return -ENOMEM;
>  
> +	ret = init_srcu_struct(&sc->dead_srcu);
> +	if (ret)
> +		return ret;
> +
>  	sc->state = SCMI_SYSPOWER_IDLE;
>  	mutex_init(&sc->state_mtx);
>  	sc->required_transition = SCMI_SYSTEM_MAX;
> @@ -364,12 +386,53 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
>  	sc->dev = &sdev->dev;
>  	dev_set_drvdata(&sdev->dev, sc);
>  
> +	INIT_DELAYED_WORK(&sc->forceful_work, scmi_forceful_work_func);
>  	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
>  
> -	return handle->notify_ops->devm_event_notifier_register(sdev,
> -							   SCMI_PROTOCOL_SYSTEM,
> -					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> -						       NULL, &sc->userspace_nb);
> +	ret = handle->notify_ops->event_notifier_register(handle, SCMI_PROTOCOL_SYSTEM,
> +							  SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> +							  NULL, &sc->userspace_nb);
> +	if (ret) {
> +		cleanup_srcu_struct(&sc->dead_srcu);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void scmi_syspower_remove(struct scmi_device *sdev)
> +{
> +	struct scmi_handle *handle = sdev->handle;
> +	struct scmi_syspower_conf *sc;
> +	int ret;
> +
> +	sc = dev_get_drvdata(&sdev->dev);
> +	if (!sc)
> +		return;
> +
> +	/* Wait for any notifier to complete and inhibit further processing */
> +	WRITE_ONCE(sc->dead, true);
> +	synchronize_srcu(&sc->dead_srcu);
> +
> +	/*
> +	 * Once here any possible in-flight userspace or reboot notifier
> +	 * will have completed and further notifiers will bailout immediately.
> +	 * Cancel any work which was possibly already scheduled.
> +	 */
> +	cancel_delayed_work_sync(&sc->forceful_work);
> +

To keep it symmetric with probe, do we need cancelling of suspend_work as
well here ?

> +
> +	/* Unregister reboot notifier...if any */
> +	unregister_reboot_notifier(&sc->reboot_nb);
> +
> +	/* Unregister userspace notifier */
> +	ret = handle->notify_ops->event_notifier_unregister(handle,
> +							    SCMI_PROTOCOL_SYSTEM,
> +							    SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> +							    NULL, &sc->userspace_nb);

Just wondering if it is better to stop receiving notifications from firmware
first and then cancel any pending work ? Basically reverse order of probe
for remove.

-- 
Regards,
Sudeep

