Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F557606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzeK3NHr;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=BMA63C6z;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pJS20yV9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8MaWwLX3cvqigHT35k5vI0q6D8vrfBSl5m+5djh9nLw=; b=AzeK3NHrnJtsCw
	fK0GGdqrIGnQQi5iBykuRyCY1cUaha3GiIdB+4fgryICJK3zzVxjoGr6XsoJFdjBVw1XCo18qBpr4
	0K6Q6KffLm86msXN8HT6iDa0N8EHl5MVLu9O5GzhhrRg+KEhSsE7wS0LAoHsytduKdbjL/Pco6on8
	Ge/7eSGUNLgAQe0FxmOWTmvHfR/YpB0wBhu6Ds1FNqQ8T8DU4sB0InMzfBX/c6sAfE8cUpSrA0G5C
	uafdHLut52A+h9ufXAgMhFCPmUicqJvEgjOz0wcRxDjgavP8d4So92risjSPCCtvLGQj4fmxDSLNm
	HdV/HtRoP6x4RrGJzfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdzY-00000005E2g-1rcj;
	Tue, 24 Nov 2026 00:02:36 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdzQ-00000005DyT-3gJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:02:30 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 088C014003A8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:02:28 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Nov 2026 19:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1795478547; x=
	1795564947; bh=8MaWwLX3cvqigHT35k5vI0q6D8vrfBSl5m+5djh9nLw=; b=B
	MA63C6zlWBFAalgP/7fwc1rwQQmgneQYkvk9+GMvgZyrz3lXxUHEi9cYKDUgQAT6
	uW8w0w4yuZ2f058v/8LSlMiC+bvtrHszrDN07es2m1BQIbQFGiL09/taRWwA5zDc
	G8zrjnAhlKm+k4rO+WxQOBm43lvvjillunNbGcB57INcfw8fXJiaHOrV7iyApcCC
	PQ0LLe5fj493cNUaI+Ev5t41n/sL00zWkoeLaLv/cKh7TyXfQVofZ6Clie41FA3i
	hivA7pgIdzow7+uqZeMMPcBrbygmVzlhDizQYe/iXHkGZ2n+OJLrOhx/yu14Q98Q
	aeFSHm8nkiD3h7AXyxbug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795478547; x=1795564947; bh=8
	MaWwLX3cvqigHT35k5vI0q6D8vrfBSl5m+5djh9nLw=; b=pJS20yV97n+YDrMIB
	2MDVY5jq7wK+ZcepdZCBUZTXZq8MSMVqyMpQc9I36QcBcYST8rGa1PUYMPPNPjqi
	ZggUibYdg4OFtDzzBendu5l6PWNFqV9w2u0y3+9rKwQyrydhLO0SYYLqt84SBjMq
	GzI5jNNlNZpZ0LzeN/KU6e4KD6/y/ySIjh2Dxp9CSVHIlOrLFyqVvirIUhv5AFUW
	t0HKJ8HTXJdFzrfHB2Uai5pluwtYOkPSJVqgwFC+SBbXpyfnCsThWZsOTIYxOB7P
	X01HrVgkspaKkxwznS4j0vIHgP6Z2u2e2t9XWTEdU+KjJ40/f2L3oTOcqWuYGCV7
	278Tg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795478547; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:HvM10sT9U8WaPzJJGO129tRP/Pe13wuPr0Xg2mYgE36Irm7
	TlsdhRz5mT/PHflxOWX/aPuGwi9EC4WbLDs8/+n6TcPZyDr9gcXJKcAmgIDcGL9A
	YTOlT163Cjc1erowuOEgWWIbiOxyh2SX4WkgH6Wes0rQv26XbAly0jqFsTnLcRxf
	TuKlsNj7sO6VAsZi8Mr9fwVeyH5GHNiLpBK0ae3r2t4mZoXUguCYk4Oh9hvM9Jg8
	y874qN0TMmSXmyMgp7MdcclWfExaYYc1xk+x0551+qPE4Jq+fkHFbiD6ZjD3KP2G
	UeuBCZ+gVPQBUmmhuezebmSNmuSVcnygZB+LBZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LZ9zBWbAheslYKhTjuQGFcOGRMI69/1Z+vf55VwAtQw=:NYJCNTHvimgXVOCwEztu16OEei3WmDPKM3/uhDJ3V+o=;
X-ME-Sender: <xms:E9QEaytAUPqPsQWmtnezfVNis5iuLOVo5GdJrNP7QxYRetDEVV_INg>
    <xme:E9QEax3c5r3k7G1vR77idjjVm0mhl1TniCPrmwPvX89yEEXKKc9DWk7u0sTe3i7z-
    2mJkxzr3hmNYI_sz8SRi6_RNgLFyrqN-PSU6z_tYJT9qNspjbO0Hic>
X-ME-Received: <xmr:E9QEa5VHo_HBMdvGHxXQAEhYxOWtMjD-8GVuawMZDjio6xwj1r62gAcIqyxPgZu2Z_j0pOM9>
X-ME-Proxy-Cause: dmFkZTEIvCBAqgUEloIsFZ3FkPJniX+pdPbA8lwmlIZBO9hGOTGGz/x2Hl+7nFbV5nyvKp
    t925nNRn8DutQCQinVZPr73dXFznYxFvXbL116jqCZ/GfyonUZh/Db8T2FiyXrfT2tvgmY
    iobzatdB+GcoyC0jM5VyW//zQbbnDI1hKnSbxsDcxkUlD4xzycqbxXM6vvDpB+AvPZI9PO
    U/XSWb9pjObA40eWatkEvdJBkQEqjCEU+A4urP116L3cv2N0DBt76GIBJcBDbwZQhbIQjC
    SOwjlJv+Q9QIaSqFf9Kz25pG8hZtrsSllc9yq5WXEJr9X0qGFNbX1Y7L6XZjelykM9LdqG
    HnKWsDdr84ZbAJEC7w8MY5m2ihxoOMmdpsENx+adzCYSZjHUXDkWhh0l5piCPDMMHoRxwV
    bDHrDmgw5eSmNgGBeo1hvOR19KaiyhM6ilg0rmGodpE/pCNWnsSpiqOSxrVhFLCI4d6me7
    Y1X+BDotxGqY5KyIiHv2HTLRLHgUh3WYDkzFEmDYDo/y+MREe37IxlxJREhOOh46d4En8B
    N3M4YEN02ASI+SFYXoxYmZucPvgxDWxua/myPr2jF0a0dLEtSj607sCqlqPNc0V6UU4YRs
    Hf4hSaeBh20yVBY32s17hSUVR7nlyjdR2H1fudDrGmCzos5lnEtnrdX1zu8g
X-ME-Proxy: <xmx:E9QEa3MT0RVMpzRs1xWoLVD8LoFBI2nPim1tE-DN2KJMnSYvG1qOQA>
    <xmx:E9QEa8wru5hyrUIa9DB55M1qIY6DN_HDkYOajCulHWkPvhdPinaGYw>
    <xmx:E9QEa0i6Qkv-AsMIdwREnwkI-mFPtxITc-CzTQcGMCfzvxk06VTtww>
    <xmx:E9QEa7S4DTN08Ssd5l7JXe2a13KdwaZqcvx7JLY2xGte6JIlcg2qhw>
    <xmx:E9QEa_YCRuoM2WCfI5HeKZpORo12duwe4nuABfy7jUWjO3Qfo9dG2rbJ>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 19:02:19 -0500 (EST)
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
Subject: [PATCH v18 3/8] dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
Date: Tue, 24 Nov 2026 13:01:38 +1300
Message-ID: <f44a5cb03bf1ac543d35ff30a8411d1ee95525c3.1795478392.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795478392.git.gahing@gahingwoo.com>
References: <cover.1795478392.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_160229_019869_4C50E04D 
X-CRM114-Status: UNSURE (   8.81  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3576 NPU IOMMU is compatible with rk3568-iommu but needs four
clocks: aclk, iface and the two CBUF clocks. Without any one of them the
IOMMU reset fails and the NPU does not probe.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iommu/rockchip,iommu.yaml        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 6ce41d11ff5e..e40c9ac2b463 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3576-iommu
+              - rockchip,rk3576-npu-iommu
               - rockchip,rk3588-iommu
           - const: rockchip,rk3568-iommu
 
@@ -42,14 +43,20 @@ properties:
     minItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Core clock
       - description: Interface clock
+      - description: Convolution buffer core clock
+      - description: Convolution buffer interface clock
 
   clock-names:
+    minItems: 2
     items:
       - const: aclk
       - const: iface
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   "#iommu-cells":
     const: 0
@@ -72,6 +79,25 @@ required:
   - clock-names
   - "#iommu-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-npu-iommu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


