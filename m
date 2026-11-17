Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF857606A883
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lPl2IOJe;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=evrMnYyE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hlGbt2Dmye+Llm4siD44J7NJ+mTsgc38HpApKW6jFL0=; b=lPl2IOJej8Zrw3
	xGvXyAMmTVgskyNcqaYqbOo4JTsK9YEBIKeWagdcBPdDAEbLs8g9+sx8EfgOTGV3BsoT7bX8MSpd9
	eSDuXOy+RLliodcRPWz00qdQ8Rd/opgWiz/NA4YL4PyVix0wClGUIkTJPMvvt/GYgdSiync8FDzn2
	c1UqG5b2t2i0nLnMrvS3SM9Ox4kJ89KUMATux6VrppkR45Kjy2l/CEqpSprUGkMdFbVaCCVfSgtQu
	UAbGeRa7/t4lpdM/oZPrfJ+TZqS616Gl5kJ+90Es1XE4FyT2H4aofxxSglvhzjLxAWmHs3Z6g/4Gt
	gZmoxgtYsgpMyKsY1UJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLSJ-00000006LzC-3gKF;
	Tue, 17 Nov 2026 15:50:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLSG-00000006Lx8-13cf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:50:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28050C4EDBD;
	Tue, 17 Nov 2026 15:50:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8581E5FDAD;
	Tue, 17 Nov 2026 15:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D25211BC005D;
	Tue, 17 Nov 2026 16:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794930640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hlGbt2Dmye+Llm4siD44J7NJ+mTsgc38HpApKW6jFL0=;
	b=evrMnYyEV+oEuzKpRUip5GJppu9aNSpb1G4PROqRkV/S7qPgG45henCkNgcE2F0fXYJm9y
	1g9aIlCKyfMX7QxiVvLw+pIjKcYyv5PkX5O+SEBMC1Y9Y1Z7GzZJTJax5C0oeiicC2M5Pr
	O8Ek+Ys87/DyyAPBXRkCGRslc+ZCjYVXkm2m+R8u+88myoULrpTj0VMWMnzJ+pLoWXATdj
	mrp/kRh0exmmfF+XCxTAb49xbT5gIeVdvXgeGs9cf4uibK1Ru14b/vfummPGLfvaDZWDRb
	Pr/nBcgyPZ4opdDnGpENQhHaYT/IK4AHSJxInxRiFtOX6sixKZewdRGfJRJ6Kg==
Message-ID: <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
Date: Tue, 17 Nov 2026 16:50:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_075044_489676_E6F755D9 
X-CRM114-Status: GOOD (  13.22  )
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

Hi James,

On 11/16/26 01:49, James Hilliard wrote:
> The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offload
> is enabled after programming the requested state. A zero return is
> therefore expected when hw->rx_csum is zero.
> 
> stmmac_hw_setup() treats every zero return as a lack of hardware support
> and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
> then reopening the interface loses the saved capability. Subsequent
> attempts to enable offload are rejected by stmmac_fix_features(), which
> uses plat->rx_coe to filter NETIF_F_RXCSUM.
> 
> Only clear the capability if offload was requested but could not be
> enabled. Keep calling rx_ipc when offload is disabled so that the hardware
> is still programmed with the requested state.
> 
> Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")

This tag doesn't exist :

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/build/1212156/14986330/verify_fixes/stdout

Besides that, this is legit. Tested on AgileX5, CycloneV and stm32mp1:

ip l s eth0 up
ethtool -K eth0 rx off
ip l s eth0 down;
ip l s eth0 up
ethtool -K eth0 rx on

Without patch:
ethtool -k eth0 => rx-checksumming off

With:
ethtool -k eth0 => rx-checksumming on

Please respin with a correct Fixes, feel free to add :

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

pw-bot: cr


