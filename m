Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971D606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vyc8/xeU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iqsthhbg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FR9H2PaILFPq2g6fs1uHRogd9laRoMATzk7z1WgUqEM=; b=vyc8/xeUrq2ZPs
	Z8S1jYHoh6hEP6jbKo3r+dp7MkLLQ/gX55hY3yEkCVCYU6V0p8LBbCUh/woilknFDm1qgqOmT84rq
	C+QgLgPtcy7ZkCPE7gNhcJO/NJxVXHy+bO3NyMoh+TMwFptqBLXUmArFGniwX500NXGYa91IigMHZ
	amPGdDLVoDM+qMaQuRDOTgXmkehaLLcggLB7nUle/FbFiqUqq8yBI1oHExqkqPsMdIAY1DAcrva7V
	mXNji2QMaVsYvhR4giOqRRHvwCQGZAS2MjPVEsTLFdycqDP0rfhJ/P3Xi2BqBV9ioGyeYLHvoSOgh
	sd84HlIzBLK8SJf8st1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYVy-0000000HSGj-2xDX;
	Sun, 15 Nov 2026 11:35:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYVx-0000000HSGd-224x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F2FC60A62;
	Sun, 15 Nov 2026 11:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA5D1F000C4;
	Sun, 15 Nov 2026 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742516;
	bh=FR9H2PaILFPq2g6fs1uHRogd9laRoMATzk7z1WgUqEM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IqsthhbgPHxQxH/aiTktpmW3D6Sx7XnQEXI+ao28uV0TDfWAOtkR0xm8UDJWLaliW
	 g9CdXJS78kdgweHhR/XPWsE6AZ1njXBbKmcbpPPzYeoi6tCuhAad4MgKWEtepGl/xb
	 plo2TLTxhDkm2KMl9InzDiX3fbrYJJh+3HHB+Duw5s7QVWSZUX0mVg//VQduUKrDJ4
	 L0wW8FP7Fce5/nNLSkkofnwJ0ado08fq7zxIIE3eN84SNzlz0HLHorI7jw6zJmDgxg
	 6ccWhgZhbBBz1Hy0rFZIahAr2yTj7N6d5JBvvlEGBOk5TJ1bqokO24v1v5FgrDLuHj
	 6VHCksydU3O6A==
From: Chen-Yu Tsai <wens@kernel.org>
To: andrew@lunn.ch, jernej.skrabec@gmail.com, samuel@sholland.org, 
 Roman Riabenko <roman@riabenko.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260822052353.22881-1-roman@riabenko.com>
References: <20260822052353.22881-1-roman@riabenko.com>
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
Message-Id: <179474251421.3095306.4655080143943626806.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 19:35:14 +0800
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

On Sat, 22 Aug 2026 08:23:53 +0300, Roman Riabenko wrote:
> The 'rgmii' mode does not appear to describe the RGMII timing in Olimex
> A64-OlinuXino boards. The PCB layout shows that the clock and data
> traces have roughly the same lengths for both RX and TX and, thus, do
> not appear to implement the 2 ns RGMII delay or introduce any
> significant delay.
> 
> According to the KSZ9031RNX datasheet, the PHY adds a typical 1.2 ns RX
> delay and no TX delay by default. The 'rgmii-id' mode causes the PHY
> driver to enable appropriate internal RGMII delays.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
      https://git.kernel.org/sunxi/linux/c/5f30c467fb36

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


