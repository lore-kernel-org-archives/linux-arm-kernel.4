Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E74606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1K8UtgdD;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GL0q54Lr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IkIbePbwpiJw2XaAzSr+/25S6QYyRwR70kd3c2KH4wM=; b=1K8UtgdDmqr/t2W+ZKM6hotiCR
	hFsb9YMmjAjfxXOxVcMdDITZGC4ZovDliAFiANG0vDtX68+g1jt9QFIHPJyJ0zhvphOzYACXMZHyc
	7TbGGuArs/SECdJk/AxiW59CjugSmuC4uxVug/YPRiX6VmFcJ4AFZ3lGk48AfGFwxoj25nJWLVyWS
	paEPwn5cxeKCJU0F/q18bPqKZq0BSC87oz+mjnkgxRcEOzzipPcZQ/jk6uWMBOGoS4+vU2jVg2HWI
	6+KuyD75IK343Romj6tGcuUmAyz25NlVN5LvAWWoz3/l6GLm3AXtT9ZZ1k8MRkKvLNVULCZxiejV+
	0OevuIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV44D-00000000vWO-0GVm;
	Sun, 22 Nov 2026 09:41:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV44A-00000000vVu-1imU;
	Sun, 22 Nov 2026 09:41:00 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDD82ABF;
	Sun, 22 Nov 2026 10:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795340301;
	bh=yTMMp7PT3K2LyuvelR0MmDh6s2VsGr4kgwTbxEVPAwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL0q54LrHkSn2pAjjFMO58LLdrGwbsOPFXG57oU5XxCd+1cPoP2nCvPVBSf7C9dxv
	 TwU3KgbXpSkLaiHRp58caVX9suZEC3zznR0xZJI3ZJmN/2t9/W96BG8p9UYKDAh5Bh
	 89KCH1L23XRTnHsOCB1YCLTR2uu+yfQ3WGQNisZ0=
Date: Sun, 22 Nov 2026 11:40:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andyshrk@163.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
Message-ID: <20261122094050.GB2739410@killaraus.ideasonboard.com>
References: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
 <179533990370.107225.5765165679182115805@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179533990370.107225.5765165679182115805@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_014058_604471_25FA586D 
X-CRM114-Status: GOOD (  13.49  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 09:31:43AM -0000, Arun Iyengar wrote:
> On Sat, Nov 14, 2026 at 06:00:39AM +0100, Sebastian Reichel wrote:
> > @@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
> >  	status = wait_for_completion_timeout(&dp->complete, timeout);
> >  	if (!status) {
> >  		dev_err(dp->dev, "timeout waiting for AUX reply\n");
> 
> This still drops a reply the sink did send when the IRQ thread runs
> more than 10 ms late. On RK3588 (7.3, KASAN on, v11 of this series:
> same 06/23), with a SCHED_FIFO hog at the IRQ thread's priority on its
> CPU (busy 40 ms of every 200 ms), 1410 DPCD reads gave 183 timeouts.
> Checking for the reply once more before giving up gave 0 timeouts,
> with 127 late replies taken:
> 
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1493,2 +1493,6 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
>  	status = wait_for_completion_timeout(&dp->complete, timeout);
> +	if (!status) {
> +		synchronize_irq(dp->irq);
> +		status = try_wait_for_completion(&dp->complete);
> +	}
>  	if (!status) {
> 
> Feel free to fold it in.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Claude (Anthropic) wrote this change; I reviewed and tested it.

There's something missing here. You may have reviewed (whatever that
means) and tested it (probably), it doesn't seem you've understood it.
All of this screams of a big hack.

-- 
Regards,

Laurent Pinchart

