Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C5606B1DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRXqsUij;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IhrZGzHH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8t4QuEM/UAFTQif1padG43+4xJsVO798G1x6veCOSgw=; b=oRXqsUijoPvOkZ
	Yr3A05fgKASRX3tIhdC8zsrbJ4nX0uIjJua15zg1W2fxIfMwAu3bUwKGYxx4AxiyKCAnIA9C8IKxS
	kAVomNij4aGv2hsqBFKCwA3WVNAeZMzgrHgfA8BAOycxaTucuI/kIU8jUWvbHsEehDjfLB5nNull4
	UKOsKvn/KQrq86fcyh4VVF8hODS93wFvrCOpJZM03EEzMPIYE/VC23JvMgjfus8qGVARNJRp1e2aR
	14QoUyDopSBkT0vv5ZFV0kY7bi4+fEWHOeHeoLWBYekEmCEoqi6a+ivS+V4J5uoBbGP4A+GR9x6tI
	lnmb7msaxniaCwsilzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmoS-0000000C66O-0FHS;
	Fri, 13 Nov 2026 08:39:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmoF-0000000C61H-2Kqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:39:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 036E1C4F76D;
	Fri, 13 Nov 2026 08:38:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 339D9601D5;
	Fri, 13 Nov 2026 08:38:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4206B11BC06F0;
	Fri, 13 Nov 2026 09:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794559134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8t4QuEM/UAFTQif1padG43+4xJsVO798G1x6veCOSgw=;
	b=IhrZGzHHEal3ZdOVMwhzsvbm5iuwEnp5xHC0dulEJ8kc2vnVnVCp+mqGoO1a8XACcjFo3L
	CemyoCGSjPFSqj+xVQN1dhltZ0iVnQmkCOSBvXU15Dmbd2Ahmr83mLPMw8X+qgICiJrJrp
	SjwpXfrk0UcG4L72AZvp4eSvVUTv7Ve1b/Nd6cfIkkTIyTnqxwY1wg/q+RN66hpFjGpzXa
	nK3gkzC44IvPJpC97sGgzIcepYInwd3pCKGgdYMEZqPIcGqMsC1oOfuloeDHhED46S3COf
	CUuazr2dgS4G//37WSqK+pD/JNz35R1ayU9FGStfzCq/CZMKpQ3u3/D+P6Wh6Q==
Message-ID: <85370a77-e2ef-4eae-96f0-7f591625f47d@bootlin.com>
Date: Fri, 13 Nov 2026 09:38:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
To: 1579567540@qq.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 David Wu <david.wu@rock-chips.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com>
 <20261111-add-board-ok3572-c-net-v2-1-304466394970@qq.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261111-add-board-ok3572-c-net-v2-1-304466394970@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003859_928429_2EA8EBDF 
X-CRM114-Status: UNSURE (   9.05  )
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

On 11/11/26 10:56, Cunhao Lu via B4 Relay wrote:
> From: Cunhao Lu <1579567540@qq.com>
> 
> Add the rockchip,rk3572-gmac compatible with the snps,dwmac-4.20a
> fallback and require rockchip,php-grf.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> ---
> Changes in v2:
> - Add RK3572 to the shared Synopsys compatible list for consistency.

This doesn't address Andrew's request to deprecate the tx_delay and
rx_delay properties for that new SoC. Even if the board you're using
doesn't need them, we need to make sure new designs will use the
generic properties for RGMII delays :)

The older rockchip glues have no choice but to keep accepting these for
compat reasons.

Maxime

pw-bot: cr

