Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eykpMz3i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZn3M6ZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=; b=eykpMz3iNuCYpB2qTuTaSs3XCA
	KBgJ02DaZ2kZEiXT0eq4Hzlg6fgUgGzutVTp+n9uDk9d2gc5XwTrmRUeBIATMFkOuVXVYzFXredGM
	6p5g0vv14RQXVI1y/Fig87+sF1g7dlzikZqI2d0N1y/R3w8o94o8rw0OWptHiJyPnaZeSonKIgInl
	0u2LVFVxtKrjrzqQ3b0RjiGpJfptlAwd+85y5clWllqtzZh+rQg4/ZY9o8+CIepN/c3Qz6cT9AWhR
	BdLtHx9ZS8uzboHSfSSGo8CK062zGx88iCOMoH3ZJWr0yDQwciE+NVfiz33l7t2Gi+8ZbUQ2vZxmi
	Tk77xviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrzv-0000000FO1B-3ypW;
	Fri, 27 Nov 2026 09:12:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrzt-0000000FO0q-2xka;
	Fri, 27 Nov 2026 09:12:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C2F5436E0;
	Fri, 27 Nov 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795770720;
	b=zJp1B9Nz+duDBMDFCfLXAK9ccgl+OUtrB4Pbu4U/uTjuMPizQIFhQIZuAkMb0eCF9qDO
	 kxfwtM65Wd3rtx1LPFsItO/W7Itn0X0eyz/9sfsdAzdCXZenowrszYQsISoZviKhjm/y4
	 YViIUg/R/BtHEpk6mYwrPyngNXZt5HeoPlRHH4p/+AgfV4Bb0yQkNawVqmvRJatPk6pR4
	 bamyhRQhPE6BdVQiet32uvZKMHU2iC9yVtq+W3sB4m1Q6wV7zqJ/a1nGS0fcFeS1DaTXj
	 KcTsSaRF9U62rTxW02GHo40ze/kkcphMqCng3fXypdT7+x432vKD3tTkia+Phj6tCtQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795770720;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	b=lWJtTdHLleUyp/0fYIE/xYMQnPa2ERFpX0MrSBx0ApASMZNIoqy9j/cj2VKLi4EVIc8i
	 OuYHrX7M9WoIVHfIQDm/CMlhRrWZT5hhYO29vZXbVPJ6rZEuwYX/DQIrGH4YG3RVKavhx
	 yTVonQdTbOAcj8AlzeROcyiHOtQ91wrJymGgz2KgS4j+Lm+AcSU8lR3j07/miv72n6jRz
	 blrekCo2K2EkgfFXVTupaco8uHsbYqtQx5TsorqunZTjAhjg8Qqjw2IX+6xm8iI7QnIxt
	 qbhDwM7VJ66MxMoY19YkDY0e/wa+xhRGzF8U7Bc13WNXIn2XmvLfn9IDCu+eR8AjEVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EED041F00925;
	Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770720;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kZn3M6ZXKYb/w8wGbh69m5sDhY7kN7GqwHISqRVzS1Qvzuef1MufRSYWlIXn5AQsF
	 Y/h31N3U4IImKPvBgctgGtvSNzEC68JfRt/pMG4bL1A1LRaHhwM/qXeMiB26VR4W8c
	 SJU7jaMRpSYwN9v0a5/yrZXnoEW38FvMy9ctTw2lZ3dxjhC1m0dFhLGdADI9CImCsJ
	 hJmuRrDvLZfT/+a+FwLCLKrI5G7RJuoTs/4lUNOfIMA2XNaUky8a+V0OXggfo2HmMk
	 sQSyJA3KjTOJe4SNJRM5nuge8P+q81C3x6pqssV9KPUK9esVZakjPsFonHGiPc1eSs
	 8fRmz2CXqEDNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 79CEE4B6AB;
	Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 17:11:27 +0800
Subject: [PATCH 2/2] ASoC:dt-bindings:clock: Add audio power domain for S4
 soc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-clock_audio-v1-2-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
In-Reply-To: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795770705; l=1619;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=8FHHLcJZtu8lo09r1PD8utgqmy2N7M4R5lGLzc1tkrA=;
 b=S5/ZguzthjI3gVUjCh7bFSWwXQpt4KWJI/JOEdlhWakZ84ChOO6sR/8sDkcQ47HcXY+LnDgd8
 EVXcg11kSBQDiP1TOsfR/KzzecBkhRsqAjyIHRKX6IB93LBOJjxr+mx
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..75ddaf8d8091 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -100,6 +101,9 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +119,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,6 +127,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 
 additionalProperties: false
 

-- 
2.52.0



