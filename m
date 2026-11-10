Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8EF606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbOSXkgt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=if6Rgr27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=; b=qbOSXkgth3zSpG
	MC9Hn2PlpWoMiEJ2gat5IuQpB8Y7FGqdD33Y28CyEGkZo0tTzVfBcsWNSY0IzSa/gktn4BeuRwaFd
	cvO+HuWxbSAocAA75U2wUI6Hk+RcwuS7HMh+RlObMEMy1Gnm45CKMiBlkZcDi/psoYrMPeZr72+Bu
	K4hJl3bmoAOjoKAskWqPhgweEezcv1Fy5FMbD+Hh2saoTxOTs6jrNsldOjk9X0uUrj9ZijkTqrCsc
	SNG8HyugBocqmr/S6riFmcFwfCPPZMODm+A9o/6U9xJ1vnV9FJhfiRl/icavgxFnFjv1fukVVlQcw
	3MYKLZ2IjzaAw7QsRUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdja-00000002Q5y-2Vtr;
	Tue, 10 Nov 2026 04:45:26 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdjV-00000002Q4Y-22OB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:45:22 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-4adaa0f72abso1169370fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285920; x=1794890720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=if6Rgr277wUyff0VjVu5A3s1g+KgoS43jfv6L97QhZaIyq7v1hDAZ7KGZp2kA2BU4c
         GYpxeD1A42Rh1uWvkawUqoxlHhiGH3j9HNHCw49wlSCnzJx6u5os5dR12S4la7HEKWJO
         rpCpAMqlMDomT8hQTwa3FTb25yixS1yzDdDV5Z3uMK48HMPN+N2A34qu/ScQlU8Bhrhh
         7rdeP19C0C5cJaKvXTPDR5TMRUCxH5e6VROYJDfvKUVY83JpnwmFV3sNOeVsEBrbOP1k
         z6yKUjTxDG+J7h1pfb/ds16ICq2gp8gFr9lWsmJSWA1Ps1EodAo5223CpOu0/lME+ANv
         4HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285920; x=1794890720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=DSr6MXcLG4CgNYwoPgfS1K6UWsSXcGAxMDG3ZMjQWHX85zkHglHtXVLx3nu0jnFfrQ
         p44tWcj8+WjsU5CBUAwIymT3atByQvpsfhUlalkk5pmytCL7gIpoldkHevh2Djjri6iI
         9NzI7CcyhBKp+Qb/g7r9ZUxRjVM7k1T3snf6pcbmlFVv5wc65JB59Jkw0VLhjSNaLAGR
         qe4XmxXmHZ8cKU0ITJx9Qd68sVznU/R75rGKEo5GXXibNTq5jxE9VBFI/HphBLJ9e3d7
         uXwUMJWYKq9DqsLUhptoswdgLIQvcwg8AKDvq0Zovdv67b6KhXnaDitWRACetoAcj4+V
         Dutg==
X-Forwarded-Encrypted: i=1; AL+hErEtv0sWptr9UOvpOI+sODlenn65U4cPfC/jndTO9Tc1Iv/yMFvUyRLqqra+QJyohrORzpKurRGcePJScK7O/XTV@lists.infradead.org
X-Gm-Message-State: APuU4Z+XIJ+2VORLC/anigY3yYUjjr2r+dbUx5+NKxQHj8rCVjH51xn0
	hp+/XGjD1g5j0YPBDzQUFEPLjIfo92D4UF0ZWAO1oLyKxIGNwhv8h+ZK
X-Gm-Gg: AYBFou0ML5ciFlFR/KaVVqPzxKnHqal9qojtrSwp6BVaOpyKx8mv4WSUQ9QkLncotDd
	oRJ/vckicqK+ZeRRFLJKv1fIbQvJLdY5uxG/S5WHzq/cmsaxi9BLRH+bc7G4j6Z7Ar0WdgE1hKY
	pH+vJn8ONkxc0YP5MAW9R91bu6RL2LxbrtzoMArcMDltzkE02dBLJiDKupKl3qPki7Xp3n589Bh
	W6ZJCR27ocN4OCYPWl5/QwwEFz/MjJyp281K+palRCCLXQfJgiN9LuG8jWXt5vUjdXN6wTuu87E
	3znblpF4Cn8e7bjQgMFKoAh+rDtjLbZ87d8s6foYdiXAUpNomG9ZZtWbUcn/NOUWYv7aB3xA2vM
	YpiahP2VAAYIRplCiDgN8kelyb7oogF6llPTSyGY2mlwYX6tF7E+cSyKgZmtHIaxNWyZCXXM4vv
	rlQmDZSiZ+1XZWs1M2kMJtSFSOKL6T3tjPUDH9zVdh2NTN0l5aXICYICMkzRrg9T5b4Bz+wdBlg
	ZA8jY/g8q0JZ3cBJdGleoiEzlbT7k4sUc4KwS2Fm8r0WRXe0x7HI8FQ8M/IyEhq1NIRp6uQP9JN
	HTjuPvM7DX+JuyUMAcCTeS/LCoWEJSvNlDKc0TJn80GZpMAnejMB9+01kfdR1oNZEvCgp2GVdFX
	InSqorw==
X-Received: by 2002:a05:6820:c2c7:20b0:716:e2da:28c1 with SMTP id 006d021491bc7-718a77f2696mr394873eaf.39.1794285920417;
        Mon, 09 Nov 2026 20:45:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a40b8a9fsm954836eaf.0.2026.11.09.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:19 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon,  9 Nov 2026 23:45:18 -0500
Message-ID: <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_204521_656664_4B285840 
X-CRM114-Status: UNSURE (   9.51  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
for the accompanying initial board device tree, so it can be identified
and validated.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..37a7d713ac71 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

