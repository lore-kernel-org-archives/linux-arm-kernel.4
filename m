Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB99D606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1HTFb47t;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0HPWr/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=; b=1HTFb47t3OmgOF
	V4cegsAfMexI/z/8/MTc3eL2C32aehYqcyc5UYpvtVOKiFhEgw9uLrYzO91vED1DNZzBB/ZP0PTlc
	zdbf0vOObBt03/GRsY3zf9z7mqjmpWByrhPduCNr1Dk/08rfFwrGUap+mwAb9F5vkfCEhweVpvZOB
	jgv0JNBl6WscFABI8QUOxBxZi8SbgFetABvTcBHffpvUhmZVj43dzz9CzlQSjzj6MZ/+XPHpfWemX
	XsOk+gC39PGRxb3+K6+6Wa3vKsbYD3s4hJTclqaapU36uoNOdduboSgBJGNuFK57SZG9/2x/C2alM
	/n7MX9TVtPajWcETqslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBM0-00000009fSv-30qS;
	Wed, 25 Nov 2026 11:40:00 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLd-00000009fEB-22ww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:39:40 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1b3b4944a0eso4228140c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606777; x=1796211577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=q0HPWr/+7Sx+4UyxXzWLXkuYpf5TbnII2HlVtz4Z+zsYc3M8DQ0VufKZeRSxscIywc
         nkpUG8eyV/4SnYtF/LCc7WO7cwVoRWCLQ2eA5w26vR636WFkHvAOtzJdj5SS/Iozp57I
         kIFeuC0aBLR/TfnIocnfKXaktPUyYbeUS9cIMGSEU/JjK4VRkgbpkBTMUkkSMutHbJQI
         jGDUwkIEmTQRXBE0o9X5PynKT7GpJpz9LhWNDmHs1KnSrpI9qlcxM+cmQoEIn5tXBoAO
         sDjj5gnKI7KrZdvfNjDmONzgyOUJm5prxEYfQdgOxX3QNUSnFzDG2EaCAWellZrplIi0
         OUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606777; x=1796211577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=H3LzqXyS2uV0jSLvXA4PV4lKFzwXZVfI8D2rZiqUWJW1ObsaZJ6swCPIu5ocdeQs6G
         aWVQrNzTsoow5u4Bn/J50/DtC/eUhhBgHdj4VSw9/ZOc0a3bUjSlyz0v8eoJs2vgxMqX
         Gpdmmqj0DphleoZgEw1W0K2E0TP5ciz4Cn+QzHE0ImVtVI1qkP0Rv+gAgWFZgPwrMq7M
         x/T9S9Fb66M5i4C9MeUyB5MRr5+oSAup0C9lnQ00aoclBaTLzeBi39Y6VDOz1Mv3F/Ov
         gzvuZ/O2PPPF+4Wu58Omf3ZVnsuxFCJX0V5xUq6J40d25s8F2HZLuZbwU0y0osMmvYoS
         HQ8Q==
X-Forwarded-Encrypted: i=1; AL+hErGgD1KKD79HG1VDyII2OlsCjvywnpOSwiPGkI9FFAvkHBpQ+2O30ibnS6yiba0KFvaWhAmhdmVkQqzD7M9/gFU2@lists.infradead.org
X-Gm-Message-State: APuU4Z/0oWUoM0D5BFRGpJitR0SsYz18NlPmXQAiDkpKHkkd8zgsbzvf
	7owhEc30KjxoVZ21ExB1o9AXJ/WW8+fXG+XUZcIBCSXgQNpz+erTBCJY
X-Gm-Gg: AZFdTZeeMNkSvVT5uktVyAPPljqYIwOcRKCBmQ37oY7kbWIiDoXR3KdKN8jRE7w5O1y
	roQeoSkTdB8td04dzlTfzjEL6bMHcSRHAzoP5QcYGMy5BnwWBsVqVFGVdQCFY4cLQHjE+5EP1rm
	0W1sELbTb77f5V6fuV1FRyURs7zc0bKiUvcX4fR0a7he52fyLZWav/Qr+vHZzvO6iqCtewXtVmh
	IiekO5Fwu7O02Khw8LSL0e/hvrGxdFT7jXlE07Ltac04bCJQnaSSHR+tsdqv30+ttilxTnY7/95
	JBOCtOR20UPEiIdXXVnUqXg/+Dl+y4aQTUpV5hzjj5KF6uBmrmzL++/h8FOij4UksVtgRE4owfx
	oYtZeLbAaNHkGQL/Ho+JbuPESKF+esWemxehd/fYZ9MyW9LavryOlkUG8df3nmvg+zmvp48q6m3
	LmqSSUiGnYiNj5wFke3Uf3uXJ+j/SkW9gY24KK35e8CFGR5n+70cl4SUGmgog7ilHW2ZCqtclSz
	KA25/DbdIkeBSKWtQZzflh07l12hOllVeworifd05Y28ZrlkI5D/z26drvOOCtSQJnaOdhDhwbf
	zMn5abe47DOZsWc1pAh7nOaI9LBppCenxXyD77lZlvqQhns=
X-Received: by 2002:a05:701a:ccc9:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1b5568b3e73mr17483022c88.15.1795606776639;
        Wed, 25 Nov 2026 03:39:36 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:36 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Wed, 25 Nov 2026 17:08:44 +0530
Message-Id: <20261125113845.297658-3-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125113845.297658-1-dineshkumarv85@gmail.com>
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_033937_535047_AF45DBAD 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the ADLINK LEC-iMX95 board compatibles.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1


