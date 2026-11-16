Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C7F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uD6IdUpS;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=G0wrkUiB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C/xrMaZEdozCXeS1OyWKkLrn5z+kvKgCOECHu40oOnE=; b=uD6IdUpSOkoiBN
	xzdPuOF3C5f24c3rLOMFgWEu+YQ80Lvfxi/qBC9F+4ORr8sRiJOiu69mr0mLtKZHb2zlIErt1/Ius
	1Me+nN90OH88p59lPNxFWrF0egCqf32M7mYAWZDgPG7cN5skEMQb4tFsL9W3ylq2HPkSNdSjtm1NO
	X2EnLTK24EiWwrRSsYWadjed8aPbpKanJEp7gkUCtMTt4ArlRrRmzzQMg6kLeo0rjykjW3tPFhp8C
	6kFjS0Xo8Dqq7LpH2L5OOnX72Eii9ifIdiXMk6CM7vP6c7yKlFoYgW9cGpEDwAzH6pCN1K3q6ZkBA
	ZMZ1RwKqM14/g4bmcqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv1q-00000002D28-1U5d;
	Mon, 16 Nov 2026 11:37:42 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv1k-00000002D0Q-40sN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794829055;
	bh=BgYjXRjzcjLxGrbQy7oJJ5oNxCwDfd3tLx3OFtVZViE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=G0wrkUiBykcwdZQuzByBqWZDuTGExve5JfOThtNqTKW9/lr0qb22xuTijqZLqx4HO
	 wtQ2kTe3hU23MqhoIORYUNqU8xVHuBsxuEWOrrVF1uYk41u+uQKmDvLJo5/YwwOZbH
	 7j8sipWJANA7TQq0koB72YCvKzD5u2eoLBvKkDI1dTi/4mXGAJ04TigwEfV7ooblwQ
	 VepBU+yxPde7K4yU2AwVxO+JnYuIlEwAzFrm0d/S/u0wPNelHNb49pUSAufZBiZG4K
	 4LUXzcRruxxrJXDVAsNjqH5OuxQwUZvo04zChFWfJ2CYsGhCy05MyEw6q2mcc+4TdD
	 ME+Fjf1eM0J+g==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id C4FA38148E; Mon, 16 Nov 2026 11:37:35 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: g.nespolino@gmail.com
Cc: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: Re: [PATCH net-next 0/2] net: stmmac: dwmac-motorcomm: shutdown hook and Wake-on-LAN from S5
Date: Mon, 16 Nov 2026 08:36:56 -0300
Message-ID: <20261116113656.2203674-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAKx9m6O=uqC16v5-swStrtq4xzNzExbM0xFoi5znQOmnwDvSZA@mail.gmail.com>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <CAKx9m6O=uqC16v5-swStrtq4xzNzExbM0xFoi5znQOmnwDvSZA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_033739_484963_E222B68A 
X-CRM114-Status: UNSURE (   7.63  )
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

Hi Giuseppe,

On 11/16/26 12:23, Giuseppe Nespolino wrote:
> Tried it on the Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07).

[...]

>   patched   wol g, BIOS WoL enabled    wake, 1 of 1

Thanks for testing!

A side note: it was mentioned in a different thread that this card
only shipped in older NUCs. Your Slimbook has a 2024 Ryzen in it, so
the YT6801 is a current NIC that vendors still put in new machines.
Good to have that on the list, so again, thank you :)

Magnus

