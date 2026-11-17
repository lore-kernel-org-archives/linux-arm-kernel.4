Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC073606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aackSaOA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=S2uwp4k9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CtprQKaqONIzKnq3zmbcyeT6g/iiSQamtXKbLaCRAvI=; b=aackSaOAuSs+BNLeiMXVAsG1sH
	YZcHxzveU3VY4BQ4cKDGgs0LYjVnNySUX+7AkPk8lF9pLffc6+j9KYoMPKvbmAwXpnx1kwqXbe8ae
	G2GIesaqN2W1QfNx0Wxf4mHYjjHsNfDg78Js+v/H3fhuS4RkdSpE0aa77GKb8hizZ9y47NJ/XBD0Q
	x955jH37jYszi5u2PgNLL4QdKBjqBcWIeLFd35P+vVxdd5a30SK/N4LArgjGY9Mpwxa01aD/7S4dm
	SVA92bcLlCdkYypkxE9KeE2QXkC2zibjLO6yl+ASvZp/NnV2dx7Cmk45RuO2puJ5KcF8quuiTlk78
	+epujeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHTV-00000005Sis-2OsB;
	Tue, 17 Nov 2026 11:35:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHTT-00000005SiC-0AYV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 11:35:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59C31476;
	Tue, 17 Nov 2026 03:35:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFEFE3F763;
	Tue, 17 Nov 2026 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794915341; bh=xDNOG/RyHuCKgvOys0iXiL5/z7Vv4BoX3RzY0YiL7m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2uwp4k98qyIgwXkARUYbiHAOs5X5SkwUUZN+OhkEjF/tW77RLFK6XJQROyuGHO9Z
	 TXNMotIVDGjP/kF2F2qcpG5AYrdGqirGStvdnRPTSTXWmowLxS8fJvLk3uawIokM65
	 kmCAtHN3Z2q9eJh0JBxlcftSTnNFH74gy+817nDc=
Date: Tue, 17 Nov 2026 11:35:38 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver
 removal
Message-ID: <avw8CvBXXWNx4YGX@pluto>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-3-cristian.marussi@arm.com>
 <20261116-merry-hypersonic-skink-91109c@sudeepholla>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-merry-hypersonic-skink-91109c@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_033543_170731_5D7AFE18 
X-CRM114-Status: GOOD (  30.44  )
X-Spam-Score: -4.4 (----)
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

On Mon, Nov 16, 2026 at 06:14:50PM +0000, Sudeep Holla wrote:
> On Mon, Nov 16, 2026 at 08:42:11AM +0000, Cristian Marussi wrote:
> > Once a reboot is initiated following a graceful shutdown request received
> > from the SCMI platform server there are a couple of registered notifiers
> > and possibly a scheduled delayed work.
> > 

Hi,

> > Take care to properly stop, unregister and cleanup all such resources
> > when the driver is unbound.
> > 
> > Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-dbe4eba7-1520-40a1-92e8-8892b6e47c4b
> > Tested-by: Cristian Marussi <cristian.marussi@arm.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  .../firmware/arm_scmi/scmi_power_control.c    | 76 +++++++++++++++++--
> >  1 file changed, 70 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
> > index e0680e33180e..b0a10fd92fa6 100644
> > --- a/drivers/firmware/arm_scmi/scmi_power_control.c
> > +++ b/drivers/firmware/arm_scmi/scmi_power_control.c
> 
> [...]
> 
> > @@ -296,6 +310,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
> >  	struct scmi_system_power_state_notifier_report *er = data;
> >  	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
> >  
> > +	guard(srcu)(&sc->dead_srcu);
> > +	if (READ_ONCE(sc->dead))
> > +		return NOTIFY_DONE;
> > +
> >  	if (er->system_state >= SCMI_SYSTEM_MAX ||
> >  	    er->system_state == SCMI_SYSTEM_POWERUP) {
> >  		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
> > @@ -357,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
> >  	if (!sc)
> >  		return -ENOMEM;
> >  
> > +	ret = init_srcu_struct(&sc->dead_srcu);
> > +	if (ret)
> > +		return ret;
> > +
> >  	sc->state = SCMI_SYSPOWER_IDLE;
> >  	mutex_init(&sc->state_mtx);
> >  	sc->required_transition = SCMI_SYSTEM_MAX;
> > @@ -364,12 +386,53 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
> >  	sc->dev = &sdev->dev;
> >  	dev_set_drvdata(&sdev->dev, sc);
> >  
> > +	INIT_DELAYED_WORK(&sc->forceful_work, scmi_forceful_work_func);
> >  	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
> >  
> > -	return handle->notify_ops->devm_event_notifier_register(sdev,
> > -							   SCMI_PROTOCOL_SYSTEM,
> > -					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> > -						       NULL, &sc->userspace_nb);
> > +	ret = handle->notify_ops->event_notifier_register(handle, SCMI_PROTOCOL_SYSTEM,
> > +							  SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> > +							  NULL, &sc->userspace_nb);
> > +	if (ret) {
> > +		cleanup_srcu_struct(&sc->dead_srcu);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void scmi_syspower_remove(struct scmi_device *sdev)
> > +{
> > +	struct scmi_handle *handle = sdev->handle;
> > +	struct scmi_syspower_conf *sc;
> > +	int ret;
> > +
> > +	sc = dev_get_drvdata(&sdev->dev);
> > +	if (!sc)
> > +		return;
> > +
> > +	/* Wait for any notifier to complete and inhibit further processing */
> > +	WRITE_ONCE(sc->dead, true);
> > +	synchronize_srcu(&sc->dead_srcu);
> > +
> > +	/*
> > +	 * Once here any possible in-flight userspace or reboot notifier
> > +	 * will have completed and further notifiers will bailout immediately.
> > +	 * Cancel any work which was possibly already scheduled.
> > +	 */
> > +	cancel_delayed_work_sync(&sc->forceful_work);
> > +
> 
> To keep it symmetric with probe, do we need cancelling of suspend_work as
> well here ?
> 

Yes, I was going to do that in V1, then I decided it was not
needed...without any good reason really O_o...
Sashiko pointed out the same...I'm adding in V2.

> > +
> > +	/* Unregister reboot notifier...if any */
> > +	unregister_reboot_notifier(&sc->reboot_nb);
> > +
> > +	/* Unregister userspace notifier */
> > +	ret = handle->notify_ops->event_notifier_unregister(handle,
> > +							    SCMI_PROTOCOL_SYSTEM,
> > +							    SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
> > +							    NULL, &sc->userspace_nb);
> 
> Just wondering if it is better to stop receiving notifications from firmware
> first and then cancel any pending work ? Basically reverse order of probe
> for remove.
> 

I think the order is irrelevant given the dead_srcu gating, BUT indeed I
kept this order so as to keep the undo in reverse order: in fact the
probe at first issues some INIT_WORK, but the real schedule_work happens
only later after a notif is received, so the order is:

 - init_srcu
 - static WORK init
 - register SCMI notif callback
 - RX notify msg
 - register reboot notifier
 - schedule delayed work

Also, even if the notifiers are inhibited by dead_srcu, I felt better to
cancel that work as soon as possible.

Thoughts ?

Thanks,
Cristian

