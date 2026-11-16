Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC8606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HXr1jJE9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Dl+vqjAb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM8J1lZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZuODRaJ5G8FoGrxxTCkHxBbk35bvVff0bzp5O328+D0=; b=HXr1jJE9g3VWLO
	rGRraKQTuT6WPV1l9OBCAiB8FPyHfPy8mbfBthnmSMx99/X4IDBMMfeRnFhcUJaslkKOh3ZrI9Cvg
	SCKDuX+uGud6nObNMgtd8TnJw+M19U1TqLTZKqvkTo0rXgdP3CsMTAJHkNso3v1U6txxcllkHgqDL
	rgblRNltCtukBz3dWdmJ1VYNlDSM9gapjhJJZsFGxWUFXtrc4nVlPdOgUsUwZ61NZacfREsHUjBRL
	iyXdvzQOB4NAAu+5eYMMsEw0a30N7Mk0DgDlLK/2SbXyKG73oIpvRJj5kt3OujtjKJeKdCm5/LbA6
	05ZZVJwSZ/dNEDQY/XJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfn-00000003FzB-2D3j;
	Mon, 16 Nov 2026 16:35:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfV-00000003Faj-0Dft
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=ZuODRaJ5G8FoGrxxTCkHxBbk35bvVff0bzp5O328+D0=; b=Dl+vqjAbV654LiTxhuOwNhdglH
	2XD3l9a/nacvVPN7XOeZ4jv6+7w4QPDcUGdL5mArn2Bth0mVhxJuTNd1hYbN/WoGbR5AuIbYlDLAk
	DBT8dY6Odd10noZk8exRgEwoSzn9K3EwXDecVgKRLIHWLqmY2GaB6fgGM7tZBXlVcbBRP0mHBZxOZ
	SgbH+po1FRBGs8dHGRTR2LuYYv9zS6XUgNL/07+W1NBxl73xK5rTWquohjQI5GlfQiG1BOCDYNedH
	nqYNYiCjJ+TgxIVBDkyR76e7Vwb1FYOlkyaiNyKZVDy77yruOlOVHNksQ8iOGtAlm/6AeTOip07y+
	ZDxwqhKA==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfQ-0000000E4Ok-1wzp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c468bd799ecso540972466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846889; x=1795451689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZuODRaJ5G8FoGrxxTCkHxBbk35bvVff0bzp5O328+D0=;
        b=uM8J1lZUWQpcQjTSCdggrVl3+nUzh+sk1vFPmvMXE5hEVHUwaJFtagB/14BNR+4mfE
         1NnJXThA+dSZWv0OzNL1v6UZA+b6LxSaxJhxA5jj5Tacxv9Z8sXJcRO5mQsIP5upPkRW
         rHUUecM5XXfnvOqc98B8wnjt+X+bBKyF42IASv/6ns0SIwhFjn4pcafieJqpjFuYo3K6
         t01HZcS2jD5k2hrgPmWcxt9Wo5g0CHpUUhumUBigRhXQNz4xO4K+wCpBtuI6afZ9vwxE
         qocKUYoMFJSVijQFOYg1TiTHaFhVRIwL9PNFzn5Cv1seZ+FY5ugxnrI6MG8DxTEw3+wq
         DDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846889; x=1795451689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZuODRaJ5G8FoGrxxTCkHxBbk35bvVff0bzp5O328+D0=;
        b=amQXZRTwYtxWYONxTg1VDJF3FK8xGPho2US2zIA6GJDYD7ZajRfWmyqqY3PtFuQl6R
         L4lznEuJSzxdc7dv/LQ0hcGSH2XqE/z1FXgK+fAgRGtAoFFoak/K5JZI9NPdCHZAxg3C
         p235Nh53QKudlvPJ2BkzML0xiNb05avdx58tUtURFS0yeh05Ha7dPmMpN9tATAZQ32/1
         fGpFIkrmKwM1ux1dJ6vSii2Jin/Jc7Fl0c0yOYqxpze7qWjOfc+X6Yv/8mRDYZrX+iw4
         Wj06CjkXN4Dyy3FKIV+eM3i+BVPsv+KO5uDXxIxkUVMAYH2LfEqINJsR4Cv3WbDdomJS
         O75A==
X-Forwarded-Encrypted: i=1; AL+hErE5eCLrHA3T1dMEeXcxkesLseMddpNaawcu7IjUG4csjO7hHaUXxQdlG3qc/pYjK90APWlNcytn5f0tUMAEPxL+@lists.infradead.org
X-Gm-Message-State: APuU4Z9CkC5gLgFY41w48IGBtbdSrxFNd/EI/awrN52jYWtYbJG5NhYy
	j5afWho02kMCnwoOhfJuwEO81sojiL+S+yHHYrraUg54Yy/DPu4YFEkH
X-Gm-Gg: AYBFou1ZzCVYzIxGSx93woC7u+8LsyhDjx+3Qhwi2GjFn61ZUCMKHRC9GOjyfDX+LxF
	I6KIHu5DmWnL+iOA01NLX76Ek9PiBKFUdxz7wcBQTFhe6aRQ7tDlCediax8pS+cU5K9oBCPrdnA
	M9aP/QXxSCcfJxDmRPy4oe+rJHCw+NTX9JvfpHZawdvGsbx5C3zxnejYjnY1Z5n+rWvO1DSNZmk
	0HnZE0UMSyYGHm8ltW5JJjjRK5J3akc0w4jHNFNYDS0uniY8JyZJ0ZVOObaKr27tsoExbDHexWI
	9fHIglEOjFCXog5h/qpONDxlDYpas2QuD34Z5d7XK8AfdzMrB8uBOYnffIGk6QGajogpO2IHhw1
	Da+giUeMl4lpPsjnRqCP7X68nrthcDLFnQXwMypGHlUeDPTx0pO+i/IkwE2lTKK8L5QMo01Xb/a
	/PqewDJ/hXL6K7Fst4bHnD2L/UQgimg5GXihrJxk7TYCvzwkCELybbcKZBDdNg+hGzwpuy1K2Ay
	OLbChHkc+CMOK58fM1udL2EVQUWcc3dd44HXXDhOrvHHrX3GfAZU9RzdoM9BSJBHWjxktH/8/WT
	SJB83et5lSCAuo+XSeuMvcvxRzVe5Roc0UB1mLd66rQkelNGKjoauG+sBZSUo6Q8BgNnx/DHW2Q
	VkEFp+O0VH9Fyhtux8KennXx9s1HT147PmrU=
X-Received: by 2002:a17:907:9614:b0:c26:1649:47a5 with SMTP id a640c23a62f3a-c509642f8f8mr842322566b.27.1794846889039;
        Mon, 16 Nov 2026 08:34:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 13/15] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Mon, 16 Nov 2026 17:33:57 +0100
Message-ID: <20261116163412.551438-15-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_163453_124170_27DF5161 
X-CRM114-Status: GOOD (  16.11  )
X-Spam-Score: -0.2 (/)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document support for Airoha Ethernet PCS for AN7581 SoC.

Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface
(10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

This follow the new PCS provider with the use of #pcs-cells property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/pcs/airoha,pcs.yaml          | 261 ++++++++++++++++++
 1 file changed, 261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..9c1d116c1b01
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,261 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Ethernet PCS and Serdes
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
+  the various Serdes port supporting different Media Independent Interface
+  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-pcs-eth
+      - airoha,an7581-pcs-pon
+      - airoha,an7581-pcs-pcie
+      - airoha,an7581-pcs-usb
+
+  reg:
+    minItems: 6
+    maxItems: 15
+
+  reg-names:
+    minItems: 6
+    maxItems: 15
+
+  airoha,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the SCU node required to configure
+      the serdes line to the correct interface mode.
+
+  phys:
+    maxItems: 1
+
+  "#pcs-cells": true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#pcs-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - airoha,an7581-pcs-eth
+              - airoha,an7581-pcs-pon
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC reg
+            - description: HSGMII AN reg
+            - description: HSGMII PCS reg
+            - description: MULTI SGMII reg
+            - description: USXGMII reg
+            - description: HSGMII rate adaption reg
+            - description: PCS Analog register
+            - description: PCS PMA (Physical Medium Attachment) register
+
+        reg-names:
+          items:
+            - const: pcs_mac
+            - const: hsgmii_an
+            - const: hsgmii_pcs
+            - const: multi_sgmii
+            - const: usxgmii
+            - const: hsgmii_rate_adp
+            - const: pcs_ana
+            - const: pcs_pma
+
+        phys: false
+
+        "#pcs-cells":
+          const: 0
+
+      required:
+        - airoha,scu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-pcs-pcie
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC 0 reg
+            - description: HSGMII AN 0 reg
+            - description: HSGMII PCS 0 reg
+            - description: MULTI SGMII 0 reg
+            - description: USXGMII 0 reg
+            - description: HSGMII rate adaption 0 reg
+            - description: PCS MAC 1 reg
+            - description: HSGMII AN 1 reg
+            - description: HSGMII PCS 1 reg
+            - description: MULTI SGMII 1 reg
+            - description: USXGMII 1 reg
+            - description: HSGMII rate adaption 1 reg
+            - description: PCS Analog register
+            - description: PCS PMA (Physical Medium Attachment) 0 register
+            - description: PCS PMA (Physical Medium Attachment) 1 register
+
+        reg-names:
+          items:
+            - const: pcs_mac0
+            - const: hsgmii_an0
+            - const: hsgmii_pcs0
+            - const: multi_sgmii0
+            - const: usxgmii0
+            - const: hsgmii_rate_adp0
+            - const: pcs_mac1
+            - const: hsgmii_an1
+            - const: hsgmii_pcs1
+            - const: multi_sgmii1
+            - const: usxgmii1
+            - const: hsgmii_rate_adp1
+            - const: pcs_ana
+            - const: pcs_pma0
+            - const: pcs_pma1
+
+        phys: false
+
+        "#pcs-cells":
+          const: 1
+
+      required:
+        - airoha,scu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-pcs-usb
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: PCS MAC reg
+            - description: HSGMII AN reg
+            - description: HSGMII PCS reg
+            - description: MULTI SGMII reg
+            - description: HSGMII rate adaption reg
+            - description: PCS Analog register
+
+        reg-names:
+          items:
+            - const: pcs_mac
+            - const: hsgmii_an
+            - const: hsgmii_pcs
+            - const: multi_sgmii
+            - const: hsgmii_rate_adp
+            - const: pcs_ana
+
+        airoha,scu: false
+
+        "#pcs-cells":
+          const: 0
+
+      required:
+        - phys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    pcs@1fa08000 {
+      compatible = "airoha,an7581-pcs-pon";
+      reg = <0x1fa08000 0x1000>,
+            <0x1fa80000 0x60>,
+            <0x1fa80a00 0x164>,
+            <0x1fa84000 0x450>,
+            <0x1fa85900 0x338>,
+            <0x1fa86000 0x300>,
+            <0x1fa8a000 0x1000>,
+            <0x1fa8b000 0x1000>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "usxgmii",
+                  "hsgmii_rate_adp", "pcs_ana", "pcs_pma";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+      compatible = "airoha,an7581-pcs-eth";
+      reg = <0x1fa09000 0x1000>,
+            <0x1fa70000 0x60>,
+            <0x1fa70a00 0x164>,
+            <0x1fa74000 0x450>,
+            <0x1fa75900 0x338>,
+            <0x1fa76000 0x300>,
+            <0x1fa7a000 0x1000>,
+            <0x1fa7b000 0x1000>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "usxgmii",
+                  "hsgmii_rate_adp", "pcs_ana", "pcs_pma";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <0>;
+    };
+
+    pcs@1fa04000 {
+      compatible = "airoha,an7581-pcs-pcie";
+      reg = <0x1fa04000 0x1000>,
+            <0x1fa50000 0x60>,
+            <0x1fa50a00 0x164>,
+            <0x1fa54000 0x450>,
+            <0x1fa55900 0x338>,
+            <0x1fa56000 0x300>,
+            <0x1fa05000 0x1000>,
+            <0x1fa60000 0x60>,
+            <0x1fa60a00 0x164>,
+            <0x1fa64000 0x450>,
+            <0x1fa65900 0x338>,
+            <0x1fa66000 0x300>,
+            <0x1fa5a000 0x1000>,
+            <0x1fa5b000 0x1000>,
+            <0x1fa5c000 0x1000>;
+      reg-names = "pcs_mac0", "hsgmii_an0", "hsgmii_pcs0",
+                  "multi_sgmii0", "usxgmii0",
+                  "hsgmii_rate_adp0",
+                  "pcs_mac1", "hsgmii_an1", "hsgmii_pcs1",
+                  "multi_sgmii1", "usxgmii1",
+                  "hsgmii_rate_adp1",
+                  "pcs_ana", "pcs_pma0", "pcs_pma1";
+
+      airoha,scu = <&scuclk>;
+      #pcs-cells = <1>;
+    };
+
+    pcs@1fa07000 {
+      compatible = "airoha,an7581-pcs-usb";
+      reg = <0x1fa07000 0x1000>,
+            <0x1fa90000 0x60>,
+            <0x1fa90a00 0x164>,
+            <0x1fa94000 0x450>,
+            <0x1fa96000 0x300>,
+            <0x1fa9a000 0x600>;
+      reg-names = "pcs_mac", "hsgmii_an", "hsgmii_pcs",
+                  "multi_sgmii", "hsgmii_rate_adp","pcs_ana";
+
+      phys = <&usb0_phy PHY_TYPE_USB3>;
+
+      #pcs-cells = <0>;
+    };
-- 
2.55.0


