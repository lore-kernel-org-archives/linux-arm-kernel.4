Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D4606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZEKSr2hQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W9rz7AwU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vVTWkhfLiH/QsLki+tG2g1OrDcp1ntC4ATOpIndsvv4=; b=ZEKSr2hQ8KtIGcj3ULYLLhYqOZ
	GydBMbSW3pHjKI/Re0iQTvS6AlWye2Pj5BDjxwVzw+FGFA7lNwXL2DkC6DRq0IeBd6HdyuFsIuiuF
	o1noCNxUmj/0Ie1ypr/jBy35nf8KYgtbg+8bHQytkWB8IIVLTKsc/dAU31aURsI0aAw27v8tk7hY3
	lF1memYkT25ZrtsfspC4XIk6Z95ieci+a9EmV5EqW3tcyyv0jogKdpAlhudMs0LPf7BfRwiVH6l6G
	mf3VCWw7mDY3NYyOj0QlG78cnVRlpa32DunfdszHsvhaIJunP4YcJ/Y1AkyILbSRvLMpCI75tA7ad
	loVB3vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYZD-0000000GSpP-2GQV;
	Sat, 21 Nov 2026 00:02:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYYl-0000000GSdM-3uAP;
	Sat, 21 Nov 2026 00:02:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C8C5411C8;
	Sat, 21 Nov 2026 00:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639661F000C6;
	Sat, 21 Nov 2026 00:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795219347;
	bh=vVTWkhfLiH/QsLki+tG2g1OrDcp1ntC4ATOpIndsvv4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W9rz7AwUeMWreMrPywL+G/eoSE/ac2EveLkjzau1+l0PpgXWjbqzH2KWAYN5hxD/0
	 evRhjZHWufSyBIVEzlrjwmfIRXPIpt4QTk1ivutvkXBvV4bFQhJFI/26GRbX5pvHM3
	 EluX44uvrajwnxDAhlXrXaS9HMrM07H3/Ou6qQO3hPenvRQtCRv06l9uXteA/pLViA
	 O/TGDLSTfnS2YI04Br/iLpk4mLydKXSfwv1M7WJajGUA6OHjBWCG6swUWr+dJKhQ0M
	 WnI7u47mSRhMBbQggvz7GW8gE4F4+V8Q9YuTyV9In9Zwsf4s7HMXNClCq0SxgZhO/E
	 eRAYjIXBkfH8A==
Subject: Re: [PATCH net v10 10/10] can: rockchip_canfd: serialize timecounter
 timestamp conversion
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, kernel@pengutronix.de, mailhol@kernel.org,
 heiko@sntech.de, socketcan@hartkopp.net, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 wg@grandegger.com, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 stable@vger.kernel.org
Date: Sat, 21 Nov 2026 00:02:25 +0000
Message-ID: <179521934595.3131.13988876249908602124@kernel.org>
In-Reply-To: <20261119-rockchip-canfd-restart-close-v10-10-df23913aa33a@qq.com>
References: <20261119-rockchip-canfd-restart-close-v10-10-df23913aa33a@qq.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch is tagged `Cc: stable@vger.kernel.org` with `Fixes:
  4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping…

--

can: rockchip_canfd: serialize timecounter timestamp conversion

This commit holds priv->timestamp_lock around timecounter_cyc2time() in
rkcanfd_skb_set_timestamp(). That serializes the RX, TX completion and
error-frame timestamp conversion against timecounter_read() in the
timestamp worker. The comment on timestamp_lock in struct rkcanfd_priv is
also changed to say it protects tc and timestamp_active.

> Hold timestamp_lock across timecounter_cyc2time(), using the same lock
> as timecounter_read() and timecounter_init(). Keep the SKB timestamp
> assignment outside the critical section.

[ ... ]

> Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
> Cc: stable@vger.kernel.org

[Severity: Low]
Should the stable tag mention that this depends on the earlier patch in
the series, "can: rockchip_canfd: prevent timestamp work from rearming
after bus-off"?

The timestamp_lock and timestamp_active members of struct rkcanfd_priv are
not in 4e1a18bab124. The earlier patch adds them. It also puts
timecounter_read() in rkcanfd_timestamp_work() and timecounter_init() in
rkcanfd_timestamp_start() under the lock:

    spin_lock_irqsave(&priv->timestamp_lock, flags);
    if (priv->timestamp_active)
        timecounter_read(&priv->tc);
    spin_unlock_irqrestore(&priv->timestamp_lock, flags);

If this patch is picked on its own for a stable kernel that only has
4e1a18bab124, it will not build. A backporter could add just the lock to
get it building. timecounter_read() and timecounter_init() would still
not take that lock, so the race would stay open.

Other patches in the series list their stable prerequisites, for example
"# prerequisite for the Rockchip restart/close fix". Would something like
this work here?

    Cc: stable@vger.kernel.org # depends on "can: rockchip_canfd: prevent timestamp work from rearming after bus-off"

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-rockchip-canfd-restart-close-v10-0-df23913aa33a%40qq.com

