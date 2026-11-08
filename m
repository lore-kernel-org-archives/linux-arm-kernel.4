Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A199C606EEAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KeacxK/7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwIaR+Or
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=; b=KeacxK/7THGeeZ
	/SdVNHOJomzRX+klU74ovoLYxIt4m2b/9MfVmGKVTtth0ymE3aAXlY/05D+WgPOP/QESdtzc0KSos
	Y7E7sCNKTpSsmGvIL04z1KwE/aMF3IKavaV3eG5fR7q3vgV9A5gUe6uUEHr0YRwXFQiefx2FCMl/k
	GK5a4RqMOXIgtMVnjKI/oNXuVH+vEQz8KDc3mqr768+EtsV9XHzcK9INy454W1tJ+Gd91EN6X4ZOx
	KtslLJMliIrpbYU9pcsctLhvLV1eHPywV0Tdo5+J+nt/V9lhEMnYpigmVNuU7V5OZD2rCmusCW5Mq
	esmZWN7DBchnZgk2byCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAmU-0000000GlAh-2NaK;
	Sun, 08 Nov 2026 21:50:30 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAmQ-0000000Gl9a-3rNM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 21:50:28 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso344802eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 13:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174626; x=1794779426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
        b=PwIaR+Or4nxsdsuobuUbf27fgM9Kh9hODts3y5HFIBMkapreQEMGsHzNaCeODfu2zY
         rMOUlSzFX9flRbh0Yz6pbOaeButYEm9FC8zUR5GF/iZywZbV1qhJo0iXPO9w8m9YZvHb
         NGzaOSaYSmvlJ9syLGOi5u5fC7GLokp3LxGwMCVJaXaQ88vWpatRL7crw8KJAqEK5+L2
         oBfTkWXB7/n5Aje1QEU9x3eeeaviAIFiw+oV86JOImEyc5DjRecN4Jn/omUJQ+eYumKl
         K487SgvUMH0vx6rDaqIBBs7zNQpE4qxoLO7tVuRVcBuW/1fKY2xxePDdQRRcOWZKik4B
         KKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174626; x=1794779426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uKmhZ2eC+qczkvgumkqf4irKvpY1pztTchTW2mAuZQ=;
        b=u155ZVhMYygllXCinmJ2mmY/x8o8kecV/R/pT8L34cAT+9f3hPAGsDK90FP90eliAy
         5bo5E6LhbUZVQOjYMAus1Jpbw0li9xu42wyHKPzWxJt1Jx8xjVdY0M7mEQXI/0BhFgpd
         ttXnL/Pny4tj+ZXEJ0Mb9Jm5kBk2punmLgUAwnsPiNuXH52OJiAVRP7NnLTaZ2g0RMVb
         qCgCvdYfrjnBPL/00wAA5zuATXunp6noxHso8wo480B17q7++ewELYqIUY80KCTVojXO
         uTQimSBkW1wkVGPu2m4iiorRcw2Qbf1Xiv5MHP+VRYI1DNGyS2wwNjxlNLJds2wqvOG2
         qYOg==
X-Forwarded-Encrypted: i=1; AL+hErGZL6v5btpQ05NPTiyCdQv5ruRNCpKgZNeNSfx3e3PcxnnADhC1VYrfOQZjR6ZEhbx+wLtL9Ky6YezczzkD5REA@lists.infradead.org
X-Gm-Message-State: APuU4Z84uca92iG+Xu2NQsNdBfOXhF6N04+kBAtKHu0/aw0JSMfs6N+t
	45yQeMbQrlxGD2EFJG2cqkA7BpTRZ9q1RM/i6XXWZouJDGSNDrjpQeun
X-Gm-Gg: AYBFou0qdDr9e91ARxNHuCWcx1mrA8kuhhh4jFcN2euKY1feiLF0S1ajlqLZqBzqerw
	FKUxcIuxHvtncJBlm1wcNH8Yh3OTSSLyKzMH0dsJIa/kvM9v0r5pbibidyLUq+A0fvnFMRJCV9I
	mCNEfgzUVbuqlEsUqCmW/CJbsFDv6neb3L/R+YbxP7Auc9fcGCo5CeCRVMVsp8y746SCoHZ73mn
	FSjy0UMRy38lPBDLB4f4i6q2F5nDmdTXZZHykbGl4EA4FKA0VVJKZQ+ATur+6/wBgfr4lPBfNaD
	EM/P1xVD31xSu8o8Ej271reNw84ms4lT/nGVcqa0Wustk74A+KSPL25OmQV/iGKW/6olFgCIvbW
	jR9+MGe01RqgBQUzADLM78XhSt79CZ5v1hIdhuuchKjd8r5pRRGZUkr4sFESESVBkOURy0GJowV
	vbsjlXtLqaaAiWtZjqQbXrBUFHKiwUvc337kTdsBJkyrbLZ9JJpNaSa4dF2XtCygNv/jzVPeynX
	gOTl5JcFg7dFhxa5AO+OhTk5MvEL121mZ6XwAkCVMN5dPjZm+eA2nYCT9kwBW8eeAP3MftEtnu5
	BBekhJY2eLX73o6PeP70Jd/2noI2QYWjtQoMv1q95O2PPhp7Lw==
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id 5a478bee46e88-37256614c62mr4822924eec.8.1794174626129;
        Sun, 08 Nov 2026 13:50:26 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:25 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Mon,  9 Nov 2026 05:50:09 +0800
Message-ID: <20261108215010.351256-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215010.351256-1-cyan2254650260@gmail.com>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_135026_969927_3774EF95 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the ALINX AX7Z020B development board, built around the ALINX
AC7Z020 system on module.

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..87b331f296 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - enum:
               - adapteva,parallella
+              - alinx,ac7z020
               - digilent,zynq-zybo
               - digilent,zynq-zybo-z7
               - ebang,ebaz4205
@@ -34,6 +35,11 @@ properties:
               - xlnx,zynq-zc770-xm013
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: alinx,ax7z020b
+          - const: alinx,ac7z020
+          - const: xlnx,zynq-7000
+
       - items:
           - const: avnet,zynq-microzed
           - const: xlnx,zynq-microzed
-- 
2.56.0


