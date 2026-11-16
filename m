Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 02:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mjL1nVNi;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=WxeZfkmZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hfqntSgZEOiSlMbDpZIWb1KiGQmsm3Ec+5CbGoJgk7E=; b=mjL1nVNiGXXL9O
	C2+eZ25JuDUA1sBGZWNDbKT15uuYmsof0Z1IDI3BuI3sYKkPmSv/t7KUKYY2ZpKj9cCC4ac1i9cTS
	o62PAKTJQHP2hrnBtNWK9gogAbvIJg/zYckp2S51jayW+tJvRAFYu/hIxyX2E30Pw7tuIVoeQh4vx
	XspUFw2qTvWbfNGAnfhOTxGeq25UKaAEJaDtCiesfOo5YT4al1U9rujumbYX97gZIwwyZFonTDxy0
	Ad2+Q2LJxU0JiSSVXQ35fje74Fe9SC72RxG4yeUheIH4Xdoyk5hDvyqRScKGazRtfeI74kSN73RVD
	SgOAIP9K8eQZnHd0bd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmVR-00000000wcZ-0OQS;
	Mon, 16 Nov 2026 02:31:41 +0000
Received: from mail-m6053.netease.com ([210.79.60.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmVM-00000000waa-3z87;
	Mon, 16 Nov 2026 02:31:39 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54c419283;
	Mon, 16 Nov 2026 10:31:24 +0800 (GMT+08:00)
Message-ID: <eb51e0bf-148a-4d8b-8110-b65094fa1b43@rock-chips.com>
Date: Mon, 16 Nov 2026 10:31:23 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lucas Tanure <tanure@linux.com>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, stable@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2] phy: rockchip: naneng-combphy: fix RK3588 SATA
 pipe_con1 register offset
To: ricardo@pardini.net, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261115-rk3588-combphy-sata2-6g-v2-1-778e0e8011fe@pardini.net>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261115-rk3588-combphy-sata2-6g-v2-1-778e0e8011fe@pardini.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e231e94703a4kunm17ffdc46316b32
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0lOVk5NT0keGBlITkhPTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WxeZfkmZ5HroSFzNuKJdwY9gasYUv4nbix2/cXrP2RmCjDFaiag8JqeXgy6Lw32LPAlnUK/JDwgljR25116G2CTQRGcyB6duFeqPbq36WeCpMq1ZX0VQ3do+LrDW58KNesZ5AexQivXnWkr6tRuGJz1XIZfXwn2I6BRkg81Bipg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hfqntSgZEOiSlMbDpZIWb1KiGQmsm3Ec+5CbGoJgk7E=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_183137_577589_E9FD95E4 
X-CRM114-Status: GOOD (  12.88  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/11/15 星期日 23:48, Ricardo Pardini via B4 Relay 写道:
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
>    ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>    Timing O_DIRECT disk reads: 374 MB in 3.01 seconds = 124.45 MB/sec
> 
> After:
> 
>    ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>    Timing O_DIRECT disk reads: 1266 MB in 3.00 seconds = 421.78 MB/sec
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

