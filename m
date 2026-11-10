Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586560A262B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R/zErl4B;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=priIvWva
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=; b=R/zErl4BLdqWVs
	gI7XtS1+PJcIssbRscaXHm62Iw3fVAY3fsSroHF0StjJqhdOdxEkDKKwVLCMGJ6Cgw96c1x/VFtDz
	XM+7A/PlD8+K2f8cMerUMHzhFOSeiJOx/aL4sxrrGO9mus0uQSeIR+dKADivQJN7dMZRJhxbx1F9h
	SUPU8aszpHdCZrEgCmhAaeADmyJbjxoYjNw05d3MRuYjyaZ6c95RSmk/m37LGPgsZXBc2jJ6Jeyrd
	DWt+CDUQR55DEfRebTWCpkhSGazD79sMCA7y85swp5CdKTJ7ptpX8cPAzJPN5zEjeRTJI8pHrQH2z
	w708ij/hqIR9BBNaZYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdPJ-00000002Nol-0U3J;
	Tue, 10 Nov 2026 04:24:29 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdPG-00000002NnW-2EJq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:24:27 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1b244fb7fffso2027537c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284666; x=1794889466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=priIvWva36ZYi7rLSvg8/QP8utZ2VCh/FC74F3V7QB+EF4CCWSi3z5QYrClxsGePqY
         s5wdhc6Qi5EXZIekhS+De+NZic0fWJVza5oLJlkqGTesh6rb1R31kBBr3jm32feAhn+v
         cZttHp2aY2K5hsFJssXnT/IClzvhVH7myuiLI5pc/sxmjFUdIPR+mUoDB6PpEVd6s4eR
         7acFnNJXaaNz3Ewl2dPEKVYWNhVhXnpLtHXh8rPkCgYZhDy4uJhGC9Fn5bZmLYk4krIq
         tWpDheykPVuXF/h1TcN7fO2PzSOQ2zzPcMLxUmIids9yqf4rsxLmLekRrK3ZxHB+n6Ho
         q0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284666; x=1794889466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=zJRp3xj6Ndlo9Jxb8HRWDAxn4xba3++VgGfhcQkgpTgVP1fFDoetNTmgIV4an7qrnp
         tI5++OT2ee1/1VpbZSy9RfCy2GNU0e3RV7f19Eqq6OsEuw0E5iZQYDblR+5Mv3Ivnz5i
         ywH0HgBvYOamqzFoJTL/+ASuORKqKv5X3TCFJvU2rW4FNEYcHip7cqiL4riX6oLxWp0N
         3tvI0bcphdPc3yTz5Ic7A4X1RIWgIw3OEqOW1CSTcLqnieBdTq9pundVwwE3jNVNoVvJ
         pa3yI0fGu26GmXAdx6Iv31M84/PjfPfp8eUv0l7k0i+srnUzACCuIm+BEeH1VjzvzhpC
         IH/Q==
X-Forwarded-Encrypted: i=1; AL+hErF3HbhErsLhSzriobuRNgbMY/fFagLXxZkjhy/z6JaQpur12NXzig3ljh1COHyDUUCFi1XkGwyWAF6gRJrd0r8B@lists.infradead.org
X-Gm-Message-State: APuU4Z9JcWksxH4PFgY8rlznwgyiFquAm6h1QMF1GiI6/HroO9td/AfK
	gxi9yVqxs5m3K5MuxtUMpcSyvGTxFfQzR9xV6o8j1m4Fhtq2DLRIk110lHipR/ZjFA==
X-Gm-Gg: AYBFou1DpDeb7BAnuCHDFOazQqMgI5bayPN9H7+cFQLIk29GhRZZsSIqwOLVS1n5UxS
	mzzKcEuFXnmqSFRGzJbADN58B3ors8+AcQJmbkPj3+Ilq5SOlZhGxcp/jGyumYAtJ+ODxWy7axC
	/T/s85+hjn5USWlwlNdMBG/kfyUlyu2qCqpmTCFAaBBBPVBFfpMzilDmi7LyLdxcIv/dWh0b7hj
	uly3uFmd5Z5JbPgqFUTajA7/uNglcTujtgk4pjpK4gyYSUPnqC8JzdLg1ZM/G57fl7AK4JmfrHS
	sitLU95iEgmLHPgltjM6rcRv0ytC0VRnrb9rN80Y5cemgxPUj3oe8h2wsTaImyWJOwMmX0vONc+
	IFRLLAdttQ7qb/qIW4o+g2d/yMN4FUyKfx1nA84geifBJsFdL0LyXUSb8g0u4zXNbBje9lGgXdk
	XcD7iiksPu3ITQJx+gcoCFVklekNUl4nwAeoAH0wsRC144cC2rjm14eJbrjVUvS6QUBp1Xb6s8c
	MP8d3+p+mrzm0Jxyk3We+EWuSWm+yip1dE/0C80sx4/FvQbUWUpOuzcbnyLX7EVGETuIA90jopi
	gvN3vhB200sIe9GyenaELH0Vdt+NdUHXlYMDcRMOue9Kmr3LkNIzQQHm6LtRSqzSq7P8oieGV9q
	lET6A+poCos71UeIi
X-Received: by 2002:a05:7022:927:b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b3b60094f5mr2444679c88.29.1794284665400;
        Mon, 09 Nov 2026 20:24:25 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:24 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/3] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Tue, 10 Nov 2026 11:24:02 +0700
Message-ID: <680b4e98af630c4759dbdf73b53926ec5f87fc3b.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_202426_577917_D0251A5E 
X-CRM114-Status: GOOD (  11.96  )
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


