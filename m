Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x1lG+WRq;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=jZYSAdHE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=; b=x1lG+WRqUP9Q/jdoFcdIbFdjPJ
	YUwBNOt9P45bAnR3G4VEVr825KeGX/pau2zPOACWxjFOBa6AoiKRs/icKUyPsx5UJye8ghCTaX++Q
	x1z1ABN+R0+SgC87Ex8o57V0NRoqqOsuJgVRn0IJj3aPvRdGaFhuzNvva9XoqMw1TE/2Cyh7NtTqR
	c9Z/5UsHCsNxEAFqqtfrd8R48DzPyi0Sc02uRwz1DWhmr593DK1a+mj9yQwtWRui1AjGrKJo5jJOX
	mv2MJ7CACvlG16gIo19kR+MKlgCPk8nTfz/uDcNrOxRzDDI3Cm/ZOQYbI5CXwaqVcvhxt8vFOaLY8
	+bIs3Avw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqKd-0000000Cj9c-2wuu;
	Fri, 13 Nov 2026 12:24:39 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqKW-0000000Cj7X-1nl1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:24:38 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-170135e43c7so486984c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572671; cv=none;
        d=google.com; s=arc-20260327;
        b=PGSwsPryB18PhhXzEu1ehL6soRytHNMsvNRbeMbumeSWbsjffT4VxuTsK5qpxvg5yr
         rRuqpr8HCp1rLQ5Qzl9Hfb+koEdMaN7hGTvx5Gjvjfhlc2UAA7bo5C9UzENGWBN2tjHX
         oCHLqrAZykYseVNP82YtF4gQSpUPVUXm0EtUKqlHyNh+6qXBY0uUB/mEvZ4Jy44zEXIf
         xQPErvv6c0IIsecu7IC4FNomB+SweLqK4nq4cEtoOrQ+/akETqEyAm5kTaDfW4m9SgKD
         IILZy2zmXwAeSQCRg04I3JUNeLHboXbSVVlhTuQymK3HQ9tqoSc2c4TrGFwhuJx6xheA
         LGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        fh=rS0x4J2Sx7jeiwl7EnLGme8XJJBnLmVx3KGu/EUn18s=;
        b=FYSzBWvqJVJduVVFneANpzhvbKF/KLGfOv+K4vnoyfdc9NiQxUT1eWNzI9lhjCk/+L
         Z7ak0rdHDu0xnmvg9aaIDpAIMTz9YZlrLkmVKfZU+SJrHE2PpKR4ICn2XJtU8IPmbbk2
         Hi3ziFyCEuzbQevHnehRdkm9WH10DlPaIV3lKwKFBVSY4sLBFLXKgun8qFb0t7S1ZBP3
         f/YCcAJmKuFybUCFVKyi5xyLmnlay//dXyrNxhgaGLH6G+TpeA/1RvrwFEZJ+hMb0elD
         x9D5DBvBPxt36CJejduG+ilopYozZYzYtn7G8gxalocLSG7I5JeE4R7CkVJd3svlhNr/
         wMng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1794572671; x=1795177471; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=jZYSAdHEwh6pXpUx18V0U6vbn92CQmEVLv/k8/TqXLqg9i91wxIbKkWoEY4Ul8B1oD
         ud4pu1uSBqCq+TnJrV2pE9OpWSGhIIRD3r4Nj0rPE/WmriiJc02JJqzyi41KL8gg/AjG
         nRJOcRd0ojQr1xfDK971lOwyrn64sH+4dAiEv/y1SjTCThr+TEAJlayqRaHkCfx7ZhVo
         mBA+R1usPU4lqYLODGBl8Vw1KICfASjzkQgo58/QuexqDKj+EYM/dDB7uwQhrI2FdE68
         mkaYDVrowJp4wS1hdbo8ghao1nafkRx/kOOBX+N3+aGaU90D0nAS/mBGA4DpWswLYC80
         Db1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572671; x=1795177471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=nblA+MTUhscPBrcBe2k+BrxF9V4Lm2SGMWqFoMWJjXa/wVQZj/Wv8dtgFHkb6jFzwO
         3bQAbWTCeqPD3S1khbCmU3WRuDWGaKs9WXgE46JovSLs+7mKfSnqH1j3zqtwCRONNOMS
         7CvBJdHsDWgNgy1X+h6xVQuREfUEPSJ34/JdxWl463Y3ZWtWi4T9qXNxDFKHQk1dTfx8
         lBwGEPaT97AuKh/7G6btVIaE99842QUxTbYSWMlXEccVDJB6Ag3+VrXn+FG29IJC4jce
         aJ7oTyGnPQNHOPLkEaDJcNWHRJKSyw8Q2O2B+3CLy6vPcVmpPwvILdps4PsqGownb74j
         J5Vg==
X-Forwarded-Encrypted: i=1; AL+hErHG8U7xTC/h8dJ/aMGGpJZ92TL+AJXHsPIqvTo0+qb6Pj8NH79bPDecStmSxG4MY9Jbk8Ntsx0UmjwDdZvU5i9/@lists.infradead.org
X-Gm-Message-State: APuU4Z96FF5TODRIh0sR9nuAi5zCqsrWJX087Yn2yVVT+jg7UyCujTOB
	FPvK/i9SI6hiv0uzC7eTwC/2JA6nLuhRDG63DeOdWR5aWyOqIozja82MxykezsIECYwD2pdSpNM
	wBQ8JDB+Kp90kmeiiAfr1ItKKPOxmnFdpqyjrkGJJfw==
X-Gm-Gg: AYBFou2dilkRzcZFXr+9yXplgMvBpuoy1sr7VygM1ClBZTuIa1UacnSGqdSt0qO4m+L
	lnfpzPzRCt2aGnulEHmFDDhpg+jiba9+fTy12IvMIu3jJjtjy5+9vcQieqSYmlnUZZ340JY/4vO
	m4egKeUZ4la8joJCSxsrQ9lbHcsOwzpX8wLzmKovLonLTGeN9wm/mzFoLYzKaspAldDS9haN/xI
	cqBihW2RSFEzdDJZO8t1pjAiBnF68aKICWpzm0yFazCepWfUnpCod7BhthNJVnn4bm5sWBt69aZ
	V4kYqTfUhlW3CRwJevM/7eJuYZiciVvmlApXjKoQuhcyMU0uq1/R4Tk9vGOzEnJ+bILBTy/u5Tv
	SFoiMSw2EFpjUOun2nWMJkD1cai6TlTX1nGVQuiji7VWdZq1cUT2C5guh6D+vJV50jaMQ5NfblR
	yCZ0z1DNFpP2BlInFc
X-Received: by 2002:a05:7022:f4c:b0:1b2:6cba:7f48 with SMTP id
 a92af1059eb24-1b50315622fmr2098905c88.31.1794572671002; Fri, 13 Nov 2026
 04:24:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-3-cunyuan.liu@cixtech.com> <avLsAlL048MtIX4x@e142607> <avRm82TLBe6I6LAD@cix>
In-Reply-To: <avRm82TLBe6I6LAD@cix>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 13 Nov 2026 12:24:18 +0000
X-Gm-Features: AclHuK-6TzVh3nCVDRnwGMEM8YGOPOqHwZQu1e6cxT9cH1x835RSR9V7MLMVi7Y
Message-ID: <CAPj87rOi0+T7E7Kge4z-8L9FuCSTt6dCqT+9+YtF3wDkd4vRVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panthor: Add initial support for CIX Sky1
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, boris.brezillon@collabora.com, 
	steven.price@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com, 
	daniel.almeida@collabora.com, aliceryhl@google.com, p.zabel@pengutronix.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_042432_504204_0AEFD598 
X-CRM114-Status: GOOD (  16.31  )
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

Hi Cunyuan,

On Wed, 11 Nov 2026 at 13:16, Cunyuan Liu <cunyuan.liu@cixtech.com> wrote:
> On 2026-11-10 10:03:46 +0000, Liviu Dudau wrote:
> > > +static const struct panthor_sysc_config sysc_config_cix_sky1 = {
> > > +     /* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
> > > +     .alloc = {
> > > +             0x00230000, 0x00000023, 0x00000000, 0x00000000,
> > > +             0x00523222, 0x00523200, 0x00000022, 0x00000032,
> > > +     },
> > > +};
> >
> > These should not be in the driver but in the device tree bindings. If you extract
> > the system cache code into a separate patch we can have a proper discussion there.
>
> I will move the eight SYSC_ALLOC values into a DT property, such as
> arm,sysc-alloc, and submit the system-cache support as a separate patch.

Whilst doing this, please break the properties out. At the moment,
it's written as 32-bit groups of 4 source+RW pairs. I would much
prefer to have groups of [<sourceR, sourceW>, <sourceR, sourceW>, ...]
than just the raw register values to be dumped into SYSC_ALLOC*.

FWIW, I agree with everything else Liviu said. I don't have a strong
opinion on skipping out devfreq if OPPs are not present vs. exposing a
single fixed OPP from the clock provider, but the former does seem
better for me.

Cheers,
Daniel

