Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E560A3804
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zv7iCDxr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bd8x/4h1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jidyAGpI/ALPwLuz5xv9pAUucASQ20+cL1hbAhUU54o=; b=zv7iCDxrVjqslIV8cs/BGOTfGl
	AMHmyww9FfIlcRNa3GJwm3cUhKWEU7b5u9XI9Ykco6BupFjbvn5+aRmbcJzjxRl7PoZ4HjpjYcMaU
	0ZO+44NHnuTZHZziX/a3B18PrMi/LYXplKMGu74xE8QJfUetSwBK1Tt9P4fsbYF0pwp1S2BwJCMr6
	2V+zohhDlDgMyTqh484rCGTd1BVR1V8tNHVf5brWs//3Rs0qrUS7m4g9v4Z0wSqNQuVWF1wmPXKLw
	HfPvtBQ9mMaKA5Hzp/X4fOP16tWpQ+L7xAmOjhZctO2Z9g0jytdne39JzYkw+y6UmEhOtBoDy5w60
	OGi1VV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdzB-0000000EYM1-29Sk;
	Sat, 07 Nov 2026 10:49:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyv-0000000EY7a-2pXS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F07F409DF;
	Sat,  7 Nov 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048549;
	b=x4CQw31kkPDB2FyvRn9MeZpipKRlttG3S61CztU8n/TwdiBMER1qEU9wEhlY4MoLazr+
	 iiwm5r9qhQbz2n3QVlK6Qehq9m17TGmgsFNGX6qWlvNAHaKjone5r6j3K52LtDWM+r4Yo
	 zgY5o6gALid0d2QU8jwO3xeA4RVmnD8jaWoLl7BAv/9/CC3f0KElseSkKP05kcNeegdfs
	 +oAr4ieqf0hOt/0KTREi9kRGb5bqmmFn8wvhSEZDezc9cHv2Ptqe+mkfMWhC5mPxHhHum
	 o/6ucicPacJD5p3ZqiXUYCenRy5BAAVs6DyPQL/6dxKrTcB4jOIWOQQ0eqfc3rt71qg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048549;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jidyAGpI/ALPwLuz5xv9pAUucASQ20+cL1hbAhUU54o=;
	b=XcYoDgOy+llJ2u72LqznLs9PJVcPuDjYs2FXHphTjzOGQ9h2BYtjPmmDIEqiwcGj9WOf
	 8ra9UyIZdWI+CS/SBInEPAqSUoKhnUkrKysvJ2HrEdaVa+HKxMpVY1u3mV7N5DrokH7eA
	 8UY4oOsF1FZWB1kcvkF+pht7rtl86UnysRgnkAhcf0vgl97pL9sYFG74BE8iMV77fTix3
	 yYwrYGbW5t011/Rqgl+E+mD8x7g6lbzvpHO5/mM0bmfwxK55aVhfsOm+Id9xB8EhwB1ra
	 pOt2AgIQK+84QGhQXfs4RaD/5V196y0XjxPm8bP0YRx91TJl8GQUsp1sttb+IPAykHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6D2B1F00903;
	Sat,  7 Nov 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048549;
	bh=jidyAGpI/ALPwLuz5xv9pAUucASQ20+cL1hbAhUU54o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Bd8x/4h1JOBcjEwgBm8z0wm27KUIxtggOMedsD2rF/Wb42r3GzdZba+9TYSyj6jqE
	 jF4bNvOQcDKsa5zwmNG0U6FUkXCMFVBgCtYwVhs/en1jNDTejUk5ztYfJ2iHHh6WXU
	 AXg/RWn0z0mJNJsmksiZdKL1NkyhIllRiD0yYQY7daDFRn6QjMPFvxXR+uoltp16uA
	 CQNIsMUxDjZwO/HEZ55axQ27hSSpzvJoQJJgxsdpT+3lEBdJNtyuUkEHa8mfJdxxR9
	 Xeaa2yM1Rz5S4O1peyUc21X92fgOV7RWbzzeb5c8s/xdtvgd2bEdxBibuYbphdXe5F
	 8LLix5c7fqIbQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 400E447BA2;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:49:00 +1100
Subject: [PATCH v2 13/15] arm64: dts: apple: t604x: Add PMU Device Nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-13-acf1e78da039@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=tOGj1AVK13sDoleZ1GDPbZJP7wjR8LAHjlBELHNHOOg=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zyUY8vKgjKjL3andcg8Nk5dDey0+fn1xW4bX8d
 OXNJ3n3bsl3lLIwiHExyIopsuibpmlPZmu4VLrMdQvMHFYmkCEMXJwCMJFJ/xn+O+079oU58cMB
 rTVteXkGz9uSNldLm/3b1Sn2qYfVRGitOcNvtmWTsmfy6O3jqNv6PDL94/oJPE1qVlfPH6+4dvj
 u5RtnGQAEvU4K
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

Adds the PMU nodes to all t604x devices.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t6041.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6041.dtsi b/arch/arm64/boot/dts/apple/t6041.dtsi
index 9110d05c896d..62d7c63042db 100644
--- a/arch/arm64/boot/dts/apple/t6041.dtsi
+++ b/arch/arm64/boot/dts/apple/t6041.dtsi
@@ -314,6 +314,18 @@ l2_cache_2: l2-cache-2 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,brava-e-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,brava-p-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;

-- 
2.55.0



