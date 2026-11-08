Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC86606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A9RX/CTe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rzNTqiF/0oFtFuwLiqpYwCiwI9Zt2IrMYSYo1+8ZOzw=; b=A9RX/CTeIcWnKB0CRydk3ihn8H
	B1SAgxus1U4/svPMPfHrKGBziBFiO/DpcOxqJnCgExoZrWUD1UctvtpHBwAdvBuy4nPRQTUL41AeC
	KypuUWDxavmhJHEAGE0h0oFs81gDX2lCkxIaYNtOHILBU6Q0Tfbf2MuGttnyOnkGN6ygoNNa9SwOS
	rKwin4wsg7qDoN0nlNXpRK/khba0vU8kvZEVUZYtITZcR0DPTUqAWVKmOI6+EgaIM+BOZh/I9xq7m
	/67MAGeXX01xC5vPItm8Wm3p50jJ5Km/yvUcaNhXG//XrqZ/pBkgq5dcYnnKJfCGhbvYpOnFiyNlE
	OWKK1xGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0dd-0000000G1DB-1mUX;
	Sun, 08 Nov 2026 11:00:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0da-0000000G1Co-1BbJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 11:00:39 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADngLZOVvBq3vOZAA--.18448S2;
	Sun, 08 Nov 2026 19:00:30 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vulab@iscas.ac.cn
Subject: [PATCH v2] net: stmmac: release MDIO node if bus data allocation fails
Date: Sun, 08 Nov 2026 11:02:31 +0000
Message-ID: <20261108110231.315004-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADngLZOVvBq3vOZAA--.18448S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4DuF1rWF1fXF1rJr4xZwb_yoW8ZFy5p3
	y7Ga9Fvrn5Jr1xtw4kJw18ZFyYkayayrWUGrWxKan3u3Z8GryaqryaqFWj9F9rArWkW3Zx
	tF4jkF47ZF1DAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
	Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxV
	W8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JjU-B_UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAAFA2rv4qizTQAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_030038_734709_4B7D9413 
X-CRM114-Status: GOOD (  13.45  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stmmac_mdio_setup() takes a reference on the MDIO device tree node and
stores it in plat->mdio_node before allocating plat->mdio_bus_data. If
that allocation fails, the function returns -ENOMEM and the caller
jumps to error_put_phy, which only drops plat->phy_node, so the
reference on the MDIO node is leaked.

Release the reference before returning, using an error label so that
the cleanup stays in one place.

The issue was found by a static analysis tool; the candidate was then
audited and the fix was prepared with the help of DeepSeek and
GPT-6.1 Sol. It was identified by code inspection only and was not
triggered; this patch was compile-tested, not tested on hardware.

Fixes: 1a981c0586c0 ("net: stmmac: Make MDIO bus reset optional")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Sorry for the very late follow-up to the review.
- Use a goto-based error label, as suggested by Simon Horman,
  instead of an inline of_node_put().
- Describe how the issue was found and how it was tested, as
  requested by netdev-bot.
- Drop Cc: stable@vger.kernel.org: the leak is only reachable when
  the bus data allocation fails.

 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3ea16d618215..ded352afd103 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -356,12 +356,17 @@ static int stmmac_mdio_setup(struct plat_stmmacenet_data *plat,
 						   sizeof(*plat->mdio_bus_data),
 						   GFP_KERNEL);
 		if (!plat->mdio_bus_data)
-			return -ENOMEM;
+			goto err_put_mdio_node;
 
 		plat->mdio_bus_data->needs_reset = true;
 	}
 
 	return 0;
+
+err_put_mdio_node:
+	of_node_put(plat->mdio_node);
+	plat->mdio_node = NULL;
+	return -ENOMEM;
 }
 
 /**
-- 
2.34.1


