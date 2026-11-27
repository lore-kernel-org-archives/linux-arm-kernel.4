Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50019606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4lHiEHHC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqEMdzdc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XCDRmkitv6anE5VKogqW8AH2LDMw98gqCBV3wPici/o=; b=4lHiEHHCkQ4CtZ
	Fpk6Q2Ct6cgFHZQNFDusiC3kzc6WTcP7/VyKk+gi6+cHfHEq4ZGY+cJ7rDvpRWTnnUnXDssELJmQg
	sDyZ1ix9NYsYS2buItBERY07LNYqFlqMHPCXtxYBHiBunKV+GAc5WmVywypbPeHaDwFvsU9hyJz02
	6Vz+/Aeae0KGTXOqRmTdJNkjLLLQdmVJr+Ikj25eRq+HPEiv2vV2PCnFqiH9wAQM/befXHE7PGerj
	oYI530gUFVLwxoSG2RyO/udPVxpLI3JHpCLu2AoxuvzJ+UP+FOa4yXzRaf2uNbxo1kemhMHhzOEL3
	GO6aO/zmxnr+D7iG3HLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwTy-0000000GK7D-1QXY;
	Fri, 27 Nov 2026 13:59:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwTw-0000000GK6h-3g8H;
	Fri, 27 Nov 2026 13:59:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 656E643B7D;
	Fri, 27 Nov 2026 13:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4C81F00898;
	Fri, 27 Nov 2026 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787959;
	bh=XCDRmkitv6anE5VKogqW8AH2LDMw98gqCBV3wPici/o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jqEMdzdcdUD9uZKKpUuXz4leJnRtw6K6Pph6ng77JUjfAdTRfV+fwQUN1tggPzH9i
	 NQfXmd1EStzlvRkRsiu6/r/xsCK/eSmrSV8IidLe5Im8wL7Jc/FI/KMibzE9oUw9jW
	 Ji/9JRAnDvoZcG4i+GyQ/V0zRlMg3swlawdEVBIArNwVZ5Nt/6TY53vaVLAly/p6Yy
	 vRroxsNcyBBeKF5rMqPWl1n/R/U4xjy0+v9IBCOBFNDNQNpm0RjPZ16H2fggpHV+i+
	 BvPx3YLXRb/YerZUCxxNkN4bS1515ZQEPIyc0IGfCdRYiMMrqbBvqRLUROOP2l1+Qe
	 MTj/sXcoou16Q==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] phy: rockchip: naneng-combphy: fix RK3588 SATA
 pipe_con1 register offset
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ricardo Pardini <ricardo@pardini.net>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lucas Tanure <tanure@linux.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 stable@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20261115-rk3588-combphy-sata2-6g-v2-1-778e0e8011fe@pardini.net>
References: <20261115-rk3588-combphy-sata2-6g-v2-1-778e0e8011fe@pardini.net>
Date: Fri, 27 Nov 2026 19:29:11 +0530
Message-Id: <179578795149.13164.15084635377833975036.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=mani@kernel.org;
 h=from:subject:message-id; bh=fei2KZ8hHxwdWll/UxDcgcWAumc1W/CM9dYMtiFW9PE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCYyy36JOz4vBxPy+mlD2r/Ndn68OJGR1ec6Jt
 EVD7aaKLtuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmMsgAKCRBVnxHm/pHO
 9TMHCACRD8CQM4Zuum6FbyZ4wvFcFX4htMB2HCjPoLWqCi8hvdKdTijsn4B0/LxbOnumZ8RMbOc
 iB6GpGWNMq0AdZ/k/Pgsp23ssTAyydiM0zEgmeA1nwsZ73NF3nGeO+zak63H2ScV24/e8BpeMjN
 s/TSAAK6xi3C3scr26C8kgaZ1cQP+bKO6uSXrbU3LyhF+o5JX5oSXpCBTCk2MRwwb96/38K48kK
 iJ4+p7SDMKnL0Luw36eME/rJlbmxvQkLdAEoS9ahl7fI4ytXlgvIvVszVlbLPtbs/9JqiK+kGWB
 YzYpWJV8l1W6B0qX7u8Lonpm7Ek8oAMTbloToFVBjUWIo5zm
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-15 16:48 +0100, Ricardo Pardini wrote:
> From: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> 
> On RK3588, the sata2 PHY speed is selected by sata2_phy_spdmode in
> PHP_GRF_PHP_CON1[1:0] (offset 0x0004), with sata2_phy_rx_err in bit 2.
> rk3588_combphy_grfcfgs has pipe_con1_for_sata at offset 0x0000 though,
> so the value 0x2 (6.0 Gb/s, rx_err cleared) ends up in PHP_GRF_PHP_CON0
> and CON1 is never written.
> 
> This leaves sata2 at its 1.5 Gb/s reset value, so the link only trains
> at 1.5 Gb/s, even with a 6 Gb/s capable disk and no SControl speed
> limit. sata0 and sata1 are not affected: their speed fields are in
> PHP_GRF_PHP_CON0 and are set by pipe_con0_for_sata.
> 
> The misplaced write also lands in PHP_GRF_PHP_CON0[2:0], which are the
> PCIe link reset grant bits, and turns on the one for pcie3x2 whenever a
> combphy is put in SATA mode. No effect from that is known, but this
> stops it too.
> 
> The register layout is described in the RK3588 TRM V1.0 Part1, section
> 6.17 "PHP_GRF Register Description".
> 
> Tested with an mSATA SSD on sata2 (combphy2_psu). Before:
> 
>   ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>   Timing O_DIRECT disk reads: 374 MB in 3.01 seconds = 124.45 MB/sec
> 
> After:
> 
>   ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>   Timing O_DIRECT disk reads: 1266 MB in 3.00 seconds = 421.78 MB/sec
> 
> Fixes: a03c44277253 ("phy: rockchip: Add naneng combo phy support for RK3588")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> [rewrite commit message]
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



