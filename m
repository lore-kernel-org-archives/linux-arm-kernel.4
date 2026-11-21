Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DA5606A683
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h6gJZopk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5GJRzs9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5oT62WpkqvQG1bllCQZAHu6BEqx9AIMOrpuD6eCPtoI=; b=h6gJZopk/7qL6HKKPQvthDIeUJ
	QtdKt9uATdsnGQigrA7dEAaCP0+M3BiEsMRz7GkI8dGH83u5JPH3lioz9LR8akIH87yMby1POP38G
	cXk2JBS0VhxettbC5gvBMSxiZK5AVp/kQkzBqmvBd4WJ+V646pWWvRNi+BvhYZ3D9Rojn3Mp3ori1
	Ts+38fXJ9nEbVu9i7r7DkECTKn7B3OFZxoms++tTpAcBLv0lVxkS9K3Ry6H7nakFK8NV3T/FcLxGq
	c7Xkka2AN7VVAjPnVyIAvZdBjHdBjK8QrKfT++w1lgxdooJlecIve9mNX6fj6gDlkOHdFJi1DI1Jy
	IV1P0BAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYYi-0000000GSbo-04N0;
	Sat, 21 Nov 2026 00:02:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYYg-0000000GSbZ-2Aq4;
	Sat, 21 Nov 2026 00:02:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99E784051A;
	Sat, 21 Nov 2026 00:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AD71F000CF;
	Sat, 21 Nov 2026 00:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795219341;
	bh=5oT62WpkqvQG1bllCQZAHu6BEqx9AIMOrpuD6eCPtoI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n5GJRzs9Z485qqcpHhRULwoD0w+4HXDdouFYqJZvFqbNqEtIj/LoieLf/eEa3yf3H
	 IgFe1HRN4ugJ4jQ2Fxoluy9faWOfAEL432IbD7XmvVvrCJTalonTnP16yaHnPltW+Z
	 TKQsRpxOvB/MgkzcbF8OfQommkTl0Mqfl2x3WxXgzjinZLPBhVwBjWhdGdJLFh6a8B
	 qMvHyV0kRA1rW4xKu38/XMpAxjQn4F0yxEWOdmm1euPxzUdY6f0crUEYRU28hhhe9k
	 PiG7uM5vQ3ornX44PSWB7MZ2+uwiPsmSa0wvqoq3AWYrNDUkWmCcDDbq9cQF90rnAr
	 qPFCd3H+10CaA==
Subject: Re: [PATCH net v10 05/10] can: rockchip_canfd: cancel bus-off restart
 before closing the device
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
Date: Sat, 21 Nov 2026 00:02:19 +0000
Message-ID: <179521933978.3131.189047644390163242@kernel.org>
In-Reply-To: <20261119-rockchip-canfd-restart-close-v10-5-df23913aa33a@qq.com>
References: <20261119-rockchip-canfd-restart-close-v10-5-df23913aa33a@qq.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says late restart work (queued by a bus-off
  IRQ after the early close_candev_cancel_restart_sync() in…

--

can: rockchip_canfd: cancel bus-off restart before closing the device

This patch adds a call to close_candev_cancel_restart_sync() at the start
of rkcanfd_stop(), so that a running bus-off restart is cancelled while
the IRQ, RX offload and controller are still available. Echo cleanup and
the final restart cancellation stay in close_candev().

> A bus-off IRQ can pass the scheduling check before close, then queue
> restart work after the early cancellation. The final cancellation after
> free_irq() drains that late work so it cannot survive close.

[Severity: Low]
Is this explanation complete? Late-queued restart work does not have to
wait for the final cancel. With a short restart_ms it can run anywhere
between the early cancel and close_candev().

That window covers rkcanfd_chip_interrupts_disable(), free_irq(),
can_rx_offload_disable() and rkcanfd_chip_stop_sync(). The final
cancel_delayed_work_sync() in close_candev() can't undo a restart that
has already run there.

In that window, only this check in can_restart() stops the restart:

drivers/net/can/dev/dev.c:can_restart() {
    ...
	if (!netif_running(dev))
		return -ENETDOWN;
    ...
}

Without that check, the work would reach rkcanfd_set_mode():

	case CAN_MODE_START:
		rkcanfd_chip_start(priv);
		rkcanfd_chip_interrupts_enable(priv);
		netif_wake_queue(ndev);

That check, and the "scheduling check" in can_bus_off():

	restart = priv->restart_ms && netif_running(dev);

both come from the earlier patch in this series, "can: dev: check
netif_running() before bus-off recovery".

Neither the commit message nor the Cc: stable tag names that dependency.
The patch only needs "can: dev: add close_candev_cancel_restart_sync()"
to build. So a backport that takes this patch and the helper, but not
the netif_running() patch, would build cleanly and still have the
restart-after-teardown race.

Could the commit message say that late work which runs before the final
cancel is stopped by the netif_running() check in can_restart()? Could
the netif_running() patch also be listed as a stable prerequisite?

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
> index 1cae86973da5a..59a79fe057e66 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -758,6 +758,7 @@ static int rkcanfd_stop(struct net_device *ndev)
>  {
>  	struct rkcanfd_priv *priv = netdev_priv(ndev);
>  
> +	close_candev_cancel_restart_sync(ndev);
>  	netif_stop_queue(ndev);
>  
>  	rkcanfd_chip_interrupts_disable(priv);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-rockchip-canfd-restart-close-v10-0-df23913aa33a%40qq.com

