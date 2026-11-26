Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D447A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DXQ671Dz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNEYbRtd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ncZEOFwP6rVHKLPZIgaSh4joPCImz4xzJxYzeEGBoGA=; b=DXQ671DzXabwQz4UxpCR9SQarP
	hsz826wIc6a2CG8sYW5VkeWrVV7df8fpZE3tLjeYbqfJutDtxa0dJnCmooz681gUxm8uUG8moiwpX
	t1OO//q6O/m4V0gg5TykjNGR8YsCxPwIPqoBpnczFjSuGyNCOfSqn/bHFedjZh/EmiOjamOHpZoPd
	7MnVkAm2QNw6sR/3n66rrTJUL4xUB2uLZGAXCLYHS1PfWaf8Yx7v6VlRAk65b2RAuSN8gZ7uqF/97
	LLJmt5hAiNQJLru+4vUyau6cF+fTJdGUY8WTtDLrqnpjK6QqSC3dBHqX9O28txBoUQ/vL2RVkof6x
	CfnGhK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVip-0000000CYH9-1BPU;
	Thu, 26 Nov 2026 09:24:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVie-0000000CYBn-470U;
	Thu, 26 Nov 2026 09:24:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CC4C62C07;
	Thu, 26 Nov 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685084;
	b=rsS+J6/X9TbZUoX65QnBFR31jnykojmYoTsqPRudBZ+uDt8anZjcAZ6db/aFjL3BQpzP
	 dSSxnQWdBa+gf8/a8r2hsbxMq5UHbbAAPwuDqBpubbEV+4FproH4Tw+DTwHrkJfRmDLu6
	 jbmQp0O0ytjDW6DCHpZ+HZYUeRCsILOEPGibsMsBDmZVIlmMmnt3Xa/pKYaHh7nLVFHFk
	 QPRKAwNAY3UPaueYOdeGIil4pmL7yEBIZx8evfVVop3lh9ZHb2zJNWrq+bKipQkohD2Wq
	 poe2u4rBFJ+LuPWFbYHplmQ0UZLxorfcbeVUZj0I4TwPn3eluWk+sMLzkcFHOLY3DcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685084;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ncZEOFwP6rVHKLPZIgaSh4joPCImz4xzJxYzeEGBoGA=;
	b=3gVlEyQTQpelzOPDgacs//94E1Xctah522Sey0NFL2uNkD+QoGJGJFKk8KWHHfhP8jHt
	 9pD2uLkOvLCCZqHL+s+y91dNha69o67rqXHGx8PDlYkILX9kcTeIBXqxvR2SGTr/O4fkc
	 eA5el7bb8sy+HbTD5+681aO0gwdrdEvXbBeQHy6S0ufr7zsFnm46sunlVvucoNvmAq2G1
	 aEMuJxZFLuwtcYL5Us1gX+xzR86VGQ8oOKy0g4+Y4rAXT8TZGNz+WOL2axFZgJM+AMGtE
	 lfmBoXDQs9wbGKC4OMpkzyRsJ78StQxCOCA75EpsWtUOYN0dPshwo/AbbOxTNyKjzTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 366B91F000C0;
	Thu, 26 Nov 2026 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685084;
	bh=ncZEOFwP6rVHKLPZIgaSh4joPCImz4xzJxYzeEGBoGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cNEYbRtdmK3BnVY27Xxf+Qldpyv/5HtnmEIWZdfAEsnWAyeD7sYzJKOPpGeQQ8KqY
	 4z1tCfYNoaiXBu9lnWQT/qkpG3vBsm5jeXUZM/K5QXUFm+G6PFAv7hYBeB2wWgLu2+
	 jCifl/PdpRlEoqr0YAzODYJBWDb29IL3PrxbhXWWnPC8L6fbTUk7CVsh0QrMARBOCo
	 Z+tn0teIVoyc561ffe95iUqfnuV/M6i4vCwGTdqf+qj2LwdkIEEb3IsKyaYzsRvFij
	 Sac1fBvCyMblRq8Bdv41H2D4T3MGj2YZsUcdWK4Zm4nreSx68tzQiAf32whjQ6KIoW
	 CT+6a9NebE3dw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B2A7C4D355;
	Thu, 26 Nov 2026 09:24:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Nov 2026 09:24:17 +0000
Subject: [PATCH RESEND v2 1/3] dt-bindings: reset: amlogic: Add A9 reset
 compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-a9-reset-v2-1-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
In-Reply-To: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685071; l=1488;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=5WFk+q6Lu4hN8rJdO/6ZEotdvqyA2ABmhWD4G7n6Cis=;
 b=cOnul2S3dQQ9XihiFhv5W/kmjH5bTzlpYQRGNH/80n1ye1L0fphm9C0NVfNTUELw3lkcG+DoA
 UYY4ygn54UxBNkPpBxjOEqyQd+hIdBpXececKRDwMMQfM5uuq1ihb6d
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

Document the reset controller compatibles used by the Amlogic A9 SoC.
Add support for the A9 AO reset controller and add the A9 reset
compatible with the T7 reset controller as fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 150e95c0d9be..e585f71879f2 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -19,6 +19,7 @@ properties:
           - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
           - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
           - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+          - amlogic,a9-ao-reset
           - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
           - amlogic,t7-reset
       - items:
@@ -26,6 +27,10 @@ properties:
               - amlogic,a4-reset
               - amlogic,a5-reset
           - const: amlogic,meson-s4-reset
+      - items:
+          - enum:
+              - amlogic,a9-reset
+          - const: amlogic,t7-reset
 
   reg:
     maxItems: 1

-- 
2.52.0



