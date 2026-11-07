Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB260A2637
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AJfUdwnQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOHSvOJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yNswxtZ81Zq4k/yFcNT1xtCIcoPyg8yyYeZaCb9JfQQ=; b=AJfUdwnQ5R92/QboL3U0ZnkBol
	3Skq2DTNuWSvRcQAtlsBBKQkJ/aLdB3aPqZHre2BcgxICc4n1FUjk/xZ4d52qC8D95BL8OP3pU60H
	vZpiB1PJvUbjzFB4UEeIRA8IgwC2+9HMyQ9KYH0bdUBpWIWCCoJBNDVWmxsMLiU0T0EJfjX99eH38
	0k8Hpq3FNUUYjZ+UqUI+enDHQvoILRSvlfQJgMqvgWdDvPxYoZ/TtYIFC5SPYY0mtrRXHhzP1BU3m
	HmknqZm5BWWdbeZMG3vxKUvDayvpsY73T86pOSUFvLz6UiWR7pv1e5UGWIijIIP9sCIm1s0modnbg
	fciW9FsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdzB-0000000EYL2-0jmA;
	Sat, 07 Nov 2026 10:49:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyv-0000000EY7B-2d6r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B9C2437CF;
	Sat,  7 Nov 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048549;
	b=1l0ZAqMN4cBsPifAPu1xiKqMVUUVhRx/9nqsbnQ/nHkazpBZhz4fP0iY9DKPvkEGkRz5
	 TTAugDT1KUIPJLfXQ0a2UtuUrd2sOPeH3F1N7UH0YW2yGooAAWHns/JckXcShWd3XQ6ku
	 vKp9fxr2TukKcdUvtO/D0+ZE7yVkkqemiwxH9frUw83bsMYsS8eItpbpPCagiHcbQtEK4
	 dPLAr37thsi3ovYfyTeNG0FO+r/kKfp6ixz5uXJORozVZFZ0IUa5+NUOIRsH1zEI1LhAs
	 gGHaB+W4r/MvgNDszZoAl4VDIGeFf9tbs9DsK+rx3PTrCgHsuT88MXlY4I6MS9fqE1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048549;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yNswxtZ81Zq4k/yFcNT1xtCIcoPyg8yyYeZaCb9JfQQ=;
	b=ttTPoBsyDZfa9jbckqjGDNhO6tiWNGpQKb95/gB5iFnmsh4a52dcYUy4X050jPMC4zyl
	 fjv/JYIbnwGZaBXyTm602a9LLmpkpqytd83OosHLGzdy2HXr3F9RjDObUCj+x0GeS8W2X
	 IrIgy2JZb0LjcEpaPDe7UxYm4ONvKmqSUmkSUzqzBKBVmBrKHgDMB2GeWm4/mhiNDGgKi
	 HHvR7N0zaRiQoG5uBckZAd3GzvvDiF08WRkgDDDAVmK14FU1KfQpcRftolyTF2Tj1z65p
	 J4edYLnm2aFzJSjgW/PS8IDtiKVNR8fhlJPb5MdW66mx44wft76Gqo9oZ7gFn6Ejagw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA4691F00906;
	Sat,  7 Nov 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048549;
	bh=yNswxtZ81Zq4k/yFcNT1xtCIcoPyg8yyYeZaCb9JfQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iOHSvOJsQOdDoim2ZyAkdv0GaPFGrwU+HwxE5VmWbHJVIYDWTuAJnO4IhfgOhDery
	 ygsciYlOtxw2+o+l2kDH1KGgKp6swFbj+W0B10qc14llAQLxfM6Y98M6tyX2YFQGIh
	 oFQEmq8jjhh00uV6X2rTmXbuCUysMTr8t54ufOrVyLlyVyhnn5W5XUrBNOWMSLnj6Z
	 IEY3Y1/OOlZPu+UJHa4KNDN21hV7OEgbdxtNfp1h6/t9pmXaG/daJLU0jQdx+sM5x0
	 zaSPJuGfLN4rIOYQ0HsMbqvWtpDmFILwkMxh80kGB5j1M7IMviiW5SH1TIEaiXK0xe
	 Z5wFr0aNz31vQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4EAF147BA6;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:49:01 +1100
Subject: [PATCH v2 14/15] arm64: dts: apple: t8132: Add PMU Device Nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-14-acf1e78da039@gmail.com>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
In-Reply-To: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=844;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=3BrxbOYqTLNeyKHRZvsGvB9dy6HUAnTkRir0SxA2U9k=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zyZ7OiDOQDNK9237x7IW7s5Pa7zM8UpQ/5rJy+
 6StHyK+vU7tKGFhEONikBVTZNE3TdOezNZwqXSZ6xaYOaxMIEMYuDgFYCLKQQyf2f3f/VI7fX3R
 vy1exd/159YsjZk4Ldu31eCLtbxRhjQrI8OBOzYqbUW8d/995o7S+Na9lf20dsCFX3f5DWM73ns
 VMnADAGOFSaQ=
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
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
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

Adds the PMU nodes to all t8132 devices.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t8132.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index e2e79c7e7fd0..767e622136c3 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -197,6 +197,18 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,donan-e-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,donan-p-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 

-- 
2.55.0



