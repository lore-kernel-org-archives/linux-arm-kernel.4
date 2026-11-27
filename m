Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F0f6w7aD;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=awUl84Kg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kFFbZKkKUFjl9tVqzC+oYl95ClW2/a5f1vqAFZ408qc=; b=F0f6w7aDbrtjpD
	ZfK7HR5ozMelDEWOLLERsQpXHj2Tlz6GiDd5oOK/+SPecFnaBqKC2kRFXTsKBaKpDfs8HaUjJtv1j
	5HpAcdf437jW9ZcqwyupjoeVdzXhdbnTA5t/UNBUl/vfbGWQwUQIJokbXa567aJWkYO/LUfk2j+GT
	cBPFdGuUCMwqZFtEGbYNPPLN57NFP3L6lgVDf6Nala6kNzqeuIfSeylFH1vhGIyCAo6G4DFfDX+x0
	sx/RwSgNkYU1u59N4jcerbGztmSXrYKq3cPh7aBk1Ahy109eiC/pjMvICGN3+zR8S/a7icGZYq/hE
	qpCcMMa/2SVNiyspL3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzgk-0000000HG18-2l3n;
	Fri, 27 Nov 2026 17:24:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzgb-0000000HFy3-29Ad
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:24:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73331C2AC4C;
	Fri, 27 Nov 2026 17:24:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98D4A6049C;
	Fri, 27 Nov 2026 17:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD05311E90D6D;
	Fri, 27 Nov 2026 18:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795800268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFFbZKkKUFjl9tVqzC+oYl95ClW2/a5f1vqAFZ408qc=;
	b=awUl84KgO2Tm8Ca8KlUgbZ0m1USDz/UO8HsjwvOEeg7c7/7bsXmrNQgyMg+nQdLi4uO2ch
	64mKLCWE9YANSnZUTY4Uy6ZSnUiTbf1HhU6gILRF8gAddrfVlaYi+z/s3lwv128HIBscq2
	0LS777YEpIi0ksZtBY8cf8fIkJ19NUOnpnZ2zv5k2rwTHAkqia+lozqXhq3PSJIrIjASas
	IxoPz3F36wGf4Zd8+ZvwUdOkOipwcURIzMJLqUxBVwPPwjCl5GB90Y9CrHNolx/b8nLGXD
	cGW7KXrEBwCZh76xkoWfizA9Hh1ymE6X8ESqtXNnXnqq0H88O0seFMepZpEpmA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] drm/panel: raydium-rm68200: Set prepare_prev_first
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Robert Foss <rfoss@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <20261125075455.772826-3-stefan.ghetu@nxp.com>
References: <20261125075455.772826-1-stefan.ghetu@nxp.com>
 <20261125075455.772826-3-stefan.ghetu@nxp.com>
Date: Fri, 27 Nov 2026 18:23:58 +0100
Message-Id: <179580023805.1981164.14144325145950560136.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_092437_729744_757E8DEC 
X-CRM114-Status: GOOD (  12.84  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> rm68200_unprepare() sends MIPI_DCS_SET_DISPLAY_OFF and
> MIPI_DCS_ENTER_SLEEP_MODE, and rm68200_prepare() sends the init
> sequence followed by MIPI_DCS_EXIT_SLEEP_MODE and
> MIPI_DCS_SET_DISPLAY_ON. All of these need a working DSI link.
>
> By default, the panel bridge is prepared before the upstream DSI host
> bridge's ->atomic_pre_enable() and unprepared after the DSI host
> bridge's ->atomic_post_disable(). A DSI host that tears down the link
> in ->atomic_post_disable() therefore does so before the panel has sent
> its shutdown commands.
>
> Set prepare_prev_first so the panel is prepared after, and unprepared
> before, the DSI host bridge, which is what a panel driven by DCS
> commands from its prepare/unprepare callbacks requires.
>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
>
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> index c535dc931903..cc87f587ca78 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> @@ -360,6 +360,8 @@ static int rm68200_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>
> +	ctx->panel.prepare_prev_first = true;
> +
>  	drm_panel_add(&ctx->panel);
>
>  	ret = mipi_dsi_attach(dsi);

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


