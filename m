Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C1606A8BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IfDuXJpR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMThpOdK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=57JBd6NrRiA+/jRFCy9q5Qihc1Hdg/pxYVEDsZyfeXk=; b=IfDuXJpRwaqItj
	rpRH9vEcOA+BGxC8R9CqBLpt1IZmLOH5gOnX6rCNEBLh/x/aGqETIjJhVJi4LSmGY023TrNDFNbs9
	e022Swj/rDHmSrpj4B10QtKr75GhqY9U4HsZFxaR0v3nSvBQdZ2U2NljJk/gyj4DujsvzuXa6RDkT
	EhekA2TLXZ38RhnPipZRh9xoVnvdl4T5E0QYliNxvMSZnXeaL1LhYEzhrvkGFV79WEzr68t5OLUyq
	KB+a9z9aYiQwJnjnfmG8o+FL+59BuPXs8EwkkyXaVSNEhK/IWKGPC7X+vF2Eg+rCrxAjEat/1C4O9
	QWC8KOVUbZvJ3/6ynk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUi-00000002mZm-2dB0;
	Mon, 16 Nov 2026 14:15:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUY-00000002mTY-1mwb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 325B940745;
	Mon, 16 Nov 2026 14:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBFC1F000C4;
	Mon, 16 Nov 2026 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838530;
	bh=57JBd6NrRiA+/jRFCy9q5Qihc1Hdg/pxYVEDsZyfeXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VMThpOdKIvCTkjd5IzblEqkc4xNi3tGTWkBPkMnVEgyRynm055uP7j2hhaZQ1Ygc6
	 HqwAw4t5g+t9iE4e2uXQrLgphwNdjZkelxxGzXu1c3qe39LeyPKpjXkk0T+lKyW5lJ
	 rVd53W+2CxXMRdWvsf1g9RutCBp7nz/GoMoclEeAy+SwavqtAX6h/rDuvcmuhbfTV+
	 G6gpxZu7UXNl7p5WvR+UkegONQNdmDwSI/6iFDjIpNNk9t6H6w0YmeBHo71XtX8Y5k
	 /txwG7dXet/CppKAtIm8Gz3iLuHHKRew7kZ1nwzM9BTePkZ+W1BohRqchH9RqB2lYK
	 raABhBOK45f8Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/8] dt-bindings: soc: synaptics: Allow SL2610 mux controller children
Date: Mon, 16 Nov 2026 21:54:39 +0800
Message-ID: <20261116135442.4827-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
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

The SL2610 system controller includes selector fields for routing shared
peripheral signals. Allow a mux-controller child using the register mux
binding and show the shared MDIO master selector in the example.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 .../bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
index cdf947cb3e0f..b53a62bf73ae 100644
--- a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
@@ -45,6 +45,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle to the SoC system control registers for CPU PLL bypass.
 
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+    description: Selector fields in the system control registers.
+
 patternProperties:
   '-(pmux|pins)$':
     type: object
@@ -136,6 +140,12 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
 
+        mux-controller {
+            compatible = "mmio-mux";
+            #mux-control-cells = <1>;
+            mux-reg-masks = <0xa04 0x10>;
+        };
+
         i2c2-pmux {
             groups = "GPIO23", "GPIO24";
             function = "tw2";
-- 
2.55.0


