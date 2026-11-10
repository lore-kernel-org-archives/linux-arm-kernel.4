Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C0A606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sg93wi58;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=F2oreDAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8vkSRLV03sMiSf6kg11DqKSF3D7mLrc58A9bRe4NGqw=; b=Sg93wi58tuSnGfyYd20ezHoJ/I
	i0vjTk+giB5RRvsKpmSCZdMnOrVPlhqinv0QUGFlEmOVsRypns+lCi59r/FHocIGZxEfojVyzcUTF
	UjHVZWUZlSFZSwxRZumLVz+CkXSKhWXgCKPWWqSqP2QWq9zdRsrb9OoZS16HCAQuENhtdmyouZnVs
	zBiqUGJz7MSIz56Dj/AwlOQdnBNPuteO+YMPRYxFnfvVI5rguO00qW7amug3PAEQjvSK1CwlrRQWw
	cunhdcmHnMUlcRq0MCgrJlxinvRthzTaHrHQWdf7ew0l9TktA10zQ/SH0nKk5oI85FzkKlzF3P6lz
	2yPVlltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsu7-000000051PK-3DPE;
	Tue, 10 Nov 2026 20:57:19 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsu5-000000051NY-1Tln
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8vkSRLV03sMiSf6kg11DqKSF3D7mLrc58A9bRe4NGqw=; t=1794344237; x=1795553837; 
	b=F2oreDArloXLkxxkQJayFAVgov4G5PeazzSzn99/2WxPVFtf3x+SvpDRemSDghb/T11qe2i55cK
	qqhetHSsGuZE8rZX8Wvc+m3eh9wsUEnw4J/tmCWP6mxX5kEoe61J37CYE1VcR2LU3hqiYI3AQ5y9T
	npAZls7xgRT7Wp7vTeZAAftrIY6KbmJ/OFv867AgQcS+v2Rtbam3oPcHiLVbCua5WDjsA3L4bjwaO
	p5s9awWwd5cttW70bcoe+3AITNTN3z9ajTRK0bcA3WxpdZm/wKUYakX12K3FaqzaFm20nILfUTK/y
	hmk4YW2bmZF6aA8tdvF+NxlZdDKM6f8MdZaQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] ARM: OMAP2+: Convert OMAP3 I2C to ti-sysc
Date: Tue, 10 Nov 2026 21:56:02 +0100
Message-Id: <20261110-i2c-sysc-v2-0-490cda69e350@kemnade.info>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOE82oC/0WNQQ6CMBBFr0Jmbc20ooIr72FYlHaQ0diaDhIJ4
 e4Cmrh8yfvvjyCUmARO2QiJehaOYQazycC1NlxJsZ8ZDJqD1lgqNk7JIE5ZzIscS+v90cGsPxM
 1/F5Tl+rL8qpv5LplvxgtSxfTsH71evF+WY3/bK8VqqLM91RrvysaPN/pEaynLYcmQjVN0wfUk
 IIxtQAAAA==
X-Change-ID: 20261109-i2c-sysc-a048409add7c
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>
Cc: Sicelo <absicsz@gmail.com>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=HLpL8m8DVWiEtYHCjcrWT5QMR1NV1zGxurHaq3sDY2E=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBq84Top3dPTjI90yNGW8S5KhnBqHG17bYixViRu
 jq+IdCPCjaJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCavOE6AAKCRCEYUX6QCjc
 8VLGD/96/ySK5pTY9pr3coUPLe3B9TgfXFp64mgj7w2aVydch65lIy6JGjGxTr4EoCiVRwS88rn
 9VVsk5fnu3bd3PojWPFtZQSXXNLNiuX353LFzUv9MtOLWlGb2iu2am+RSiW0fqUsOWwWZX46/OR
 kEMPfrKzKHKgFthv8x5R5Z2D7PpVJyLp89hShiu9nA1CdmLc9drFjkfAiiF7mOxns16S7LwO58g
 4I8x98yAAvd0y/ue62+AMaJAlof/Gqb0TcyZtno82nWmq2QzJlCornnuDSo+jiO/6VY7GRE5/tH
 Qo2FKmrO8eiq11Wj/1w2NO0JyxZgQyc+UQ8KFiAAPPiqZBLnM1+fxqiYbPX7Y8iCgTg1caYNwMb
 RXtUrT/gJQUltUiRm78TY0qs3fpExdC63Z12myPrse8XRVuXKCaot3FGEtUxit4M3VccsREWU+/
 FdjmwH/VSfdfGX3aS9ezmKpZ9XUMCjgWWKENqAqaIDnnl7tcO/bSRGuqBwLYicwrBVcgWY6rHwX
 rkzvQqtfn/7OmzlpTGu0Wa4zdZa7H6dB3u5HyMk7SyGVoN6k2kERwCpVEQiy9kRKMFf8+FecB/D
 IGUked0zH4riSTO/tiFkJAlCGPpqj8Qx6Rz7mx4AYmGOBCunlDLOcHJezZdUmouSu02BR/TeaEt
 G6c+jht5ZFZEzGg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_125717_403987_EDAD74A7 
X-CRM114-Status: GOOD (  12.68  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

During suspend on OMAP3, I2C suspend oopses. This is a longer standing issue,
in the past I mostly tested runtime suspendidle behaviour on that platform
(including uart autosuspend). A change in the I2C driver fixes some corner
cases in pm for ti-sysc based systems, but breaks systems using the deprecated
ti,hwmods property. 
To avoid that maintainance overhead, convert the i2c definition
First fix the I2C quirk needed for these older chips. OMAP2 stuff
is not touched due to its planned removal.
After OMAP2 is removed, arch/arm/mach-omap2/i2c.c can be removed, too.
I may try to check again if there is some safe fix in omap_device.c
but changing things there has a very high chance of unexpected side
effects.

Handling the commits:
In the past (e.g. around commit
42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977 for converting musb to ti-sys)
these changes were handled through a separate branch to keep them in
order.
Here is a hard requirement of the order. Patch 3 can most easily wait
but having patch 2 after patch 1 is a hard requirement. As the
affected devices get their devicetree updated with the kernel,
that should not hurt too much.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- fix missing kerneldoc
- fix typo in dtsi, which surprisingly worked quite well
- Link to v1: https://patch.msgid.link/20261110-i2c-sysc-v1-0-8945eb1d38f0@kemnade.info

---
Andreas Kemnade (3):
      bus: ti-sysc: fix I2C quirk for OMAP3 variants
      ARM: dts: ti/omap: describe omap3 i2c via ti-sysc
      ARM: OMAP2+: remove i2c from OMAP3 hwmods list

 arch/arm/boot/dts/ti/omap/omap3.dtsi       |  96 ++++++++++++++++++++-----
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 112 -----------------------------
 drivers/bus/ti-sysc.c                      |  20 ++++--
 3 files changed, 92 insertions(+), 136 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261109-i2c-sysc-a048409add7c

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


