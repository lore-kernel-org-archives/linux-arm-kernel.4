Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B2606EE94
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Harfdzvm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7UoJ4qU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y3RNcp4pnRlKxAjxnzkLeSDjNbMJzP30RaISr73JjaU=; b=Harfdzvm0KE/82kN/517oKs72t
	be7KWyMF4bF79PeKBfsdKlMm1QTa05N7lvPpwe0rBax9ayWkPGDTiP4cZPJKR0t8WvbPmf35+AVpq
	UuWIIJC618NCWvDtmtJcLZ7NQpY5JgX0nEvIyT37dzD1BtEsoKws8h87PECLm0VXPUx9Mv+tDOg6p
	aoRuYPUA7Mb+xFPboBfFiOmPC/alE6ZHKbPBC2qqvHz8pW1OEPdpDCe/Mzg7pD7dr3JaD8HlBwB3X
	0KnG+pVfYOKMTKZXa8mUToVCvhvTjFcDgjwlGRvnEIy31FUfiPRpNvHpLJ1f5MBCFoELt8fSRqIiS
	r/1PqH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNhF-00000000Xsy-2Ukz;
	Mon, 09 Nov 2026 11:37:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNhA-00000000Xn2-3UhP;
	Mon, 09 Nov 2026 11:37:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9307A45839;
	Mon,  9 Nov 2026 11:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AE21F008A4;
	Mon,  9 Nov 2026 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794224272;
	bh=Y3RNcp4pnRlKxAjxnzkLeSDjNbMJzP30RaISr73JjaU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e7UoJ4qUmetFXicfvMj8lPo0PrvfWYyqNGOclNmOE61ADo7Ev5ENGKxyb2g0mBSxj
	 x5CS7Gpx7hTutSFF1uRljrxkOvT+sGm9RAo2PofvivVJOa4ofl64azJqvqPELGIEAd
	 jSjfSjG688iFxZ4gTfAPOScmUOzaDq5oUFvhloVmXgVXwlf0XHO6bmGnhi6TcMLpgS
	 ultz0EvbSLsISi6FIL6lm2jCR3MjXWIkoWkuESbElTkf2T5lv447srR0jWBNX8Q+Bv
	 3YU+PgFi46QH7giBAc4jZI0wRxYZCMLbEgoq9XJp+VlRUNAf8WyV4v0RbYjk5lo6TM
	 sBAEqO3v4mQ/Q==
Subject: Re: [PATCH net v8 09/10] can: rockchip_canfd: prevent timestamp work
 from rearming after bus-off
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
Date: Mon, 09 Nov 2026 11:37:50 +0000
Message-ID: <179422427089.994134.14595272665034265410@kernel.org>
In-Reply-To: <20261108-rockchip-canfd-restart-close-v8-9-3e7a23fd9eae@qq.com>
References: <20261108-rockchip-canfd-restart-close-v8-9-3e7a23fd9eae@qq.com>
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

- [Low] The patch is tagged Cc: stable but does not say that it depends
  on the preceding commit "can: rockchip_canfd: serialize TX with bus-…
- [Low] The commit message gives only one consequence: the worker can
  "keep polling while the controller remains bus-off".

Pre-existing issues:
- [Medium] Concern: in this commit, rkcanfd_skb_set_timestamp() reads
  priv->tc through timecounter_cyc2time() from hardirq context without…

--

can: rockchip_canfd: prevent timestamp work from rearming after bus-off

This adds timestamp_lock and a timestamp_active flag to rkcanfd_priv.
With them, the timestamp worker reads the timecounter and requeues itself
only while timestamping is active. The start and stop helpers set or clear
the flag under the lock, and the work is cancelled outside it.

> The bus-off IRQ cancels timestamp work asynchronously. If the worker
> is already running, it can requeue itself after cancellation and keep
> polling while the controller remains bus-off.

[Severity: Low]
Can the commit message name a user-visible consequence of this polling?

The only trigger is the bus-off path:

rkcanfd_handle_state_error_int()
  rkcanfd_chip_stop()
    rkcanfd_timestamp_stop()
      cancel_delayed_work()

As far as I can tell, every way out of bus-off already stops the worker
synchronously:

- Restart through rkcanfd_set_mode() calls rkcanfd_timestamp_stop_sync()
  before rkcanfd_chip_start().
- Close goes through rkcanfd_chip_stop_sync().

In both cases cancel_delayed_work_sync() handles a work item that requeues
itself.

Runtime PM is held until after rkcanfd_chip_stop_sync() in rkcanfd_stop().
That means the stray worker never reads a clock-gated controller.

Anything it adds to priv->tc is thrown away when rkcanfd_timestamp_start()
runs timecounter_init() again.

Given the Cc: stable tag, could the message either describe a concrete
consequence or say that this is a hardening change?

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
> index ad582afbbd682..1d2a122770dc8 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
> @@ -30,18 +30,27 @@ static void rkcanfd_timestamp_work(struct work_struct *work)

[ ... ]

>  void rkcanfd_timestamp_work_init(struct rkcanfd_priv *priv)
>  {
> +	spin_lock_init(&priv->timestamp_lock);
> +	priv->timestamp_active = false;
>  	INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
>  }
>  
> +/* The caller must quiesce IRQs and timestamp work before reconfiguration. */
>  void rkcanfd_timestamp_init(struct rkcanfd_priv *priv)

[Severity: Low]
Should the commit message say that this depends on the preceding commit,
"can: rockchip_canfd: serialize TX with bus-off and restart"?

That commit added rkcanfd_timestamp_work_init() and its one-time call from
rkcanfd_probe(). It also moved INIT_DELAYED_WORK() out of
rkcanfd_timestamp_init().

Before it, the work is initialized on every rkcanfd_chip_start(), which
means on every open and every restart:

rkcanfd_timestamp_init() {
    ...
	priv->work_delay_jiffies = div_u64(work_delay_ns, 3u * NSEC_PER_SEC / HZ);
	INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
    ...
}

The new comment on rkcanfd_timestamp_init() also relies on code from that
commit: the synchronize_irq() and rkcanfd_timestamp_stop_sync() calls in
rkcanfd_set_mode().

On its own, this patch won't apply to stable trees. An obvious manual
backport would put spin_lock_init() next to the old INIT_DELAYED_WORK().
That would re-initialize timestamp_lock on every restart, while an old
worker may still hold it.

Other patches in this series have a "Backports must include ..."
paragraph. Would a similar note help here?

[ ... ]

> diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
> index 3664124a8da25..078876769a05d 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd.h
> +++ b/drivers/net/can/rockchip/rockchip_canfd.h
> @@ -477,6 +477,8 @@ struct rkcanfd_priv {
>  
>  	/* Serialize TX submission/completion with bus-off and restart. */
>  	spinlock_t tx_lock;
> +	/* Protects timestamp_active and worker reads/requeueing. */
> +	spinlock_t timestamp_lock;

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch.
priv->tc still has a reader that does not take the lock.
rkcanfd_skb_set_timestamp() calls timecounter_cyc2time() from hardirq
context without timestamp_lock:

rkcanfd_skb_set_timestamp() {
    ...
	ns = timecounter_cyc2time(&priv->tc, timestamp);
    ...
}

Meanwhile, timecounter_read() in rkcanfd_timestamp_work() and
timecounter_init() in rkcanfd_timestamp_start() now change tc under
timestamp_lock.

If a conversion on another CPU races with the worker, can it combine a
new cycle_last with an old nsec? That would give wrong or non-monotonic
hardware timestamps on RX, TX-done and error frames.

The last patch in the series fixes this: "can: rockchip_canfd: serialize
timecounter timestamp conversion". It takes timestamp_lock around
timecounter_cyc2time() in rkcanfd_skb_set_timestamp(). It also updates
this comment to "Protects tc, timestamp_active and worker requeueing."

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae%40qq.com

