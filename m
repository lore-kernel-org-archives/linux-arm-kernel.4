Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A5E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D3RerR5X;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxv4eaCp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v/KSonE9ptOXxsuc9pp4torUv+e/nHP0QcHgDnUNcJU=; b=D3RerR5XdJYlM+ZfOgqpL1j7fz
	OdKCSSXUmvgxKo8c/m+Gep/zUJBSMiRv7PFpz5BNq6E40eWa001Rl7yF7pNWudagcERvWfEKmi3M/
	v16LfsUhRQisWz6qNTBq3jj1MhgxCfYjQ2BY+PYO3xR+yX5lglDsskSErXvkw+EOFtTqON2aoM7Da
	546MnnZsXZfQW01EHV7Xf8HP0br1+9dAS9Hjk8BRy437w8GB8/BlcSAYWWc3lFbDT4Aeoke8i1Mk1
	DUkz6JtpTwMmswp33Hwf6/4fdLkzc0taPkd91DCuadAn6B2X4IOVRFXwAKNTMh/yaj7/xFhlFx49y
	uoBcoEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUh4r-0000000GyuJ-2X2B;
	Sat, 21 Nov 2026 09:08:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUh4q-0000000Gyu9-11xU;
	Sat, 21 Nov 2026 09:08:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 067F24057C;
	Sat, 21 Nov 2026 09:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B563B1F000C0;
	Sat, 21 Nov 2026 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252087;
	bh=v/KSonE9ptOXxsuc9pp4torUv+e/nHP0QcHgDnUNcJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cxv4eaCpbXRq6+v7J1sHTC/XE2qAAtLQj83KoTTDZefr9jTQzjqRiqZh4HC71E79v
	 Vlt8Av7KJ7IrypkZtZ1Cn9eiJuRAAf6TGWckhX742luMP83OZydl05emuuerW4iGFi
	 bFOSua99qcr/sduVAr5VNWinteptSmxaZPzwlnyor2FHbFTbclSF0DHjxJ9g11cBGV
	 8YBV7YlXxwhF0fR8e6yXSTtoxEUtc/ysgrmo8r7TaXZq+/r3cToH+fHVRKC523F5Y2
	 YRDhDq614icNC0D1dMZrkIXCdTNckyawppSsihWKW3aNBEgG5dMD9FE/rzxkoB1lhv
	 WIf3Bn9VA77Aw==
Date: Sat, 21 Nov 2026 10:08:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 23/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
Message-ID: <20261121-active-pudu-of-flowers-ddfa8b@quoll>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
 <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 06:10:46PM -0700, James Hilliard wrote:
> Normal NAND reads and writes worked on H616. Fault injection exposed a
> failure when recovering from an aborted internal DMA transfer: the
> controller's soft reset could leave the first subsequent read displaced,
> sometimes without an ECC error. This was not observed during ordinary
> I/O.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


