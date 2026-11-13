Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE34606F5FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A/bbacXx;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rChCb7D2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=; b=A/bbacXxZsWIXtgxFA9V+eKXxW
	03XI1rv0Qr2nZpRyZ6ifBo8NUZb9Cqjdg9+ky6xlJWrme7zXXsOiN8Sxi9k+QVrBocroigvRT4GmT
	e0+3EBOtdfGW7AXSc+fFoGyoBHjUylIFwsqcszLNJKMvDHkwvWCIawERIqU6poK0lkQvqyaJNEbcC
	JpGmeSdBoVGl+vnfIRhMe6M53jdOixbBHpxOzKxbjXOCAFwdFIVMp2TnC0xkhZZMwCUNej/XRfpU5
	+RsTWlDYG7UwhFfNKgyTLGOzJMdzXmfDngB5OYNikAF+3rvApgSmo3cGhvncSuBViWUw5d5yi0gWP
	HazWAdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuQB-0000000DeR7-26Nv;
	Fri, 13 Nov 2026 16:46:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuQ9-0000000DeQG-1aUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:46:38 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so2282962a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794588395; cv=none;
        d=google.com; s=arc-20260327;
        b=FGmdiRKnXUTvxmPVb5Zo94NXAt8xQaa131UN3qTiKjcpyOK75dHjuxr1eKMX3em2D4
         SzVFvriePNpYnuxfWA2i4f4WI5JufXY+oLiDgZVX29P31IjsBrnivCZdlZFcZK/20DtO
         6EE+ndTTmt8EqtEPhIdtkpwMDZOuSQoRYkSV7qFSVGEARmYgBUTIuViBjDe6AzBqcAbV
         nLYB4tPggsf0au33sVhIow2ZKa2zkwYmoZanS4oFbAby6BOnl1cRnTcDLJCPjBuCT4sM
         QMTkV9CE0GoB3buEfGBJgqFF6ob5m9IjvIiBq3GIDg+oGGjDDNfSfYv/95j0GsYvBCWr
         ofOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        fh=d73PaUX+tfX8jRLJ7HHkqp+EcbuS0a9DyqmY4EDVluA=;
        b=Ntz2sJN+PAlc8K07ESxtCsSP98G4RDjo2FPyMCTGDlbYNq2ln1VYvSbon1OAKLzZtc
         BAqWnUuQa/5SskpK/N+dYz5+qm9SY78h8DiIUphSotqle1ojtZlMZezjG9cfRhr9mAwI
         Ze5UEqA/p3PXPH7LEo2ie2I5O2T8CPx9lPoXjCG97XfZpeN0/gNsLyztZwaj95VvFHxm
         rRzL/8Lvsu5aGDjQtfGwQIxNeglVTZjQ88z/sfAnJflC3yYyv/L3wXzOpetq4XF4tTJM
         5qMlobWyfWGCeBMdFwVwJ+3fx0PlvtJhp9W6INyea2gdwjdtBOqME6llU7reiURgFPYe
         Rq9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794588395; x=1795193195; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=rChCb7D2+N3+xjWAvnmbyET/ZP2qrJyjMb49tBocZUwilG1zjkx2WVU+i7emQRdDTG
         E3X9MFV8lS10D3QxMB7y/GrU6fo2YfAEAQe/D0XA2FIwUSINvzoo9DsmaMmZNzCkgAkf
         6WulIEXbxd5rvWfz8GXIQqSEydeRJlXNxg7hsAAhTzX+vO4k8YnTdqHccDBTtypYdm4T
         JVdeRpTLPOAHj23ZKkZHfv8ei5URSoAUCkw05SmoMMIbA28HAVHA7dfOvGA26VpCexou
         s8HkGL7/CVMkCNTFv9I5VsCgblWh2o642qmLwRvCJXv6k/vR8PcsL+yOMXxrSf25xPtQ
         vc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588395; x=1795193195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=qZ/CKmPLcNDfSX6HdOQZG2tRC1K2e3zOubBFZSrUAUWH+bIDd08wzIAr8xfk0KE/zw
         nuCN09YtK2IP6jcY/RBzxxvDQas/zPTpEZDUCXSMtDsZnxzIuBX9WnCjg+3oMWHX5Mpu
         EVsbsofmYnfK5Eoff9jsDNnAYK8y5x8Qm2h3dcSr82Sjf6j41W60HvfHZRHlGYsnUd/a
         q/sn1v6kgle2BJ2IlEnxD1+bqgw4sH+qmU5q7/e0h8vYSq9+fJNXAkg+4DlnoGtXrsRb
         dLGaou4nwQWkfV29u5dAkeNRtCkmLdrMCpGnjh6qcS88O+k6M3+/AN8FCUrMA3OMSMx0
         mHXw==
X-Forwarded-Encrypted: i=1; AL+hErH+dofIpr5Ty3C48xaKxAowP6sOnXV85NmJNwuyluu4sSZsXe4iCxX9UdKZHXqTp8aq6Iw6y9uVEaHYvRWZJjSE@lists.infradead.org
X-Gm-Message-State: APuU4Z8HDWD4rG2B+lp7QS5JKWj4FKWlmYCcT1aiRoCEs8vbRmOuCfmL
	B248/cyCJfDPk4DBYt+UI6KsTOL2AUOYpFTNKl9HP15m2HAxNAf9fpZ6XZx2KzdwW9y/c840FGG
	5uOd+4PoYiBzAR9WctDamZSArU+q+lkV24Go4qBmpJw==
X-Gm-Gg: AYBFou1SfhDV32XW17bYe9NffD597s1xa1PyfoDl0x3B5lE+mHiqKHOE1ewiCXD3Nys
	m9sjLBM4gReZD3aRHTlIffVDif49JqU7Vhp++KNB7IAg0IhJG8a1JPvto63Z0RiLzzTMjJ24pzR
	zrK2UxoxkdJvCjDfrM4MeqAPvfbTkqLIcznoX6mxIiRZijr4X9QUIGXl/knvvZrEOnxrotAYHEY
	UqvuzKwg9pgRcdi2+7u2B1TkxjNbESp8FYMc1vQ6XaVQE17v0k9VvkM5VNTw+oHDSw5F4Wfh2DQ
	+KWTkjDP/X0vQ4ekGcmsfGZtKnLq4bAxO2gb8o4vTfgwQTute1vt7gSZofvXF+/gQEyHxMvDAGh
	qCT67GMoA6fzn7UJ087OxxN9OOkEUliYxEGsikfOtPKv1rcuaDKMasKFMmkLRjtUDmaqKhQ==
X-Received: by 2002:a05:6402:a6c4:10b0:6b4:7b28:858b with SMTP id
 4fb4d7f45d1cf-6b7c0be1709mr2033159a12.19.1794588394028; Fri, 13 Nov 2026
 08:46:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
 <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
 <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org> <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
In-Reply-To: <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 16:46:21 +0000
X-Gm-Features: AclHuK_ez23rl1EP1_wg4tzOti-KVedDElMJmYIu226TUJ8WPAQv2T8gyYll0Ws
Message-ID: <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Juan Yescas <jyescas@google.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_084637_447611_33675341 
X-CRM114-Status: GOOD (  34.14  )
X-Spam-Score: -2.1 (--)
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

Hi Alexey,

> >> Eventually to have some sensible/working ->recalc_rate() for ACPM
> >> cpucl{0,1} clocks.
> >>
> >> Which is needed, for instance, for cpufreq_dt because it registers with:
> >>
> >> static struct cpufreq_driver dt_cpufreq_driver = {
> >>         .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> >>                  CPUFREQ_IS_COOLING_DEV,
> >>
> >> Don't know if it answers the question (if I understood it correctly)?
> >>
> >
> > Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
> > parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
> > ->recalc_rate(). Could you please clarify a few things in the commit
> > message (and below):
>
> Thanks for the good questions. You hit the exact pain points we have been
> debugging on hardware with cpufreq-dt and Panfrost devfreq.
>
> > 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
> >    APM hardware, they are the PLLs that ACPM reconfigures behind the
> >    scenes. Meanwhile, acpm_clk_register() sets num_parents = 1 and
> >    pdata.fw_name = name for all 9 clocks in exynos850_acpm_clks[].
> >    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
> >    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
> >    orphaned in CCF with rate = 0?
>
> Correct. Is it a problem now since there are no "clients" or consumers or
> users of these clocks?
>
> Or do you suggest to link them all to parents clocks to have a sensible
> rate?

Since your implementation relies on CCF to get the clock rates I think
you have two options:
1) Only register ACPM clocks that have a corresponding CCF implementation.
2) Add the missing CCF clocks for the ACPM clocks you are registerring

Should CCF's ability to set the rate for these ACPM-managed clocks
also be restricted? It seems undesirable to have two entities (Linux
and ACPM) able to set the clock rate, with the possible exception of
it being useful for debugging. These limitations should also be
clearly mentioned in the commit message or cover letter.

>
> > 2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
> >    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
> >    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
> >    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
> >    __clk_recalc_rates() only reads the cached core->parent->rate without
> >    calling ->recalc_rate() on the parent itself. Won't parent_rate remain
> >    stuck at the initial boot frequency?
>
> This was already asked and seems there are no answers. The problem with
> stale rate is present.
> https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@linaro.org/

The question was sent on September 9th, but the series adding support
into ACPM was sent on September 15th
(https://lore.kernel.org/lkml/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org/).
The limitation about get_rate returning stale values should have been
clearly stated in the cover letter or commit messages.

>
> Any suggestions?

For the benefit of the ML, we discussed this topic off list. The
consensus was to try and make CCF walk the clock tree, recalculating
clock rates from the SFRs without using any cached values (as ACPM
could have changed the SFRs of PLLs, dividers, etc., behind Linux's
back).

That should in theory mean that clk_summary will always report the
correct clock rates for everything in the clock tree and we won't
report (or make decisions) based on stale values.

> > 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
> >    cpucl1_cmu_info still set `.manual_plls = true`.
> >    Does that conflict with ACPM firmware managing the CPU PLLs?
>
> I don't know yet what to do with that. I didn't encounter any problems
> yet because of this. Is it related to early initialisation only?
> I thought that exynos CMU driver doesn't touch PLL clocks after init.

You should check this with downstream sources and the TRM.

regards,

Peter

