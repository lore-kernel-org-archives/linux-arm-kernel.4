Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hX1CqpTk;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=pEh7LIp9;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=QMGfry2g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZPZTcZ28iypWR3zLEK6BsXPi/eB2P8Ay98qQME7HgBo=; b=hX1CqpTkYA1eI1
	EYCWWF+Khl9tCewEg2w2PZ93gU70yhxvifCCWRd6vSmagSFQYWtUad3rIrJ0kZl2wZ0TClWp/5po0
	nBhb3rENB75K1yuFh9pAjW8OCDFlx6O73qClNnioGy2lGGTvtgAvH2r+GvkBQ2gLrscgUyiguyzke
	IpgqAoKqOYiaqhW7lF23hP17Sz0AzcR0OXvuH0Sm4XAdhizTf6CAi4r8ES0cgHJwNVh6utQlfD5yc
	SJrIH8PGS3wAe755ubJ5NOx0dEbaxgqhpRyLPUBqmXlWEOOPxjelNl5rWrCXPrgpxV5apBGBTPHIX
	yHCck8d84LSKPKejA/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0eg-00000000m1H-1AyU;
	Sun, 22 Nov 2026 06:02:26 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0dw-00000000lPV-2Ya4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327299;
 bh=ZPZTcZ28iypWR3zLEK6BsXPi/eB2P8Ay98qQME7HgBo=;
 b=pEh7LIp9FZjl0PsZowan121u4RA+0A7edpOA7YcGPFC1j5Zl7VDDGjMxMm8krNrQX+qET8GU4
 EaiC0q4vR5mTiTJhM1jhVT/CYpD9kKIAryGLs0fAMzsI+aoyFdAUbkjF2QTrk++7GwF+rc46PZr
 /OWPPiIMzx/9eC2T0n/89GbKaRvvGqGpy8Z1JIF9x5a3s7H81XmCWl2/bsku8w8X5Z+Ktt4JPM9
 jG224r4Eti25bDlAWuLAWFao1C80e9a327g8xMaB8mTusmX1GoKKMiZ20zEvkjn2qCGVdvr4hp0
 mBZaRd5bRPvYYQ0swxUglBCWChMq5CAEsVj0q9+EcXKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327299;
 bh=ZPZTcZ28iypWR3zLEK6BsXPi/eB2P8Ay98qQME7HgBo=;
 b=QMGfry2gkdVsmXutcnaQZnEPxd5/2LqXgGG+pZsxc0yLzUT7V/NaNlEO2euo+qEku/kyr2uOb
 2QARmrDsxuCfTZn2EKtXyTc5IllLIpiqSX0XPq70AIsyfi/kNqH9DtH3xyJPCmgWTjOlvHOFdI+
 ojb+/dww/tUA5CQz8z/aQpI=
CFBL-Feedback-ID: 6b028540cff95ecda8c093f5:d39f546e2953e6c3bd51a1fc1a8b7a3e
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028540cff95ecda8c093f5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 8/8] ARM: dts: rockchip: Add Luckfox Lyra Zero W board
Date: Sun, 22 Nov 2026 06:01:11 +0000
Message-ID: <20261122060114.773624-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_220140_706984_73A639C1 
X-CRM114-Status: GOOD (  13.47  )
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

Luckfox Lyra Zero W is a compact wireless development board powered by
the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
peripheral expansion.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Zero-W
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change

As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 arch/arm/boot/dts/rockchip/Makefile           |  3 ++-
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  | 23 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 9a699bb8fc5a..faebeb20f467 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -48,4 +48,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-vyasa.dtb \
 	rk3506-luckfox-lyra-plus.dtb \
 	rk3506-luckfox-lyra.dtb \
-	rk3506b-luckfox-lyra-ultra.dtb
+	rk3506b-luckfox-lyra-ultra.dtb \
+	rk3506b-luckfox-lyra-zero-w.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
new file mode 100644
index 000000000000..f2fa513e8bff
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506b-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra Zero W";
+	compatible = "luckfox,lyra-zero-w", "rockchip,rk3506";
+};
+
+&fspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
-- 
2.56.1


