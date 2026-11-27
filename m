Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0BC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qCli+F7g;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChdjrnbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=; b=qCli+F7gVp39KbplZgJZ1hBJEq
	gO0Bl5Ml6mFQcs/nQWIh1vKaGrHGajX/nOEZCvt6XzFYm7hZf9/TFSzBi1zEA7Pz/UHnTxangQi0H
	LnxH2WNadVswwh89NHenMk3qiYNMPWG/Q82xu7fj669V6+rGlcpcsRnYLd7bVpcKvdTazNVCjjwTl
	QpcSGCFVx1hfP0uoVakyOO2NAIgvMBmx6HPvHO67btfqkGtTyqKRxdvtHczSTRTMGs+7CnlRfskR1
	SNbP31VZTXJTt76+0SOT7c0SkNgj5lJmcRz4oxsfy3RIugQkuVK7K1YhoC3DFpFlN21oQGerkBd4u
	/xb5yVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmYi-0000000Er2g-1n1O;
	Fri, 27 Nov 2026 03:23:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmYZ-0000000EqxQ-2AXq;
	Fri, 27 Nov 2026 03:23:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CED1B4086E;
	Fri, 27 Nov 2026 03:23:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749806;
	b=rsyO1rz8EXdok1QXs1bSnkRo4bGIWsCD+7BQRt5XnIWBWipuPAG6WsNmb389gbdVdJax
	 Ytp05j6en562zc5yy0TUOAlakvwcHEZy6s4kCYf8dEqxn6ZhfQVx9vIa/tjZkpjMRuCvs
	 xXMpcg69NoaiEZPooiI7iZoo9X5+zBo1rreBEVJZZ/UVCLeojGv6W31e4NrE/t6wQ+bY4
	 GKGpmNtImdDAOxn3uIU3jaZJYoMrcX9KEpiYaueZYver19SxtuFEUg4IprH6pqvtTpclY
	 7gyVKhdAHjvxwB+++tIGntkhuRvmDDLnmqWWwy0xmg5fIcpzzOIFYTYy/lJ4X/xsp7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749806;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	b=HyJn2l2jM02VX+GFXFhSqZAkdLifFsUgBWN7RD14iRAz60jhe9RMB3qBmi/Q1xh2Lkp8
	 Te7LruFHqjKrrfqshAPwvYEiTnogd+9AhfaN6NnxFSYW3mMqARK6GpdH0XT6IgTjv2m+T
	 aN8IgeoD7Pz5s1scSeal1JY5rFrtLymppXfdEXXkmy4+gihZEGlnp+OdfbNmJb1sm3Nlg
	 hmKQK4Scap2j6pC/u4jQfte7crcUzLzQVuPjJFpzJt1uh6nK2OKpptW+K4GmYlNzSa4pJ
	 Jg/aGJLZDgBHjTxNbujJFSn8GXbSHk5PkZo+NO+1QfTr+2V36VTgmA4+BeADgiyPspw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A07BB1F00893;
	Fri, 27 Nov 2026 03:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749806;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ChdjrnbSWlNi8OC/H/Twx8osfNgVL4fbbbO2I9LXMtIP7Gv8MrV/OJb7N3pmJ1ler
	 y63v3fcfkOS2wSrPnK+gkeXrk8eAWGkqikux6hKISV4MdEWIv8zkZXEpButjaMpene
	 KWDiVKTHHW3HFjlgH7tfVK8htA1EPikW8w+Xsv/W+4G2FSOCAoVR2ogIzf3QNhvh2e
	 MWej3W05w+umZ8mouX+gOcIcc1sI9N1b1ChJ9JAr3N//QJTtGbNYucp2bVnBb7nyvz
	 zA14QdBGy83/fUpNWYLZdZjRR6ZXNx7E3IHIkW90iH08WTXPj/+f4S/bq3uwZ8O12C
	 PbM+93YCXTOmg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2B5CE4B536;
	Fri, 27 Nov 2026 03:23:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 03:21:54 +0000
Subject: [PATCH v4 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-a9-ir-v4-1-820209515755@amlogic.com>
References: <20261127-a9-ir-v4-0-820209515755@amlogic.com>
In-Reply-To: <20261127-a9-ir-v4-0-820209515755@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749801; l=1145;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=rmPAoSNSZx5LMEoeF/b4E+Q1f6fRs3+ubaclp6Z1pc8=;
 b=SDByBrBZZqFxlr6BWJd3MQAjvYPpGxvnC2xMExDusEjm2PDIELuH80jfKJiOQZapHxLDbN/JM
 +24LbZZtl4+BrMWg6//YnTn1ecghq52cSV5HYa1KUpOd/m6BQ2uEW9D
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0



