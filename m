Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC92606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RbYI10D4;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=spPImfx6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f8D4AXpdECEMbVGfexe2cz/ScJYTT4Gg2O95M/ifd9s=; b=RbYI10D4dIXc4T
	plXiG5tJPHrAnCV/7l4tYoCaSC4kSMmzvLkooRbebK3/rKIK0XwZQU6zmE+P62zCQQeDD/w/zk7Tf
	9Vx8Kwh2hEBzKWLH7aKv8Fjc2BfqyZP0JcG1vIIBcXzJEAFF+KENVi/wHPFGSaskhT2h6NZ7VQA7W
	qCR5JHS8qa2WhjJQxRcHxsgU1iTg1E+IouwPlTWXl+GcQig+2FObldYhKwkB7w80rZd3RCP2rlf/v
	GuXeALGv2SGgdVezFBI6CdjXsx2FPrYz9iDkL/jrFJZeQmt2DtfwqtuJe7ANdkGO+ohueXxEi7+u0
	I7aqbHFBFruu4NgRpcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKyp-00000006HnR-0V48;
	Tue, 17 Nov 2026 15:20:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKyl-00000006HmX-0DQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:20:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A4FB5C4EDBD;
	Tue, 17 Nov 2026 15:20:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 326355FD6A;
	Tue, 17 Nov 2026 15:20:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5396711BC0041;
	Tue, 17 Nov 2026 16:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794928806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f8D4AXpdECEMbVGfexe2cz/ScJYTT4Gg2O95M/ifd9s=;
	b=spPImfx6F3CzhN16ICPmW7T06RqvUifyDFcrx8atsJuVdxPSElDxgZB3E+SewfgfHYbQk7
	V4MlwVfWoKNAWrdv5W73fwoMA5MKtYJL6gTuWVWG5jpjyMFOs6PTpxcM3z1Ak1FEeJgqSV
	pDsvdF2j+XIkT3XSP5tIkPd/Grrg8Ck2a58GoDWddT0px3jEXbYA9SHV1AcW1meNc2od9k
	lSpWdBItmquE4Ebno/2zFDY9affW+xNwnrDKoEVv6JXEFnixQ+Tw96/Q6PGmfrhO6/VDuL
	kTmlc3oYWYiDDxby2VdZYL37wbzOyJPI6nLRUjWOyPwVyoUZW+CvSDlUe9uyzQ==
Message-ID: <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
Date: Tue, 17 Nov 2026 16:20:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_072015_271938_1E2F9CF7 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

Hi,

On 11/16/26 01:58, James Hilliard wrote:
> stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> hardware checksum engine. The MAC therefore keeps dropping packets with
> invalid IP or transport checksums before they reach the host, even after
> ethtool reports RX checksumming as disabled.
> 
> Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
> offload leaves checksum validation to the network stack. Preserve the
> callback's existing success return value.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Nice and simple, I tested that on an orangepi zero, with an allwinner
H2+, and I can indeed see the difference as bad chksum packets are
dropped on that core.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


