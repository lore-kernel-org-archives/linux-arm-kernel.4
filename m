Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18109606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ES6ZWXfL;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tXPzzdC2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=osciUjLQZdt7MjSZGYTDWwPTvV0Ioddqf9NzVSgW9yA=; b=ES6ZWXfLgSWwI4
	/hRzA90qn/BRfMDSH+ftoalHbpY+wi4k6uHMub5XZRMXfyfFbyM72Kj2InC01aE6pjyP47hta4N1F
	oiaVQy3eBs1J021Fvngfhsyir1pqiuB4kHx8YGegYEwmWRJYXIN+QZRRk5CibZ1zrgZ4zZ6ICsEH/
	V1JKl6e3ctdjbR+dVcALfRbZap7sux8UYSpCjTce/Di1sEpYtWtJYrcRUUC6gDG0+cxWn6kmfAVIu
	wPtPY3IfSqAns9fcVyEvyMpFCgVUWg4/0KDNe04FSsKHCkfpvdVxIsoPmftPz7Cz6PiCz88bL1LZ4
	Ii3qsXySXqxriCh4Zitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVttK-00000007FXr-2AUG;
	Tue, 24 Nov 2026 17:01:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVttH-00000007FXR-3Gad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:01:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0845AC2C65F;
	Tue, 24 Nov 2026 17:01:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76ED6601E1;
	Tue, 24 Nov 2026 17:01:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EEF511E69A87;
	Tue, 24 Nov 2026 18:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=osciUjLQZdt7MjSZGYTDWwPTvV0Ioddqf9NzVSgW9yA=;
	b=tXPzzdC211i3SbKqbZRiAboCnxT82UlwM5+F9yUN0/Q/oBTHNyOmnY+pH1n7hTWlWviKM8
	H52A47MkSX29iUAtmHxVANiLmG4X7WiWyaBjAC7KboaWQNYpN+XTo+EnggbmybOPMhiqUm
	WogmMOaVloip7b7acwX9KOfRPs2APxAPo8RjJcP88GPig+au/A99VNvrtvE9IYJab1on3k
	2WPImDv4nivLj/Z258sihz4WUMEy5vunt9J+GPEhCEelwUWPjGZLEKQgYgu1jEbmozrtUY
	dBCE1PUvj/2Ea0g6oPkvmWsnch9RsiV5jHJNhiddbrXpQL+qvwXaBjUWNuM4LQ==
Message-ID: <1209f1bb-99a3-4329-a234-59da708870a0@bootlin.com>
Date: Tue, 24 Nov 2026 18:01:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the
 device at shutdown
To: Magnus Leatti <magnusleatti@kernelriot.com>, Yao Zi <me@ziyao.cc>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
 <20261120102754.778283-2-magnusleatti@kernelriot.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120102754.778283-2-magnusleatti@kernelriot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090111_973675_F703997A 
X-CRM114-Status: GOOD (  13.11  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/20/26 11:27, Magnus Leatti wrote:
> No .shutdown here, so reboot, kexec and power-off leave the MAC and
> DMA running. This chip keeps its registers through S5 too.
> 
> Hook .shutdown to stmmac_dvr_remove(): interface closed, DMA and MAC
> stopped, PHY dropped.
> 
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 42f0b11a7b60..63ce2301a0f6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -374,6 +374,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
>  	.id_table = dwmac_motorcomm_pci_id_table,
>  	.probe = motorcomm_probe,
>  	.remove = motorcomm_remove,
> +	.shutdown = motorcomm_remove,
>  	.driver = {
>  		.pm = &stmmac_simple_pm_ops,
>  	},


