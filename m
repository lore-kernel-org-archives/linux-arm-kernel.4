Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vw2XujFx;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nOBwVEwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yWaFCq7JnwSDWKTvNogLNZK80Tf50prb+R7v0cgYNHw=; b=vw2XujFx7vv2EV
	bJ/Hs0pNhxRRgekdLUHAoxwvf0iMhZs2/jJbC6dN7QWItsBMz4UvlJVgLakZbmoyG+NrnucGMjO3x
	mTBNP69vTDGYnfgqeJE6x5OQ74f+HhH22SouUh50cZ0EmNz9E0Z+IsAUzEEnr6+RhlsOhxDx0t+1K
	W2AXNrQPNcmCGrfChE8nNZ46+b0WxbBH0uPJCLvd2TDQEBq/M6t8qSb1nvBV/dHtyj7Xy8LApC/NK
	RVu8RcZI0zNBgS+LyKegCPGmCBLmZSpkjx/Z7Cst1cXQZZVuspzje7CTiUIvHczD4bolF0fRxuKKP
	jw4MidlBsBSh90IEFZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGQj-00000001s9q-1QlM;
	Sun, 22 Nov 2026 22:53:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOS-00000001rKC-3mqF;
	Sun, 22 Nov 2026 22:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yWaFCq7JnwSDWKTvNogLNZK80Tf50prb+R7v0cgYNHw=; b=nOBwVEwicULrSbOpd7FOwsEDZT
	RM5B58gCETz0HpRYEJHhtG8598ZZxNBOFuhsBARM0iwUsVrmLpQ4GHkHZ6NkZRw0zhTSe6waHQdcj
	HV0gd8EJMuSxktNsfSoCJrnokWM1FDqUtqMXnxwEnFJELvqeh0hK26bKfRhWBDaIXQtOl5PaghTmb
	VLZxs0nbQ07xhdUC0mGzrjC2RonLMUe76zOFX7PDhMmYetiOvoKBdkUC8+lijNRO4M5UsftEvYujX
	+hUA/osiDCfCyOqQnChA1Rvw3lTKTbfLDOAQp3tzViRVqI+ei7dgWHrZ8sa4FmtH5bYsx8+a4ZCU5
	f30e8rQw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi 4
Date: Sun, 22 Nov 2026 23:50:23 +0100
Message-ID: <179538782481.3150822.15935425724986295169.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv>
References: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145045_243549_3140D449 
X-CRM114-Status: GOOD (  12.12  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 06:12:10 +0000, Igor Velkov wrote:
> The SD I/O supply vcc_sdio (RK808 LDO4) is pinned at 3.0 V, so the
> card stays in high-speed mode at 50 MHz. Let dw_mmc switch it to 1.8 V
> and enable SDR12 to SDR104.
> 
> The card supply is not switchable, so after a watchdog reset or a
> panic the card and vcc_sdio are still at 1.8 V. Linux and U-Boot proper
> boot from the card in that state; U-Boot SPL loading from it has to set
> the SD I/O domain from vcc_sdio, as it does on NanoPi 4 since U-Boot
> commit 210ab4f60df8.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi 4
      commit: 149ff2e99d6aa12d7a971a215723b8e92a5fbc05

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

