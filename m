Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7C1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XayxJoFR;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=D+3yX0wV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qfG8+HNjWNjgKY/1LVDEwnEFGbVLXME85VZs5AOT4/s=; b=XayxJoFRinhzv/
	batqKQmz24I2byAQJUENAsafcfMg76X8dYLaP9CdQ52/SP+Afb1VY9AG6rRwHgyVTG2fPchgZZM2U
	eT820eoTh7yZpuznzL+xIGzW96rOqZQyku6sMxoSV5G0YKn9J8lnIfdLMSIMHhxtUnczdG2NVc678
	/zrkKV/x1C7LbPQ2gcxpqt8O0HPL+F51iOYvTdEYHK/AYgcco/IKYdriT9F1SmbAexP3ebw39X7m8
	dqGSTWQ65hrpVi7/BrLuABGm3FlcnsMC/Msuj1FlhqQAV9VSCHgWPb8MKRPQFWaveCUcqxC9ZPp58
	JHkxciZrVBEwPENRMgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRf-00000007HVx-45h3;
	Tue, 17 Nov 2026 23:18:35 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRc-00000007HVZ-2p8i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 23:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qf
	G8+HNjWNjgKY/1LVDEwnEFGbVLXME85VZs5AOT4/s=; b=D+3yX0wVYBhvGBXf88
	nxmOrOsC0UVwZ95uwemG5wZI/zzHFewQ6NxwPgKFi5fMQ83yHImsxbk6km0ePDOh
	DcovJ3SWSzeaftSd5VAHUWNjzpMfqvIX7qEpTKmVUY9XW6ewAQKmw+t9U51CjxaC
	GKeSSFY8OqLDU1d08BXXIJmHg=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXt8a_4PxqUebhIw--.17204S2;
	Wed, 18 Nov 2026 07:18:24 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] pinctrl: sunxi: request the per-bank supply optionally
Date: Wed, 18 Nov 2026 07:18:07 +0800
Message-ID: <20261117231807.264348-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117091944.12082-1-hsyysy@163.com>
References: <20261117091944.12082-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXt8a_4PxqUebhIw--.17204S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7AF4rAFWrur45Zr4kCrg_yoW5try8pr
	sxXFsIkr4rAFyxKwsxuw12yr1S9an7J343CFykK34rAFn8JF4fXw12kr4YkFs5Gr4kJr4Y
	vrWUZa4xGan8X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul_MfUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QBCdmr84MADPgAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_151833_180651_D4E55865 
X-CRM114-Status: GOOD (  17.72  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The per-bank "vcc-pX" supplies are optional in the device tree: the
binding documents them, but notes that many boards do not describe them.
sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
falls back to a dummy regulator and warns for every bank that has no
supply:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Use of_regulator_get_optional() instead.  A bank supply that is described
in the device tree is still acquired and enabled, as it powers the
physical VCC-Px rail, but one that is absent is skipped without a
warning.

The OF-only lookup matters here: regulator_get_optional() also falls back
to a global regulator-name lookup, which could bind a regulator that
merely shares the name with an absent bank supply and is not the supply
of this bank.

Skip the free path for a bank that never obtained a supply, so the
refcount is only decremented when it was incremented.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v4:
- Drop the supply_absent flag and the early return that tested it.  The
  result of the OF lookup cannot change at runtime, so repeating it for
  every pin request is harmless and caching it only complicated the code.
  Suggested by Jernej Skrabec.
- Link to v3: https://lore.kernel.org/linux-gpio/20261117091944.12082-1-hsyysy@163.com/

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 31cd142..1fcab0d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -912,6 +912,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	unsigned short bank_offset = bank - pctl->desc->pin_base /
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
+	struct device_node *np = dev_of_node(pctl->dev);
 	struct regulator *reg = s_reg->regulator;
 	char supply[16];
 	int ret;
@@ -924,12 +925,24 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 		return 0;
 	}
 
+	if (!np)
+		return 0;
+
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg))
+	/*
+	 * Use the OF-only lookup: regulator_get_optional() also falls back to
+	 * a global regulator-name lookup and could bind a same-named
+	 * regulator that is not the supply of this bank.
+	 */
+	reg = of_regulator_get_optional(pctl->dev, np, supply);
+	if (IS_ERR(reg)) {
+		if (PTR_ERR(reg) == -ENODEV)
+			return 0;
+
 		return dev_err_probe(pctl->dev, PTR_ERR(reg),
 				     "Couldn't get bank P%c regulator\n",
 				     'A' + bank);
+	}
 
 	ret = regulator_enable(reg);
 	if (ret) {
@@ -959,6 +972,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* The per-bank supply is optional, so this bank may not have one. */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.1


