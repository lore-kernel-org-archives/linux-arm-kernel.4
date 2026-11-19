Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7860A260B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KCmHY6Lr;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zPTod43m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3t5GjNWjLeDJ7jf+sWjWE+z8pgne1HFP6Z9ewGr3ciM=; b=KCmHY6LrG+qpih
	BO/2S8cdznEV/ahuIdko8pLp5a1y2SPC/8TXfEXVrHW7nUFFCHTIyP3Wwu6PjNWAcQvocEo0uvnT6
	DlTQhbC3HxgYouOPu+Yt5h6pSsKcqYeD0+p2roxqBKlYvjzt0Q8zktdc92bsrhJPkQrxbaz/r7ml5
	Rnd5Dl3wkXsOSYVi/IMrccCT0j9Ga8wPuEHjqiSC4k/wo3yefAnbWz0xoO6iP2rdPmjjZg7HtKhue
	DJIiGdt2jRWjzjF5FS/SRGeMD0WyPQEjaQD1kITeWNgRx/i66tj93cJrHomynFHZwxVBmahhs51ia
	EqwCTMVlT3KDeCgW72dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OG-0000000BrND-1bQn;
	Thu, 19 Nov 2026 12:37:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OD-0000000BrKu-2tYK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D5E81A170E;
	Thu, 19 Nov 2026 12:37:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D364760237;
	Thu, 19 Nov 2026 12:37:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 510D011BC0760;
	Thu, 19 Nov 2026 13:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091838; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3t5GjNWjLeDJ7jf+sWjWE+z8pgne1HFP6Z9ewGr3ciM=;
	b=zPTod43mAzLSSRgzVXjEmLAXkDGnxePwHhzkScC5gOoZIjGIKZrN9qQvXbbt1f7+xrC40e
	kWUCCNvwwMyXfEALuAkbI6u43LkZV+KGC2c/ZOzEC/4phQiCmL+YZvS/0THt2ekxxWgacR
	tu7CMv3of0F6uZOdw6R8k2L12mJN5gyaXmuGe1K6spBswNWI3ATX0X/XQ7ZA2z7l13ESfg
	kwKykGxuin8gKfntIgliW+nEo2ixhWg5Bzv5yitkMs863ypkm2GLvGpNgpDzkCG0uUn5xX
	pbht3yp6JD1MYGDKDfPS30lAM6tMEFTzS0HNicPVhEZ+CUIh0fnUDT+oK4PxKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
Subject: Re: [PATCH v10 00/26] mtd: rawnand: sunxi: fix transfers and
 support randomized OOB
Message-Id: <179509183211.2889394.16825117934214735151.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043721_886326_C65D78EA 
X-CRM114-Status: GOOD (  10.57  )
X-Spam-Score: -2.1 (--)
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

On Thu, 05 Nov 2026 11:55:16 -0700, James Hilliard wrote:
> Patches 1-24 address the existing driver independently of the Allwinner
> randomized-OOB format in patches 25-26. Please review and apply that prefix
> regardless of whether the format extension is accepted. Supported geometries
> keep their existing on-flash ECC layout, bad-block-marker representation
> and raw callbacks.
> 
> Patches 1-3 prepare the shared paths: centralize OOB handling, share the
> NORMAL-command chunk-size calculation, and remove duplicate chip setup
> immediately before core page commands. The DMA writer retains its early
> setup because it accesses controller registers before program-begin.
> 
> [...]

Applied to nand/next, thanks!

[01/26] mtd: rawnand: sunxi: centralize OOB handling
        (no commit info)
[02/26] mtd: rawnand: sunxi: share the buffer transfer chunk size
        commit: 53013c67871f3f31b0181ffed8a14ba6b9466427
[03/26] mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
        commit: 2bd4acab1e0e16c06ac64f60aa01a72d0e651616
[04/26] mtd: rawnand: sunxi: reject pages exceeding the ECC step limit
        commit: 5eb28d68d67a22f5b2f9d98d9567b01f432bb88d
[05/26] mtd: rawnand: sunxi: use the logical step's OOB length in PIO
        (no commit info)
[06/26] mtd: rawnand: sunxi: propagate page-setup and erased-check errors
        (no commit info)
[07/26] mtd: rawnand: sunxi: drain interrupts before reusing the completion
        (no commit info)
[08/26] mtd: rawnand: sunxi: stop failed program operations and disable ECC
        (no commit info)
[09/26] mtd: rawnand: sunxi: select the pattern ID for the current ECC step
        (no commit info)
[10/26] mtd: rawnand: sunxi: preserve synthesized zero-pattern data and OOB
        (no commit info)
[11/26] mtd: rawnand: sunxi: propagate buffer and column transfer errors
        (no commit info)
[12/26] mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
        (no commit info)
[13/26] mtd: rawnand: sunxi: use page reads to reposition small-page NAND
        (no commit info)
[14/26] mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
        (no commit info)
[15/26] mtd: rawnand: sunxi: send all address cycles in split operations
        (no commit info)
[16/26] mtd: rawnand: sunxi: propagate chip clock setup errors
        (no commit info)
[17/26] mtd: rawnand: sunxi: limit buffer transfers to the command byte count
        (no commit info)
[18/26] mtd: rawnand: sunxi: skip unavailable NAND child nodes
        (no commit info)
[19/26] mtd: rawnand: sunxi: scan all chips before registering MTD devices
        (no commit info)
[20/26] dt-bindings: mtd: sunxi: require the H616 AHB reset
        (no commit info)
[21/26] mtd: rawnand: sunxi: reset the H616 data path after DMA aborts
        (no commit info)
[22/26] mtd: rawnand: sunxi: reuse ECC status within each transfer
        (no commit info)
[23/26] mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
        (no commit info)
[24/26] mtd: rawnand: sunxi: reduce user-data length register accesses
        (no commit info)
[25/26] dt-bindings: mtd: sunxi: Add randomized OOB flag
        (no commit info)
[26/26] mtd: rawnand: sunxi: support the Allwinner randomized OOB format
        (no commit info)

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


