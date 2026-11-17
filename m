Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED8606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i25WWh8Z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pi+tKxi9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bJVwrQqa8l7JgzWCKogPwHHXJ/PZMAHNz4aWA78CpQ4=; b=i25WWh8ZppliWfXWYPuCkyqA9A
	StHvnSUAG6gsgHS0+BjN8yRZdmRiWwgbWZz/bFb/2tzB9KgQ5NlGOMdXuLdNdiecrImDLZ7E3W92Q
	WlKAwSrfp56G4tFzsIP7gCt0NZ674iplnmaLrANaHwd4JbzmK7UaKcgbYpztJJIzXWQRte7LZ+d3G
	xXfA+KC7Qgr914K4r8tIc8Lcn1meJjrS9O7OF0eA9YYaznJaNeyLih5xzedpABT0n+hOmFQ5rC9hg
	dIHcIVIPU/gzu7IjM+MzO2t/fMHm6ZRNct8L7OZR8LdQugC8ZjWvTnByVDmaNxLQpsvT9ljnpWKEO
	WqnKNhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJpA-000000063OB-2AVS;
	Tue, 17 Nov 2026 14:06:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJp2-000000063Ho-24Jk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:06:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B6BE43A7B;
	Tue, 17 Nov 2026 14:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955621F000C7;
	Tue, 17 Nov 2026 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924368;
	bh=bJVwrQqa8l7JgzWCKogPwHHXJ/PZMAHNz4aWA78CpQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pi+tKxi9kmMuTZhjTUoxbJeEVUTg2VvCUhWTqFt1mB6L78yNYqlOsWqxLYARFXVoA
	 Yri51wSF7FCoK6pZok1+2vZSlPdEeE9AbaelnR16LgTyct5RGTyACpNJhzRupF235S
	 6mJDych6WLvoIYyItiTIT/dKkqOYod4KRkwiesPz19DYLHyebZLtIGTjZnXU1TJG44
	 IckbfCIDcpUHjybzvYG86Pzea+WPkZSHyHkDMryi9W6O9fE5WnDvMU03VsbJV/iHQI
	 woROMR7CJ/FU+E20NB/HaiAZW3JPcy1wknGP4C+HZ7SMp0jtfn4h7MWH7dFPxaqipT
	 Y2/2/xzvj11Ng==
Date: Tue, 17 Nov 2026 14:06:04 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Chengyu Liu <lui2012qwq@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
Message-ID: <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com>
 <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
 <avw5o7sTyriZ2ZiX@pluto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avw5o7sTyriZ2ZiX@pluto>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 11:25:23AM +0000, Cristian Marussi wrote:
> On Mon, Nov 16, 2026 at 06:25:52PM +0000, Sudeep Holla wrote:

[...]

> > > @@ -188,13 +197,16 @@ static void scmi_forceful_work_func(struct work_struct *work)
> > >  	dwork = to_delayed_work(work);
> > >  	sc = dwork_to_sconf(dwork);
> > >  
> > > -	dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
> > >  	mutex_lock(&sc->state_mtx);
> > > -	/* avoid deadlock by unregistering reboot notifier first */
> > > -	unregister_reboot_notifier(&sc->reboot_nb);
> > > -	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS)
> > > -		scmi_request_forceful_transition(sc);
> > > +	needs_forceful = sc->state == SCMI_SYSPOWER_IN_PROGRESS;
> > >  	mutex_unlock(&sc->state_mtx);
> > > +
> > > +	if (needs_forceful) {
> > > +		dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
> > > +		/* avoid deadlock by unregistering reboot notifier first */
> > > +		unregister_reboot_notifier(&sc->reboot_nb);
> > 
> > And re-evaluate needs_forceful again here after un-registration before
> > calling below forced transition ?
> >
> 
> If all of this is locked as it was originally there is no need, the two
> threads should just sync properly...
> 

Fair enough!

> Let's see what Sashiko thinks..

🤞

-- 
Regards,
Sudeep

