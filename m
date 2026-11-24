Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EDZxOiUf;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=ZFKqow3A;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g2IaOFE3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JL3Qgy6Zdu9V5GN8HWvkTl1Wq1sYl2OXZMXf1JcFhGo=; b=EDZxOiUfpr5D/f
	4V/umjoZu3fLWD8derKtgkWjlbenaeUFIWxLdsLukmcClXludgYD8MZh4DajmWIQj8aS7n5wQg8Ik
	WP0deBAk1/0aVJZjblt/wGs0f5gQ8iweUoCH6APtbnrp4N56fKt9qzTRn+pip+D+pnA9JhY9/6bF7
	KxujfW26OTYrwvKbYJ9GZ3UVl9X1xgsCJ+OayFJOOMqIgHt/3D4TlJdKoQSqQKFUH/AsDdKcqFctg
	L6oseMbLteyzQ3wlf5MECmBLzO0Ss9UGjoRv9bIyZYoMJuVHV40rykJDmIfvuWwsewnOHGTCx616/
	TdNldjqFZgauTzb9+uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdzP-00000005Dxc-0Xdk;
	Tue, 24 Nov 2026 00:02:27 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdzG-00000005DtH-0lYJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:02:25 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ECEE11400392
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:02:16 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 23 Nov 2026 19:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1795478536; x=
	1795564936; bh=JL3Qgy6Zdu9V5GN8HWvkTl1Wq1sYl2OXZMXf1JcFhGo=; b=Z
	FKqow3AO/RPA2d6U0v60HnuCsT6mJQv6h9SgGEGOTg4/tetQuhYXCeItn82qnCMx
	8xrSqUgXiEPpW32Em1lud9QD/Sd4xyO/aJl96h/0DVC8XuaA5VtvmiXG06djhS9O
	51o0l2h2Ixt5M+uWZvJhuqR2cCzu5jRdX2T8ZckKdK3auy+cPepI4puebhrSQ1zr
	Dkofgpzq0X1F4mJRbjhelY4ToR2xiQki9mzKzgIOv3PWGeDCKK0NtaMiInq+66eN
	Bo7hDatiupC0NtI7v5nH2/O/rIWQr9neBe9dTpiTPB6ICcHT19cYX31MWlGa8hN5
	SwkLGoasTailIMd29S+CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795478536; x=1795564936; bh=J
	L3Qgy6Zdu9V5GN8HWvkTl1Wq1sYl2OXZMXf1JcFhGo=; b=g2IaOFE3ABFa8U0PB
	ctXwvD2URDVaTqo5Ryn/Z7ePXj/1Iw2dobgx/yUWHmQ/KyH2uKcLBpYn7i5z+rUN
	zqWyazHalAR7Vtq73O9vJqA1ZkK43z+KhSXNWqYYFlxeNa2U9V2yTT6tZkRWA7wQ
	EFHp0wa5B9jBscfYP5B1qK9hwWt2Eh+1NVBds1Koys76FlBr+Qo2d633c5Z87wx5
	d8dXTe9ARGGvt4Zd+AyZPZA8Nt9HuEJqEqFV3JBpxxWLbW3847zY2QNrQEmrE5zp
	0p+EIGxJ12RpsnUzqJU8GfWvl8KTiy6ODE4TvtR9E5kVIN7HV2SGw+1+xK1//Emf
	6xLBA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795478536; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:Oluqnpl5RL/Djo+IMurOqIV4PufS98zkbxN9h+dwiDT3koW
	aJv0KxOpuHqFlQx5bEqtUa5HPPMKAFhADKmU9ctlHV7eew4NCV3fVzfLPENaAU3e
	7HQXsOg/cV2uCUQg+wV4lLw8+WL1yatPoeJySwf8FHSRy/zc9R5TFlUoCjcKa2ig
	Ik8N14FNVBfJM9L646q8lTvuIKihCATOeeb5AML/rVDLVdWy5ORximkPaxYK8ewZ
	xDgavM+rmaZO7tRjilz72MXM6PQYfNQs9yH91GSobaf7bvsOw72WXdNz/xfA311Y
	A6s2XU1u1VDZtEMJjaNm/fa2F0RR7WbAd85T6vQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jiVJd3R6hdy1hOaQm+GRtS/51voX6k7EnP0kvg7Pe5E=:ANkstA5lYKTOgLdpX3zjs2D2gIDyAH3ceoRvnlM8StI=;
X-ME-Sender: <xms:CNQEa0QU7nxzDePsyr8i3xmbbF2mw0BTLTz1rauGUn9evoliHXYBZQ>
    <xme:CNQEa8KgtFxzU4Vh8AB9FVycAB_21RCNerJ5Mov0pRfxRaYwfJhD55MfQXLxHwOsf
    N1yoaF2T3N_NhyFZOOebenvnd5afuWg5iMpg4sXC8YBU1vfWU2emmCy>
X-ME-Received: <xmr:CNQEa9Y_CMwvJS2Dwc6tlby5OQOLikjLl1j1_86j54kg_RUhkyP0Ttm2_G7qWLgu_Dqj9w3r>
X-ME-Proxy-Cause: dmFkZTGEhlIT9xPRA8308BbHtqEEwMB/QskSvZlBy2+jFJwvtvfCirBVTmQimOCxW6z0/I
    N3fQ54j2uzkfIPiLqru0ODAgPBYDp/gZpGlhkMMOs9hof9ZG9GEOWdivyiuw2bnIONku0f
    WjmY8ul15onHL4eXgbBkYGjVGEM6SHV1iLYZaKVJkdDH3DHIqCHks7YrVY+mw1lm/Lplg4
    vSpMyj3j9q6sOZaTJVZd7ureJCnCjHJkmaDoA65nKLS/dXaLRNB8dxmmJokxzDm7a1gLZe
    vv+kmS5leROp3LsXetZXye6uoB1rh5Trh3ziYwSHciSyu7VL/LnTqx4QcFZ369FhHiPhX6
    7qMgCUUgRTYvnSceX6g8TlNjrvseGChimQ2uL5/UPnolD9ExtQx90gU5jyLWx+p3EDQlT4
    UDArTfpc/8Z5L6LrFf6GVl6VPvZVPOoVG9Ef+PjEsOTZrxzQn41TuJgMsxtwgpN9tica3k
    /bM28FMyvcoIjOtpkDXjDdu+DDK8CLsohz94hhBnXq5e9Is699FOHYUZLZiwL5ZxgG5Spo
    9ZWuC4ZluNyOzq9If9HUZ/+5+TfGiMQoR3WAdtp/G8jauX4kI+4GYW/kLVIWh1Q9d2pDzC
    JGmZPMPrhqxFo9TXatBlDsIJ7gyWPgwoJhGO1q+Q9SRgBO4qclrJxac8MNNg
X-ME-Proxy: <xmx:CNQEayAtxQOnJk6XgF2DU0tPHIoWvGW2Ms5epOyl-KGWRiPKpKQqiw>
    <xmx:CNQEa3WIN-rUiySS5myOFEKopLwsvTWvBUy0BV3ScBCFoCcjzUiPGA>
    <xmx:CNQEaz0EQrI-v8c62I9ve8TAhE1ha1U37j-NiW68ffEfvEPhOi7nFQ>
    <xmx:CNQEawVUDg6r2Af-WMgS1kSMJ1nLokV_3ElVm8PctJSwCVO3Z1nuUQ>
    <xmx:CNQEa_Eve3L4R8gm5f2Sj2bW2NUBo-6MWorniFLENug8K8BMWuGRyWrM>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 19:02:07 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: ddrake@baylibre.com,
	royalnet026@gmail.com,
	sidong.yang@furiosa.ai,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v18 2/8] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
Date: Tue, 24 Nov 2026 13:01:37 +1300
Message-ID: <eea37bd2f486b5855b314014d2e4c3049c666bb0.1795478392.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795478392.git.gahing@gahingwoo.com>
References: <cover.1795478392.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_160222_253507_1CE10958 
X-CRM114-Status: GOOD (  10.22  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3576 uses the same NPU block as the RK3588. Each of its two cores
has six clocks (aclk_cbuf and hclk_cbuf on top of the RK3588's four), one
reset and no sram-supply. Describe each SoC in allOf; the RK3588 still
requires sram-supply.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml        | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd..2eb9337819e6 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3576-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -33,14 +34,18 @@ properties:
       - const: core # Main NPU core processing unit registers
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: aclk
       - const: hclk
       - const: npu
       - const: pclk
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   interrupts:
     maxItems: 1
@@ -54,9 +59,11 @@ properties:
     maxItems: 1
 
   resets:
+    minItems: 1
     maxItems: 2
 
   reset-names:
+    minItems: 1
     items:
       - const: srst_a
       - const: srst_h
@@ -75,7 +82,36 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+      required:
+        - sram-supply
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+        sram-supply: false
 
 additionalProperties: false
 
-- 
2.43.0


