Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32150606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DkfMvk6O;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=piTNOTts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=; b=DkfMvk6OQLqm4C
	Or/cQrjQoNawj0uPOyRzp2Bmcp6LhH5mCyX1prK/fd8UDnreM2vjRinNa19MmPDubdtTl2gyO+qny
	TOYgMsLEjJtNAhzp0lMEmvo6rE2g7aS4lSdBkWQVnKC/YUps7l5hq109wcqBgHypGJ4fzxlSbocRi
	crVigF1QB5GamCNPygUpXN79LDwV+ZqIPVTI1dmQ8/xiMOAC+IyXg5eeyGIu/v3TLuxMWEcq9xCrg
	juQFSgyqRplhJNQHuzAbFmWpuuZ5pBM8Wbd/UIo87KHXQfUdLoXbFF5y8b1n/gKAEKBqZVSWGw0E2
	V+jJ/XKY5FZVgbsn4hFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBCb-00000007CBk-2s9o;
	Wed, 11 Nov 2026 16:29:40 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBCU-00000007C9i-3tl6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:29:35 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1679194eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414570; x=1795019370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
        b=piTNOTtssapHeEvxof79X44k6N9qvE7Aw5NHsb/NaZGN3HDL6tR7aTlATlfwCg5iEN
         7Zw98VTJ3KQ4pUEB+6UoIasj2aI5hoLKc9C09pG59CApePtSNA3gwZrSXM6jPvhYh129
         rTjsmwpx6uDPWWZhuihCsCx/8GtS+RwtGsLvWUsFlRrbLHx26IStaMA9NOxX8mwsvUmM
         gXW95j5FgxM/mssX0U7+84OGJNrrDCFXVZhKbS07mBF048PZJsfY0NudozWUec6j2X5E
         lhwOMtyfuj+r3WSBDknjVeH9pTgaa1fVY3lj8wwm4B4TTlIVsP4a/bKh5kt1XA0cF75r
         a8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414570; x=1795019370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIIpUdcYbCc97fJ/nZL3tfOeMSipetiHJ2bLLYEWKuY=;
        b=j43A3uZLdu9yiOoCVrwcpcTia4M7EB3eg0BprVj+CIzq1S9j7Sbo3s7/HDypNt39DD
         VzCTUk9uDS+x4UReAKSo3hwL22N0Qma0cTonMt3kGOsTFu9+gyJpWvEkSUJ7PtJ2wS0Z
         XPV7xFFYUSXpnEC3nN09e9qrTRBG68pU+OWHegJ6/vf0ymWw9Thdb61ZnPUtUfZwLce4
         E4VSUz0CGCn5DPBg9LhiBlNfzuK090I/LDk16B+P2ALnTl6JcS9aXU6w6yt979BovXnP
         nXodcr/RnAGvecQ+QersLtesUxBCElEBh6BWu2LI/lOHD0BV8YXburSLg4kfLhGYXVsw
         MiYw==
X-Forwarded-Encrypted: i=1; AL+hErF/ViqZAT+NDvbJM55+Oz8CH0qb9qVK76pTRib7Ksp1tcq0EWl4cdbKXZ1wCJBFCAbvkrChHHACz0UnNrZSY1N8@lists.infradead.org
X-Gm-Message-State: APuU4Z/Z1L/+Tdwqke6m/XQMili2d/IlWz+8gDKM9e+jGnPXTO12EATR
	nXFWu3VQGNrzUSAH2cGtV3K6nfAuKJJLVMjiNK57Z2IJ2RGxx7JsEMFe
X-Gm-Gg: AYBFou1tcUydoYsAYOXoL/XaVa2k5S4YOP23xRgFhsiI1z+WuIwK2WB672Wz6x4YJax
	+RHdeMPg1Nu2TSj8G5qF5YEvDhLAE74NtURe9rVheFrx/JB+M0Ti4OE0MNsHNmgMTZbbKz/GYbd
	no0BUyffzOMHjVuYSyM/dGwBGlTg+bo5OctGWzTua5/TwtbJU39JNLoppTIc0jx5kiyC6AhnnKA
	obCx6BZdHI14dylN3QWrjVxLI9e0Z6DeEkRKjUFN67SHqmuio02OLqBjo3oYUuCBCH3xUUr9ypA
	jiQg5oq3HjkSjhydh/P3n+4MVbWbyIZRJhDIcAWoj5bgTTWAQLsnnuPeMAylME6d7PuhCvWYd++
	WnrcHRzGlv1CEUTd+GJu5gsAZqfzYdXCeZK16JYj8HZIqsmPsVlqZSicKS3POYsd5crfd/fNYE0
	4cMP+SG9eTDaVLRLlLEU/zE6KYd2YSdNQ640pMyesB39Nbf7oxhtdgO2hgWh20pFn97eAjtJRzQ
	IPULlOsE0bvFiXOPmTTmbbSKw6pf96LDPAlfD8qNYAS+mttKpB/QE+aCEYqhYvgna2muPPWYGRZ
	VAiTuzTfIL2agWRyG6B+DP2qCdwKLSp/QYKqKGGLw9Yux6NbMg==
X-Received: by 2002:a05:7301:428d:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37686171ed4mr3330492eec.25.1794414569971;
        Wed, 11 Nov 2026 08:29:29 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:29 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
Date: Wed, 11 Nov 2026 11:29:16 -0500
Message-ID: <20261111162917.97532-2-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162917.97532-1-cyan2254650260@gmail.com>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_082930_982437_CC86525C 
X-CRM114-Status: UNSURE (   9.55  )
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
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2..e3bd3d7660 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -34,6 +34,11 @@ properties:
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


