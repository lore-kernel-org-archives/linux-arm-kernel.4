Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7618C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yeQowpGb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kUkHdNHq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KwqEOHogSWf29GMTvbcaDBvWnXtsNEWUuQTRLlnKv3Q=; b=yeQowpGbJnadbHFxmTJ1yZc0EX
	qvRSJB5mDkgABmGkUY7hBOJSbur24Yh+n94jnWcLo/+yn13SjB7zp/TFLhN8oVL/z5+kOo+Nmr5pd
	zWD9gQJNEUYfExoiHUW8tyfoZBdUEMoMg81vwk50gRJWSqtZzDRwD4hmT6V20wGwrz5D8xAN7wSix
	aIM7PyV/A6n/nHNYAujjmbeO2L4hbdDeyp/YKA729sxFohN5r6zsMmVYnDf52A5eULDQytK1aPWb2
	sFojlIW4nX2uyFD8MAfNU3R1GAYJ3hgwM6QRcgNxfS2ifdiR7uV3PuWMxZiBR1Nnlg/P7Lb/9OnT5
	laJWFLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRh4-00000009So1-1xcE;
	Thu, 12 Nov 2026 10:06:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRh2-00000009Sne-3ZLL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:06:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA96E605D2;
	Thu, 12 Nov 2026 10:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA01F00A05;
	Thu, 12 Nov 2026 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477967;
	bh=KwqEOHogSWf29GMTvbcaDBvWnXtsNEWUuQTRLlnKv3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUkHdNHqa/8UOtYlysZtF0KFLAjhEFo/5to8EELIoPLiwm6VmR3IIA260N8CNGaky
	 KkDiBeU3h0Nn2vYbZPllEeda3T6N5g11mPKNl/1Jb5vHSVIqfbsY0d/b08Ry7r0LvB
	 T1T6TACqDbRtokbhdJvctY+41oDq+BKsiSgJ9JG69gMfZHmyX2O7bupBt6zaX993eW
	 EoaBOx5ODQyok7TlKjgHJddYKIYisbKSvioby4lqOq2mNX1iEJh92SeWnzSDAtercv
	 CEBk6h/ndNQrTBOMgteCIH4u6ed+BiF6254VR1/dEAT2mG1XTagp0uQVZuBmrrWoVS
	 eCo5IxoBK9mpQ==
Date: Thu, 12 Nov 2026 10:06:03 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, dario.binacchi@amarulasolutions.com,
	Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in
 PC mode
Message-ID: <20261112-illegal-slick-rottweiler-bdc9ea@sudeepholla>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
 <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
 <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:04:51AM +0100, Patrick DELAUNAY wrote:
> Hi,
> 
> On 10/30/26 09:32, Sudeep Holla wrote:
> > On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
> > > The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
> > > returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
> > > mode, Linux can assume that PC mode is in effect. Treat this response
> > > as success so PSCI power-domain providers can initialize when firmware
> > > does not support OS-initiated (OSI) mode.
> > > 
> > > Continue to report an error when OSI mode is requested but
> > > SET_SUSPEND_MODE is not supported.
> > > 
> > So, your platform advertises the presence/support for OSI mode and yet
> > opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
> > firmware bug as reported.
> > 
> 
> I think it is no realy a platform bug but a too strict management in Linux
> kernel, for PSCI power domain.
> The OSI mode is not yet supported by the STM32MP25 platform in Linux at
> upstream but I introduce PSCI domains in device tree (but without idle power
> domain) just to prepare this activation in next steps.
>

Fair enough, that shouldn't be a problem.

> As the PSCI support is not activated in Firmware (TF-A BL31), the firmware
> correctly expose its capacities (PSCI_OS_INIT_MODE =0) => PSCI feature
> indicate that OSI is not supported (FF_SUPPORTS_OS_INIT_MODE = 0) =>
> PSCI_SET_SUSPEND_MODE function is not supported (optional when OSI
> is not supported)
> 
> in Linux side, the power domain driver
> (drivers/cpuidle/cpuidle-psci-domain.c)
> 
> correctly check the support of OSI:
>     bool use_osi = psci_has_osi_support();
> 
> in STM32MP25 platform use_osi = false, so the driver request
> Plafrom Cooordinated mode (PC mode) as expected
> But here  the GENPD driver try to use optional function to set mode:
> 
>     /* let's try to enable OSI. */
>     ret = psci_set_osi_mode(use_osi);
>     if (ret)
>         goto remove_pd;
> 

IMO we should make this psci_set_osi_mode() call only when use_osi == true
above. If it is passing false, it is setting PC mode but as comments states
it may be assuming OSI mode and proceeding further which is completely wrong.
I would bail out of psci_cpuidle_domain_probe() early if use_osi is false.

> And the problem occurs here because the optional function is called but the
> normal use case is not handled (OSI mode not supported / PSCI_SET_SUSPEND_MODE
> not supported)
> 

Agreed, but I would check before calling here. The proposed fix hides
PSCI_RET_NOT_SUPPORTED error for PC-mode setting. So clear NACK for that.

> 
> With the proposed patch, the Linux kernel can have PSCI domain in device
> tree even when PSCI OSI support is deactivated in PSCI firmware (or not yet
> activated): the domain are always ON (GENPD_FLAG_ALWAYS_ON).
> 

Do you see any issue failing in psci_cpuidle_domain_probe() instead ?

> NB: I hesitate between the current patch and a patch in PSCI power domain
> driver:
> 
>     /* let's try to enable OSI. */
>     ret = psci_set_osi_mode(use_osi);
> + if (ret == -EOPNOTSUPP && !use_osi)
> +    ret = 0;
> 
>     if (ret)
>         goto remove_pd;
> 

See above, if the driver is assuming OSI mode is set after the call like the
comment states, it better check if use_osi = true.

> but I patch PSCI firmware driver because I think it is a more generic place
> to handle optional PSCI function.
> 

If we have to handle it in the psci, I would rather not make a call to the
firmware if PSCI_FEATURES(PSCI_1_0_FN_SET_SUSPEND_MODE) returns not supported.
That is the expectation for any ABI the firmware said it doesn't support.
Making unsupported ABI call to the firmware may result in unexpected behaviour
and must be avoided.

-- 
Regards,
Sudeep

