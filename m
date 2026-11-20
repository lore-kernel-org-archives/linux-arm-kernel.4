Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=caILllsC;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6KMaV6j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=; b=caILllsCMf6Hc5
	SL1XMQt5lFjmQ/ztsjIuPKQCrh8IBOZ8K5S6eH9zW0Ux5qM/nIRYIrTzbh8zkMbkuOXzvLeuDZalh
	pWil3MTIwBra2OOTefVlr3jjvMOS97+tYMWeIz5grOItWlzkDwPQB2mfkEHKTu4tJZ9HEtDtQngE0
	8Pg+73Y69gHfpUC93P5rhxSDMOUmKeUI18X7wT++Pm7w2t2PVWy1vOZ/a1OeMl03zB/oB3vaYIkVH
	1fpDg9ewNmYnT5Ur6wlM76tpBnX/+cwFPppwLN2rCuZAIVhkVht+C8yn4WLMQMR6khtMzsT4K63mS
	tbRr0pG9X1pcVOnQnU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFas-0000000DzTf-0zjV;
	Fri, 20 Nov 2026 03:47:22 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFam-0000000DzSb-2vT1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:47:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so156352a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146436; x=1795751236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=p6KMaV6jupC6mOlb30jLhfS+9mB+d81K4PPiAWA5zH+J49YJnIxqg84Pj4cmkp4NOm
         fAO1AikHcd8ljka8Z1cXn20j+YbUU0MqibyZYh3gpCzdNPAaJ5vPnKWsSjELMI0+9BaW
         aMx1GoG/uq9CYK8eJkDDKgqRcALYfUx7ZjQ18XBc5rLczzDTdwHS/3cn/wXqTT78RZe3
         1pI0d5v+LIaPsQqOUbj3GW3M7BlBWfiy53KcOfUUZPu0fjLfNmPFL5AbbPjp7FOaayrn
         ZSKfYm7ELuf/bqPnDNvIYEDMxOw1LpZMGvhs5sCpjMqIWSuZFolSqciWg6t/DirsXjp3
         SOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146436; x=1795751236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=WLTtC4oVOpVgAkwMgfyN26Myuqage4JXplvsbXMEmCeDgOD6cLE+4EN3NH5idFdLYC
         7pOzR5ugq9MPMuboiayUq/MicurOY5V6pRewlxBJ2LmG4lXaLAX/XLjmtJjCMS5kgosP
         9ZqrVVZaI28kNZEI/MaTSq2FrUiMKq+VH0hBDxQ64PtAHM/x+pb+fKrsbcQM1LvOHCa3
         2lS/y8le5JPCcN9t0p8gEeKWADZUk1gaC4cWFLqj4ogbAZbhs/a9d2SUL5ast2frrVl1
         v/6NOlCqfnLw7qD/NvClGFAX5rMr3lihyAMbMIs8ZgnmeONZPWmkntydjaxcggcSv8xf
         GmjQ==
X-Forwarded-Encrypted: i=1; AL+hErHgVnVQ4NXyn1TIzkA6lPSZkyXUrNf52H7pTJIlkJALUMEZlnBqiY/oeViXPNPJ0bGDZgbx8gbCQCPF9W05qUfv@lists.infradead.org
X-Gm-Message-State: APuU4Z+71SugjYsBXY/cBsN+UbA9sPHyG/AIILPjB90jgEGNUez6fBS2
	L7JpaSwDphBdoUKO8gsJgE94GB1L8AsQm2qljtUJcoLZ8pY5mZA6k85vpPlNx5c0cQ==
X-Gm-Gg: AZFdTZcjEvtlTNKG8BCXRBfYtCIl3YiLNi2zQ0KfRCn6P6IBDwGZ90LGkt49xljOmHa
	H1Rv27p8MMyaTHEhFc3NGL4C767xckaStz0MUZ+v6a8kqNZBi6/W+qFlsHO4fbRpLWQwDQeR5Kw
	Qm8AmweBL7z+BJG+CVy/qbDM4sFH0CQgqJakpNNRvqnkRRDVYI8eAiohFb6hCpeQFdmd5BAfbzh
	8SwaywQo0DscqY8g8Gjugr+MPm4GYw3MfiVJqlsWLg5j77FfA+/tH+CBb4T0Ol8dE9nnqrNvvNd
	asS2QsvoO8eKDBqzfSEUt9aGmRkh9nbX25AMPTtZ+je5HZreaNcbiNeQn76Myn01fq1kxDrbfYv
	bypaENW5GBuolCUUhchCuWc5YdpaEyAQinmDbDoD0nEujMgZ/oqgK3VIstuBCCMXElk1kqV8Q0i
	5M8las8SU8vqcUpNQEgK34nE65IIue4mZfg5EIFYswEqy2fBuZh2RZbcJ24Vcb1Uwxnu5wL14yM
	Bs1hfkNQuTz8P9o5x/u3SCPsckJSR587z1pzhhl/2TYNyMab9dejb02ElMaxOqo/gYZuUFzbA2C
	hpT4S8eb2IbRxEwmd849A9xaQ9/fwVJWTjnVw3hOfe/A3+Se0BzFL2gaDCsioppyzZ/KMTbuToO
	x22fCi67JUR+N9CmG
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr1557473a91.52.1795146435786;
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:15 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 1/2] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Fri, 20 Nov 2026 10:47:00 +0700
Message-ID: <753a575720fa88245d12b19081741687271f6c2c.1795143925.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795143925.git.jjc@jclark.com>
References: <cover.1795143925.git.jjc@jclark.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_194716_743637_7DC9BC61 
X-CRM114-Status: GOOD (  11.60  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Global Timebase Counter (GTC) of TI K3 SoCs is the system counter,
the one the Arm cores read as the architected counter. It can export one
of its counter bits, selected by GTC_CFG0_PUSHEVT, as a push event
output, and the Time Sync Router can route that output to one of the
CPTS hardware timestamp push inputs (HWx_TS_PUSH). The CPTS then
timestamps edges that fall at known counter values, which gives pairs of
CPTS and system counter values.

Add an optional ti,gtc-push property giving the GTC CFG0 syscon and the
HWx_TS_PUSH input the push event is routed to. The CPTS driver uses this
to write GTC_CFG0_PUSHEVT. The router itself is configured separately, as
it is for ti,pps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 .../bindings/net/ti,k3-am654-cpts.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
index 3572749147fb..7bf5bedc2b9c 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
@@ -101,6 +101,23 @@ properties:
       The pair of HWx_TS_PUSH input and TS_GENFy output indexes used for
       PPS events generation. Platform/board specific.
 
+  ti,gtc-push:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the Global Timebase Counter (GTC) CFG0
+              syscon
+          - description: HWx_TS_PUSH input index (0-based) the GTC push event
+              is routed to
+            maximum: 7
+    description: |
+      The GTC is the SoC's system counter (the Arm architected counter). Its
+      push event output, one counter bit selected by GTC_CFG0_PUSHEVT, reaches
+      a CPTS hardware timestamp push input through the Time Sync Router. With
+      this property the CPTS timestamps that signal to provide hardware
+      cross-timestamps of the CPTS and the system counter. The router is
+      configured separately. Platform/board specific.
+
   refclk-mux:
     type: object
     additionalProperties: false
-- 
2.56.0


