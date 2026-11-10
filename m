Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0810B60A2623
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DJutJxOk;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UugiCK21
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bX/uUUUq5zpCBJOKITgDDQ+yzfwVENJcIRvnSi0VT/o=; b=DJutJxOkUZ2KeM
	kE7+z7L692suKkwmdP3Marhiu8/0UMTKXHdFxtaiex7YRJkXlYW1c9pYvfIuqi6x2gHe4fOUD/Q+5
	yL/Lajoq69E8zUO5z9OddipKguLglnjwmXaCQZpPUeFYPcY2k+e2LVsuJe5x6KBhHS9zNGvqegu1T
	1kH5nd/YHiAcCoGB2gI5HAt0ciNaXrNc8sbSrBzByAiaA4gqzICaqAs7mAyrWaEIkN7Zd1MwAmTQ+
	x3+XlM04tXxwM7Mf+3hZSK/jJVUS6lC1sxZuYXq5v9Z5XXhlaNEYOJWuISNU6BlaQe1Wkpp0bLULN
	hpwibtOi3PZ6nqrCjqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQixg-00000003R3i-2YuG;
	Tue, 10 Nov 2026 10:20:20 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQixY-00000003QzD-3v6e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:20:16 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1FAC0201EBB;
	Tue, 10 Nov 2026 11:20:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794306009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bX/uUUUq5zpCBJOKITgDDQ+yzfwVENJcIRvnSi0VT/o=;
	b=UugiCK21pv9l6/5HpqAmmsy3nT+yM1zPQDEflnBoNQDMA10K+Tlgd5O4+Rcs9q/RYi46Ea
	CuEp/culbGqDO0+lC8SnpWb0zTuDXkfQLJZHKOIjV8TY4VK/nD6O1x67H7yC8Cw20ryoQA
	97d2tYW/BqW5TfoI/s4yw+R+Wf6FgzjVRlBZTk1cIyInCiC/4xUmGUULtQQA0HBq4fr7az
	nlNfAb1XOeUms8AllmFzre1DiHZZFeL7s5Wc/xKDnyvjHJu5y7k14TBQPeSC6JhwKFSszn
	0AlH5HX9+KBdj4MlGxhVGAMceOcF50nkoDMp0j/svUCA0RUBTeuvNOrCI6bhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794306009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bX/uUUUq5zpCBJOKITgDDQ+yzfwVENJcIRvnSi0VT/o=;
	b=amzx7bJokyYSKJ4oUZljP4OMzlVK5a7C9b5QdxcoQBaUl7PwH1dfr9LLWl2Ym4cktihnuj
	mDjo0vwJ2ROyTDb5C2nmOUDgrpYC1KGnnPPqHe85JXh0Zj0PpCEuzv2Fy5+CYH8Eqd3EVF
	rKOq4eTQAKUy40Oncrc4yogTWQFwl7nh8p7X7MFNFMhzHtIPT+8zg5h+6opp9o/20yJyX7
	/9LqbR+Pn9xMHcJ5H/p2o+4YrfwsxxGyh1LIIk9hW7GPwft3Lw30fQmTNVtjlXDRn6sceN
	aInf5521KH9+5cavd9h4QTK02Wbyux2PutaAwBpjcy48Y8Xo/5hNr4+EwVmgDw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794306009; a=rsa-sha256;
	cv=none;
	b=ET2nnB+duEP3MA4yizB4ELO/Bs971uRePT0WEBMjEt4EI8jCiW52Uskow3rf4o+rEDN+t+
	vHHTCZJ/YXsBaanAfVjM5hFxHBJXGGcgqj+kreIGQVgBotdGg9nfvhyj6oluT91HSdaIF9
	pLdmv4WdZZ/AGhSqcRnN6ck+YCkS46L84TXR9+JPjS+UDBkayimjB7pAdIlDQIAJm7o2aF
	oX3BEPNpuHlu5UGjYsTBc/zrIE4mFlmW83j9Nt9B0xj9LujlGdEsf6XsEANlYbmO0HuayG
	qJWC4PRaHbONnJxyHIMvIp8bCKQjLFieOlA/2aU/nOM24t72XH+rBJlLIPSqEA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 10 Nov 2026 11:20:06 +0100
Subject: [PATCH net-next v4 2/4] dt-bindings: net: dp83867: make
 exclusivity explicit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-v7-2-topic-dp83867-v4-2-a268f83b1ec1@pengutronix.de>
References: <20261110-v7-2-topic-dp83867-v4-0-a268f83b1ec1@pengutronix.de>
In-Reply-To: <20261110-v7-2-topic-dp83867-v4-0-a268f83b1ec1@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=sRMCwpzFKvkFIO6648eNAR7IxA+Kn/25bR6VPl9CbK8=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9an99c/PmLP3/slr535hIL+HVbWlY0bX694wChnWbRgt
 cgr+aKcjlIWBjEuBlkxRRaVhRV8oh4fPCOniXDBzGFlAhnCwMUpABO5G8fwk/Fl3NzKn56PPbTr
 rLi2XJDLqD7oJzn5ib7+Lw7Zo3paTAz/c27OuKRw4kp4A3+WxO30eVc0/JbPKgplYn65cobnztc
 xzAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022013_149866_296F0389 
X-CRM114-Status: GOOD (  12.45  )
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

The io_impedance_ctrl nvmem cell and the properties
ti,{min,max}-output-impedance are mutually exclusive, as noted in the
ti,max-output-impedance description.

As this is only stated in the description and not made explicit in the
schema, the binding checker will not catch if this condition is ignored.

Make it explicit in the schema that only one of them can be used. With
that, drop the note, which also described a precedence for device trees
that the schema now rejects.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 2cd8311ece5e5..833540743bdf6 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -7,9 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: TI DP83867 ethernet PHY
 
-allOf:
-  - $ref: ethernet-phy.yaml#
-
 # only the PHY ID, not every PHY with the c22 fallback
 select:
   properties:
@@ -67,11 +64,6 @@ properties:
     description: |
       MAC Interface Impedance control to set the programmable output impedance
       to a maximum value (70 ohms).
-      Note: Specifying an io_impedance_ctrl nvmem cell or one of the
-        ti,min-output-impedance, ti,max-output-impedance properties
-        are mutually exclusive. If more than one is present, an nvmem
-        cell takes precedence over ti,max-output-impedance, which in
-        turn takes precedence over ti,min-output-impedance.
 
   tx-fifo-depth:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -133,6 +125,15 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+allOf:
+  - $ref: ethernet-phy.yaml#
+  - not:
+      required: [nvmem-cells, "ti,min-output-impedance"]
+  - not:
+      required: [nvmem-cells, "ti,max-output-impedance"]
+  - not:
+      required: ["ti,min-output-impedance", "ti,max-output-impedance"]
+
 required:
   - reg
 

-- 
2.56.0


