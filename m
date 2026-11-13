Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932EB606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 03:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FtCJh0qS;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=UOeTeFTk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m3fmYBaNLptWcqbvTdAs8gd+S3McHL6fxfP2xtMRAWE=; b=FtCJh0qSy/gbZf
	hq1HRq+GaAVLQyGTfIUtgLb9a5Z40wEKGD8EKYh7Lz2JkjcswHv3nIBzHxdxUyuILGKJlmza+GjQr
	ZqooLR3KKE0nQNSxwU5edJDqW7qgM4YodpVutu7EEMU9csMd2ZNzWV0gJEFzFblSfveYgLEq4q0ls
	L6V1Ykc9paZ1SCL8OFPmFYBSADTWFL/jV7Y6umALJuaNBVTIeMJQnpKldsB+EdZHcS38Gpt5TJQ1A
	XouN8wDxdqFewjPn7VW2DWkiyxt/fpYPOSM6lvAFYdzTlRdyBNePtNlwcN0XDvyzcfcLXnCrGebOg
	7hgUWG5k98+XEOFQobWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiGA-0000000BbP1-2YtR;
	Fri, 13 Nov 2026 03:47:30 +0000
Received: from mail-m9357.xmail.ntesmail.com ([103.126.93.57])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiG7-0000000BbNu-03Ch;
	Fri, 13 Nov 2026 03:47:29 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5488ddde6;
	Fri, 13 Nov 2026 11:47:22 +0800 (GMT+08:00)
Message-ID: <d8c4201a-7fa5-4831-b2a0-7e603e443567@rock-chips.com>
Date: Fri, 13 Nov 2026 11:47:21 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/rockchip: vop2: Report POST_BUF_EMPTY at most
 once per frame
To: aiyengar1990@gmail.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-6-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-6-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d30462b203a8kunm6288f08e5bde9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBkaVhlOS0IeThgaSh8ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UOeTeFTknFLncW5GEyIIqqIAPAhoP8j7fodDwPUCsy9ptksY/V+zcWtpn4NERrJDm0gn/gfDgrY41ayvsT1WRO0R0/a01ZXggzWwaDtU58ia3adLvT/HqImPAgfGtvR4S3+NAC8HvHZhqZpWt3atIytZl3XG24J1toe9Yl7aGwY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=m3fmYBaNLptWcqbvTdAs8gd+S3McHL6fxfP2xtMRAWE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_194727_284734_9C0E9B0C 
X-CRM114-Status: GOOD (  14.54  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arun,

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> POST_BUF_EMPTY is raised for every line on which the post processing
> stage of a video port finds no data. The interrupt handler only
> rate-limits the error message and leaves the interrupt enabled, so an
> underflowing video port keeps the CPU in the interrupt handler 50000 to
> 300000 times per second, for as long as the configuration that causes
> the underflow stays in place (e.g. 120000 interrupts per second for
> 3840x2160@120 with two full screen layers on one AXI port).
> 
> Mask POST_BUF_EMPTY when it fires and unmask it at the next frame start.
> The frame start (FS) interrupt is enabled for that frame even when
> vblank reporting is off, and disabled again once POST_BUF_EMPTY is
> re-armed or the video port is switched off. VP_INT_EN is write-masked,
> so masking POST_BUF_EMPTY leaves FS alone; FS only needs enabling here
> while vblank reporting has it off. A new per video port lock
> serialises the interrupt enable bookkeeping between the interrupt
> handler and the vblank callbacks. The error is still reported, now at
> most once per frame and video port.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 91 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 10 +++
>   2 files changed, 97 insertions(+), 4 deletions(-)

Well. This change can indeed reduce CPU interrupt pressure when 
occasional POST_BUF_EMPTY occurs. However, we do not expect this error 
to happen during normal system operation: if POST_BUF_EMPTY shows up, it 
should be resolved by adjusting layers configurations or improving DDR 
bandwidth, rather than being masked.

On the other hand, this approach drops the per-line POST_BUF_EMPTY
information. In complex debugging scenarios we still need the per-line
error reports to locate issues, for example partial line data corruption
with AFBC on Cluster planes. Reporting only one interrupt per frame 
would hide these critical debug details.

So in my opinion, we should keep POST_BUF_EMPTY handling as it is.

Nacked-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


