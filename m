Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ANWZ4vss;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=SjFKF5/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xDtIST3zZ9y4EzJ6NETBhs9+pFPleoAbssJ/eV+XnOE=; b=ANWZ4vssgGfL8C
	oc8uqtLbZKB8CDd3Uu+lkvgr2i+p7Mm/uM86gUJ8YQ/nahHau9gcbVNFtl8q9BkW0D7HK4vRg9FMQ
	XhOB9Wby+4UXqxbgbq53ec1lamcQRohC6zgEuNP72Hq3Onb0Ppqe7CeD6Haq6HoaihECTpuAkDGDo
	wBiliQ5beGK0lBrEa/dMksfx5iPq/pyAnQEmVR42U14Itv+d/d04mK7d+F4SIuyj+YShbrxTlCv85
	x4GXtOnY1s/AInSFLQ2z1FxZ+K1syqPradqppatYU5oCWFW/MBbwOnRcexPwn6qxhZryjUKpcag7m
	uMgAUN8FQCCY1+Dhz46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTDT-0000000CDeb-2hMU;
	Thu, 26 Nov 2026 06:44:23 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTD8-0000000CDaM-0gfV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:44:03 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id AEDCC403EF;
	Thu, 26 Nov 2026 17:43:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795675425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDtIST3zZ9y4EzJ6NETBhs9+pFPleoAbssJ/eV+XnOE=;
	b=SjFKF5/tk54Xz2Km9hT+o/URL72fTkx0Jsfqyqj9ECYBOS1JAbZ4S7UZoxx2E4V2K4nuDB
	CjBsPCYkeTBKtm7tCpB39vnc3y8fYp0RUDSbMqzbdMo0NYwrrpVyyfGiqy77A82MWqLqts
	gRaL3UUDOIhfL+EsjPfoSoH7g0fRDjTcg6QTYR5KEI6O/HGn4x4RiXa2zKhOgfrF1QXfFj
	ouoHUeyW5wp7nutpSrq1e6v55JE0WM/h0mmwtyRn6cIEtxy7vLWwMS+q+ynDUgSBxrnsFY
	S7x9GaxPK/NbWq9/tEZVBbWcdvdBdNLPoGw9S4PApBmkLScYonxN38gY5ENAdg==
X-GPT-Reason: legitimate; this is a technical, personal, or professional
	correspondence regarding a Linux kernel patch (net-next) that
	perfectly aligns with the sender's identity (alastair@d-silva.org)
	and the recipient's role; the content is highly specific technical
	discussion about hardware clock inversion and GMAC210 support
	with no marketing, phishing, or scam indicators; authentication is
	supported by a consistent From domain and a lack of external links
	or urgency tactics.
From: Alastair D'Silva <alastair@d-silva.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for Allwinner A733 GMAC210
Date: Thu, 26 Nov 2026 17:43:45 +1100
Message-ID: <20261126064345.2569445-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com> <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_224402_433095_882244AB 
X-CRM114-Status: UNSURE (   7.23  )
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

Hi Jerome,

While testing A733 GMAC210 on the Orange Pi 4 Pro (YT8531 PHY), we hit
two hardware differences that also affect this series:

1. External vs. internal RGMII TX clock (SYSCON_ETCS_EXT_GMII):
   Unlike the Cubie A7A, the Orange Pi 4 Pro wires the PHY's 125 MHz
   CLK_OUT back to the MAC and stalls on 1 Gbps TX with
   SYSCON_ETCS_INT_GMII (0x2). It requires SYSCON_ETCS_EXT_GMII (0x1),
   matching Allwinner's "aw,rgmii-clk-ext" BSP property. A733 GMAC210
   will need a DT/clock way to select EXT_GMII vs. INT_GMII so both
   boards work.

2. RX clock inversion (BIT(4), ERXIE in glue offset 0x00):
   With BIT(4) = 0, Orange Pi 4 Pro required ~3.8-4.1 ns of total RX
   delay (matching what you saw on Cubie A7A with 1800 ps MAC delay on
   top of 2 ns PHY delay). Testing with BIT(4) = 1 (ERXIE) confirmed
   it inverts RXC by ~4 ns (180 degrees at 125 MHz), centering RX at
   0 ps MAC/PHY RX delay. Andrew Lunn requested fixing this clock
   inversion rather than compensating with ~2-4 ns rx-internal-delay-ps.

I plan to rebase the Orange Pi 4 Pro Ethernet support on top of this
series and address these in follow-on patches unless you intend to
roll them into a v4.

Thanks,
Alastair

