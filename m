Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J+POjlrI;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=2pXqmXMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zF4RKurSPbtIZr5y6aisxGcnIy7a/9xHHcRfZOEEHKY=; b=J+POjlrIfMPFii
	HwZzrYpqc+Rc/NcAzc8nBAs5IBca8u7Pn7GXikFx/fUA37tAeCnzysp9KoNTL1EzJ9IBszJCrLoY8
	tdSrjukwY07m6//RPUHKUl070WDwKYCqerYbc8E8oeQdlj5e4/9BJVxRPRot6KJ28jDmOtx/6Rg/0
	t454It8vg7bwFFvbBW/yEQNAgMquxkMDFebHo1jOGHMlBllh2807meW5Ew6rjD8lLn1JLOKHxZs67
	eKod1HLiabG7QWoqQx+QP4Vbgl2pQw4QgflwXdSSNeVwtHuxd9n+SESX0lcuRZ30VmS9jJvQVCqOp
	ne9dH7tGzzh5Rlwr5wWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRNv-00000009Q04-0v9n;
	Thu, 12 Nov 2026 09:46:23 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRNs-00000009PzQ-1M40
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:46:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85196A0064;
	Thu, 12 Nov 2026 10:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794476777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zF4RKurSPbtIZr5y6aisxGcnIy7a/9xHHcRfZOEEHKY=;
	b=2pXqmXMP8GV7SvW37kAVDSxQn4a35G1NODITlm961BJyJKuTT4HfH7yNcaBeBN4U7Eb3SF
	oGoK1o/QgNZ93MnAS6xYwRJFTIckJQVngdNqeBszfwHk3jZwF+9MUSzkvqSL3rUdWWOmIn
	/pZph+Gzp5APYCp3MmrS3XrDTJCFBDAo3ae2EZafPKBes8q1zu2HSsGOWEeCZsq//Hfd54
	pGZ6TMzePxnA/mbDS9PvreQE1Wmuurcx6zATx0sTy2N6DxcJwEygFLY7y6YKTnpcurFyiV
	mvOoMIx7Pmbs9BvgaXK6x1zNAiFJO+3VECTyNllVrq9nQZM3UDeQXq2vkYWX/Q==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 10:46:16 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
 <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
Message-ID: <328e66e47898b772f2956649bf4cf795@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_014620_547651_93FA51BB 
X-CRM114-Status: UNSURE (   5.57  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arun

On 12.11.2026 09:41, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>

> [...]

> Limit max_mtu so that a frame with two VLAN tags and the FCS fits in
> 2044 bytes (MTU 2018). A device tree max-frame-size can still lower it.

max-frame-size is only parsed for the snps,dwmac compatibles, not for 
sun8i.

> [...]

Thanks,
Nicolai

