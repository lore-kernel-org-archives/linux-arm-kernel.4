Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62413606A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1eLp27y7;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Rd9h/v7r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M5yd3L4xpmBeVM5XoGF353kDrspRqwKbIMSF1r2WHMU=; b=1eLp27y79oCs/ss0BHItUVRB1j
	htJRg3M6IFn6QXd+Xnf4UN2zNrBwk0dkfdVzFZp98NSNpC+yrpDWBgtiJvJl0QYuL+zYPt3U67w7I
	RkLWXR9lLdFfSDkeeGEDRI2K2d9Eh21v7nvdiQkR3vgzwInjljBx/toxteKd5QTQTMeI1d6XmolXK
	gUhaERTZJ/e19BLtlQ9zWDAdtY35jy8nNkdeHS+f2JzKCwBPyrVih0A1FMjl9z7jhbljb4ITOc0tu
	5+vxMRCnok4nvv2RVbTPtp7ETDxrWQiF8p/Zr7ef9sFGKr9cYp2xu5H9AUjGokGQRYN9mLIvIbf8E
	GUzga4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXnx-0000000AcOj-3jQb;
	Thu, 12 Nov 2026 16:37:41 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXnp-0000000AcHi-3L6g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:37:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB77310A716;
	Thu, 12 Nov 2026 17:37:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794501439; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=M5yd3L4xpmBeVM5XoGF353kDrspRqwKbIMSF1r2WHMU=;
	b=Rd9h/v7rSnKUtWdeUZfHA28W7NZgYmXtAD8dkv86sa2dlucShA2T3wevFF/tWU3aRF9b1i
	7aLHK91cSgMZmB5Df6N85bsuSjqtBQD1yJzQpMnfLRIn2oKtDUDx06D+Ebg7cLyN5sxhwe
	Esle93iKfga3Sspw3WDLKWvafkPlRHwcuQixxASjAR/VLaFKKB62k9QvuQ76C0GsUXZVAR
	8UU8Su9FDvAmNrtv6c6StyvMgFnCBEGODy5F5XLn196ZqKTSlk9E0sDaBKLZRjJmCLj1bj
	y0Mo5OuJWHndMyxa1ABh5AdC9muvQMidnHbj2t9P5xYAzCurDttjo3cO+f4XpQ==
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
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Thu, 12 Nov 2026 17:37:01 +0100
Message-ID: <20261112163703.3358164-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083734_072588_F5DC41C8 
X-CRM114-Status: UNSURE (   9.08  )
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
---
Changes for v2:
- Place cbase in the correct order
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


