Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6915F606D81B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hiflushu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BsNl7ZDe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ViT3Yo4M3SsUpvja1R5K7/sF1YFo5i6DucfxLblQBU=; b=HiflushuFD4gvEMLxAMsoUga5q
	jRaLn/VW2tigDln/K/dXPeRoc35qDvZWFwuwrMu3wMlvOT5tOEowB+j3eIZHSSBcYGp4kDx4ww+Is
	gdS2C2MDU2w0IGCHIquTBZciQRk4bjlIdPfYpffR4QgO44AHzovHYUNzZ0FyxDUy28t3PkG4fozM/
	FGqcHcxFBZt74MMHgd6vktJfz739RJ/54Bd/RhLwKNxHd70LcaQfSiAj2bTly/Po9Pg9Itl0pkGBj
	78ki2oMW+yDR9B79yC65Q4SyieYTL4Q5sizG1ktNUbc25YlnsiRxGqxXFRUvLKjo1yZxQouIsQjn6
	3tyFeBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNh6-00000000Xjp-1xQM;
	Mon, 09 Nov 2026 11:37:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNh5-00000000XjF-03In;
	Mon, 09 Nov 2026 11:37:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CE8361262;
	Mon,  9 Nov 2026 11:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21341F0089F;
	Mon,  9 Nov 2026 11:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794224265;
	bh=2ViT3Yo4M3SsUpvja1R5K7/sF1YFo5i6DucfxLblQBU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BsNl7ZDeGyPFQKK2Sj1fAO+4RkRF1uiZ6sP5hR44G7QzyBrQ44q9NwfvOW/fxL2n6
	 1GgkdTCTfIHUWTTx+NhQtw/CVAybuER3+EHRhrGsmvVzn14YrIP9RG2aOMLXDapPfB
	 FTcDrtf/1N9pKXuB+yw2ztzN8T96RVDxGQnnzftygYfPR6rhvkqUEyUgtq2PKSUkvR
	 zkKXPatfQr+bwb57/ifJYEpOR9/QZqsHtrXWmEdCCHNZPT9JNCB6SY/bThhSbCYMbK
	 i8P762UuS7STpaLKdWxNs40zTEM5U939heEyAKA/tqh6mf9b9LN5u7HKTI45OKXUFm
	 CfMbFacbIj/wg==
Subject: Re: [PATCH net v8 03/10] can: rockchip_canfd: retry the outstanding TX buffer
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
Date: Mon, 09 Nov 2026 11:37:44 +0000
Message-ID: <179422426444.994134.7825659732864102594@kernel.org>
In-Reply-To: <20261108-rockchip-canfd-restart-close-v8-3-3e7a23fd9eae@qq.com>
References: <20261108-rockchip-canfd-restart-close-v8-3-3e7a23fd9eae@qq.com>
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

- [Low] The commit message for "can: rockchip_canfd: retry the
  outstanding TX buffer" states the user-visible failure ("the pending…

--

can: rockchip_canfd: retry the outstanding TX buffer

This patch changes rkcanfd_xmit_retry() so the erratum 6 retransmission
uses tx_tail instead of tx_head to pick the TX buffer. The goal is to retry
the frame that is still pending rather than the next free buffer. It is
tagged for stable with a Fixes: tag pointing at a5605d61c7dd.

> Use tx_tail to retry the outstanding buffer. Otherwise, the pending echo
> entry can remain incomplete and leave the TX queue stopped.

[Severity: Low]
The tx_tail indexing looks correct. The stable justification is harder to
check, though, because the stall described here depends on how the
hardware handles TX_REQ(n), and the commit message doesn't say.

The controller has one TX frame register window (RKCANFD_REG_FD_TXFRAMEINFO,
RKCANFD_REG_FD_TXID, RKCANFD_REG_FD_TXDATA0..) and two request bits. Every
frame is written into that shared window in rkcanfd_start_xmit() before
TX_REQ(tx_head) is issued.

rkcanfd_xmit_retry() has one caller, rkcanfd_rxstx_filter(). That caller
only gets that far when the nominal frame echo_skb[tx_tail] is EFF:

drivers/net/can/rockchip/rockchip_canfd-rx.c:rkcanfd_rxstx_filter() {
    ...
	if (!(cfd_nominal->can_id & CAN_EFF_FLAG) ||
	    (cfd_rx->can_id & CAN_EFF_FLAG))
		return 0;
    ...
	rkcanfd_xmit_retry(priv);
    ...
}

While the tail frame is EFF, no further frame can be queued:

drivers/net/can/rockchip/rockchip_canfd-tx.c:rkcanfd_get_effective_tx_free() {
    ...
	if (priv->devtype_data.quirks & RKCANFD_QUIRK_RK3568_ERRATUM_6 &&
	    rkcanfd_tx_tail_is_eff(priv))
		return 0;
    ...
}

So whenever the retry runs, exactly one frame should be pending, and it
should be the last frame written into the shared window.

If writing TX_REQ(n) latches the current window into buffer n, wouldn't the
old TX_REQ(tx_head) have resent the correct frame? The echo would then
match echo_skb[tx_tail] and completion would go ahead normally.

As far as I can tell, the stall only happens if buffer n keeps its old
contents and TX_REQ(n) resends them without reloading from the window.

Was the stall actually seen on hardware, or is this mainly making the slot
indexing consistent with the echo_skb[tx_tail] model? The Erratum 6 comment
in rockchip_canfd.h has a canfdtest reproducer, and a5605d61c7dd carries a
Tested-by for the depth-2 change.

Could the commit message say which TX_REQ(n) behaviour the fix relies on,
or add a Tested-by or reproducer, so stable backporters can judge it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae%40qq.com

