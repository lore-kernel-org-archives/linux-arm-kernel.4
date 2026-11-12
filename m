Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8195B60A263D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O5X3NPu/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qu4iskwl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7Dww7rLEK29Z8yiJXV5V5KMhrywlVHiQMndBRuw4E/0=; b=O5X3NPu/pCDynhJvZLFqOI4SnN
	q3mj0XNTLjjE3Zb2L7UUb/yKmpI/iT/mLQ5kfbUyPFDevrq+HixiciR8oavwy6JaHGPl4Jg1DqneQ
	O5iHPCxdTf2wjLj1brcy1JXiqe7HYfSFqAvEFW6qbypQf92ZosiCQLTgcZHzI5GUrZY4NZeuYsjbM
	HBuPFgN4yaTjRcS3vXZK9i0Kbl40eRW4Rb96fswGHqzaY9vp1w6GwVM8XeuWxyWG2afe6MGgg2sZL
	HRJPgTgdJyFTi2oR3FhxFYnAmyTM/xE4lXU6GO8V9yo3AHb4H8mZN6lOGY/0wzxUyCAFlbvzF+7oW
	RSDzRgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdKy-0000000BAHZ-1a9f;
	Thu, 12 Nov 2026 22:32:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdKw-0000000BAGj-2RSa;
	Thu, 12 Nov 2026 22:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0082C44F9E;
	Thu, 12 Nov 2026 22:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53AD1F000C4;
	Thu, 12 Nov 2026 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522725;
	bh=7Dww7rLEK29Z8yiJXV5V5KMhrywlVHiQMndBRuw4E/0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qu4iskwlFTCn0sPnAuYguLRUDzos0rP2oiB2AV6297+eONMYTmxzBG9ldyx/ZiwMH
	 4BY6Bbuc8BzogjDhd1FpX2D22Bq66YV3QjstHiZVSsAEAvwBb+IGvdpRR74rHU+oa8
	 KBMUbqeMZcw0Oi/dEada+JA93TRZo6z9Ru+aC1yc8NlYXImB561/9XVKiugV9zc3U4
	 JSoYaEkEnSBNr67EPpqg/LjteW0gzZHlx1WD/ZvUv+5UWCga6NW18cNLWNCGd823qe
	 Aj3DX1K027sMoeGt+7Dnkhqg/2zyOjFh7nkH3/Ab2FVepFBESbMmCI2HNXYfJ1ZTfV
	 /qZN/Ot3wccGg==
Subject: Re: [PATCH net v9 01/10] can: rockchip_canfd: prevent TX stall on
 echo skb failure
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
Date: Thu, 12 Nov 2026 22:32:04 +0000
Message-ID: <179452272422.488853.17004807498883326670@kernel.org>
In-Reply-To: <20261111-rockchip-canfd-restart-close-v9-1-6643f3825ba3@qq.com>
References: <20261111-rockchip-canfd-restart-close-v9-1-6643f3825ba3@qq.com>
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

- [Low] The commit message understates how bad the bug is.

--

can: rockchip_canfd: prevent TX stall on echo skb failure

This commit moves can_put_echo_skb() in rkcanfd_start_xmit() so it runs
before the hardware TX buffer is written. If no echo skb was installed, the
frame is dropped and tx_head and the BQL bytes are left unchanged. It also
passes an extra skb reference to can_put_echo_skb() and releases the
original skb once submission finishes or fails.

> rkcanfd_start_xmit() advances tx_head and requests transmission even when
> can_put_echo_skb() fails. Completion matches self-received frames against
> the echo ring, so an entry without an echo skb cannot be completed and
> can leave the TX queue stopped.

[Severity: Low]
The code change looks right to me. Does this description cover the whole
impact, though? It looks like RX stops as well as TX.

can_create_echo_skb() uses skb_clone(GFP_ATOMIC), so can_put_echo_skb() can
fail with -ENOMEM under memory pressure. Before this patch, the empty slot
still became tx_tail, so rkcanfd_get_tx_pending() stayed non-zero.

After that, every received frame goes through rkcanfd_rxstx_filter():

drivers/net/can/rockchip/rockchip_canfd-rx.c:rkcanfd_rxstx_filter() {
    ...
	skb = priv->can.echo_skb[tx_tail];
	if (!skb) {
		netdev_err(priv->ndev, ...);

		return -ENOMSG;
	}
    ...
}

By this point rkcanfd_handle_rx_int_one() has already pulled the frame out
of the FIFO with rkcanfd_read_rep(). It then returns before
alloc_can_skb() and can_rx_offload_queue_timestamp() are called:

drivers/net/can/rockchip/rockchip_canfd-rx.c:rkcanfd_handle_rx_int_one() {
    ...
	if (rkcanfd_get_tx_pending(priv)) {
		bool tx_done = false;

		err = rkcanfd_rxstx_filter(priv, cfd, header->ts, &tx_done);
		if (err)
			return err;
    ...
}

rkcanfd_handle_rx_int() then leaves its FIFO loop on that error. tx_tail
never advances, so the same thing happens on every later RX interrupt, with
a netdev_err() each time. Frames from other nodes on the bus are lost as
well until the interface is restarted.

Could the commit message say that both RX and TX stop? That would help
stable backporters judge how urgent this fix is.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-rockchip-canfd-restart-close-v9-0-6643f3825ba3%40qq.com

