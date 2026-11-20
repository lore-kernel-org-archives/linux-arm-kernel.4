Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD042606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BLePaum2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTKttV9i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y8B3yYureNWw/gPn5TmCorzbaVWuAnwa7i0qf1DFZYY=; b=BLePaum2GRONfVNhalmexD8C3o
	DzAMGPRfGNtbVxjIBBuFRX9COYNeIvw+lEn2E8zWVYXNKl253RS/gIKFsbWJoBu1psml9m0pgnymz
	y2UeTaiOFqSe9w4XDS/cDiDN+u1hXNL+S99yCaLb9VhV6aj+9oqXqsIfSkVuolTrCuSRlqW/CFW1W
	pNwgcnlPRQe4I6juYu6Sp4fkAc3YlcUvZ+I3IM6DlQcSfibBWmrOIE3L8AvJDkr3H9hVnMtTGlAmq
	i/AdRfjZ41J7X5AajSh6FJr93/Y7Z6SCbxH6ZadfNXvHMqG0A30HEDS4onOAkqfFqdBv6u6KdbghS
	2GjJX6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTEl-0000000Fuao-0Pxo;
	Fri, 20 Nov 2026 18:21:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTAZ-0000000FtFn-3MKI;
	Fri, 20 Nov 2026 18:17:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BEB4E63481;
	Fri, 20 Nov 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795198626;
	b=jvVxcEjXCbvhwEL53D9LBoYvNRjD01vEIprgCgaPSnxWgRIiN4tBLDPhC6vV/CrVSbc5
	 mHTtQktcnCw5JTFQgt2wBhiM7OfDVGCFo7JEhlt/ohEUAotjAWHO5S2Z372Wrzyf701ej
	 Wpi1mx7jz/vPM0cXcj/zSHzvrEtj9YQrOp4g/jp63lf1FqVi1g5OqeHiPYDzbbfITtaSL
	 lr8K9s9xpaidZL+7VXFCijS2BkDPcsr1usZRy9upTDvQ6JthSPqsN7hdUlvbcKGhUQIOC
	 iCA0SSaQXxIxglp9yf1GpSqQznExo0VLe+6gVByDkOzenBoLCKy4hhbrLTLgBEZjjyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795198626;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=y8B3yYureNWw/gPn5TmCorzbaVWuAnwa7i0qf1DFZYY=;
	b=RKveoIwfbtT3CxTIrVojJ5li9VV8pLD1ddfpLBkK1DHsZJhueGOJh94A9hXs566xkApx
	 +QTAup4Ezb3PpecDHt1IT8dFTd1CvzR3NCGFGGM5QCrF+MY2j7fxM8MQa0sjWw8E6crdg
	 fk/7nppLKa9S092sura2+8RhDJ2yfw7U2YPmXj9W90EllMcJAmreemrBIRkF9sLWyOXpL
	 1t/Qksw2b5Me7ewH2akg8hcMDLKxy2KvnHN6+1WaKYO3I2lhZD1vYI0xf7wRJ/6wGw9/P
	 zX1GS4U3z/Lmf6UuC0BlFiACbb/lBivIEoklXi8GFmq9B//rAhHmFRzpnnDE01Ib9BQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E392B1F0157A;
	Fri, 20 Nov 2026 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795198626;
	bh=y8B3yYureNWw/gPn5TmCorzbaVWuAnwa7i0qf1DFZYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PTKttV9iq7cIau5tOrVZR5Xdhd1o3syY74rb8vqaJh7emR/8kY1tcZUVQpf7QA3in
	 V2KXz3G5LUkxYKHZn0he019m0nKbaLJ2nlr1xC4NgI5Vvdz//YQ5iahQRsHFguo4nE
	 bx5Cwu0JpSOnjB9XK0PQMkdd26HCk2iMHIknbqutxe1KE2LEM3fyYcOMZ7Wc9Nkebr
	 5m623iFySBWM9NKPfhZ4QddfceZMVSB1QWHm4G61PPJBdfeo+rrCmVC1S+8TAv9L1N
	 saGpE0jxG5SX70KNs72fqBjeS5G3DMRnB8cN3lX4jD/aeN9bioZVBFks+AcJD43FUk
	 fY4ggGWyWzbNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 06E234B919;
	Fri, 20 Nov 2026 18:16:33 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 20 Nov 2026 19:15:44 +0100
Subject: [PATCH v2 05/11] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-meson-drm-create-hdmitx-phy-v2-5-93d622d9bb07@aliel.fr>
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
In-Reply-To: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=gEM9bIkhQe1Q+n5KKc7w/RzPzlM5UABBv5gf7bLSb8c=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzZDX/bk3+ePHb89WyPSYJnD4w2ZPgL/LfR2BOha7zqxL
 3H2xwcdHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBEnJQYGR4xbb61aP/Vxb+2
 HDjaMnuxuF3egasWCT3Tvh6fceFeoN5DRoYDTr++iG/Wv6B9/f6Sp1dbvDdqvri5pe6jn2lPz4m
 Kq++5AQ==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The HDMI TX PHY now has its own binding and driver. Describe the link
between the HDMI TX controller and its PHY with a "phys" property
holding a single phandle, and update the example accordingly.

The property is optional so that existing DT, which do not describe
the PHY, keep validating; the driver falls back to creating the PHY
itself in that case.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
index 416fe263ac92..7ece4ea262bd 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -108,6 +108,9 @@ properties:
 
   sound-name-prefix: true
 
+  phys:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -136,6 +139,7 @@ examples:
         power-domains = <&pd_vpu>;
         #address-cells = <1>;
         #size-cells = <0>;
+        phys = <&hdmi_tx_phy>;
 
         /* VPU VENC Input */
         hdmi_tx_venc_port: port@0 {

-- 
2.56.1



