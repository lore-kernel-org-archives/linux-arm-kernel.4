Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MK7Kp0gG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtksSc0l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zAYFUjiX0jOUAJDHJtH/L7YVqP+edUw5GTR3eb2mpnw=; b=MK7Kp0gGLz3WrIJ2jdfzn7pB2Q
	gmSfSm8hbr3U/TA6lWP/N7OL723PQRfq+OtfcriH443l6Z7FrzaChFdNLE+uts3BQKqx/daNjjbyZ
	hUnI/ooEt55mS8pMKuUBfpd7eb6TPqN6xz/g30vgyZzcDBqTJSldYIWGOD8AWFiNMvdtLGrGzXOLh
	u9hw9uGWfQi3qed4ehg55OELz6J9Ut2IlL8+pE9mbcmcMcsGOaJSM/sUg6hXJ7cgZFOUhBSyi0RtC
	2GbDUJV6CnAM0Z9XKdVF/Y+jPdpcU6Fn6ZKBKOQwAdHdeTsunSj5ibbLLBlKybe4X39EGyBF9vZeV
	Yfjfl6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdLc-0000000BAet-2xWJ;
	Thu, 12 Nov 2026 22:32:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdL6-0000000BAMW-1wRl;
	Thu, 12 Nov 2026 22:32:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B047464D7;
	Thu, 12 Nov 2026 22:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7981F000C5;
	Thu, 12 Nov 2026 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522736;
	bh=zAYFUjiX0jOUAJDHJtH/L7YVqP+edUw5GTR3eb2mpnw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mtksSc0le/FtM79/qJHhucirm/de9afd2YTo+JwFl31Px+ikx3c6qFa35CT54BW2i
	 Uu2mgaRZuh7Po2BF91/3z5ROtINoKcogwasnPi/BbM8H6HC4/MJFrKuNcOJZFcmG+0
	 Lt+t5mRZrK/BWSoIN8iE9EUuxp9iDYrNZ3A9mRr+8uFmU4m3YXGkZlTZguu8/Rgol9
	 5tZZbr9aB0OpBw7sDvXqYIhyBR0r9baCjNRX4ZUtdGHeqQiXxiA02kOj/3IC8LRD8i
	 Me0EyGbHfA+5YDpc8o1zGWzRZLA2rGHptB4+KIRo/mYOQDo7C/zZIFr8SyjjUcNkF/
	 33hVw20cOX2oQ==
Subject: Re: [PATCH net v9 08/10] can: rockchip_canfd: serialize TX with
 bus-off and restart
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
Date: Thu, 12 Nov 2026 22:32:14 +0000
Message-ID: <179452273462.488853.12444870521885218967@kernel.org>
In-Reply-To: <20261111-rockchip-canfd-restart-close-v9-8-6643f3825ba3@qq.com>
References: <20261111-rockchip-canfd-restart-close-v9-8-6643f3825ba3@qq.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch adds priv->irq_suspended, a plain bool used as an
  ad-hoc gate for the IRQ handler.
- [Low] The commit message for "can: rockchip_canfd: serialize TX with
  bus-off and restart" carries Cc: stable@vger.kernel.org and Fixes:…
- [Low] rkcanfd_chip_set_reset_mode() writes RKCANFD_REG_INT_MASK =
  RKCANFD_REG_INT_ALL immediately after reset_control_deassert(), with…

--

can: rockchip_canfd: serialize TX with bus-off and restart

This patch adds a tx_enabled flag, protected by tx_lock, that stops TX
submission and RX echo handling before bus-off is published and while the
controller restarts. It also adds an irq_suspended flag that keeps the
shared IRQ handler out during reinitialization, restores INT_MASK right
after reset deassertion, and moves timestamp work initialization to probe.

> Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
> Fixes: b6661d73290c ("can: rockchip_canfd: add TX PATH")
> Cc: stable@vger.kernel.org

[Severity: Low]
This patch is tagged for stable. Should the commit message also list the
patches a backport depends on?

It relies on several earlier changes:

- the tx_lock critical sections in rkcanfd_start_xmit() and
  rkcanfd_handle_rx_int_one(), from "can: rockchip_canfd: serialize TX
  state and command writes"
- the close_candev_cancel_restart_sync() call in rkcanfd_stop(), from
  "can: rockchip_canfd: cancel bus-off restart before closing the device"
  and "can: dev: add close_candev_cancel_restart_sync()"
- the netif_running() check in can_restart(), from "can: dev: check
  netif_running() before bus-off recovery"
- the skb_get() echo ownership handling, from "can: rockchip_canfd:
  prevent TX stall on echo skb failure"

The commit that adds close_candev_cancel_restart_sync() has neither a Cc:
stable nor a Fixes: tag.

Earlier patches in the series state their dependencies ("Backports must
include...", "Backports need..."). This patch has the most dependencies
but lists none.

A backport that only follows the Fixes: tags would fail to apply. A version
adapted by hand would lack the serialization that the tx_enabled checks
depend on.

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
> index d05264605efc2..a5c6331191d17 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c

[ ... ]

> @@ -116,6 +118,10 @@ static void rkcanfd_chip_set_reset_mode(const struct rkcanfd_priv *priv)
>  	udelay(2);
>  	reset_control_deassert(priv->reset);
>  
> +	/* Reset clears INT_MASK; restore it before configuring the controller. */
> +	rkcanfd_write(priv, RKCANFD_REG_INT_MASK, RKCANFD_REG_INT_ALL);
> +	rkcanfd_read(priv, RKCANFD_REG_INT_MASK);
> +
>  	rkcanfd_write(priv, RKCANFD_REG_MODE, 0x0);
>  }

[Severity: Low]
Is the CAN core known to be out of reset when this INT_MASK write
arrives?

On Rockchip, reset_control_deassert() goes to rockchip_softrst_deassert().
That function does one posted write to the CRU, with no read-back and no
delay:

drivers/clk/rockchip/softrst.c:rockchip_softrst_deassert() {
    ...
	if (softrst->flags & ROCKCHIP_SOFTRST_HIWORD_MASK) {
		writel((BIT(offset) << 16), softrst->reg_base + (bank * 4));
    ...
}

The CRU and the CAN controller are separate peripherals. The barrier in
writel() orders when writes are issued, not when they reach the device.
So the INT_MASK write could reach the CAN IP while it is still in reset.

If that write is lost, INT_MASK stays at its reset value of 0, which
leaves every interrupt unmasked. That lasts through the FIFO, timestamp
and bittiming setup, until rkcanfd_chip_interrupts_disable() runs later
in rkcanfd_chip_start(). The read-back does not detect this because its
value is thrown away.

The commit message says:

  "Restore and flush the full mask immediately after deassertion so the
  remaining controller configuration stays masked."

On the restart path, irq_suspended is true during this window. An
interrupt raised then would get IRQ_NONE without an ack, and the shared
line would stay asserted until the next mask write.

This depends on the arrival order between the CRU and the CAN block and
on how long the reset takes to release. I could not confirm either
without the SoC documentation.

Should there be a short settle delay after deassertion, or a check of the
read-back value?

[ ... ]

> @@ -356,9 +390,17 @@ static int rkcanfd_set_mode(struct net_device *ndev,
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
> -		rkcanfd_chip_interrupts_enable(priv);
> -		netif_wake_queue(ndev);
> +		rkcanfd_chip_start_finish(priv);
>  		break;

[Severity: Medium]
Is irq_suspended working as a lock here?

Two paths set it before a block of work. rkcanfd_set_mode() sets it
before the controller is reinitialized. rkcanfd_open() sets it before
rkcanfd_chip_start() and request_irq().

In both paths, rkcanfd_chip_start_finish() clears it:

	smp_store_release(&priv->irq_suspended, false);

rkcanfd_irq() checks the flag without taking a lock:

	if (smp_load_acquire(&priv->irq_suspended))
		return IRQ_NONE;

This keeps the handler away from state that rkcanfd_chip_start()
rewrites: reg_int_mask_default, reg_mode_default, bec, tx_head/tx_tail,
cc/tc and can.state.

I did not find a concrete failure in the current code. synchronize_irq()
takes desc->lock, which makes the WRITE_ONCE() visible to handlers that
start after it. The release/acquire pair makes the reinitialized state
visible.

Even so, the exclusion depends on synchronize_irq() and on the rule that
only one instance of a handler runs at a time. Lockdep cannot see either.

It also holds only as long as every path that sets the flag calls
synchronize_irq() afterwards. Other code that uses the same state, such
as the do_get_berr_counter callback rkcanfd_get_berr_counter(), is not
covered by the flag.

The networking driver guidelines treat a flag that is set on entry and
cleared on exit to block concurrent access as an ad-hoc lock. They ask
for a real lock or RCU instead. Could this use a real lock?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-rockchip-canfd-restart-close-v9-0-6643f3825ba3%40qq.com

