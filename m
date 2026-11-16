Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EB9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ST024UL3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d6JNnFfoaeyGY+wbe6iG5ANoRSPTTnQEghBDjZz1BM8=; b=ST024UL34WuXX7P0oFYZeoftGo
	pEwn9ek3AoDIteitYVgkPZ6UnEeazLgZF8j5ursjla1MWdA8NGEJomWKHkmBGup8lOZo2R25fbH8z
	K1DMxq6Sd/Gr7CvRBiD3qvLBYEqWLFKgv5WVOmZU6A1XQ4Ia6h6A7PHDSjus7sxUHpD/tq+dH13Gg
	upm9pYNoG2nOR5mZtxqbqdnOc8Wg4YrOIv7cn07z7Yko5AVD/b9P2MLRnRhCj0ea22Of/vnppPeyK
	gzGx/Fs+sFXKzXWoIYEPQKX140pZyphGJ6oxWVJw8K9U9X6WDcs6XKZbja5Olv44L5wM0bjg1r4PI
	TlZRxJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0uA-00000003SZw-03B7;
	Mon, 16 Nov 2026 17:54:10 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0u2-00000003SVO-1Szp;
	Mon, 16 Nov 2026 17:54:04 +0000
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0tp-004GoI-1y;
	Mon, 16 Nov 2026 18:53:49 +0100
From: John Crispin <john@phrozen.org>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v3 0/3] i2c: mt7621: add Airoha AN7589 support
Date: Mon, 16 Nov 2026 18:53:40 +0100
Message-Id: <20261116175343.344425-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_095402_383562_0278D521 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Airoha AN7589 carries the MT7621 I2C controller with a second
control register that holds a 16 bit clock divider. It runs without
SCL stretching.

Patch 1 resets the controller with reset_control_assert() and
reset_control_deassert() instead of device_reset(), as the EN7581 and
AN7589 reset controller has no .reset operation. Patch 2 adds the
compatible, with mediatek,mt7621-i2c as the fallback. Patch 3
describes the variants as match data and uses the wider divider for
bus rates down to about 3 kHz.

The series applies to next-20261105 and has no dependencies.

Changes in v3:
- Patch 1: add the Reviewed-by of Philipp.
- Patch 2: add the Acked-by of Conor.
- Patch 3: compute the AN7589 divider with constant limits, so a clock
  rate below 1 MHz cannot wrap it (kernel test robot, sashiko).
- Link to v2: https://lore.kernel.org/r/20261112185820.1315718-1-john@phrozen.org

Changes in v2:
- Add patch 1. It replaces "clk: en7523: add a reset operation" from
  the clk series, as Philipp suggested.
- Patch 2: add mediatek,mt7621-i2c as the fallback compatible (Conor).
- Patch 3: the extended divider supports bus rates down to about 3 kHz.
  Set it up before the controller is enabled.
- Link to v1: https://lore.kernel.org/r/20261111093941.691801-1-john@phrozen.org

John Crispin (3):
  i2c: mt7621: assert and deassert the reset line
  dt-bindings: i2c: mt7621: add Airoha AN7589
  i2c: mt7621: add support for Airoha AN7589

 .../bindings/i2c/mediatek,mt7621-i2c.yaml     | 10 ++-
 drivers/i2c/busses/i2c-mt7621.c               | 70 ++++++++++++++++---
 2 files changed, 70 insertions(+), 10 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1


