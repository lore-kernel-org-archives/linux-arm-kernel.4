Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38C6606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ISV3j1tB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hSXv6uUV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R1sC1VNhGnBtpHRUbV8Au5v/vixUhvc52DHmrj1EE2M=; b=ISV3j1tBhigsMOAqP3lf5cYXAl
	IVQXeh/VZoCv7YYuWo9bRfANQoUppPxYIbv8LlmUCC6UEcZ8AHvrimzRH6t+9efYFwxjIAM0GoFVk
	b+nDljSYDnjsk0vtILJvUnX5HW97HyJxfVWxYkHwKSof6eTPd8Vi0s16z9HyRIOBmj5hKbQ77bkXG
	EgxTKX61CI425bWRU2Z3+2DP8F7iqP/rdkssLTSEkOTRb1TLK0laMyBV6E5B4u6CxlqNRLLkeanJ3
	9OyMPXRrpWPuzubBBVgZKUw/DP6cGKIHKVvhIRRMM6atxd4TORSxz4xjPdDlWel6y4Oo8yRV7Eu4l
	x6XDB2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tY-00000006YIG-2gxt;
	Wed, 11 Nov 2026 11:53:40 +0000
Received: from mail-ed1-f70.google.com ([209.85.208.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tT-00000006YDp-1Tve
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:36 +0000
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b706aec65bso3453829a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398012; x=1795002812; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1sC1VNhGnBtpHRUbV8Au5v/vixUhvc52DHmrj1EE2M=;
        b=hSXv6uUVz78hr5FTqf0/vZDVFYgXELQ/9RS1TGL5QFdnOL+fDnuxVyP6RC2BrWlMjT
         P7pwxe2SGyPy6ypd6sEElRwe/ZiCDK3ZtVgK28MdkDtZd4Jfu0PWJkGNyCloV4UgT9bh
         E5xf1RAlFIvaiXAxBhi3HikziPhr+5ikN9MB6Z6SbpZNNOGKnS+7USFhewLStjRCvMeh
         /YCLoodrc1eRCKb0FpEt/bPOWMHCIsNWTBFptgj4LwpYmjzT1RMocfkcPBRLprZIUAwM
         DGVpe5T9CfWEx/50FfsslJKFHNoa/7EIB/B2rLA4txSMhneQn3URlEyDrsqKGeunj9t3
         BtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398012; x=1795002812;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1sC1VNhGnBtpHRUbV8Au5v/vixUhvc52DHmrj1EE2M=;
        b=YJ6080/ekQe0vi3hGQdQTQ+mygPaPwkV/qVVu0N+2zWMaqFTBkzVuL33nTSoxqv56q
         aPyDiPPfQWpuyF+lMeDbzOvo6h0SWbvuJqPxet5c39eyRjA1kwzKXIjU0bGdPbCXJpl5
         /PLnE5I+1dGFp3G42g/jyJs85LHZhMr9VpahxSdlLk9ozsSlcQaC1EmJ3ET/A4gwH4eV
         J29LYVrhoiGFcSyxynL3is3v+YgZRDCHhkNMfaipD1oRPki0s5F87OLY8erbcHXhC7Ul
         dM5fnabWV1JFz6IDAfycsvbZvzQH/8wm9Igh5acRME8qyBX5FMhgtI8e+5eGubhRYHrb
         dVUw==
X-Gm-Message-State: APuU4Z8bFhqK0x7xNmUl5pFg4p3ge7j36ALG5JTezv99Rw0mXghBEF5q
	RK2wsPrgGrTGO+YInCZ1S3AXFjKyLKjVQ1mKIWw2cSNKF6doKh6pFQHy2h4Xz9wGKIiHjZoJ9rs
	XjNrZvyxpci4yqqoPraQRcwX/eyjYOBLf3fpgxiwYL5KhAfmZyccCRbSf9L04F1P/SOvCoLCUjU
	SzfXV+jWMzCkylfv31CqvefdbQBQO8Wh+8fx47N5rn2+Bf
X-Received: from edr5.prod.google.com ([2002:a05:6402:44c5:b0:6b6:4dd3:1b66])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:a511:20b0:6b3:f81f:927d
 with SMTP id 4fb4d7f45d1cf-6b77733e8b0mr1246254a12.6.1794398011893; Wed, 11
 Nov 2026 03:53:31 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:08 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183; i=ardb@kernel.org;
 h=from:subject; bh=f2/b8qqgKRe7hacc/4x5TBVKpXpp7q5tLsN3LE74ybM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuCpHgyIfm/LrS1FSu6Xvz1l0mHVTvFTtjONsay2OS
 q6pmSvbUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZSOp3hf57brSnLdWznaZt/
 VjXienpp2Q2HkCnVj5+FXDa4G9HrPIWRob363M6NP8xKju40Zp5WMvOvZt+vmxc+vViYvc6VuXn qGX4A
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-13-ardb+git@google.com>
Subject: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the ACPI tables
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035335_434925_52A5EAD7 
X-CRM114-Status: GOOD (  16.15  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
cluster idle state, as the C630 would occasionally reset with the sdm845
default. However, the firmware refuses the resulting value of 0x41008244:
the cluster power domain is never entered, in EL1 or EL2, and the last CPU
of the cluster keeps retrying instead, including during suspend to idle.

In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
besides powering down the cluster, this state also puts the rest of the
SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
display is off, e.g., right after locking the screen, makes the C630
reset.

The _LPI objects in the C630's DSDT describe the states that Windows uses:
on top of CPU state C4 (0x40000004), the cluster container has
L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
powers down the cluster and its L3 cache, as the cluster idle state.

Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
It differs from the sdm845 default in bits 11:8, which are 3 rather than
2, like in the corresponding states of newer SoCs and of the sc8180x and
sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
to keep the runtime governor away from it: suspend to idle always picks
the deepest state that satisfies the CPU wakeup latency QoS constraint,
regardless of its residency.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 25 +++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 0645ab429177..3e4df4335be8 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -37,6 +37,24 @@ aliases {
 		serial1 = &uart6;
 	};
 
+	cpus {
+		domain-idle-states {
+			/*
+			 * platform.F2 on top of L3Cluster.D4 from the ACPI tables,
+			 * which also lets the rest of the SoC sleep. Suspend to idle
+			 * picks the deepest state regardless of its residency, so
+			 * use one that keeps the runtime governor away from it.
+			 */
+			cluster_sleep_1: cluster-sleep-1 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x4100c344>;
+				entry-latency-us = <3263>;
+				exit-latency-us = <6562>;
+				min-residency-us = <0xffffffff>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -340,8 +358,13 @@ &cdsp_pas {
 	status = "okay";
 };
 
+&cluster_pd {
+	domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>;
+};
+
+/* L3Cluster.D4 from the ACPI tables: powers down the cluster and its L3 */
 &cluster_sleep_0 {
-	arm,psci-suspend-param = <0x41008244>;
+	arm,psci-suspend-param = <0x41000044>;
 };
 
 &gcc {
-- 
2.56.0.611.g1030f0b940-goog


