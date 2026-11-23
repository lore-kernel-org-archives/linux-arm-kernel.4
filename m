Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xuo/nPHf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nc3Cp1Yy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xt4XcogETaPg/vLPHA+ZVa2mgH1C1Y+V+9gARYxKDCo=; b=xuo/nPHfaF0kyvZ/nyXpfudSHf
	TzWIaZZscDBM7ZSNKSnIHBSY4CFStnuSznsMdRbIa5rQHaAd127rpfjwBDBhRFMqUk25AKWpeTV/u
	Dgt3eOvi5bOJArDBOWfxDS8GXyS6ELPc62w0XFZCIkHsFXndeks1ce4v/D/ae9ysw+WtYxc78zZnG
	8a4zz/frQw+jge+y7gvIZ38QIRyBh/ELjob7vfE/sW1GWKOtbrDkKd0wawQAzuLggofdK18dzQbwh
	qdKG/IW753dKso3M9bYMXnhBPtloWd0WqV9BUlxqOPZjXU+YgXmZ3n4TGcfWUgiQwkFF5fUJt45HF
	JJPNEvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVCj-00000003lZF-3tDj;
	Mon, 23 Nov 2026 14:39:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVCi-00000003lYs-1k2u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:39:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3026A43495;
	Mon, 23 Nov 2026 14:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08AE1F000C6;
	Mon, 23 Nov 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444775;
	bh=Xt4XcogETaPg/vLPHA+ZVa2mgH1C1Y+V+9gARYxKDCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Nc3Cp1YyqxS8+n1+wQNwrlyR/It0roSLBI26bH8bkouZdaqwqYuJYwYf+s3WJ80oT
	 JbyrajvaMQD2SfQUoCgGMeklH7PEqhF3bJYzYdyhoydD2aibO2WY640cy2XR5FGD8i
	 GfYl/sAG3oz3Mu2nUGsYnDUOpij8MvFIv+92qegDdRRVsA8oSt/zZpQFP8F9+61ELT
	 WhaVx6cUIpdvBhYiQiTRXbs44844xRqOvA5NsxG6VBuCWbHrZBBl3Tb2iECVzAnj0J
	 dXF0hVkLJQrW7tBYH6rkOUnJXLgmH7aCMV/JP/2O+Vmrzn1Mr9KtnYK1OLkTayC0wF
	 CAvq9z015JQ8g==
Subject: Re: [PATCH net v8 2/4] net: stmmac: track unfilled XSK RX descriptors
 explicitly
From: netdev-bot+sashiko@kernel.org
To: dinghui1111@163.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com, fujiahui@lixiang.com, zhoujing3@lixiang.com
Date: Mon, 23 Nov 2026 14:39:34 +0000
Message-ID: <179544477433.3135.15487793537442434685@kernel.org>
In-Reply-To: <31856c65c85293ac3955212a22653ca41a36ad2f.1795096430.git.dinghui@lixiang.com>
References: <31856c65c85293ac3955212a22653ca41a36ad2f.1795096430.git.dinghui@lixiang.com>
X-sashiko-severity: High
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

Critical: 0 · High: 2 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Permanent RX stall on dwmac4/dwxgmac2 XSK queues after a full-
  ring refill that ends at a non-zero index.
- [High] net: stmmac: pre-loop refill failure in stmmac_rx_zc() skips
  later refills
- [Low] The comment added in stmmac_rx_refill_zc() describes a narrower
  condition than the code under it.

--

net: stmmac: track unfilled XSK RX descriptors explicitly

This commit adds an xsk_rx_pending counter that tracks XSK RX descriptors
waiting for refill. It also adds a clear_rx_owner descriptor op so unfilled
descriptors stay CPU-owned. stmmac_rx_zc() and stmmac_rx_refill_zc() now
retry refills on every poll and write an end-of-ring tail address when a
refill ends at index zero.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 8bd2440461959..f9ac82d2e7266 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -5626,12 +5632,18 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
>  		dma_wmb();
>  		stmmac_set_rx_owner(priv, rx_desc, use_rx_wd);
>  
> +		rx_q->xsk_rx_pending--;
>  		entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_rx_size);
>  	}
>  
>  	if (rx_desc) {
>  		rx_q->dirty_rx = entry;
> -		stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->dirty_rx);
> +		/* Use the end-of-ring address when filling an initially empty
> +		 * ring completely, so the tail differs from its initial base.
> +		 */

[Severity: Low]

This isn't a bug, but the comment covers less than the code below it does.
The entry ?: dma_rx_size expression applies to every refill whose last
entry wraps to 0. That includes ordinary wrap-around on every lap of the
ring, not only a complete fill of an initially empty ring.

The commit message calls this "a refill ending at index zero", which
matches the code. Could the comment say the same?

It might also help to say why this differs from stmmac_rx_refill(), which
writes the base address for index 0:

	stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->dirty_rx);

The later patches in the series leave this comment unchanged.

> +		stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue,
> +					     entry ?: priv->dma_conf.dma_rx_size);
> +		stmmac_enable_dma_reception(priv, priv->ioaddr, queue);
>  	}

[Severity: High]

Can RX DMA stay stalled after a full-ring refill that ends at a non-zero
index?

This patch removes the one-slot gap that stmmac_rx_zc() used to keep:

-		if (unlikely(next_entry == rx_q->dirty_rx))
-			break;

The consume loop now stops only on dma_own or on this check:

		if (rx_q->xsk_rx_pending == priv->dma_conf.dma_rx_size)
			break;

Suppose the XSK fill ring runs dry under traffic. The CPU can then consume
every descriptor, and the ring becomes completely empty with
cur_rx == dirty_rx == k for any k. The last successful refill wrote the
tail as base + k * desc, and DMA has stopped with its current pointer at k.

Now suppose userspace supplies at least dma_rx_size buffers before the next
poll. The refill at the top of stmmac_rx_zc() runs:

	if (rx_q->xsk_rx_pending)
		failure = !stmmac_rx_refill_zc(priv, queue, rx_q->xsk_rx_pending);

It fills all N slots and entry wraps back to k. The tail is then written as
entry ?: dma_rx_size, which is base + k * desc again. That equals both the
stalled DMA current pointer and the previous tail value. The ?: special
case only covers k == 0.

The comment above depends on a tail equal to the DMA position not
restarting DMA ("so the tail differs from its initial base"). Doesn't the
same reasoning apply when k != 0?

After this refill xsk_rx_pending is 0, so no later poll writes the tail
again. Every later poll finds descriptor cur_rx DMA-owned and breaks out.

stmmac_enable_dma_reception() seems to be implemented only for dwmac1000.
On dwmac4 the RBU interrupt only increments rx_buf_unav_irq, and on xgmac
it only schedules NAPI. On dwmac4 and dwxgmac2, would the queue stay dead
until it is reinitialized?

The later patches in the series don't seem to change this logic.

[ ... ]

> @@ -5661,6 +5672,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
>  	bool failure = false;
>  	int xdp_status = 0;
>  
> +	if (rx_q->xsk_rx_pending)
> +		failure = !stmmac_rx_refill_zc(priv, queue, rx_q->xsk_rx_pending);
> +
>  	if (netif_msg_rx_status(priv)) {
>  		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
>  

[Severity: High]
Can a refill failure at the top of stmmac_rx_zc() stop buffers that
are freed later in the same poll from being reposted?

The pre-loop call asks stmmac_rx_refill_zc() for all of
xsk_rx_pending. Whenever the pool holds fewer free buffers than that,
xsk_buff_alloc() returns NULL partway through and failure is latched
to true before the receive loop starts. A partially filled fill ring
is exactly the case this patch is meant to support.

Both the batch refill inside the loop and the new refill after
stmmac_finalize_xdp_rx() are gated on !failure. Neither one runs for
the rest of the poll.

Meanwhile several paths call xsk_buff_free() on the buffer:

- XDP_PASS
- STMMAC_XDP_CONSUMED (XDP_DROP, XDP_ABORTED, failed redirect)
- the discard_frame and rx_not_ls error paths
- XDP_TX, via xdp_convert_buff_to_frame()

Each of these puts the buffer back on the pool free_list, where
xsk_buff_alloc() could hand it straight back out. The old code started
every poll with failure set to false. It would have reposted those
buffers once dirty reached STMMAC_RX_FILL_BATCH.

With XDP_USE_NEED_WAKEUP, suppose those paths consume every descriptor
that was posted. The poll then ends with xsk_rx_pending equal to
dma_rx_size and no DMA-owned descriptor left in the ring.
stmmac_rx_zc() returns count < limit and NAPI completes, so no further
RX interrupt can arrive. None of these frames reach the XSK RX ring.
Doesn't recovery then depend entirely on userspace issuing a wakeup
without having received anything?

Without need_wakeup the problem goes the other way. Suppose the pool
has fewer than dma_rx_size buffers in total, for example a TX-only
socket that never populates the fill ring. Then xsk_rx_pending never
reaches zero and the pre-loop refill fails on every poll, so
stmmac_rx_zc() returns limit every time. Wouldn't NAPI then never
complete, even on an idle link? Before this patch the same setup left
failure false and returned count.

Should the later refills still be attempted after an earlier failure,
for example by OR-ing the result into failure instead of skipping the
call? And is busy polling intended when the fill ring is simply
smaller than the RX ring?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795096430.git.dinghui%40lixiang.com

