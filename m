Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QLrPU+J6;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=LBBHAHTj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v170zuzkWK5E8JogMW92ptltcMWFO5dDHSPC4KhWfJI=; b=QLrPU+J6tYKMWk
	13R8j4Fm7RPMP51i378wlcOt/lkGsUsdZHt/wi8kWiowRSJT2enL8EorslfDsOzJlSMAOJRL83Bsk
	OfCSMlWqbpUKp2Jp3TJHf6Xunc3WnTdPpyLpOcV3DeOLTWEP7jvkj4Na7OGxmgyDYwFk1yZ832UaB
	iaphziDU4Jp02/5HrEndB2j1REZtn1XOgqvk08x05XcgP33BQASD0rEVJC3aA0xFdyOHTqPXoUEtS
	T9oDso5sdR5FVdh3GBJsJReEga7kq/Bk5wDolzj90vKY6ZZzUo6K+USGb4BLJoWqS+FDxuB6EpNze
	+YuZW/6NKGw/7QlN8UVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQixg-00000003R3G-213u;
	Tue, 10 Nov 2026 10:20:20 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQixY-00000003QzF-3ygU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:20:15 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7D23A202334;
	Tue, 10 Nov 2026 11:20:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794306009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v170zuzkWK5E8JogMW92ptltcMWFO5dDHSPC4KhWfJI=;
	b=LBBHAHTjxSBG5vWXjBTxzNQDmVlT/3z8SV+EjnvrJFvZA/orPWjlatDRm/8lGMNJKRB3vR
	oWWYK0uiNEHxSMJCUrWrR3xumpf+kviq2itccmWgodfq2aCcchqIMwFxhsUl7rnMQKWfpE
	HekRWc4mk5JR4xoOMSG+jsb8y2chigYpcfdixAAbF3H5YkHnYKhhdN1tvp9RdFQPgYZFXD
	O3pyQDzo3G2bbRzvi3ansey5waGyV206/qMbZ75fOSqDmtc7SEo1py9hunARFv0xsMiAqt
	4fJjVbqBjMRbd49W3D7xh+c0HTy3mMFiKp5uxA6hJTWD60Df/ohx0g3Bpp0rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794306009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v170zuzkWK5E8JogMW92ptltcMWFO5dDHSPC4KhWfJI=;
	b=dlCR3GGuEvv2Tvokka6cNsfW1ooDI2swQ1LrMCEwVuHyQmED/dWHMoJyfg/HSLjIgr3XlD
	ls2XDA51iZChcY8x7aPSPG7sHclaj4P+uwULBAS0HJZIdS89JonG6l0rlqXsH9c9mcjpBU
	qkA78wWEbAPvbotJn2okqqzPe7lveA5/5TFa9xIq8L1+LQXSqixW6oVj4tSLWzuv9pGpUD
	nXnEVUC1l26DO78RRJZJrv4/eDmV4L1RR0wYTtEiHYAB0dY4Z8MLP88HHTG+RS0HCCRqMt
	tkeTvrTIsyy5lhErqsdFUqGOsNjoJXdbjip2Yli1oQcKRqGa3zCvUykTNKf6ww==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794306009; a=rsa-sha256;
	cv=none;
	b=B6wXaZdnlCqtzJ28tfhpEk3L+rL44BdHguN/+XaK0g/xQl+hRvruOFGgtvGSF/brUfMtEY
	9UlhGGMDz4RwJNQA/5ObMh6xUBVfUc7YnZsV9J2Y+CrINtdyL0Vk9Cv6k6edO7x+U8LbsX
	bIs/IjNNmyV6mnIXDYHIzVIen0IcdgkCp75AAF9MJgqxQHwzDiYZcrQivFVdLISOBzcxfI
	pwGEAjuqzfA8adQEyAHyKm+gce7byqjtOGku2VwRPnCrkwK7t72qtrsrgd38CvHYYo+C9B
	UGpCIPrzjV3QUx5QU507aPOEB+IuuhlBpnu82ut+eicS3WoDwtGGVZ/WOhHLcA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 10 Nov 2026 11:20:07 +0100
Subject: [PATCH net-next v4 3/4] dt-bindings: net: dp83867: Add
 ti,output-impedance-ohms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-v7-2-topic-dp83867-v4-3-a268f83b1ec1@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=DCzVebg+SU/ONPpSp5yog7UKs35KdC0TeKWiCOdSZP4=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9an99f/3fJXn7dwnfrOKd1z06c83Lf0zxre8pK9mhfVz
 6VMD83m7yhlYRDjYpAVU2RRWVjBJ+rxwTNymggXzBxWJpAhDFycAjAR9uWMDLMT10xaG8GQKKc5
 9d482blKOTwLuR2efvfI2cP2Zfqcui+MDH8OzPcWvLvv5mpXRYYp/x0lzWXnJMiacBWsluXbvjb
 rEAcA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022013_151237_839E1CE7 
X-CRM114-Status: GOOD (  11.42  )
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

Currently, the output-impedance can only be set to default, minimum or
maximum or via a nvmem cell.
In cases where there is no backend for a nvmem cell, a value can not be
set.

Add a DT binding, 'ti,output-impedance-ohms', for specifying the
output-impedance in ohms, between 35 and 70. Like the existing
properties, it is mutually exclusive with the nvmem cell and with
ti,{min,max}-output-impedance.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 833540743bdf6..557d2517a72ed 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -53,6 +53,16 @@ properties:
     items:
       - const: io_impedance_ctrl
 
+  ti,output-impedance-ohms:
+    description: |
+      MAC Interface Impedance control to set the programmable output impedance
+      to a value between minimum (35 ohms) and maximum (70 ohms). The PHY
+      has 32 settings in this range; the datasheet does not specify the
+      impedance of each setting, so the value is mapped linearly to the
+      nearest one.
+    minimum: 35
+    maximum: 70
+
   ti,min-output-impedance:
     type: boolean
     description: |
@@ -133,6 +143,12 @@ allOf:
       required: [nvmem-cells, "ti,max-output-impedance"]
   - not:
       required: ["ti,min-output-impedance", "ti,max-output-impedance"]
+  - not:
+      required: [nvmem-cells, "ti,output-impedance-ohms"]
+  - not:
+      required: ["ti,output-impedance-ohms", "ti,min-output-impedance"]
+  - not:
+      required: ["ti,output-impedance-ohms", "ti,max-output-impedance"]
 
 required:
   - reg

-- 
2.56.0


