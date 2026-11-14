Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57D860A2613
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OnU+um2E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=M0uFKQvA;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=hmFJBlo1;
	dkim=neutral header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=02oCrzVs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N+9Y3ZHWND8ST8ERZZyyzL82Il25wWJZbVPoJhmWdl4=; b=OnU+um2El47HI+
	qs0kSH92cgatseye/DITvA1fbiiAywjvoGkIHuM5dnUwTETsAAOkX39wWi17xhnM4HrKtcysXFM9T
	7XCC6fgfjjDHuM341aMKMLahd7PtA+kMc7Js+MJHU9kfisI4YMd7PxonKUfy1IsCs9+zVJeB1FwqM
	xaK2LwNEemFKZ2QMolYLKpYpSPRSeyVqUjV6pvzt20uN9eNjRWtXo3e7GgVLgqlKRxeeC767iGERO
	+WesYjnvCt+1bvLljpISbhp0sIGBLXBE3rml1JIiz5WN9N4XdqtE8SfrWHiDR3ccimBghHlkjdICJ
	Qra6/WWq/lk0OoBhl9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS46e-0000000FBiR-3GqM;
	Sat, 14 Nov 2026 03:07:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS46W-0000000FBWA-0nEC
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 14 Nov 2026 03:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N+9Y3ZHWND8ST8ERZZyyzL82Il25wWJZbVPoJhmWdl4=; b=M0uFKQvAsLjw7Y6jRlLZA29Whe
	/vY1Di4M5CFTO4qCacEEsavOKZg2yy1v2/tWEuCqzNMg0UWg09YCmx1lZEg87NEFcjw01+eOv0O4c
	tGL8ihc1VBvyRXGt8sCPP68qNkCHO2t2BHSIBR/rh+I4LLBLgCzuywiHzJMVbXXiGQ9SriSQ8KGXX
	bcnPJlBoOAHu8t6T7mOcanGIJHYIGRuF121ciTTpbX8ml8uxMCavpkFHtDOVOnoT+Fk4Jfpdoeq6j
	zc93Uq/vrNFg/VuLaOi5eyVB9tP8A0JcbYCyIK6EXCogU171zLJG7FDp2bzbwEdwWwGTQ7cIujyY5
	T4H33yhA==;
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS46K-0000000C5iV-3ceY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:06:57 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 9E5BC1381A48
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 22:06:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 13 Nov 2026 22:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625607; x=
	1794632807; bh=N+9Y3ZHWND8ST8ERZZyyzL82Il25wWJZbVPoJhmWdl4=; b=h
	mFJBlo1z252QPnZhveWFXdEwvah8nHxZD86blxjM2ZZOV8D1MY9ZFxAcYdDNWPKD
	lrVlltL4N0t8k/kI1zgDn79W2OaPHUjuM0PantmGbC7KZk1g08lWmoBvyGYgPSZ5
	wILqZPLZzXUq2OUwRGWW4IFn/L5ysj9NyQnlNVMd9KISPn8lwaY5V2gd7iQkqZWF
	h5Vl/rEfLQu9pTtWHqrTRVpE2xvexSw05G3QpssqXsZQL6DI1lUl+UiSZOTpqTxx
	Mq7RZsA4CMhQT67fc7PGBFQcp1EydmdUhA0ICdhxhP0QFM0tjNvfXnlL5GuRa/pE
	yP7+IukD01isOeasRU84g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625607; x=1794632807; bh=N
	+9Y3ZHWND8ST8ERZZyyzL82Il25wWJZbVPoJhmWdl4=; b=02oCrzVsPHFU0PiH8
	woZAbQuY5YOEAqPsWc6K167EgqRbUCrrWVBKj8k73THjgy9qwEKrhVjZtWOPoPw3
	0zu7PhBN9+qmHgTQY4/U/loWisUeVU3Cwed+Zam3wrbZEX07q3h6tFZqWinRj40y
	XnlPeoosVDhEtnx6PKor9Dau39xZ/7KmNsTmg1IaCMs+m+BNVm8tK+IvTG1O9Vht
	dSDgyaa9eVTulk2vjzPdiV4Tyj/hcp7HEQc3Og7naFtdIkyjnhPPPzJGqTOhcbMc
	dbtIF61k+fo/dwzKNaOycvwNJjZNP26BnTy3NxLan/PK0FtMSh+UDfPLfCRr2zXb
	kSV2Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625607; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:jAv3FCAZxy15whbBcKrjwmRctl5sMWN7pwkvBD7M6ywqyga
	sGmSCQebjkezFT7588Qhy6hWDhMShV3MwMyFBbxHzdIB2Fzv0tK+mwrgOcxMm81n
	ujSwA6cDN38o1klVbK941nuui9ojWYAlueQWyihtSTgbSgcBRJMAR3NT1jZcSSqN
	sLHi70SLAmuqFenhZI6AwXQinpuuA0xagzatd+OmYAH+jZmPYoZ5INnjA+yXjY/p
	tDN5lRweHqyqHoH8CIWCsPcYn7iumGVVCZq6oeEKiyWX3weY5Gho6gaddH1qkB14
	tIXTrR5ek6iKSW+M66n1CXP9IRA0Mz6sCaUwWYg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:G0rMrLQgBxn4OAvwTRlSphgqx9ONQzzqiiQi5Btpnrg=:E3QG1wpL1G3f8pPSmRg3P12/DKKK+lX4bpFVJJLsfbA=;
X-ME-Sender: <xms:R9D3ao4GXcVrBtILyChglSVcmY-nwVOlE2UZAOotYsYxYlP-NrrZaQ>
    <xme:R9D3amCpRdbEJTU-BU0RfXPxqr0kRdfZe5MD4TkundRlTk10xlrNHkfiNsTlRsZfZ
    7ac8hlcXjdX1snS99bjCHWj_ECEpl3jGtQIxMhPUyeHFC51k6d7UWcZ>
X-ME-Received: <xmr:R9D3agt6qvPfKvr8UPxiW5Ni1XCm7nSxgKCMumkJZ7Y-PYFFrhElxE3qCwFk_MHKts6p6QKx>
X-ME-Proxy-Cause: dmFkZTENh3Cq6bNtRDDqH//naJpK03OGhXB8Cp3eHHX2EpHYf2oBjZ1/43ruyqVDLzR5bI
    q7gV+k53czH7SJj0JMNaMvWBGkaUqaereb01ifHpul1q14DobEKJC2mDvQQE3HzqoOU9gl
    QO0UnCSJOnNpWmY1qWdj/IivEZ+5eJmA8XcRYmqsfPBSZaKqk9zCnQvCGUQuYFJdsYZGP5
    L8zECb373LU+oefpY9jKwOjkFDiU4CWxV3iExHL3zPnpeZwM1wkFJxhm/yJk+2AJ3ju4OO
    RXCknd9xSS299sQU1FiikwzYfEAyF9m0XTBIDoIn2qfRRJDU3uzKkImCFIAQPMS5Q++UMJ
    HNGti+0chsjtgHUFHERda/e1esdxvF/MLapAIbUuAA8i/5FCjBkAcw5N369Zb1h1zT9bJ5
    6m7RBUUXtquxt0RqeHkHOekFzPQ77KqUX4LxLzfAJN6IjAPwHnrvYt1MpX9r/enJ2nOEql
    bVS6HYaFJdTO5LnsW/AjFKyK0zv1VoUA5EtHmfilWRIc6TWsAZHvV6/FKjBUFjB34AyCqV
    As7v0V2ObOmVe8tSCaESH6Uh0AXx7IsFxmAIh94XZFQD2nV6GGyw+HfzGwCwltht78VCM/
    NeqYAotcOPiXJvEbQzwmLaKDYwUt1GYeDCnzXCwXhJU+QCtmjewixHGi/suQ
X-ME-Proxy: <xmx:R9D3asM9Q0m49OQPHsJ7heQWwbeqZlQW2FOL6veyn0aSVqa8lP8C0A>
    <xmx:R9D3agV1YvvBbE7Ef3wX4DvRZdJTVBP5fqdZLnNznZb5xe4P7q3ZMg>
    <xmx:R9D3avRFjImoTT6eWnfx8DGeVfZzMGP7WaiVqUfFW1Lki2nsVgRZvQ>
    <xmx:R9D3aoaDTU4LJunbR6TnjFVryxsIxtLqyJAoELuSVbP-v41H14Y1UA>
    <xmx:R9D3agw4r_dvEpyT0t3EpwPTpr23kA2D80R1Sz_25EalAwRsI1xvvFD4>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:06:38 -0500 (EST)
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
Cc: royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 06/12] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
Date: Sat, 14 Nov 2026 16:05:23 +1300
Message-ID: <381d2bc99486ca312e1d02f482eccd37def29831.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_030648_992417_3550A1F7 
X-CRM114-Status: GOOD (  10.39  )
X-Spam-Score: -0.2 (/)
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

The RK3576 and the RK3588 use the same NPU block, with different hardware
resources.

The RK3576 has two cores. Each core needs six clocks, two more than the
RK3588 (aclk_cbuf and hclk_cbuf), needs only one reset, and has no
sram-supply.

Define the requirements of each SoC in allOf. The RK3588 still requires
sram-supply.

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


