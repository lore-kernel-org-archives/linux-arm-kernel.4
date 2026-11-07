Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103260A2603
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X852hWQN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yh8d1Egg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7UCcnKNIf1YK72LJjanIkn0/FVXmySqVe1/aphUGt64=; b=X852hWQNxqFSovh1uuCrszniR5
	t88/mOtbI3xH/JuKOnzFzMyAzeMKV8uCnM3DqfFhF2FsovzXTGEiDwxVmF6DOBAb2uGrz3U8W66fr
	23OLJVX7lB1hDnhWvYh7Iv6XBEQ0rBCpSI6gxvJrnCF0BhRIVblXs1sWSzHqBMrfo6X+22crFq6O3
	6xtJ4a65ABJMRz7zgf3KnxI9e8IUrGRHsKxh7AQIshpU+Zxa/war3CbSS6a4LyTq+evxN+j1bJyTA
	C8IdBw2gwGEALIssxUlZSs6r21S/P4jPqDxW7UOhGVlFiVp9Eag4aiw3GwdWe4SH+FH30S5QHKaow
	80wal1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdz5-0000000EYCD-1qT8;
	Sat, 07 Nov 2026 10:49:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyu-0000000EY5T-27jb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4634343DBE;
	Sat,  7 Nov 2026 10:49:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048548;
	b=y7H6OMYGb+/QC/bBgIC9n6Dua9HRbm3ghmgJK7aqhLCV6XRWb+LMrN0cMCdPU9/up1sl
	 F3KHcnuhgyIMMY9+3JL/rDRt49VG9VnMZYjMOlxfQjiHvWPBlAoMQoEM01weCxav8qX48
	 kYZvd7SZbhyp9sKWUwZ45jcNY1dNAyUEOo26Df/Bg2gGBJ1aNh+XKmz52I+W+kuNGAyQk
	 LSs49bl+YLIeGyx66cuG6oylPk/QZ/oBWY62v1kL4ajnHbEFiteTeIMihONesqd+jsQAs
	 QEzK2TZ9rk9SPMhqJAF608YzJn8vfcwA53qCjhpaAUtnjcLvtVN1yYDgdkcoOLkdzvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048548;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7UCcnKNIf1YK72LJjanIkn0/FVXmySqVe1/aphUGt64=;
	b=uJZqNHHQ5tTSRb4Wcj4VFi4d//sWN2hFjLhwQUCMz6s6bJs50buquWGjDkfKAmdioEe7
	 at1R4cqEpLlM2bK/7zOSKVVxOIPvGfi6Wa0vwbSYrCbQ5mncoVBI0KvJ33lc2WI0VmNk6
	 KzJlbQjXEL1bO7o3koNjkYKdK59CGxFDl2ws8qMNa4uiHIyWjjFW9FOm3aAU/rPjLGqPH
	 ynQg6rBNL+p9Pd7y86azlC3nRhXpIbOWV7Amdc1PqJNMP7cnCkUK8Y7W2v0/gmRRXE9uu
	 dxLaUVX3hERdRb7fKB6d3OVZRIg54fWAE9hXgVZHEnkJlfHD17dQDjKzR6TKpaPB7FQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C25351F00921;
	Sat,  7 Nov 2026 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048548;
	bh=7UCcnKNIf1YK72LJjanIkn0/FVXmySqVe1/aphUGt64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Yh8d1EggOZAwULZrCPw17gfjzptzHktbaGVAvIDDNiMjj7BXGUmwJnjOFQ/SquoVP
	 k5MMl13VtJQWPz47lxuYzLZC10tG1JmmaCMiqAe+esJB5j1d4+0RrjnAl+j7MuFT2r
	 X/VRdB3DBtAUK6ZnsHpzUvjAenUJTXtwX8HFzzf99KNgiDIa6M+AftPV8lyM3Mg63Z
	 fidjKN5Af8KhpAeP0tqtpSNp6sfVZWVWqmHm2PF4f0J0LVFjRNn58bRt8SuqViO21t
	 6vZdo3aeNAU9GwZbfTdlg91sY5AOIWgNAWf91vuvNV0/2P7EjwP1enelwPFlBukt2n
	 Va2Dq4IMBIBsg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0175147B92;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:48:56 +1100
Subject: [PATCH v2 09/15] arm64: dts: apple: t603*: Add core interrupt
 affinities
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-9-acf1e78da039@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=SZxjnnpiAPlBmETm50YHBvKw+Yyj82CoILY577jql1M=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zyfzUbnvhuLJuflbhzknTfj3MmiYc0i+4beGK3
 VG5ubWLmlZ1lLIwiHExyIopsuibpmlPZmu4VLrMdQvMHFYmkCEMXJwCMBENIYa/4keYJyVoPOP2
 tFdn03+01fh6k35+VGVJwL3oHPGtBz6EMTLMvXvPIufUqccvO/doqXteVD6/hb3U6uvTEtY304S
 ufbjNAAAay0pP
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

Add the cpu interrupt affinities for M3 Pro/Max SoCs

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t6030.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/apple/t6031.dtsi | 18 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t6032.dtsi | 20 ++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 85a16d03e22f..d49210572e19 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -451,6 +451,20 @@ aic: interrupt-controller@351000000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					cpus = <&cpu_e00 &cpu_e01 &cpu_e02
+						&cpu_e03 &cpu_e04 &cpu_e05>;
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+				};
+
+				p-core-pmu-affinity {
+					cpus = <&cpu_p00 &cpu_p01 &cpu_p02
+						&cpu_p03 &cpu_p04 &cpu_p05>;
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+				};
+			};
 		};
 
 		pinctrl_nub: pinctrl@3641f0000 {
diff --git a/arch/arm64/boot/dts/apple/t6031.dtsi b/arch/arm64/boot/dts/apple/t6031.dtsi
index 30a91c1a47d2..e226a45fe530 100644
--- a/arch/arm64/boot/dts/apple/t6031.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031.dtsi
@@ -45,3 +45,21 @@ soc: soc {
 #undef DIE
 #undef DIE_NO
 #undef SOC_NODE
+
+&aic {
+	affinities {
+		e-core-pmu-affinity {
+			cpus = <&cpu_e00 &cpu_e01
+				&cpu_e02 &cpu_e03>;
+			apple,fiq-index = <AIC_CPU_PMU_E>;
+		};
+
+		p-core-pmu-affinity {
+			cpus = <&cpu_p00 &cpu_p01 &cpu_p02
+				&cpu_p03 &cpu_p04 &cpu_p05
+				&cpu_p10 &cpu_p11 &cpu_p12
+				&cpu_p13 &cpu_p14 &cpu_p15>;
+			apple,fiq-index = <AIC_CPU_PMU_P>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index 2a3a1fed59df..627027f8cd14 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -371,6 +371,26 @@ die1: soc@2200000000 {
 #undef DIE_NO
 #undef SOC_NODE
 
+&aic {
+	affinities {
+		e-core-pmu-affinity {
+			cpus = <&cpu_e00 &cpu_e01 &cpu_e02 &cpu_e03
+				&cpu_e10 &cpu_e11 &cpu_e12 &cpu_e13>;
+			apple,fiq-index = <AIC_CPU_PMU_E>;
+		};
+
+		p-core-pmu-affinity {
+			cpus = <&cpu_p00 &cpu_p01 &cpu_p02 &cpu_p03
+				&cpu_p04 &cpu_p05 &cpu_p10 &cpu_p11
+				&cpu_p12 &cpu_p13 &cpu_p14 &cpu_p15
+				&cpu_p20 &cpu_p21 &cpu_p22 &cpu_p23
+				&cpu_p24 &cpu_p25 &cpu_p30 &cpu_p31
+				&cpu_p32 &cpu_p33 &cpu_p34 &cpu_p35>;
+			apple,fiq-index = <AIC_CPU_PMU_P>;
+		};
+	};
+};
+
 /* delete non-present DISP power-states */
 /delete-node/ &ps_disp_cpu;
 /delete-node/ &ps_disp_cpu_die1;

-- 
2.55.0



