Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47BA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P3YKJ3cA;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W870dAHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RHZ/QH5LnoISU6GeZCjgA0RZWJvhgjCLYDlmnSC1S/U=; b=P3YKJ3cAJmi8uB
	6CORPF4n/tVKiAIPFwSE7TPn6egWse1HBcIhxjYQhlBb+r7iThjkL+67QQGFAf27k5RwrPA2716OS
	V3EcheHUCXefEr2/JwbzG/2O5LaaBLIY8OGcyQt1tQ/mScsGHiahGuJuCaF/uNgBD1Fy2Luontlys
	eNPjZbg1ZwnKG2iYw2U3FBH7AreWuyQR0Ku3smwvCrT96qJ+HRmyXBymEJiwUMHVvt4GEPOKtr+qc
	ytVzhDQAboB9y9FqQ/gCLZo9N9gxONowAlDGOhGs80b891PH4DiKcaiVChpFoimNvjA9Vf68MPV1u
	eCcKn8Y4G7KopfN4hUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzgT-0000000HFvm-2FVk;
	Fri, 27 Nov 2026 17:24:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzgQ-0000000HFux-11Pf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:24:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 63D5B1A0645;
	Fri, 27 Nov 2026 17:24:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29E426049C;
	Fri, 27 Nov 2026 17:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3689511E90CD5;
	Fri, 27 Nov 2026 18:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795800256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RHZ/QH5LnoISU6GeZCjgA0RZWJvhgjCLYDlmnSC1S/U=;
	b=W870dAHWC1yqL23kPODML9ob6EDrRfjB9CimjwkTP5dHp4PtRekPhyK3ttr37+zDzNKg+M
	vDDlszyZx0N0fcPAaMPMEV4Imq+XA/QDRN8TrjRErNoE/ED9NkIhqn2TmEbHCY5Gr+DBpL
	gRHQUxHOAAylmTCifAgJETn819LYv2pu8e1X4JeKR2ExhNiM8H0RJiUSv4s3TJdEl0HkqU
	uTciaRI8m9sNFZ/IRJ8ml/pDxq2d8e/Q6TSmZpvS6hjTyyc6kpgicB9VVS52apbDT2OT3+
	StsObVSr+ANdF+V2zV+I0z1Tnfvj3zZKS5WuMiR32y+jTVFIq+M8sOU7Mf62+Q==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] drm/bridge: nwl-dsi: Move DSI host disablement to
 ->atomic_post_disable()
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
 Yannick Fertre <yannick.fertre@foss.st.com>, Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20261125075455.772826-2-stefan.ghetu@nxp.com>
References: <20261125075455.772826-1-stefan.ghetu@nxp.com>
 <20261125075455.772826-2-stefan.ghetu@nxp.com>
Date: Fri, 27 Nov 2026 18:23:58 +0100
Message-Id: <179580023804.1981164.5694161848427155266.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_092426_429170_CDDCD64E 
X-CRM114-Status: GOOD (  20.82  )
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

Hello Stefan,

> Some MIPI DSI panels, like the Raydium RM68200, send DCS commands such
> as MIPI_DCS_SET_DISPLAY_OFF and MIPI_DCS_ENTER_SLEEP_MODE from their
> drm_panel_funcs::unprepare() callback. For those commands to reach the
> panel, the DSI host controller and its PHY must still be running.
>
> The panel bridge calls drm_panel_unprepare() from its post_disable
> hook, while nwl-dsi currently shuts down the controller, the PHY and
> the clocks from ->atomic_disable(). Since all ->atomic_disable() hooks
> in a bridge chain run before any ->atomic_post_disable() hook, the DSI
> link is already down by the time the panel tries to talk to it.
>
> Move the disablement to ->atomic_post_disable(), so that a downstream
> panel bridge that sets pre_enable_prev_first gets a chance to send its
> shutdown commands first. The enable side is unaffected: the controller
> is brought out of reset in ->mode_set(), which runs before any
> pre_enable hook.
>
> Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 1aab46e1a168..2b1af6d1d58b 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -738,8 +738,8 @@ static int nwl_dsi_disable(struct nwl_dsi *dsi)
>  	return 0;
>  }
>
> -static void nwl_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> -					  struct drm_atomic_commit *state)
> +static void nwl_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +					       struct drm_atomic_commit *state)
>  {
>  	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
>  	int ret;
> @@ -968,7 +968,7 @@ static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
>  	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
>  	.atomic_check		= nwl_dsi_bridge_atomic_check,
>  	.atomic_enable		= nwl_dsi_bridge_atomic_enable,
> -	.atomic_disable		= nwl_dsi_bridge_atomic_disable,
> +	.atomic_post_disable	= nwl_dsi_bridge_atomic_post_disable,

Looks OK to me, and I don't think it's going to break.

However it would be good to have testing on other platforms, so I'd wait a
moment before applying, in case someone has a change to test.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


