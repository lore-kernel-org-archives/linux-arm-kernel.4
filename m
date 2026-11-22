Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD635606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MmXDZH8b;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=eQSO7jbW;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=NrQvOlmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YC+Ogj9wmHA/Qf6zYsQ4fT2IqAwJLhOnqw7/ALnfGek=; b=MmXDZH8biBpdOxn2vswycTrlDN
	7Z7JdrOmq3/jaOXX7Y1xpVNhR4tXDjzM5+3uY3c3dzkMbpNYZJiCzjTQNF7VUGtnxLj7cya3r5HPx
	sNQoqJeswPTuuxzK13OII7lNYcpr7r1Qxwekk7yadeBcqx3WshEhtmPONr3GxucxlAsJc6x9yHYD7
	m/rmFCZCWfpgsuDGA7Fwgie4+B5YhKlQXrFRdhLzJSttAuHBUguuT9vNvzHFAx1L9T9n6VgyY6QJ+
	dMSaQjkpXRq9E2I2FfQvq2gaO1nBIF7VvAdzjdJEoZ4S0saATjBkN2JsLzm1XWKjJJN57Wtd1StlX
	AHI5SRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBcT-00000001SpF-2INF;
	Sun, 22 Nov 2026 17:44:53 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBcQ-00000001Snn-2766
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795369489; bh=YC+Ogj9wmHA/Qf6zYsQ4fT2IqAwJLhOnqw7/ALnfGek=;
 b=eQSO7jbWwdzVmf48iiCsdCn2MIUs08sRiqBjROm719HHzGwCWm2NFQkBQfr/Gp1JKY5dDLX0h
 HIST4Z7ee9P1NMgoUGGOH15SZ4DkogMyHQqWjIkVsrZrlJ/5Lp5bQM6AZf6CDAta06iUkGgQhQ3
 Kl60xWiiyOxsIlIXp0V9URbLiU5skogjUM7qOP8MX0SIxfiPsCM/IxivUThVevGzwnbgI5a0cpm
 9HwU0kqXWlMgzna7rzHZP3ob76tFvzVMbrv6y+7cFtP54W7aXzSkXEitusDfLAZ5+OsZg2iK9dq
 6zpqF5Y4KQ+rIvmfdqbmpz/JGxPVM+fWG+74jOLsA1Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795369489; bh=YC+Ogj9wmHA/Qf6zYsQ4fT2IqAwJLhOnqw7/ALnfGek=;
 b=NrQvOlmRKhhYGs6uxbympWPpIFWPDp+W2j9E2qYvBDDfOl2ZexQ9XaSSvK77w7JQSnnJlKrxd
 leYSQi1kJpb7ty/i+Hkuqnae4X7mColyiqQhdXlvGniZps7kWUp2AMt8nHYb/lguH24JHKDIvYl
 n2ftpMPmDjEFHghkD/CLsjI=
CFBL-Feedback-ID: 6b0329e237459da6a917fd20:615e4b675148a362b7f544948ebb1200
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0329e237459da6a917fd20
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Jon Lin <jon.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] spi: rockchip-sfc: Only use x2 clock rate on version 10 and later
Date: Sun, 22 Nov 2026 17:43:57 +0000
Message-ID: <20261122174357.1295391-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_094450_551024_3804BF12 
X-CRM114-Status: GOOD (  13.97  )
X-Spam-Score: -2.0 (--)
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

The detected NAND ID is read back incorrectly on RK3506 using SCLK_FSPI
rate above ~50 MHz.

  spi-nand spi0.0: unknown raw ID f7d511000000
  spi-nand spi0.0: probe with driver spi-nand failed with error -95

The FSPI_VER value, clock names and vendor kernel sclk-x2-bypass
handling seem to indicate that x2 clock rate should only be used on
FSPI version 10 and later, not 8 and later.

Summary of FSPI_VER reg, clock names and vendor kernel workarounds:

   SoC       Reg address       Value
  rk3568  FSPI_VER  fe30002c: 00000005
  rk3588  FSPI_VER  fe2b002c: 00000005
  rv1106  FSPI_VER  ffac002c: 00000006
  rk3528  FSPI_VER  ffc0002c: 00000008 (vendor sclk-x2-bypass)
  rk3562  FSPI_VER  ff86002c: 00000008 (vendor sclk-x2-bypass)
  rk3506  FSPI_VER  ff48802c: 00000009 (sfc->version set to 6)
  rk3576  FSPI0_VER 2a34002c: 00070010 (SCLK_FSPI_X2)
  rk3576  FSPI1_VER 2a30002c: 00070010 (SCLK_FSPI1_X2)
  rv1103b FSPI0_VER 20d4002c: 00070011 (SCLK_SFC_2X, sclk-x2-bypass)
  rv1103b FSPI1_VER 205c002c: 00070011 (SCLK_SFC_2X_PMU1, sclk-x2-bypass)
  rv1126b FSPI0_VER 2146002c: 00070011 (SCLK_2X_FSPI0)
  rv1126b FSPI1_VER 208c002c: 00170011 (SCLK_1X_FSPI1, sclk-x2-bypass)
  rk3538  FSPI_VER  fde2002c: 00670013 (SCLK_2X_FSPI)
  rk3572  FSPI0_VER 2a02002c: 00470013 (SCLK_FSPI0_X2)
  rk3572  FSPI1_VER 2a08002c: 00470013 (SCLK_FSPI1_X2)

Vendor kernel use x1 clock rates for RK3528, RK3562 and RK3506 thanks to
use of vendor sclk-x2-bypass prop or version downgrade, effectively only
use x2 clock rates on version 10 and later.

FSPI1 on RV1126B should likely also use x1 clock rates, and DDR_UNSPPT
(bit 20) of FSPI_VER being set could possible be used as a runtime
indicator.

Runtime testing also seem to indicate that SCLK_X2_BYPASS (bit 24) of
FSPI_EXT_CTRL only stays set after being written on RV1103B, not on any
other version 8 and later controllers.

Change to only use double clock rate for version 10 and later to fix
use of SPI NAND on RK3506.

  spi-nand spi0.0: Winbond SPI NAND was found.
  spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128

Fixes: af103eb7d7d8 ("spi: rockchip-sfc: Support sclk_x2 version")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/spi/spi-rockchip-sfc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index a85a260ba95f..8cc300d533e4 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -113,6 +113,7 @@
 #define  SFC_VER_4			0x4
 #define  SFC_VER_5			0x5
 #define  SFC_VER_8			0x8
+#define  SFC_VER_10			0x10
 
 /* Delay line controller register */
 #define SFC_DLL_CTRL0			0x3C
@@ -220,7 +221,7 @@ static u32 rockchip_sfc_get_max_iosize(struct rockchip_sfc *sfc)
 
 static int rockchip_sfc_clk_set_rate(struct rockchip_sfc *sfc, unsigned long  speed)
 {
-	if (sfc->version >= SFC_VER_8)
+	if (sfc->version >= SFC_VER_10)
 		return clk_set_rate(sfc->clk, speed * 2);
 	else
 		return clk_set_rate(sfc->clk, speed);
@@ -228,7 +229,7 @@ static int rockchip_sfc_clk_set_rate(struct rockchip_sfc *sfc, unsigned long  sp
 
 static unsigned long rockchip_sfc_clk_get_rate(struct rockchip_sfc *sfc)
 {
-	if (sfc->version >= SFC_VER_8)
+	if (sfc->version >= SFC_VER_10)
 		return clk_get_rate(sfc->clk) / 2;
 	else
 		return clk_get_rate(sfc->clk);
-- 
2.56.1


