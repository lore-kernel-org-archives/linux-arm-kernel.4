Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11708606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cnAnmOai;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=oSHTh3ua
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yROZWwK3yFhmR4J+4rR//wVwCBq3MVfqb1zhpZ3Xm8A=; b=cnAnmOai+tOEeg
	4x8mNbTPkFr1Q77YXJs6fAMmFmWNj8wWeuKHLaPEE9dL3Rsni0zt9Nvyogv8ISx97UNbIAzfNyp2Q
	8SmzNL9cqXK9G7n0wboXhuqdTiYkGhWvjEe0xjanxcKxEFjww5OjegyNVYY8paTnSR1jw60MqYe1O
	xkoxvm9L8GjZgfbR7p86gkj03zvPxgnsSzMg4VlcLpQZSYj/Gt4LwFTQLnwIO5gfiEa3N3+lzQ3nt
	CI/l/ws+HU18qx26TZFIfwUhjMPUiAS4syNNQAYZkojwfQJxoc++XrVWZUYHsbYCxhtRIgho/4jbZ
	lGxU7nRo3x6MvE8s7Hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGrJ-0000000AkSJ-0wdw;
	Wed, 25 Nov 2026 17:32:41 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGrE-0000000AkRj-3sIZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795627955;
	bh=yROZWwK3yFhmR4J+4rR//wVwCBq3MVfqb1zhpZ3Xm8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=oSHTh3ua6WOxhR6mUde3jJfwQFFL1ehk2cnxLu97fuuGqHhlsyjmHU9xKN7v+Zxta
	 P+l67hZuKrgxOPZLasZ7/XbG0y2vxrkzHxT93f5NA4PhKvk0CPj2wZTME6om1zR51S
	 JEO8aE1OETrdmSqFTq7e+ap+Z2IV6Inr0iftRQWIM/F8genOW02B0K3wNMOpTvlIqD
	 IyLC2z24xSXvd1EJzdpGvve1hK7fIupSTIXu0OdW2o2zLgxPdcmI5eKUM08Se9z3tx
	 tiWoQZBoS2YBzWrAE39IBLPVS4oewebGLrsIrL3YlluukzArEj/+bpJTCfMSdOD7We
	 R7zTL+dr/HScw==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 36FC5814AD; Wed, 25 Nov 2026 17:32:35 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown hook and Wake-on-LAN from S5
Date: Wed, 25 Nov 2026 14:31:55 -0300
Message-ID: <20261125173155.2073979-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_093237_006329_3E68203E 
X-CRM114-Status: UNSURE (   6.23  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

v3 will be posted with the comments removed and the Fixes tag on
patch 1. Since nothing changed in the code, I will carry both reviews
and the Tested-by tag. Thanks Yao, Maxime and Giuseppe! You're the
best.

Thanks,
Magnus

