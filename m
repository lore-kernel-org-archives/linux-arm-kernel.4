Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC0F606FDBD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aOX7StGs;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KkRYS7mp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a3AUKNlSVDZ39IZwLsl97UWsYGgmsYsDaAjeg9BZZYE=; b=aOX7StGszlZaI4TtHENNBRSmG4
	81I6tWHA/g8StcejSpEIoaLDtsPHqKpijINVSv8TINgZsNTihQsdfhAUaOKlUBoZ9jLBxdnYQ66jK
	QQuXauU/PYgfNo6ygofO1YoXn/aMtAMOZr02cE6eVYNDtnQyTboDW1gyiVDvgYU6KtrwOvIgPGmuk
	7oxWhtsuu2JA1RcTcdPyjw+J+D73Pt8iRU/u4VfqIo8BSR123O5iaFzw2YXmEFw9w2aX09wUG5HLR
	Fdql42qgMoUYxPDqqMHA3gaeNOP6lbHg1SSjJRcqn1psv89IqrKLnDtRZcYOB84zY+YuDDjH4OSvd
	H/l10x1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSujE-000000029IK-08Q5;
	Mon, 16 Nov 2026 11:18:28 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSujB-000000029FY-2BaX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:18:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52A9110D21A;
	Mon, 16 Nov 2026 12:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794827897; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=a3AUKNlSVDZ39IZwLsl97UWsYGgmsYsDaAjeg9BZZYE=;
	b=KkRYS7mpH7UrflVNcXh9d6Y43DirBj6jis+xezcRiSpz5nfZ/ATIiLBUzkPM+7wMEhk2nT
	UOIRZRAaseM7yCeWo3MdW1retdbZGfCsCpZ9IXChCKSxekU0u7MscH9vyRBk8Kdg070u6V
	UNz8/EZ4RKbka4svVqh33oWxoZHFD7wQzISws98vjXsZVjhY+AC3ZGmsvhSSBDTThzv4HK
	2RejkcJJL+vhL6AF7HzC9LliXj9rL8YE1YEFaZYU3cDZFcJeFFEeTuf2fDTr9TG1G2f5Ub
	CLOVtKo8z+Oc0vPMTQMBkr4U0SawGXwvkkSgtb2Mhq+iMgkHYR/YCZEdMYFk7g==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Mon, 16 Nov 2026 12:18:00 +0100
Message-ID: <20261116111802.2442456-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_031825_751289_D01C0BD0 
X-CRM114-Status: UNSURE (   8.96  )
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

Add an entry for the i.MX8MM Cloos CBASE board.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes for v2:
- Place cbase in the correct order

Changes for v3:
- Add Acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..0fd10f1a1a58 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
           one compatible is needed.
         items:
           - enum:
+              - cloos,imx8mm-cbase         # i.MX8MM Cloos CBASE Board
               - cloos,imx8mm-phg           # i.MX8MM Cloos PHG Board
               - tq,imx8mm-tqma8mqml-mba8mx # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM on MBa8Mx
           - const: tq,imx8mm-tqma8mqml     # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM
-- 
2.39.5


