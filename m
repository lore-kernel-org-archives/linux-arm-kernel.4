Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9105606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VyCbvVr/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jl5+aGR4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bu8GPmpCAkcoaJxsFEUiAyGP51RQcGFILDv8clR+O0k=; b=VyCbvVr/DkSo5J
	vPDjQbbgBrGZyp3gAlguNCaUma9NFuXLsI/mPGptBT4K45+DCPZb545UW30VOg/pES0T3KvfzKml7
	9shhd6+OP2wmiPQEnhBV9sGLxb50XZOMipT83YB8UVg+EKYVjzotcaY71czh8AJ1SikQvBimIA9lZ
	qPgIllZqz7cjaDh3raVzTrG2VwExyUq5OwT5mZXK6PdpCqrghBplfGerqLuZYSVLQ3HVmmIdYowBA
	vRFwqSF4U/7Q/1ndPLAnYKAPXbS47SLmvNqo90tCEt8UF2Vodp4dSraMt0ON/cWXcwqBHFAG0aQg5
	Ry1xtb4lmm0g6m5TboLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXjZ-0000000HOgZ-1dVD;
	Sun, 15 Nov 2026 10:45:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXjT-0000000HObQ-43v1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:45:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6CAA432F1;
	Sun, 15 Nov 2026 10:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265921F000C4;
	Sun, 15 Nov 2026 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739511;
	bh=bu8GPmpCAkcoaJxsFEUiAyGP51RQcGFILDv8clR+O0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jl5+aGR4rXDMnFJG4HP6h8u8YP+Lw82HWV1aAgbwwQwC/bmjsULNb+Ut/H8GeYUqe
	 1ICR33Sryjo9MOaRDKLa3HXAhLiqw0fN9C8ewTi2qLJlMgdDvLHIq/LnMiGMfoIuFi
	 jv2JbQMEMhSvJgqXvtW/vHAhSJYeq1t2s74QotyE1enhyWUJThocrq/T5y0nqeAFCn
	 mX68LL8FIHXzGEAC/D3QMeQ++sPa3UjgsOvmyjWD3nMC6792H9hRYLrOieLen93i5r
	 t5eJhtpFB8BGQOVlcltFDFuaVdytpLC1lv20katDgQOiHSbWJuBb1owVD9cwB8AIly
	 efa/BkI3IIkHw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 11/13] dt-bindings: arm: berlin: add Synaptics SL2610 SoCs and RDK boards
Date: Sun, 15 Nov 2026 18:23:50 +0800
Message-ID: <20261115102401.3520-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add devicetree binding for the Synaptics SL2610 SoCs and corresponding
RDK boards.

The SL2610 family includes five pin-to-pin compatible SoCs: SL2611,
SL2613, SL2615, SL2617, and SL2619.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/marvell,berlin.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell,berlin.yaml b/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
index 4e8442980dcb..30d94059e2f2 100644
--- a/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell,berlin.yaml
@@ -41,5 +41,25 @@ properties:
               - marvell,berlin4ct-stb
           - const: marvell,berlin4ct
           - const: marvell,berlin
+      - items:
+          - enum:
+              - syna,sl2611-rdk
+          - const: syna,sl2611
+      - items:
+          - enum:
+              - syna,sl2613-rdk
+          - const: syna,sl2613
+      - items:
+          - enum:
+              - syna,sl2615-rdk
+          - const: syna,sl2615
+      - items:
+          - enum:
+              - syna,sl2617-rdk
+          - const: syna,sl2617
+      - items:
+          - enum:
+              - syna,sl2619-rdk
+          - const: syna,sl2619
 
 additionalProperties: true
-- 
2.55.0


