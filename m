Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084CD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lxmTvLqa;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A6Fv5VIS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dLkNPiv/xl+P6umWyR3G+hlZbr8X7kcPVrM7p4myao0=; b=lxmTvLqav9W8pD
	lD4BMLGtP02kqoN9ivj5ZBsHzMcaC416AzywIP8qGOq1FRPXZoPmvG3q6S3U7GCN+FCp5D34GJl1t
	o1bEquxLOOtEtSGfoxINr80LuuKrdyaHn92WlcV9XnweVPGjPUa7+y0MqMtxFGjOlTp4plk+m+DVk
	dq5wUSLmk/jBkE+8Me2lB3HIo5DXakp6O9Au2ejqNAJMT18tKG85rhmWzM3lifurxu2tkSU7z3F6x
	AN5J9Ov8Koj1Wy6nQQBZapmd3K9tp4JpWFZ2axxda4XCqTu+EidNeLx3uAlpVjukr6qXWskudJPz4
	PG9uwqHWLTCA7gfiJ5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdCI-0000000E3KI-2fP3;
	Thu, 26 Nov 2026 17:23:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdBc-0000000E38q-3Cyj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:23:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A7861C2B;
	Thu, 26 Nov 2026 09:23:05 -0800 (PST)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91FDC3F632;
	Thu, 26 Nov 2026 09:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713787; bh=UW0HYlQy3YHqOrhT+H8MjwdGt+BCMyK7r7KTgbmojD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6Fv5VISVzg+Oz5+JGSGNdmUl7cufPYWJW2/p60njZlDwyLdfcAucKu3i5pxV4rDb
	 CZ8LD3C1SsKElpB2x4pUBQUPPLI4WQYqFV7fp2MHUkunbuLhlRCO8w300sK10CcmTY
	 wOXWtcKlEeZ5e1YNlelDHmD9us4YyLOpxwNhkYlE=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: a733: add r_i2c1 pins
Date: Thu, 26 Nov 2026 17:22:52 +0000
Message-ID: <20261126172253.1097838-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126172253.1097838-1-andre.przywara@arm.com>
References: <20261126172253.1097838-1-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_092311_717704_3BB2AC68 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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

The Radxa Cubie A7A board connects an external RTC chip to the R_I2C1
pins (S_TWI1 in the schematic).
Add the pinctrl subnode to the secondary GPIO controller, to allow using
those pins in a board .dts.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index 8a258f16751e6..fe1abee701310 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -585,6 +585,13 @@ r_i2c0_pl_pins: r-i2c0-pl-pins {
 				function = "r_i2c0";
 				allwinner,pinmux = <2>;
 			};
+
+			/omit-if-no-ref/
+			r_i2c1_pl_pins: r-i2c1-pl-pins {
+				pins = "PL12", "PL13";
+				function = "r_i2c1";
+				allwinner,pinmux = <3>;
+			};
 		};
 
 		r_uart0: serial@7080000 {
-- 
2.43.0


