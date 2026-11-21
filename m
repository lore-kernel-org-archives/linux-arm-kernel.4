Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092F606A6A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ETVGvWQq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2FuDmHU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AHUQMxgVMnTXxKbmEWmbNVYVHdBgjW37+wv9A15XjEA=; b=ETVGvWQqMVHh7pWeH1daRO/ldS
	t1TnLsQxv+vq0WHdckimf6xhtB319nKisZGTZdfld5frUaxRDFUgXQW9yZoG+KVziz3YpxukPTBU5
	kjXTymo815DSwtsrlLGKCuUMiTHd01claT0Oi74euhf3jakq5fBhkyVi2ELTlVSH1e0aV2BcEjxGH
	Q8vZQRoF0VVr3X4zEqUhL8uUFf4reFuJb83cCW5UGRCGVro2adkICo6+zlyl2GDipnP8YhYUneiLe
	5CnfbmxKaxuU9wE7jgB7MXBYleH3iBqc5SikYsavFKfEgYODHsP4QZJ+vbJA0lc4/XPAO5HL0k5U5
	1z7I6IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrb0-00000000BHk-0wYM;
	Sat, 21 Nov 2026 20:22:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUraz-00000000BH1-1b38;
	Sat, 21 Nov 2026 20:22:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DD7743D95;
	Sat, 21 Nov 2026 20:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF041F000C0;
	Sat, 21 Nov 2026 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795292520;
	bh=AHUQMxgVMnTXxKbmEWmbNVYVHdBgjW37+wv9A15XjEA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W2FuDmHUppm5SPhv9G08NORlp7OkTi/kNvsUtOkx6P0tjFmnH63ZM7hfnlR29q+Gl
	 LxbSs34ywhFlbB3wCS9gqyYsJo03tPku2kV3YTzA3/h8dz/DYi4s4m8eQN9NakQ7kO
	 cuu7d/VVWPqOEiHpMDigzvDGKXKW2OrTT5tekoBjkINl/OHLfEeHm8qGq9lBVxNxY6
	 q1lldf3d7or+ng9Wzf3Blt/lGriTCIleeLonaZKFL60xZYbr1ZEU8a40rPqAZXceRe
	 kaxCnps21folpZ+nIByCksYl8EFwVwQ1ZPJfcqNGj/7coMbSoNTgNIoHyASCpzsylh
	 h7MUsdCIwj+Nw==
Subject: Re: [PATCH net-next v7 1/3] net: ethernet: mtk_eth_soc: fix the RX
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 daniel@makrotopia.org, mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 20:21:58 +0000
Message-ID: <179529251869.3135.16945484998995426880@kernel.org>
In-Reply-To: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
References: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
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

- [Low] The patch subject "net: ethernet: mtk_eth_soc: fix the RX" does
  not say what is being fixed and reads like a cut-off sentence.

--

net: ethernet: mtk_eth_soc: fix the RX

This commit resets dma_addr to DMA_MAPPING_ERROR at the start of every
iteration of the mtk_poll_rx() loop. Before this change, a descriptor
that took the release_desc path without a new mapping could be re-armed
with high address bits left over from the previous descriptor. On
MTK_36BIT_DMA SoCs with DRAM above 4 GiB, the hardware would then DMA
to the wrong address.

> net: ethernet: mtk_eth_soc: fix the RX

[Severity: Low]
This isn't a bug, but the subject doesn't say what is being fixed. It
also reads like a sentence that was cut off.

The body describes a specific defect. In mtk_poll_rx(), dma_addr
carries over from the previous loop iteration. A descriptor can reach
release_desc without a new buffer being mapped:

  - no netdev for the source port
  - MTK_RESETTING is set
  - the refill allocation or mapping fails

In those cases rxd2 gets the previous descriptor's high address bits,
while rxd1 still holds the current descriptor's low bits.

None of this shows up in the shortlog, and stable and patchwork tooling
rely on the shortlog. Could the subject be made more descriptive, for
example:

  net: ethernet: mtk_eth_soc: reset RX dma_addr for every descriptor

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-7d2c457e68de6b53b7348d1bdbeadcec%40loljews.com

