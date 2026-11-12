Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E44606A8B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rfeaTH0g;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hcZ1xmlw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FqXsbXaCFmPnB64KL5JcY5o6vyw75pQUZ8BpYM+BYNA=; b=rfeaTH0gSLRTCb
	uKstlrMNExxfj++lj2QhR06NJ2h4goBcheRRBkM3MMm6EYufCIhAfGcMf5tNEqs9N9Dlxru3AdF5/
	PJbY5Vwyt8z5xPt/Ca4wNEfuo8PKFqNuRv8lM3yQpyTGsR42wLDSAiZZX1oZVG1DkL88/0Pg31aWJ
	VYpvAn9kiwue0HvhRhrqvaTuw1S990Sm1FBSLOfiRtchCarJ6YWv5ohmSE6WUh165JAcvvTR/ihYW
	LsGDL5VYPwxqdfLhCf8WuzCUkPzPeXLfQz3/Fis7yngaxkucQMrwI7E+y8r/knogyJIj63BPXTHms
	XK4CDM+zhjKrP/8oTNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXo7-0000000AcTV-0DGC;
	Thu, 12 Nov 2026 16:37:51 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXnp-0000000AcK0-4A1i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:37:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F7B310CC72;
	Thu, 12 Nov 2026 17:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794501445; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FqXsbXaCFmPnB64KL5JcY5o6vyw75pQUZ8BpYM+BYNA=;
	b=hcZ1xmlwW+fEVZIeg8n+iS0iBpSHFgxMMx6Mcg+ba2LuIZoqhUBzXSvrOrEG/17VoyCEZ1
	mAnfJFEMPTAfKCXnDliWyXcuXBNK5qIVzsTBWlkJipsykm5KgvukgPJcLB8nCTIanrUl1Z
	wGAnb+/5MYIf18rcdVOZaJYFAPg8Gbp0LXprRaosky4BMb7IFulrHyIBKLI+oi+rJ01hg/
	zEEo4PG+yYZTRJx1hMi5NyyQaL7GP8BKVeJNXmzV8U2zBRe6UhUg8fmaQVKsU79QqZbsP6
	ePzNbqBnKM+nD0Z5Otk+Y6sKDHTUXsOjjs2JamIsVF0bJwOqzajIDLsnX2AEEA==
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
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77 temperature sensor
Date: Thu, 12 Nov 2026 17:37:02 +0100
Message-ID: <20261112163703.3358164-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112163703.3358164-1-lukma@nabladev.com>
References: <20261112163703.3358164-1-lukma@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083734_237976_345EDA2B 
X-CRM114-Status: UNSURE (   8.93  )
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

Add "national,lm77" as compatible for the National (now TI) LM77
digital I2C temperature sensor.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v2:
- Place the compatible name in correct place
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..ae8f12c83043 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -375,6 +375,8 @@ properties:
           - national,lm95235
             # Temperature sensor
           - national,lm95245
+            # Temperature sensor
+          - national,lm77
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm80
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
-- 
2.39.5


