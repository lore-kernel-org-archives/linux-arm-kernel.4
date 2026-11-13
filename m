Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tq3N0UHc;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jzY9LK4/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WGzrbb9Ex+mxcBU1HN07l5VKAti9MvUiAb5zdaFIefE=; b=tq3N0UHckIee4J
	JPzpzVDHPPscQf8CxB5DjLN4bt6EFvyqq7qT7JwLmut/usvMGIXKQOSRrSnP6oXka/quz89Cmds3A
	zb/ZAgYRQFR555+dL8jlXAXtNoWVJI4vSHdbNE0VouJLLJZwWYDhGl0Mk6Yu4wKb5zDbuVkqo4iX/
	ESwoZxmXaI32nu/kR/n2sNRSNNZ+z4qgX8cYaryQCRMJScbsKmmNY9hZhTDr5HHXtZ7OTB4voR9TI
	agnCOeyQdK+JcsLT2g+I6bmy/F4nEmI7ht+/Xrv84GazLtJsOfPbvs0pT7JJR+inwSveF9n1wQXPO
	PXQpezECcRu0UFB61BSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfyJ-0000000BQZ6-3Ty3;
	Fri, 13 Nov 2026 01:20:55 +0000
Received: from mail-m81155.netease.com ([47.88.81.155])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfyF-0000000BQY4-0tAt;
	Fri, 13 Nov 2026 01:20:53 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 548371a1c;
	Fri, 13 Nov 2026 09:20:45 +0800 (GMT+08:00)
Message-ID: <fc6344ec-c05c-424c-b625-10db05a971e6@rock-chips.com>
Date: Fri, 13 Nov 2026 09:20:42 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/rockchip: vop2: Balance window fetches across
 both AXI ports on RK3588
To: aiyengar1990@gmail.com
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-5-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-5-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d27e280b03a7kunmefdcd92d9fac3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDS05NVh0dGEkaSR0dHkhJTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jzY9LK4/ON6eY6KhwhGwDVueItq52MIS7fwO64EYIVFJy5Mz06nIqScMNriiPDu/bUJ2koMefOB910yaEfbpxGlF3wIhKIHA1tMwV12yF92OINKB3LKSnkBYoYjykSFjJGwndeIRanbA4czxac+JdPz5ClaIInavT0NQX42zpns=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=WGzrbb9Ex+mxcBU1HN07l5VKAti9MvUiAb5zdaFIefE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_172052_033105_D0235BDD 
X-CRM114-Status: GOOD (  21.84  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arun,

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The RK3588 VOP2 fetches through two AXI read ports. Every window has a
> fixed default port in rk3588_vop_win_data: Cluster0/1 and Esmart0/1 use
> AXI0, Cluster2/3 and Esmart2/3 use AXI1. The port is chosen by a per
> window register (CLUSTER_CTRL[13] / ESMART_AXI_CTRL[1]), though, and it
> is programmed on every plane update.
> 
> One port can't sustain two full screen 4K@120Hz layers. With the
> console on Cluster0 (the primary plane of video port 0) and a video on
> Esmart0 (its overlay plane), both on AXI0, HDMI 3840x2160@120 reports
> POST_BUF_EMPTY on about half of all lines (~120000 per second) and the
> picture is scrambled. The VOP read rate measured with the DDR PMU drops
> from the expected 6.3 GB/s to 3.2 GB/s: the fetch collapses instead of
> merely saturating. Measured at 4K@120Hz, XR24 primary plane:
> 
>   Cluster0 + Esmart0 (AXI0 + AXI0)	~120k POST_BUF_EMPTY/s
>   Cluster2 + Esmart2 (AXI1 + AXI1)	~100k/s
>   Esmart0 + Esmart1  (AXI0 + AXI0)	~90k/s (XR24 both)
>   Cluster0 + Esmart2 (AXI0 + AXI1)	0, 9.2 GB/s read
>   Cluster0 + Cluster2 (AXI0 + AXI1)	0, 8.6 GB/s read
> 
> Moving Esmart0 to AXI1 at runtime (with no other change) makes the
> first case clean. Raising ACLK_VOP from 750 to 850 MHz, or changing
> the NoC QoS priority or mode of the VOP ports, makes no difference,
> and neither does the buffer placement (both planes scanning out the
> same buffer fail the same way). So the limit is per port, and the
> fixed assignment puts both layers of the most common configuration on
> the same port while the other one sits idle. Lower modes are affected
> too: the same port also carries Cluster1 for a second display, and
> under DDR contention from other masters a 4K@60Hz port with the
> console, an overlay and a second display underflows for short bursts.
> 
> Choose the port of a window when it starts fetching instead. The atomic
> check assigns the ports from the whole new state and keeps the
> assignment in a private object for the next check. The port of a window
> is also stored in its plane state, and that is what the plane update
> programs: commits on different video ports aren't ordered against each
> other, so the private state of a commit may already be replaced and
> freed when its planes are updated. A window that keeps fetching keeps
> its port, so an active layer is never moved. The windows
> that start fetching, the busiest first, each get the port that leaves
> the busier port least loaded, preferring the default one on a tie. The
> load of a window is its estimated fetch rate: source size x bits per
> pixel of all its planes x refresh rate.
> 
> A window must not share an AXI read ID with another window on the same
> port. The IDs in the table are unique per default port, and mirrored
> between the two ports (Cluster0/Cluster2, Esmart0/Esmart2, ...), so a
> window can always use the port its mirror isn't on. A window that is
> switched off keeps fetching until the next frame start of its video
> port, so its read IDs stay in use for a window that starts on another
> video port in the same commit, and until the commit that switched it
> off is done.
> 
> This is only enabled for RK3588, where it was measured.

According to TRM, "In order to maintain synchronization between layers,
allocationg the layers used by the one port on AXI0 and AXI buses
respectively is not allowed."

Fortunately, we have another way to accomplish this: use the VP merge
feature. Please refer to the patch below.

https://lore.kernel.org/all/20261029081429.862-1-kernel@airkyi.com/

-- 
Best, 
Chaoyi

