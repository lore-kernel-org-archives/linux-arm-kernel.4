Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E3606A888
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ri5dtOkx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=; b=ri5dtOkxboZxEE
	E7rk4LtYi04/i1AcqafT+lHYFwVJklGA8nBFbT/q1VTKiDV6Y6FjnSmfDgbwBINAjiLuQT2AyfWqk
	WEe3hKRsBDRZe8to6hGfwrTUsy/HNyE7NEwrVTK75FFATT1jvQxddqmaLzmWlI5AoykOQ9YnBNRNx
	GPV6XgQxmubcZcwSqd4W34nXky2ZDx4VGVGiBZGyWd+96gykWDEk0cQLsQefM5ej+zjuigqI81L5x
	dBbE8W2BYkLZCTB9JjCos0mLqoLMUAEjnTyEWCsu7ev2c8oqAAP9+E4ndgt0s3m0wrvjYLVmU50a4
	hry8PmXNail9XylaaINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFD-0000000Ch9h-1Bs2;
	Fri, 13 Nov 2026 12:19:03 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF6-0000000Ch6s-32Jv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:01 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50715c2757so141564566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=;
        b=f6Q1E0t6BMkEieR8pj7/11MYmRufwq3af/6wX0R3y35+Fo4RXmlbEqAgY0tDpFykLA
         yhKjgj7e4aAyOg6z5s/SCV6SdA2Y85G8NG4tdEyhEe9J2yKBkNQlI5zjBcAAx9nv5tIm
         K0o9v0689DzCrKZkbsZD+ML62gZzIrYPAqBQeD55oHgk+CNVxvJFHivTDfQUTWqWMJ/d
         EWA/WlBUvJTob9ZdrnpMHFftLWi8/Pe4YxrzZ8nUm+7iupUXHC52sFSCl1aa/qp6eX1B
         YNqEe1klTdj/CAx4uzobZ5Wh7k3lA9i2MWikR7jjwOo7IQEAlXDIJxegUniEerMUXKUK
         +MxQ==
X-Forwarded-Encrypted: i=1; AL+hErFXgKr/IPQXcAYB1i2WtSRUNJwJU+dOZiMSbKJ+0vGZdpldVanr98e8NuLxyJjlchRsxDJSHuJdHDIxmZ53rE7y@lists.infradead.org
X-Gm-Message-State: APuU4Z8LzTdURrzMCi17JpVk1LKoSFN49lOogRGJwoZXxrDDSBImU9O+
	0IrRLGPD2Uhk23avmwQFeQHYqIckKErk6XqSQ/U1000NRZB1bSlyZWPU
X-Gm-Gg: AYBFou1tas3yG5DkesnzXnhREwm3KtdDvrnx5hGl6uv8PeI1LaeKtrLA9QnQJ2XbkGc
	Wx6iwpUaFG+YJlI/Od/nLBZtSenxSKvtRONtSaxadzJW9hOIZ/PJvECX3iE1TuVbmmxjLTFZEWd
	ED3/C6p2xGxphY97gkcZcX/NplIH8S3vmTWdjhk2xaPHNgD8WO1MOUEV5UxNVCWQs4adQ2ocFh+
	FV86MUxIL7qxmIakpQRWi7R2bjS4GbCk8kYiRxuAvsLNmXX6iglmmMhxfASF9Lz/2xKqKCSyUM3
	1K9uNYEJgbjwEOEj8rRB2s9MAaNTBscJKrBJuhJtWGph+1Dqmjms9BtqY3uF7v/odnLlJqKsV8u
	nmwWRhHyP9RWTqPiSSW5NC4aKPLKyMWSOQzWUIl3RFwZdR/Jpb/m+XEs3BEgFSJtIDJQ+J2Eldb
	yX//HTFg/Wcx0WgHaIg/r70xtabgIq4MQUaF4FtncV/UTsO8qXjBpsx1Dcxo9eSf6X37TqRZfQI
	gm2HGtwW8Yt5iXwRdEn6aNEhwM7rU/6HQ6LxPnSeXkZqty9cW851KMPdF2+X+BlKkiEiq+fan8i
	c8oq8n+UR053AEZsZyKs7KH1m0wHZJWSNkj2BJuSAuuejqgi7qKiaCUa6m40Nf4XJmZVR+6cSAW
	++jZmVE7W2eEFw2D1Lg4IINluGIPdVUzkmDpVB9IoQEK0Mw==
X-Received: by 2002:a17:907:72cf:b0:c41:e75e:5889 with SMTP id a640c23a62f3a-c5096398b58mr185619766b.33.1794572334460;
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Fri, 13 Nov 2026 12:18:46 +0000
Message-ID: <20261113121852.334604-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_041856_797870_446FC768 
X-CRM114-Status: GOOD (  11.59  )
X-Spam-Score: -0.7 (/)
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 9c9cc3ef384d..e769c9bb70d8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -175,7 +174,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.1


