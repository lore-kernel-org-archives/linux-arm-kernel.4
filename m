Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C24606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ubO1fuB+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pp8X0Mp6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+1pGJ7i1ND9Ohr0UreFf1Uf/cvKyOGS6sdqn792QKQg=; b=ubO1fuB+M0MoFfFg15YPeGStGJ
	e32QuV2YhjiCmpmAFja+O9kPPDJEPttOk0+hSsygLAGJ/nsrb42q4H1CVWbu0M8eqn0hWaNjcEfHp
	EnEMkR9mzpJqRV3ubHufrgr7ZjNXT0tvC7FUpsftEEWnAs7uGGMZH15DmR2xwMQI7O7Ez1u3FLDbk
	nZSKEoFGjYx9RzAVXAXdSpyjh3jCnr16DO8LSEgXk9PlfOa7SFHyIUYRw2hKUrlm7YgXQFat0/08A
	/fs/BPlEA6VskVfmBPRHnVtL22QD8qoJtQ+O/AfJZR2oatW83UUDxMNfhx1i7JV0SCOZgUnUEfUSr
	CGYMecUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwQw-0000000GJdb-2vkv;
	Fri, 27 Nov 2026 13:56:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwQt-0000000GJcx-1AcM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:56:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2F391570;
	Fri, 27 Nov 2026 05:56:04 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFB6A3F632;
	Fri, 27 Nov 2026 05:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795787767; bh=zFLb+OnB7mi1qu1Jzixs1i73JRMix70x2iUgcxdeRak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pp8X0Mp6ZjXqcFWpSZ2xN43cysZr1MhhpLxJWetb3mG9Q6tE8uxvUM37Twn5qJ/Kk
	 bqq0U1bKtZJT0bLAsXhm0kCF3/+7v9CBwavqekEUDlicPi38n+h4a2pzF9VoZ2iFrA
	 QufSsZfPwwgBHb1itTcwkXkM5AHJBlg3w6THqM30=
Date: Fri, 27 Nov 2026 13:55:56 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
	philip.radford@arm.com
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Refactor protocol allocation
Message-ID: <awmL7CdzcH4vmw_i@pluto>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
 <20261124185111.1022322-3-cristian.marussi@arm.com>
 <20261124145015.0000358e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124145015.0000358e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_055611_432206_80C6BE6E 
X-CRM114-Status: GOOD (  24.66  )
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

On Tue, Nov 24, 2026 at 02:50:15PM -0800, Jonathan Cameron wrote:
> On Tue, 24 Nov 2026 18:51:11 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Simplify protocol initialization and finalization using cleanup handlers.
> > Relocate the protocol put operations out of the setup and cleanup code so
> > as to be executed strictly after the protocol devres groups have been
> > fully released.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Lol. I should have read on! Nice that you have found the time to look at this.
> 
> > ---
> >  drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
> >  1 file changed, 22 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index 2c4424aa0d37..199f0a189432 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -2256,24 +2256,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
> >   *
> >   * Context: Assumes to be called with @protocols_mtx already acquired.
> >   * Return: A reference to a freshly allocated and initialized protocol instance
> > - *	   or ERR_PTR on failure. On failure the @proto reference is at first
> > - *	   put using @scmi_protocol_put() before releasing all the devres group.
> > + *	   or ERR_PTR on failure.
> >   */
> >  static struct scmi_protocol_instance *
> >  scmi_alloc_init_protocol_instance(struct scmi_info *info,
> >  				  const struct scmi_protocol *proto)
> >  {
> > +	const struct scmi_handle *handle = &info->handle;
> > +	struct scmi_protocol_instance *pi;
> >  	int ret = -ENOMEM;
> >  	void *gid;
> > -	struct scmi_protocol_instance *pi;
> > -	const struct scmi_handle *handle = &info->handle;
> >  
> >  	/* Protocol specific devres group */
> >  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
> > -	if (!gid) {
> > -		scmi_protocol_put(proto);
> > -		goto out;
> > -	}
> > +	if (!gid)
> > +		return ERR_PTR(ret);
> >  
> >  	pi = devm_kzalloc_obj(handle->dev, *pi);
> >  	if (!pi)
> > @@ -2328,10 +2325,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
> >  	if (pi->proto->instance_deinit)
> >  		pi->proto->instance_deinit(&pi->ph);
> >  clean:
> > -	/* Take care to put the protocol module's owner before releasing all */
> > -	scmi_protocol_put(proto);
> >  	devres_release_group(handle->dev, gid);
> > -out:
> >  	return ERR_PTR(ret);
> >  }
> Better though the devres group approach works best in my view when it's a wrapper
> around a helper.
> 
> 	gid = dev_res_open_group(handle->dev, NULL, GFP_KERNEL);
> 	pi = __scmi_alloc_init_protocol_instance();
> 	if (IS_ERR(pi)) {
> 		devres_release_group(handle->dev, gid);	
> 		return pi;
> 	}
> 
> 	devres_close_group(handlde->dev, gid);
> 	return pi;
> 
> Though here you'd have more or less a wrapper surrounding a wrapper, so fine to
> just push this up into scmi_alloc_init_protocol_instance()
> 
> Anyhow even if you leave like you have it this is a great improvement.
> Lifetimes in these calls are now a little less complex to reason about.

Yes this was definitely some ugly ancient code of mine that needed
definitely to be cleaned-up.

Thanks,
Cristian

