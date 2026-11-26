Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143CD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QbUh5rma;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pCvaSWpT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OTlAdjsMnjHpK7mYzreF1Hc8nBUzyBy1IwUaOdo6L+A=; b=QbUh5rmaiAt8E6
	tj5r5f1rHhYzZSiDefqCTob4XXLK03dgJqevshb9EJx2eRNJuJRg5ZUShsaE9dPRT8kU5N15MHKjQ
	84Y+gSQ8Wf+MvZcbrxn0VDJ8Nl8r5mZTfkjoSPA8hc3q90AZJoIsKN5i/TtTtt5RvYwz/DRTvvdcf
	fKcFD3j41KGOOTP9eS0l00kMXt1aC5Y03WC7oxzR3lOyq47Ew0r3qRQ2QYMhlY7ncI9juAjRZSSyv
	89Kd6dJcCqxpSstDxjtphERtCd8ZOG9qFQYPVFjcKibTOnkvu8D2TUG9Ml8SyheXiorflseiuW2l8
	TQEXE2P+8z3zEBK/7w0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZfC-0000000DOda-36eg;
	Thu, 26 Nov 2026 13:37:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZf9-0000000DObs-1p2o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:37:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3F7B4E417A3;
	Thu, 26 Nov 2026 13:37:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2701604ED;
	Thu, 26 Nov 2026 13:37:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E6DA11E68072;
	Thu, 26 Nov 2026 14:37:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OTlAdjsMnjHpK7mYzreF1Hc8nBUzyBy1IwUaOdo6L+A=;
	b=pCvaSWpTPSboOeyPCEWxm296dT2ARRfMHg/jxbWuTxvylPGzKgJGYSQl4h3BS7GKq4Q7zv
	yx45WbFdHbJUsYFG63QlEWM4hh6IgGzsK/ZRLyPe9xQGgKBgtU+thk+PLi8vzw2f4naOvZ
	aqPBFCt6c5hPWGI0+WONFQofOVevtXply55MOfTMTGeMpzkDfLIhv+HCDIz4lEtQ9w9ruk
	k2TkAeZrkinf3xDXs1rnFcVIwVyqEqn8At85hso4wkH2ohbjo5qROvmiPVbE4ag2NbEgIY
	4xOZi0b6C6VCvMk2wuh3F7S+nVnwUaMoOXhfDp0A8viZR4ItOrZps+w6ysOyGA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 14:37:14 +0100
Message-Id: <DN56LVC0GG0Z.31QWFJ8SS5206@bootlin.com>
Subject: Re: [PATCH] drm/exynos: hdmi: put bridge reference on probe failure
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
To: "Yige Jiang" <yigejiang86@gmail.com>, "Inki Dae" <inki.dae@samsung.com>,
 "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin Park"
 <kyungmin.park@samsung.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <rc-b1-20261110-vc-19-b220c856ecbb@gmail.com>
In-Reply-To: <rc-b1-20261110-vc-19-b220c856ecbb@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053723_609064_2AFAD5CB 
X-CRM114-Status: GOOD (  10.41  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Nov 26, 2026 at 6:58 AM CET, Yige Jiang wrote:
> hdmi_resources_init() ends with hdmi_bridge_init(), which takes a
> reference on the next bridge with of_drm_find_and_get_bridge(). That
> reference is only dropped in hdmi_remove(). When hdmi_probe() fails
> after hdmi_resources_init(), including the -EPROBE_DEFER returns for
> the DDC adapter, the PHY and the syscon lookups, the reference is
> leaked, once per failed probe attempt.
>
> The sashiko AI review bot pointed this out on dri-devel on 2026-07-16,
> in its review of an unrelated exynos_hdmi patch.
>
> Drop the reference at the end of the probe error path and route the two
> early returns after hdmi_resources_init() through it. drm_bridge_put()
> ignores NULL, which covers boards without a bridge on port 1.
>
> Fixes: 2db0d298f22d ("drm/exynos: hdmi: convert to of_drm_find_and_get_br=
idge()")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/20260716132919.A3EA81F000E9@smtp.kernel.o=
rg
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

