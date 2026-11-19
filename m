Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2tcsh3h;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrCF8Uqs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=; b=i2tcsh3hrVAZ745pXX1jBdtkZF
	qQYvRzh4wJptvjZWLy4U/7gfgGJeTM8y/jw/m1E88Tk4mF8XExOYG5mVSB62/LAaaaktlxtWAbe5o
	S450mb6ZVtGQ7RpDBxSZlE1E61z1XCVVoXQ+3xcLBmsPNqr4EAhmDLRJyjWMIucT9np3n1mVntwuv
	ytzTIBnDzuFEjr8Uywi463D2zNr+U1r0LY/N/P/9MUBd6skDbeSAVmZ6Ri96aAwZ1G3Rq3ztKuFZJ
	MNqfsmTdLmSqA05n8rk8KNTxwg3j5CV4sRrzwCgUKn4ZAW98rjYWH/52TVbMSPmMnhb8LYaTkgYyl
	QkqBs8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz9N-0000000BVJP-2JdP;
	Thu, 19 Nov 2026 10:13:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz94-0000000BV9f-0e1B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:13:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C91624DE;
	Thu, 19 Nov 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083212;
	b=aDsPvEfWe1QlQk8MKp3MMWtySPCL5aJ8p1njo59j4Zs7sTcYRuiJSJDc+AbQ4UhBzHyz
	 VnZNOmQJqsnv6jBo8EDlIwMf+I8wmGKAc6AazYCm/zK7DlKVWoaBrZhUqcBU8DIE5Obns
	 bkFokA6N5jUW9ojN0oipUDqASeHGHnp3IRes6JN/384l6buu965Biv+6KczV3dEXY4r4I
	 lBu4PXKBl4VD0J/NdfKooo6taak5stf6f3UmSX9NmG9RS8vz0PPduH87iFj9xkLN9rzMp
	 ZtI3VB8tGVpTCmq/N1GV+9xOGpGNVMy1Ljheozpn22BBL8wjp6Y1UNeiKZbPqSjBe4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083212;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=;
	b=hcG1XD07QBzFMMZT2wrcg6ixFF3h3E7uGvs7n45rpsQl0An8WgOc7lifoy2HL9PRrW8E
	 LgLD39HEmGyy+/7ou7mpXfDnU5GRtn+5p/3wA27ul8cSINFr4yDmVQqBerGDRv1gF6Xou
	 rdBkdNUY2xBXTVYxPGK2vnxs2VvmEMHAskj/8PeeO9h7lNx3ZRuNCRxfromT4L0PoCtxu
	 LnS9cgKaPG5N6NvH/bWCLtA7m/GQqKvDVf7OYn6Gq1IWr/PfHG8BJpIxx0sSexgxuk1FH
	 xd1BZzz9/eBqU4ec7hGJ8aUyZ5eDGVJSPON4X6Wv5Qrgc+XGQF3scOaH3bs8/9leZTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C9501F000C6;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083212;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MrCF8Uqs1P47hmPDDwnBc9U7nggDYcyvSN6L2sKah6hi3jWPSWQf3wX1Y+THraI6c
	 GcU37kqIAzf1VveWS6Rm6XICZYnZ5e7Wy/Ma04y59dMnlkpvl1oEq0mcFc0SmtFont
	 P3B00aJtFwXlQWjFqMZ+Z2avdpXqGuGmETkk9OygE6qssTDQ4oOr4D9L+iO8pWj8N3
	 K6dMEykbOf+NBtinsNoMNB/GuUiQMs2DHN5ZNaLQCvdA+phvt48SM5av3kKiGsVTGa
	 qk4JcKO0DRzltQGVZdh4SsHf4j8dLe25Mc7oJ0owbLSA5FAFgpisBjvz5njgL2k+cv
	 VMWD8QAbZ8Yrw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DCD0F4B22C;
	Thu, 19 Nov 2026 10:13:30 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:19 +0800
Subject: [PATCH v12 1/6] dt-bindings: arm: add Ambarella CV75 platforms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-cv75-soc-v12-1-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=1278;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3/nmC3518iJUv3pa+4TrYyrJ8fmY9AVoXsn+4KhycZM=;
 b=9vq+1hFkI//llPwg7J+M2UtIl6hu74qsTlef6tAG60+No3Pp77iwO8tcE9EkyNNLxTzqIwF2/
 kZHGHhsc9YIBMPRRMBoQIrjBmTFc+i01huZifYDYXOY8c81aw2BLdir
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Zhao <longzhao@ambarella.com>

Document the CV75 EVK board compatible for the initial SoC bring-up.
The ambarella vendor prefix is already applied in the devicetree tree.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/arm/ambarella.yaml         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ambarella.yaml b/Documentation/devicetree/bindings/arm/ambarella.yaml
new file mode 100644
index 000000000000..72946e94fa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ambarella.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ambarella.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella SoC platforms
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+properties:
+  $nodename:
+    const: "/"
+
+  compatible:
+    oneOf:
+      - description: Ambarella CV75 boards
+        items:
+          - enum:
+              - ambarella,cv75-evk
+          - const: ambarella,cv75
+
+additionalProperties: true

-- 
2.34.1



