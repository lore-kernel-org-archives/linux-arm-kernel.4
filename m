Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EA6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sw9oBElN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WK1SZ2ty
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=48VJYDAuIt0iLg0S1Cc71k3C6Jpv8GbdLJgMXR02WJE=; b=Sw9oBElNKr4WUIWTb3HA7QkAwp
	9Zs3d6lLyV8qx60ic6dg2vjYsmnikNQIEItd3dYizfauB9W1GYQLs/l5FTSDuR9pVmEnE/1gKIeTn
	O1IRrc1H52zqpxp7Oj+VvND0gEwZLqslCUAskWcQZPRcVLeXdGnbhIFjPj1MJgHh8czkz7ZNLK3lz
	mQb3L31hEXqirmks6VDnuQ7zEkKPJ17571hXp8pAV4lm4vv/DP1fkZ+FZ3opGNK8evcas2ha98Y7u
	pjOAh/Yz/G+PoREXQzUIq7GqsJAZO+1cM0okFTqTagIX6ZP5Rgti29kz2E5VlStaPeuWRw8LZMZhU
	B8qhCZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdLV-0000000BAb0-23kv;
	Thu, 12 Nov 2026 22:32:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdL4-0000000BAKt-3Vxa;
	Thu, 12 Nov 2026 22:32:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BA6944E62;
	Thu, 12 Nov 2026 22:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B8B1F000C9;
	Thu, 12 Nov 2026 22:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522734;
	bh=48VJYDAuIt0iLg0S1Cc71k3C6Jpv8GbdLJgMXR02WJE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WK1SZ2tyrMYhJF/bZa4tEgn7hNxQSuUHNriOZekpe0FEf805H9H30EWWPUzGdG7ZS
	 f7dFNPDMTUlTK6k6D75/z7hCezGI6bgRaNl6oSBghVHoMYD7rdlST0RoxoBQxJG+e0
	 RSnR8GmZyArpwpmvQ/eKbVkZLDmX3l1txiaQ+H2uNYyFZcRXI21LbkxrxWrRKZniHF
	 07g5RCfvQp+KYJlx7oF45NucDumEpUZCq2rWM3gJk5i8HbbQpnT2wmVSK7Qznn0mdB
	 /GIlK/W6mEITS/+PzTCZjOosbMjnuKZcnyDNwEu/fvNL38lZxAYFOodbg7rdU4emV/
	 SR2CImU1I8o2g==
Subject: Re: [PATCH net v9 06/10] can: rockchip_canfd: cancel bus-off restart
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
Date: Thu, 12 Nov 2026 22:32:12 +0000
Message-ID: <179452273299.488853.8253978964891645481@kernel.org>
In-Reply-To: <20261111-rockchip-canfd-restart-close-v9-6-6643f3825ba3@qq.com>
References: <20261111-rockchip-canfd-restart-close-v9-6-6643f3825ba3@qq.com>
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

- [Low] The patch has a missing stable dependency annotation.

--

can: rockchip_canfd: cancel bus-off restart before closing the device

The patch adds a call to close_candev_cancel_restart_sync() at the start
of rkcanfd_stop(). Today restart_work is only cancelled in close_candev(),
which runs after the IRQ has been freed and the controller stopped. The
earlier cancel is meant to stop a concurrent bus-off restart from turning
the controller back on after IRQ teardown.

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

[Severity: Low]
This patch has Fixes: ff60bfbaf67f and Cc: stable@vger.kernel.org. Will it
build when backported on its own?

The close_candev_cancel_restart_sync() helper is only added to
include/linux/can/dev.h by the earlier commit "can: dev: add
close_candev_cancel_restart_sync()". That commit has no Fixes: tag and no
Cc: stable tag:

static inline void close_candev_cancel_restart_sync(struct net_device *dev)
{
	struct can_priv *priv = netdev_priv(dev);

	cancel_delayed_work_sync(&priv->restart_work);
}

The early cancel also appears to depend on the earlier commit "can: dev:
check netif_running() before bus-off recovery". That commit adds these
checks in drivers/net/can/dev/dev.c:

can_bus_off():
	restart = priv->restart_ms && netif_running(dev);

can_restart():
	if (!netif_running(dev))
		return -ENETDOWN;

Without those checks, a bus-off IRQ can still arrive after the new early
cancel but before free_irq(). In that case can_bus_off() would requeue
restart_work.

can_restart() would then call do_set_mode(CAN_MODE_START) unconditionally:

can_restart_work()
  can_restart()
    priv->do_set_mode(dev, CAN_MODE_START)
      rkcanfd_set_mode()
        rkcanfd_chip_start()

That turns the controller and its interrupts back on and schedules
timestamp work after free_irq() and rkcanfd_chip_stop_sync(). This is the
same failure the commit message describes. The cancel_delayed_work_sync()
in close_candev() runs after rkcanfd_chip_stop_sync(), so it comes too late
to prevent it.

In mainline both prerequisites come earlier in the series, so the in-tree
fix is complete. Other patches in this series say what their backports need
(for example, the "Backports must include ..." notes in "can:
rockchip_canfd: retry the outstanding TX buffer" and "can: rockchip_canfd:
serialize TX state and command writes").

Could this patch carry a similar note, or Stable-dep-of annotations, for
both of these dependencies?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-rockchip-canfd-restart-close-v9-0-6643f3825ba3%40qq.com

