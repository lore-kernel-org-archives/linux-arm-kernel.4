Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2622A606A688
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uc5J0QvB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrZ7O5Pr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JUWYsAKioiVEsMSH/ZTrByubfWgl7jyBZgJzPAKIPjA=; b=Uc5J0QvBkB8X0m
	pGWohaDzihJsg2GFaUZiVfd3LiEahZ9OVNDbQK1P7f+a5e4X0zIXYYOhPxV9LuYMj7EyDYKGfx0Dj
	SSeQBp4yDFWt0gvU/S4uzg4TBB7hOIOwz32t2FAgmsxg890hL3lmAoZIXkrCfVbGl+Ri3BHzvFXoU
	aNhSnx/852xoTCw526tM963IZ0jFy7E9PHtcJai2oOuE4fzUdSD5dBapFqjC8D6MgjpwHIU4j4cMm
	StWlXfa3lu+KvDR+kOcmpM3i4nHIOKBIlVVEZLScmD4LxWrumK39VWc3bJAEkWziVedbOcS16c7Go
	Np75D9EUU7Ms9x+CWd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoy-00000007EhP-40qa;
	Tue, 24 Nov 2026 16:56:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoX-00000007EbS-0TKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:56:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2FDE41254;
	Tue, 24 Nov 2026 16:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B232D1F000D0;
	Tue, 24 Nov 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539376;
	bh=JUWYsAKioiVEsMSH/ZTrByubfWgl7jyBZgJzPAKIPjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jrZ7O5PrGBnCEFsaQRTSwYRTcx7lreOAuF3MxWJaRgbEEvWWUpL62brFoGDIfoKDg
	 Al9+PSt+hA2N2WcNGFR1r/FVroUhG9FwuKjF7GwVUMEhfI30VgMvL70eDofxXT+6fd
	 ouY9d2cfKJgWKmtz/+40hj2LqV4gefeoC0aZR+zz/GIhE+cu6KrfvQYsWvt3UUjRUQ
	 HStUct+x0tAGv/5ZgzqBgovvLyl2RKqNnXgRFqtiWqkiateLWDOuvj0U+5KGlB2FZA
	 4H+9SRQHM5x6wHSZSa3YG37RbkhiGXQJJmbDjvW1AxvpSrJi6yCyp1Mg+dWshqkCne
	 NxnNk42FrjCYA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arun Iyengar <aiyengar1990@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
References: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: orangepi-zero2/zero3:
 Read the SPI NOR over two lines
Message-Id: <179553937449.1403078.18079853682671561001.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:14 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 06:30:07 +0000, Arun Iyengar wrote:
> Andre Przywara reviewed v1 and suggested labelling the flash node (patch
> 1) and setting spi-rx-bus-width in the dtsi shared with the Zero3 (patch 2).
> 
> spi-rx-bus-width = <2> needs the binding patch of [1] (acked, not applied
> yet) to pass dtbs_check.
> Without the driver patch of [1] the driver ignores the setting.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/2] arm64: dts: allwinner: orangepi-zero2/zero3: Set the SPI NOR supply by label
      https://git.kernel.org/sunxi/linux/c/ac59f8d79bde
[2/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read the SPI NOR over two lines
      https://git.kernel.org/sunxi/linux/c/7b78b5603bb6

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


