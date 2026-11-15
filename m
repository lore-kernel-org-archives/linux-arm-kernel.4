Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB054606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zTiqJDkB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ko6vv+lu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qxCmilCZAfa92h6cZG6evZorYW89HH9VZP60+AaswCI=; b=zTiqJDkBIStONkLoxGqGKGY37X
	cL4Tpp+JefFReEKkqF1EIsIdCCx7L3IM6faHeHNaW+xg9RYUNDjgIJDUtaDJntIDWcQf4uPAsDZsw
	xclnLocLOjIb4Qz4opO+hqxkFA7Iwu4giaa/8ohGlqkVAqbKD6n89Ltn+siWYu1qIu41CbUjjUjZ2
	zm5n4vEBT+z6F8vXrdSdND46gg8pH3CFjRiCUf+6fTooDBLSvpl4jBR3B3zzwX7lhGPegxxeJ2KKN
	lqWE2BTJ5nBzUbfjSi87iojNid3JF49gfNbDwrXCZaFbqSneumDdo6rV4qvbifaOTmi8P2zKtXUrc
	5nM0HBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY3T-0000000HQ1a-10Ra;
	Sun, 15 Nov 2026 11:05:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY3R-0000000HQ1A-1hbn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:05:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7057C61EC8;
	Sun, 15 Nov 2026 11:05:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794740748;
	b=UGkLYa7CSjwG0sLkqiGhooMq8k1dXXR3gNQuf0g78ZfhT5+THxAO0gyt745CfVmh4KNq
	 ZjiHZut7J7TK9JRNxfvu6lQns8bZwdEBlWKSgNjcUdbblzlnYrp/y1P5qAkdvr+u+pDol
	 6QPW5pdSgzDFeSS2iLyr8oS77rv+GCcBD/27xN9ez5AU2XDLN7ntXKmh6ZCYpMCAYWJso
	 cW7J6JBkx7NTqd4BVj9Xq6cPzFddBQDCMRItYQh3eH7CS3GrE2jEIcDvm2G100LWGYEZN
	 2ZiYmWRL7zXaPJkHzJGlN9ZpRpiY2RTYP1ChjJ8TnmsC/KxceyDbtT92jEPUs0Lj2hw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794740748;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qxCmilCZAfa92h6cZG6evZorYW89HH9VZP60+AaswCI=;
	b=Hyntrj2WO3BveiTWC+fsVw20jlASOqHNrdOgPc1jDhdPtb3o9rB1YueWIK6ZKr4fQlHn
	 QRB4zLfUPmzmOCC5Re+QzS3P4tQUZpnxKrYlnqZh9sH7i7C1GMiCrLTU8tBcNteHM1rGY
	 zfSV6tKIf1Aj1lLtw3UvilYArfLRhgL90uQasrcSf/OMFdT5vVe4Ys8eXwyN+f7+YVjHx
	 gCVAPuDWd1OFBEqzbjhmb2Lo+Ki5E4RxlkE9J348L0gvdCoLMxxDF+t+bR95l4y1UlI31
	 hahkGF8zHscFmOeL371LkBCn6MKgycYBR/usAMwvvK5XWUohaZ9qhXpXZtm3dtMV1tQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F5AA1F000CB;
	Sun, 15 Nov 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740748;
	bh=qxCmilCZAfa92h6cZG6evZorYW89HH9VZP60+AaswCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ko6vv+lui3N8xbDKD9wh+k63Nfi7f/NnKgOKNOhgn/3KJ5LpcVUR4dETjBV2Fe21P
	 OQ72RpncEbDemiIcW7XZzE7KrGnHFXrQ/8FNmvkOUaUquaxrE2Jd1LHyhzws2WJIJD
	 w8qj02AHrLh7nfj4KScLN9b5ja4z+2x+SB1JUsnFciMJQZtcniDutlUDlweUgajYyq
	 0/JVjxYfWP8tpCk1POFNP/2eEzes64/CN2QgZSbQQHBgQsiPMPw+hJ2KqSuLot4T6r
	 2SNvP0HPHdteU/LIr/dlkktKrGrkCY85AP3JecAUpsPeaIJskes4K6539APOnMXQop
	 1zoD0nAnnRopg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1B21C4A05F;
	Sun, 15 Nov 2026 11:05:47 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 15 Nov 2026 12:05:38 +0100
Subject: [PATCH v5 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-2-d246166ea469@free.fr>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr>
In-Reply-To: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794740742; l=1675;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=rINtrhuavppUlRpXg6MQkeI27TcZ5wfEkTX3E6hc7Y8=;
 b=8nv9oa/D7ccu6Xh2A0eVmU/IpwvLfiwAeH3NmglHz32gaGtYHUY0KrDZsfC7GhYJ4csB8vnwS
 H7Pwm6GXKjHDzPFPc9MvYHrCmmJnlumUj5fsseB0ZFkV8IVNjpih1HV
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Jardin <vjardin@free.fr>

On the LX2160A the DCFG node holds the pad mux, overridden through its
DCSR view. Allow fsl,lx2160a-dcfg with simple-mfd, so that the child is
populated, and the pinctrl child, on the LX2160A only.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
index fc14fd0bf84b..bb9dbcfec188 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - fsl,ls1028a-dcfg
+              - fsl,lx2160a-dcfg
           - const: syscon
           - const: simple-mfd
 
@@ -66,10 +67,27 @@ patternProperties:
   "^clock-controller@[0-9a-f]+$":
     $ref: /schemas/clock/fsl,flexspi-clock.yaml#
 
+  "^pinctrl@[0-9a-f]+$":
+    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
+    description:
+      The pad muxes of the RCW on the LX2160A, at their RCWSR12 to RCWSR14
+      and RCWSR27 windows, overridden through the DCSR view of this block.
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: fsl,lx2160a-dcfg
+    then:
+      patternProperties:
+        "^pinctrl@[0-9a-f]+$": false
+
 additionalProperties: false
 
 examples:

-- 
2.43.0



