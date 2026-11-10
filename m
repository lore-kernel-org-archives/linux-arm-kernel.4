Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8B7606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=24h6zbT1;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QvvCcZll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iV+Waf7jutjSxFSyqvs4NPIRg2kLw+pP00ZuH8Bx1Uw=; b=24h6zbT1BhKjb5fBTZjgBS7aUq
	Gbf5RrTs1arnRwnFeQOf3ODj5/f73BSLDTba7M1WptlaFTawlZbqEq34Yxc3ZilOfypGfDc2vwSP/
	XZYqgiymmWCd7foO3tWoR2OU5OzuWxnUTXw/jqe5xCqH8Fg+pms2GjjaKf4VLGVeKUCSRz+1hLzDO
	S7knsVTSZ/4wAcy4xlIEpNDNQaIkaQGOEkAh/3a32rvOf04+a4mpTDQyPwNLG1Te6G7129hP5sJhK
	331uvL+udW3NMO+lqkUYByDKOKs/aXkwyARkjrttbUg9Wyxn8fAlDdYEamVeRlEF6z1CpBbVUCWRp
	C8hheF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhlB-00000003CU4-29AZ;
	Tue, 10 Nov 2026 09:03:21 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhl8-00000003CTI-3hrS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:03:20 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D73142004B4;
	Tue, 10 Nov 2026 10:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794301396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iV+Waf7jutjSxFSyqvs4NPIRg2kLw+pP00ZuH8Bx1Uw=;
	b=QvvCcZll9nfoiX1LGBmwAWaz6C6URPecwdmuRNKhH7Vaxzrks7ds2pGmx0BDm22nRr39nE
	32fqoNq+aEWysvMQHvRxHgZh+RvwpWPndblh1y9HFDTGdPQs2lZVwzK80yaQ/jGekcBYjr
	kHNwgUGK+0nIqqWjqOZOrI3SnH1oHRKmq1r+KtIDtIPUD3O9b6/1gnEKlsQ5zwqk9NZRiW
	Aw2AQ+CHVt/a0njDG3sit1+b3djTP4RguSZgrAgExLN+cvUsbevpmElViK/w1blz/m+fPc
	qMpb7nRgBjkUqc1uwtKd3FK8Ab4S25xoLRg/Feifkk5UOP3ffVYs02iV5CylVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794301396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iV+Waf7jutjSxFSyqvs4NPIRg2kLw+pP00ZuH8Bx1Uw=;
	b=QnIBYVzDajT2AtGOEnK+v3EQQUuXrCBTbHddGThqt7eXyM8Sw1mktO3/kdQxlq4KGUbeRn
	1mCHEnV1ezBU4VnEmLDrFUBE9UfKkJ3uYmhNVUZe+9D8gcM826L+wI9+surjnEr1K2/lgx
	JiGnEMZ2O8Bk6kXJB0mHQZ29KrBV2a1umqA9I0jkbI6nckFiNaUvvXMI0MGpa2wTdbcOjP
	ybBlW0ppcMZyBS0rYgepNLIVYolZDybTKdg+gOdYUilw6IVo5nSxrf+XbvOE27Fbj7uCsH
	heCcX8vdNDYnBr4p6vmjLzUw44hvWOuxFTCYOUj5A/CP0AFDOXJ3s9bJj3vHFw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794301396; a=rsa-sha256;
	cv=none;
	b=ADxZs/pwwc0+vefYfA7cO36TgOleG6Nie6SziGqCXfoBX3SR8EY3a0A6gm1RUqMt+AEeyV
	LuZDpEhwwsytB7bCZeBDz0cIg+lPURnf+Qy89RZvz1UlOD7kZ5nf+RkfifnNnzaPDZuBnK
	rIEAM3mctVpdfYYTHQrcudSK5/gn9hDXJpYpgdmwOxRGFhvb6NY53D10V/0EUTkXI6yVEe
	21IdCjiHiaPv8C+xSdipkvLYVa/60BHsgLu3Mwp280DJxB3kAlvajvo6FD3plibQPagwJL
	rgzTyGsBc24YdnGU/57nGSnDSxNXpALZcldo6aCubZIpsbSKGPxo4KMux2chgw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 10 Nov 2026 10:03:08 +0100
Subject: [PATCH] arm64: dts: xilinx: drop unused #phy-cells from the
 DP83867 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJB7RUr2JcQDvVMbGUFolIu
 LtVl2/x/wqZk3CGU7VC4lmyDKGAdhXYWxeujOKKoVa1JiKFc4t7nIYoFt9LGB8RXTSN0S0qT+S
 8brqDOULpY2Ivr9/7fPk7P/s72+k7hG37AJwvBo19AAAA
X-Change-ID: 20261110-v7-4-topic-zynqmp-dp83867-0f11df63a589
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6985;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=r7xwrLRGPAQ0iiVHxekSDOtVkGaeiUkp/R9YD1Vpj34=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9anu5fLC3/3T7r6JP/qdiaFxxqaBu6fku6blCzqW5O7Y
 W9IDNu0jlIWBjEuBlkxRRaVhRV8oh4fPCOniXDBzGFlAhnCwMUpABM5nsPwV9Bz4S6n03X/XA1v
 hul1Lbdk/1+bahVptlI37Xj1lwBtfYY/3Kqh/NLJRk18vO6Vv4/cfXc96t/Z8vik7y7H3RgMYu6
 zAQA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_010319_428126_2980D1BF 
X-CRM114-Status: UNSURE (   9.45  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DP83867 ethernet PHY nodes have a #phy-cells property, but no node
refers to them with a phys property; the MACs use phy-handle, which
takes no arguments. #phy-cells belongs to generic PHY providers.

Drop it, so the nodes validate against the ti,dp83867 binding once it
is applied to them.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 1 -
 10 files changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b82a056be2f99..930f0e54fdac5 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -254,7 +254,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@4 { /* u81 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <4>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -266,7 +265,6 @@ phy0: ethernet-phy@4 { /* u81 */
 			reset-gpios = <&slg7xl45106 5 GPIO_ACTIVE_LOW>;
 		};
 		phy1: ethernet-phy@8 { /* u36 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <8>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index 4dcf92a2158fd..e05667f6e946b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -255,7 +255,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@4 { /* u81 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <4>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -267,7 +266,6 @@ phy0: ethernet-phy@4 { /* u81 */
 			reset-gpios = <&slg7xl45106 5 GPIO_ACTIVE_LOW>;
 		};
 		phy1: ethernet-phy@8 { /* u36 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <8>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 52954761c9f3d..af897c3cd1680 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -200,7 +200,6 @@ mdio: mdio {
 		#size-cells = <0>;
 
 		phy0: ethernet-phy@1 {
-			#phy-cells = <1>;
 			reg = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 49732de5fa4b9..a1f0592e79589 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -191,7 +191,6 @@ mdio: mdio {
 		#size-cells = <0>;
 
 		phy0: ethernet-phy@1 {
-			#phy-cells = <1>;
 			reg = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index a5bc521ab6797..42030547a32dd 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -217,7 +217,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@21 {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <21>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
index 3c28130909bc6..bad59d7b1d26d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
@@ -19,7 +19,6 @@ &gem3 {
 	phy-handle = <&phyc>;
 	mdio: mdio {
 		phyc: ethernet-phy@c {
-			#phy-cells = <0x1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index 32509083e54f4..898a9000daeaf 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -126,7 +126,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
index 96699be8430fa..b0a08cf1d03bb 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
@@ -131,7 +131,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 52441e5c87390..58684af4b98c4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -217,7 +217,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			reg = <0xc>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index b34e4c93d249d..30f97f67e8c8d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -189,7 +189,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-v7-4-topic-zynqmp-dp83867-0f11df63a589

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


