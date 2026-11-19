Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P7WVNT8X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=iESTq3U+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RdKBL2ZT8p0iQbKt/GS5KGAaU5/MWPgNyUJOPC47fuw=; b=P7WVNT8XKfn0gnVrCIeYtEkCzZ
	ZMPzJ7TgzvT1v1zEDwlsh2L6STDowYGBAcb8AShrfWIhe69Y3GALx1cWZms6cgna3xUEtjJV56nbv
	7ZxVoJtNzlVZZj8WsOaOtE92YlUF7biGW5o2c5U3xoQEToYneHw5V6lzreV38+8Dz1197Ku0fIX3e
	K4yioovWlZFfR+lifLPRMXPuUeCmRtjt6kNsefMb9Qgu4+jDhg8xTEowSYQuyQZ3lcb1LMkFgf8oD
	Ic8ZPPum7+PufxJuHJng7pKHhItRCFdwpp2q/InmaRjlXqSja4iOtXCVAkTrFdxoAbIm0ynVF12UO
	Y72FCZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzLa-0000000BYJ4-1lER;
	Thu, 19 Nov 2026 10:26:30 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzLY-0000000BYIN-04s9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RdKBL2ZT8p0iQbKt/GS5KGAaU5/MWPgNyUJOPC47fuw=; b=iESTq3U+Vva4Xf6N117sAoQ4wm
	MhRMrEnV/FXQo5Vdmkmv2KEJr8YpowfLQUuLnroHEVMVrl6KfCHpS4b+2CyoGs0YzJJSD5JGmf0lT
	9rwgDmACOtuwW41VY/fexrTheXZfoBtznY/t9FzBUNK1r5FixX1wssbbSoIYhTAkpRgTxDb6q40b0
	oCr/RHXR0jcrkXw2y/0G/wc0c19HTeN+FOHwqcrtQingpFoKMkqaUcAZPikNRuxD68+HVAxN/RIGo
	i2r4CCHM/vb/Ea26rTGZxizpixExbGZs36ILlJCjt+PbPxj+A8uUqb+FQXaGGi297ZTW4DUTIt9jO
	HUQZ3rXg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1xTzLO-000DDB-28;
	Thu, 19 Nov 2026 11:26:18 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1xTzLO-000GjE-2H;
	Thu, 19 Nov 2026 11:26:18 +0100
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all board information
Date: Thu, 19 Nov 2026 11:25:24 +0100
Message-ID: <20261119102531.2995127-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28188/Thu Nov 19 07:24:39 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_022628_167235_7B4CB077 
X-CRM114-Status: UNSURE (   8.03  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MBa6x has board-information (mac address, serialnumber, board)
located in EEPROM at offset 0x20.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi | 4 ++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
index aca320ee8f476..9b199b277c220 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
@@ -29,6 +29,10 @@ nvmem-layout {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			board_info: board-info@20 {
+				reg = <0x20 0x60>;
+			};
+
 			mba_mac_address: mac-address@20 {
 				reg = <0x20 0x6>;
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
index c7bbd6195fef1..517913abbc66d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
@@ -39,6 +39,10 @@ nvmem-layout {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			board_info: board-info@20 {
+				reg = <0x20 0x60>;
+			};
+
 			mba_mac_address: mac-address@20 {
 				reg = <0x20 0x6>;
 			};

base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
-- 
2.53.0


