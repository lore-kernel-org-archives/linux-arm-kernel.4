Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF083606A698
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UfMIejIE;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HUYL5rX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fvFQR0xZ1gS1J3KhZLCaw6EErZTMOVs9FN2WmeJUVeA=; b=UfMIejIEa5zFER
	f6y2zl0KU8MXCt8KhnefNDueDWrz2Q5kRkClwkCZud4rfurAz/uJtZS/V6xn0CnGEeZ5XnzayBXzH
	ZZ5G6sRzvhq4MYuLE7ptVvaHlnWMT0/tlw1Yy6y/sWDkurIfxp66XL/00KFyDBqniuzYQ7dFgR5Eb
	OoK5hbCOZA63rSlSpYyHyYk8zW6X8cBJwcCCT1dE4MpXlEJjUAlYPcgU/qmXW15Q8s56cvzlVNaaS
	nmyV/MonreNuqijzOw0woE6uSMcuwLxRCiKXMY7I1amkZ5z8rMv8aIfBHmMufumLkbRVjVwNASoe2
	/4NHannyuAmQmzHwt0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUWZ-00000003frw-3LvK;
	Mon, 23 Nov 2026 13:56:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUWW-00000003fqb-437q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:56:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B34C1A1797;
	Mon, 23 Nov 2026 13:55:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FB09601E1;
	Mon, 23 Nov 2026 13:55:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9B2F11E6A4A2;
	Mon, 23 Nov 2026 14:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795442157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fvFQR0xZ1gS1J3KhZLCaw6EErZTMOVs9FN2WmeJUVeA=;
	b=HUYL5rX6ln5pmUey4FFC0VmMP/KHDVGd7z3b9cRSkfyJepQG1kUURKsSY5GeK3ASrOupW1
	M4VD/8hwVr8Tg3VK5E2BjjrUxihDN/cTYVQjf8feYzMGNIcTI4cDiu0jg5yF/BuG4CYrsq
	tzW/0aT/MKxx+gNZJgt9GZb5gmt7YvuIkMo9jowqlBiVEbJPexzKEgVdqirwac8hh+4wPV
	LH9vbally66xlPRbbw/6q0KRxO79enePWAG45VwELm4emzUz5PsgsxmSbn+6UKD5g/5Wfs
	ei2kN8LIoQIo5SBM9X/fdgKnpD4SXqbHi7VcA1obpmXhz/a1jfv82osJUSImGQ==
Message-ID: <47e3f267-d4eb-4283-97d3-369d59b309fc@bootlin.com>
Date: Mon, 23 Nov 2026 14:55:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: fix uninitialized axi_blen array
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261123131326.7105-1-jszhang@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261123131326.7105-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055601_173766_BE1E896D 
X-CRM114-Status: UNSURE (   7.96  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jisheng,

On 11/23/26 14:13, Jisheng Zhang wrote:
> If platform doesn't provide a valid "snps,blen" property, the
> axi_blen[] array will contain random value from stack, then the array
> will be converted to mask which will be written to DMA_AXI_BUS_MODE
> reg later. Fix it by initializing the array.

Please take a look at https://docs.kernel.org/process/maintainer-netdev.html,
on netdev@ you need to indicate which tree you're targetting (net vs net-next)
in the patch topic. There's the same issue with the dwmac-syna glue submission.

Otherwise looks good, I'll review the resend. (also note you need to wait 24h
before resend :) )

Maxime


