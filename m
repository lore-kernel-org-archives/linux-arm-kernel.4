Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635E606EE98
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0u4JH6rW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEMegjre
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V999Ww7e4jGPhTXgZs2FNKeyvqVS8EnKiXdO6kDAvXY=; b=0u4JH6rWUIFmdmoDei0mDVt1Lo
	iirSf5k5/R7Z1BICmlsiFa5ZciNcMyA5CH8b2seunCjUrdkugv6S+5s8d1gWaDj3aI0qkajptZGUn
	RpcPp7pjOa4PsMkWnmAd5uIm+AyppszhFlZGkSlOtSAOBO44FFGZCZgqjwt+5w36khbAjiL1H/l1r
	vPprYD3KVfHa/DMGF056xed52O+PbMK3lW0SAM4fwTWKtBWgKfPZQaRezINumutobDppaJIpoC63s
	Q/r3sVs+xgr+IcpvrO+bnn1it3azG4kWUeJAXP6dGHNHBwFDp+XuMTrw7nPjiZ8dZLqKa1lfMPBpd
	d7sxCoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNhF-00000000Xs7-1J3w;
	Mon, 09 Nov 2026 11:37:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNh9-00000000Xli-0KNp;
	Mon, 09 Nov 2026 11:37:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFF284057A;
	Mon,  9 Nov 2026 11:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5451F008A6;
	Mon,  9 Nov 2026 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794224270;
	bh=V999Ww7e4jGPhTXgZs2FNKeyvqVS8EnKiXdO6kDAvXY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cEMegjreowe2UtJCPSarQ1ASuMem+nqmrGK8aCKSahZTQgpJC1BNp2j2lqL+qqM6b
	 C8nGjoGjYc5uqFCi8f4XXeCdydccMl35yB1u7UEmZt1Np/3w5t5NQfprj2NK7L9j+u
	 mYkwN5lGeqFK4rcUmm5KXgu5fNfbhC1l8MdA5znn7uWuio0UWMQ+6DvGSdhjf4VkQy
	 tBMjeIbqATpo+SSaJppIbDon8+wXuIrhs0HFPjgmR5SlEiaYoQlP8i4XbAIJ5ZLGPj
	 LI1Y6+H4xJaEiRq2BC+HqZS9DyFUUD2qO56eaCUUsnhWQqQ5TR1TenOgDI4cTQwkVW
	 bA0XP8XENChyw==
Subject: Re: [PATCH net v8 08/10] can: rockchip_canfd: serialize TX with
 bus-off and restart
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: mkl@pengutronix.de, kernel@pengutronix.de, mailhol@kernel.org,
 heiko@sntech.de, socketcan@hartkopp.net, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 wg@grandegger.com, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Mon, 09 Nov 2026 11:37:49 +0000
Message-ID: <179422426928.994134.3912589512501309699@kernel.org>
In-Reply-To: <20261108-rockchip-canfd-restart-close-v8-8-3e7a23fd9eae@qq.com>
References: <20261108-rockchip-canfd-restart-close-v8-8-3e7a23fd9eae@qq.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch adds `priv->irq_suspended` as a hand-rolled gate
  that keeps rkcanfd_irq() out of a code region: -…
- [Medium] rkcanfd_set_mode(CAN_MODE_START) masks device interrupts
  (INT_MASK = INT_ALL), reads the mask back, sets irq_suspended and…
- [Low] This commit carries `Cc: stable@vger.kernel.org` and Fixes: tags
  for the original v6.12-era driver commits (ff60bfbaf67f,…
- [Low] The new `!priv->tx_enabled` early return in
  rkcanfd_handle_rx_int_one() (drivers/net/can/rockchip/rockchip_canfd-…
- [Low] The patch adds `#include <linux/smp.h>` to
  drivers/net/can/rockchip/rockchip_canfd-core.c.

--

can: rockchip_canfd: serialize TX with bus-off and restart

This patch adds a tx_enabled flag, protected by tx_lock, that stops TX
submission and RX-side echo handling before CAN_STATE_BUS_OFF is
published. It also adds an irq_suspended flag that keeps rkcanfd_irq()
out while the controller is reinitialized on restart and open, and moves
carrier, TX, IRQ and queue restoration into rkcanfd_chip_start_finish().
Timestamp delayed work is now initialized once at probe.

> Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
> Fixes: b6661d73290c ("can: rockchip_canfd: add TX PATH")
> Cc: stable@vger.kernel.org

[Severity: Low]
Could the commit message list the backport prerequisites?

This patch is tagged for stable, but it only applies on top of earlier
patches in this series:

  "can: rockchip_canfd: serialize TX state and command writes" adds the
  tx_lock critical sections in rkcanfd_start_xmit() and
  rkcanfd_handle_rx_int_one() that the new tx_enabled checks sit in.

  "can: rockchip_canfd: prevent TX stall on echo skb failure" adds the
  skb_get() and echo failure handling.

  "can: rockchip_canfd: cancel bus-off restart before closing the device"
  adds the close_candev_cancel_restart_sync() context in rkcanfd_stop().

  "can: rockchip_canfd: disable RX offload on open failure" adds the
  can_rx_offload_disable() context in the open error path.

The v8 changelog below the --- line says the TX/RX critical sections were
moved into those earlier patches, but that text is dropped when the patch
is applied.

The chain also depends on "can: dev: add
close_candev_cancel_restart_sync()", which carries neither Cc: stable nor
Fixes:. Other patches in the series, such as "serialize TX state and
command writes" and "retry the outstanding TX buffer", do name their
prerequisites in the commit message.

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
> index d05264605efc2..536d9bc812afe 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/smp.h>
>  #include <linux/string.h>
>  
>  #include "rockchip_canfd.h"

[Severity: Low]
This isn't a bug, but is linux/smp.h the intended header here?

The only new symbols that need a header are smp_store_release() in
rkcanfd_chip_start_finish() and smp_load_acquire() in rkcanfd_irq(). Both
come from asm/barrier.h, not include/linux/smp.h. Nothing else in the file
uses linux/smp.h.

[ ... ]

> @@ -356,9 +386,17 @@ static int rkcanfd_set_mode(struct net_device *ndev,
>  
>  	switch (mode) {
>  	case CAN_MODE_START:
> +		rkcanfd_tx_disable(priv);
> +		rkcanfd_chip_interrupts_disable(priv);
> +		/* Flush the interrupt mask write before suspending the handler. */
> +		rkcanfd_read(priv, RKCANFD_REG_INT_MASK);
> +		WRITE_ONCE(priv->irq_suspended, true);
> +		/* Wait for handlers that already passed the suspended check. */
> +		synchronize_irq(ndev->irq);
> +		rkcanfd_timestamp_stop_sync(priv);
> +
>  		rkcanfd_chip_start(priv);

[Severity: Medium]
Is the INT_MASK value written above still in place once
rkcanfd_chip_start() runs?

rkcanfd_chip_start() starts with rkcanfd_chip_set_reset_mode(), which
pulses the controller reset:

rkcanfd_chip_set_reset_mode() {
	reset_control_assert(priv->reset);
	udelay(2);
	reset_control_deassert(priv->reset);

	rkcanfd_write(priv, RKCANFD_REG_MODE, 0x0);
}

The reset puts INT_MASK back to its hardware default. The driver only
writes it again after the ID filter, MODE, FIFO, timestamp and bit-timing
programming:

rkcanfd_chip_start() {
    ...
	rkcanfd_set_bittiming(priv);

	rkcanfd_chip_interrupts_disable(priv);
	rkcanfd_chip_set_work_mode(priv);
    ...
}

For that whole window irq_suspended is true. So rkcanfd_irq() returns
IRQ_NONE without reading or acking RKCANFD_REG_INT.

Suppose the INT_MASK reset default leaves some sources unmasked, and the
controller latches a status bit during this window. Could the
level-triggered, possibly shared, line then stay asserted with nobody
acking it? That would produce IRQ_NONE returns until
rkcanfd_chip_interrupts_disable() runs. If the IRQ goes to the CPU running
set_mode, it could hold off that progress. note_interrupt() could also end
up disabling the line for every device that shares it.

Whether this happens depends on the INT_MASK reset value and on whether
the controller can latch status in reset or config mode. Neither could be
confirmed from the code. Later patches in the series don't appear to
change this sequence.

The commit message says the restart masks device interrupts and keeps
other shared IRQ users enabled, but the mask doesn't seem to survive the
reset. Would re-masking INT_MASK right after reset_control_deassert() help
here? Another option would be to still ack RKCANFD_REG_INT in the
suspended path.

> -		rkcanfd_chip_interrupts_enable(priv);
> -		netif_wake_queue(ndev);
> +		rkcanfd_chip_start_finish(priv);
>  		break;

[ ... ]

> @@ -666,6 +710,10 @@ static irqreturn_t rkcanfd_irq(int irq, void *dev_id)
>  	struct rkcanfd_priv *priv = dev_id;
>  	u32 reg_int_unmasked, reg_int;
>  
> +	/* Pairs with smp_store_release() in rkcanfd_chip_start_finish(). */
> +	if (smp_load_acquire(&priv->irq_suspended))
> +		return IRQ_NONE;

[Severity: Medium]
Is irq_suspended acting as a hand-rolled lock around the reinitialization
region?

rkcanfd_set_mode() and rkcanfd_open() set it on entry:

	WRITE_ONCE(priv->irq_suspended, true);

rkcanfd_chip_start_finish() clears it on exit:

	smp_store_release(&priv->irq_suspended, false);

It is checked here without a lock. Its job is to keep rkcanfd_irq() away
from FIFO, timestamp, BQL and INT_MASK state while rkcanfd_chip_start()
reprograms the controller. The networking driver guidelines list a flag
that is set on entry and cleared on exit of a code region to prevent
concurrent access as a bug pattern. Lockdep cannot see it.

No race with the current callers was found, because synchronize_irq()
after the flag store drains handlers that are already running. Even so,
correctness relies on every caller repeating the same sequence: mask,
readback, flag store, then synchronize_irq().

rkcanfd_set_mode() does the full sequence. rkcanfd_open() only sets the
flag. rkcanfd_stop() does not use the flag and relies on free_irq().

While the flag is set, the handler also stops acking device status (see
the INT_MASK question above). Would a real synchronization primitive fit
better here?

[ ... ]

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-rx.c b/drivers/net/can/rockchip/rockchip_canfd-rx.c
> index 23476a334d6c3..fb98dd0da4913 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-rx.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-rx.c

[ ... ]

> @@ -242,7 +242,15 @@ static int rkcanfd_handle_rx_int_one(struct rkcanfd_priv *priv)
>  		return 0;
>  	}
>  
> +	/* Drop consumed FIFO entries while TX is disabled to avoid delivering
> +	 * self-received frames as ordinary RX without echo filtering.
> +	 */
>  	spin_lock_irqsave(&priv->tx_lock, flags);
> +	if (unlikely(!priv->tx_enabled)) {
> +		spin_unlock_irqrestore(&priv->tx_lock, flags);
> +		return 0;
> +	}

[Severity: Low]
Should this drop path increment stats->rx_dropped?

By this point rkcanfd_read_rep() has already taken the entry out of
RKCANFD_REG_RX_FIFO_RDATA. The check does not tell self-received echoes
apart from frames sent by other nodes, so valid frames are dropped as
well. The bec.rxerr correction is also skipped.

Every other path in rkcanfd_handle_rx_int_one() that consumes an entry
without delivering it is counted:

  an empty header bumps rx_fifo_empty_errors
  an FDF frame with CAN-FD disabled bumps stats->rx_dropped
  an skb allocation failure bumps stats->rx_dropped

rkcanfd_stop() can reach this branch, because it disables TX before it
masks device interrupts and frees the IRQ:

rkcanfd_stop() {
    ...
	close_candev_cancel_restart_sync(ndev);
	rkcanfd_tx_disable(priv);

	rkcanfd_chip_interrupts_disable(priv);
	free_irq(ndev->irq, priv);
    ...
}

An RX_FINISH interrupt in that window would go through
rkcanfd_irq()->rkcanfd_handle_rx_int()->rkcanfd_handle_rx_int_one(). So
would a handler that is already draining the FIFO on another CPU. Either
way the frames are discarded and do not show up in the standard netdev
stats.

The restart and open paths don't appear to reach this branch.
can_restart_now() requires CAN_STATE_BUS_OFF, so the controller is already
in reset. tx_enabled is also set again before irq_suspended is cleared.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae%40qq.com

