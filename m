Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E73606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kmAawBIE;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kaLIlekH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=; b=kmAawBIEVXcvRLxOqyrPl2DlZS
	kDmjfHLmEgEYaWwnBST9BYyfH1gFwZSTtBGLs9/iGXw5gRmOOcENHDD1Tn2471PZYZDkvL3ksaYHn
	fwSM1EDHdQ/n4anC++1QlfwMy2fyAhaQ1HlaZUIfY0pUMYFdvZPdIJKIvpa/Dbsn/88Q51QjXglm3
	ybSgOnlbyoKDTjUOBmnYGr8vl1B+pwxzVw8d4bFHgetwlgVgSvA3D4uuhwV0WzfSQgYxEJAmDu55e
	SNz1ZP1kbmW+DoRYCR+De6EUC3j/qH4pgTydkxHqwubwDHxkb9POCy0YEnF7VgBp9VXqzDdk5cLli
	nW68i+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQta-00000009K8S-2b1j;
	Thu, 12 Nov 2026 09:15:02 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQtW-00000009K6E-3mO9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:15:01 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1b3ada81853so3739554c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 01:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794474897; x=1795079697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=;
        b=kaLIlekHzu1lt0MFsGvIP6qUfq+/DTs09DVYH3XP72alt7du0F708qiT42ffn7tY0A
         eHsPenEVZaYE9faqz2sC+crYOX2ORWIEj+1abJbiEhVz8UKjMMtIMexVTDAjx5Dbb/tP
         xdkg6Lrs8AAVxRDLxopJWb89EVrr1iyLjtU7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474897; x=1795079697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMpo5RPSnSntW+woI56Bm32Y77NrXTYORi/b1dPNWxY=;
        b=ClKmV2qbYHsFScG2FYTw30+SrKa2rufwx93NEnYAWCe3nOmUfBERIkrY2wSsLuDONU
         Xe5fEstiINXPi3gfZrTyLEQKdLu9hbw0Y6ERSELQjon5NVL6F1lYYZCeh3yw8zAZyOgb
         7bZBlqxVQ8Wno/ymSVf8GZQ0iF1ns73fGNr1dJVcL3clYiEwhqxCsGZZ371YAGqvPu2a
         axMX7Z381zBGNhcRxoyK8w1EaLc7cY97noG5jZMHGWPjVcZ/lw+DDF0AaN3wblGE4ctz
         fNrg4JvIOMQyN2Uzgem3VSSxnfbrQyjx5Ay3sFoGSoYXaPsnGJXCvj987e+XCL/DABgq
         XQgg==
X-Forwarded-Encrypted: i=1; AL+hErHZRCThQ5Q1dviTrxPqRFj/Yw5HNNVDngAUtEGCfT91SY9BKxGJxLUJc8XQ3vVrVXrfTmZm/FDQxOfxs7q60sBz@lists.infradead.org
X-Gm-Message-State: APuU4Z+SPqr9I6kNRwhLQMvD7k5lsMapmO2xRMIGwfEOq86axXLvbQU3
	kq/m1f6JJ1bGh2eMrXixDt1Nmt0SU3bRS8Si/spAW/HYqSATmmK72csOVD3qws/ZwA==
X-Gm-Gg: AYBFou3IDEbecUNWb8Xe8Lt8XBV9macQt7YiQZ+1gorq6+2syd3gW+9xcp+0VcJlnZ+
	tVPpClbYq7f/9cFC8KYP7DH4MzKJv8wnX6eUOjJvbgi9qRZdxquTwXxbOs32hBrocsMz4WhBPOk
	UKdEOJbKZ7GgGWp8Py5oWn5IJnVeWc7KxV3nANHSmKzbXOy9GCVQ4jiUwM0OMCQ64SaESMIiPz0
	43GeiaSykibULN8iI+lWHh/OkyX3zWmUDo5MOe1/dU+q37h/PdB//hKcKDQdKRXR1VeaN+FKPsJ
	HMR3J+RXs7FdKhIMqhh53lCsVxRaK8xI+l26knO1btbQ9zlT+P717B0J9qnD7F3XMCR04vGMD9z
	UaMwkj1+jbwCLNyj2G4FYnIMiwYd4e1a+EEakZ4ix4C/3KpQEwy9QlaizYB25H0qByeTfJR1ALb
	AMF8fr54dtZdSlwEmibIgtZ+7spbK5Ni3vSAXeVilOVduno+5tgiMkj8tBcz6Wz4u5GcCOhsq9k
	nNmi8viT+ORwidbF9ekQBseeEEnWYQ4gGxUFQtVR/DYImegdR/tUHtNuEf3FcYMrNIcUp7umFg8
	wFGHzj8gEyuAAHyKeVr2RL35S/qk5h1Jx6F4OJeOMm9jMRBISLgXyMq/9p5H
X-Received: by 2002:a05:7023:d0d:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b3c02f06b0mr4729658c88.15.1794474897295;
        Thu, 12 Nov 2026 01:14:57 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:3df7:8811:7670:7b44])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3b5b2eeffsm23794130c88.9.2026.11.12.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:14:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8390-grinn-genio-sbc: Fix PCIe pinmux node name
Date: Thu, 12 Nov 2026 17:14:46 +0800
Message-ID: <20261112091448.869620-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_011458_934668_B224D0FB 
X-CRM114-Status: GOOD (  10.94  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pinctrl bindings require that the pinmux node's name and the node
names of its children follow a certain pattern. The current names do
not, causing a DT validation error.

Fix up the names so that the validation passes.

Fixes: f4d1eace54f7 ("arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 51f12328a1d6..7a31cf6f27db 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -228,8 +228,8 @@ pins {
 		};
 	};
 
-	pcie_pins_default: pcie-default {
-		mux {
+	pcie_pins_default: pcie-default-pins {
+		pins {
 			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
 				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
 				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;
-- 
2.56.0.567.gdb80ae8cd5-goog


