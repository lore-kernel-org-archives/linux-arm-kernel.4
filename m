Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D3606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cz7YsA0a;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WsoJlqdk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Be2dTaYRuTeMSiZr/C3iNTETQ7WbKElq1raCkNzgp0g=; b=cz7YsA0a3yZeti
	gfHdOpw+vdXUP9IJVT9XNfOYzdz300ezc/faJ4+5CGSM8xtHO62boa4QOC5UK2ckuihJcVRY5ReJJ
	akZvMLlQPde2e3RW97FK+Kh4DOkCUl5H4wPV1qnt2iLUKeDzuEAugKHXb8J0WcjSe9oYut8OzBtEo
	gaXtxq9frfpXZflnuLQgnBkMhQCdE0MctslAd54ti/UxLBKE74ycWN8omEZTVOAgfxVIAjSxUglC0
	9wAGFLZH55o2fdaKdS7zFSvA2p2+2dZVvOqCn+8yi4KkmD8GK4mJduEhyAd3r8uzkpctF/hNIAVdD
	xQvnxK0UJkHLBg4LhjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLEj-00000006JaK-0fym;
	Tue, 17 Nov 2026 15:36:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLER-00000006JNv-3HCq;
	Tue, 17 Nov 2026 15:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794929784;
	bh=p0aPUrV2t7O659E4kKwh/OBRJ4chchzDLVx2BMBwY6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WsoJlqdk7m4bdFtgY9+xPcaVnF1Fc265OWvU7gheC0L1FP1aivh+OLFuyrTYCNRrn
	 S9i9Z39Dayt5e5GV+jvPNLTRMLGj02+qx1G9/032w2aWOwbsFWL3cK+c8vdPyNxSCs
	 aJuFnToFweBtbNDHB3pZRYjJXgHEdJhMnlj45VP4XGlVhGICUtfs308np3z9ezL+50
	 LTV6fFpGZxEwSY0EzvQTg0DOgYVj1HpcA1RCnRbveBTnyu9Nrlsdq1ckdfa+HW3C7A
	 A2m8+DlZrdknkcKlchDj2cdh+jEc3mb17MlA9ZUzqs0txjYymEn5nbBhvNNqvL8/gz
	 CLYCQm2JlnBCQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB99917E0648;
	Tue, 17 Nov 2026 16:36:24 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9C83E480030; Tue, 17 Nov 2026 16:36:24 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 17 Nov 2026 16:35:38 +0100
Subject: [PATCH v3 2/9] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-2-32ff1546b0e4@collabora.com>
References: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
In-Reply-To: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kde048okcSOUuMGluJ2pdLxZmjahxqiNXkiSB6ShPbk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr8dHhHx/f/zCGLSYaYefmrmhHn45cAPYeBI
 nTdiMn5X1AesIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/HR4AAoJENju1/PI
 O/qaWJAP/2+hlHUIsbgIS3nK0e+Bso3oHjsJtp+eGoRp3WYS78r1UfN7+bNRANVlcDidOuMGSrF
 2Ya6QjyTOeSmlgRtj66Nj1ulsPcd+A3moEaXBqEoJsbK+yplJpsdC5UQ8OvGn45F0GUMQyAwd3c
 ywuW+3sZWYgMfnlBSDtwHbDzKSigk/+x7xqWudrdOIcMQZxSzJLkEpezRLLxqF0isjBzWC9SU8y
 E6+4FNmMTe9w3zm8CibMxhMuQIu5tVwdR8j4RcvgxK9RdKA5hLOb/15pCs9iMEBF0vucyWRMUmo
 h5r8ecn62SEtldMIALn6G/aSIBMlWbfDiFr22BlIDwpjBaS6bRBdW2r355bCVKXBuG8wGz1lNLQ
 Y5yvEkKt5cRtvp4rauwCHpDPHp92/YZJwYqbIxydAG41bG2hJl56DTGBc4c2kHRpeTyvL6meblo
 bC82AzS0lnJXlbPFPVUhCf4yGbhwy6xNti6Z8s58Xf72Pz53haNd6P/FKMWOf0sWaGS1vf8conE
 pchtFfpXMiJSVS2aAUMxklVFI1aAb/RQYP6pwS9Je4Tvz7Zx2iNYdXfkwKSAT4AFOLrzQxbwptm
 ua/NSf4KMktM1JAkl25x7yc3L218MaC/JilkIS+gwjZQEjdDPSpqdK33iO2w9Ds3kvYvsGIeO3B
 KnwsQ35STOh9I3IpjwwQp1g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_073628_015572_D4261A68 
X-CRM114-Status: GOOD (  11.99  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
like other rockchip SoCs do. Unlike the RK3588 however, it only has two
memory channels, so only two per-channel pclks for DFI.

Add a compatible for this SoC's variant, and add it to the conditionals
at the bottom of the bindings file.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/devfreq/event/rockchip,dfi.yaml       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
index d6e06a9bea19..964f1827496a 100644
--- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
+++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - rockchip,rk3399-dfi
       - rockchip,rk3568-dfi
+      - rockchip,rk3576-dfi
       - rockchip,rk3588-dfi
 
   clocks:
@@ -68,6 +69,28 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-dfi
+    then:
+      properties:
+        clocks:
+          items:
+            - description:
+                clock driving the DDR monitoring logic for memory channel 0
+            - description:
+                clock driving the DDR monitoring logic for memory channel 1
+        clock-names:
+          items:
+            - const: pclk_ddr_mon_ch0
+            - const: pclk_ddr_mon_ch1
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.53.0


