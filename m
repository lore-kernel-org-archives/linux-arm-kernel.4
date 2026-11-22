Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7700606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X8Jd3+Xk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERja+DCd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=; b=X8Jd3+XkMqrmDD
	EQA1YD1yd9j9t+k30VXmuOHfj1zLX4KuXDieVVmKPWFnKtAsA8BZJdEPb4nlbK8P9EsDxfOXr4Jbx
	s0CFMeqHJBsf3AnbrSeu6kof/nN3RgOgPqYxuCyl6wfE8N8JmeYhjUFe0sUT97vUg4piP1rnv5wTC
	WDdelw5tvEB9moSKCKkB5zSazZLhwSgL5oWJrWrbLce7ZVavADjYkiZ05dSo+R1/py7Hn09kG9znI
	NMq9LA457Y83zblvnuBZsGVbnEmIchb/r5HwPkGZSoBxjycUTlQ3h9sW0K7V92HYFsUguiThLGxE4
	jJMCd6wwpTn+l4s63kfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4eG-00000000xYB-19rw;
	Sun, 22 Nov 2026 10:18:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4e8-00000000xUO-23Ya
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 10:18:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1699077a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 02:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342688; x=1795947488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
        b=ERja+DCdLBKs8pIrTEfdLiBmS1YhFCPKOzUY/q3666q6aNKysR4+0gSX/uRz7kMwIQ
         6NKR6gyG62v/7XPbTXyY7SwIF6ptSyf+bDf3W/MlrD9xusJgSf+6vITasElOP4Ct+SKk
         itKZZ4dl+379wVqVJpdF0aYu1C/8AtNgRyy19mCr0IzlJjv0ECKijyCEdXGWbiBund9e
         MIfhhbxjRPHryJiGrwBQH5SKEJqWtjnGgjSAA9rYPWDh3QhcpABKDQdYuvHV/R7A0g+m
         GQnaAZqebDEzSfzYVBaGYubWPhTOlYosMvpP1w/fSaAbiJ4Z+scdLkSHIff59oEc0vmp
         AiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342688; x=1795947488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ph2rx9fu8uegZW4FmXu9ACxG9GNyZ62Lgq4kaeRDI/o=;
        b=JB9ciJaw5VVwxloHC/vK7zR4VpOaS37+awhwcBz0QFNLxwymCH1sieScfjqkDRphX9
         WsNHED+lP+sQo4A8PSTvFDFP1xkA8UezaGfoVVrRhDSalHf05qTb/u9e1o2FnH+QRBRD
         xzR0DiJIXOqZg3cyTKiiW12Xn27yiIwXIzwuRlbGCJZ5BIOOEHJLRMe9aHnHsM5nmR54
         mlHwYxD4QAvbcneLXbTuzbIvR0Q4zoxCPHatVJkdE/rER78q8q/4DGUUbp1Lx2XcDpzW
         fg6woIkaYjwmIoR9moSgPn3nSrw/yR2IF5W8d/jzbk5vg2+N/ijFGd1cuaeyJTRuPDAZ
         OY6g==
X-Forwarded-Encrypted: i=1; AL+hErH6L84/wwPjSjvvaoqYMr7EXsNQOY6kiOTAuTqOti3qkp2WwxgJ3VgB/qCL9l6eR0yGpymuPcL8H5oe06R9hMwd@lists.infradead.org
X-Gm-Message-State: APuU4Z8SEOD9vdoYVvGRWqGUurp+Xx0tLkMH3JREe71SgSfIGgOnDWet
	sX73x586BDTumrQPW8la8BqJLHJQ3BrEhIhRGPBfxxXGxRBddDGhySMx
X-Gm-Gg: AZFdTZdMFOAY+LalC6G+3UwmLbWjI+msydcyltljiKZcauxkz/+hlxrc52t8H54B0Xj
	g51hlBVQ5CkDaIiah2FwmFXJRkSGeeKyv3nWiGrReH5edv0A8OmKSCZyR4yYCETKdi8kQcVTPR3
	+LV3H6+bxEgPUKuils797TmDPMxXIO8TQXrX1ZQA78hWlQUN+5bGllVHKg0axkbRCz3OeVByuK8
	SuDUlPZJugkWmu3wnl1Fl/bN3oCSkbyA68xjQPmFvddXI7Y2X1XVBvtAgTEkWtGp5UDlFA/yZgn
	Xn+Vkzept82W5aa2NuwmezziNAbEpbZODfmT+XdLjTgfh6us2OVTFCUmF9bCdZc8mQNKfhbGnhP
	MRuOQ+yTBJP+zH73lgva5PFtSK/Ug5aKk43zmNtCcQVe+H2qp2vgRRJl1iY/pY20R2RhoN0vabZ
	Yw1KhPvi3O2BWTfhoTlxNaBQkIT8cT5vMSkB9dflyLMO50lmAs8fY0k+EDdTb2eBuEdWSor8Pap
	Jd4Z67t5IGQTHW4yw47QYwtuQqSOrjXSQCXRJZ/q/ckXrv6wEBb7A2h93DSWssaBbe7oTuFTaIG
	226qzUEnOiZqIWnojfqO/WMWIar7FnvcP4+u5aq+zs/LRFynZ8A=
X-Received: by 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr8501493a91.17.1795342687728;
        Sun, 22 Nov 2026 02:18:07 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14953787a91.17.2026.11.22.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:18:06 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 1/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero
Date: Sun, 22 Nov 2026 04:17:58 -0600
Message-ID: <20261122101759.206056-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122101759.206056-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
 <20261122101759.206056-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_021808_530826_DF9E0C07 
X-CRM114-Status: GOOD (  11.40  )
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

Preserve the leds and led_act labels when replacing the deprecated
LED fragment with a board-local gpio-leds node.

These labels are exported as device tree symbols and may be referenced
by overlays.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
index 539c19c10946..e01f668cb9e0 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
@@ -7,7 +7,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-usb-otg.dtsi"
 
 / {
@@ -101,8 +100,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+/ {
+	leds: leds {
+		compatible = "gpio-leds";
+
+		led_act: led-act {
+			label = "ACT";
+			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &sdhost {
-- 
2.56.1


