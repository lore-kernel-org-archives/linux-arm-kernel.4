Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E439606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQan5wOu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cVoYy6Tx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=; b=RQan5wOuWXPurOqeNQQBslCmP2
	tBHn6Z8a13b3ZMOElW9CHLXwo+2QyWa1SU/2hSwnnnxL59/9+3orvdICCRE+Hu0i5jhtF7n0515wc
	DeVygsBqAYLxTgQ6ZrlUQbZ/StVfdmqUqHChOQfe88+FZNx2Axy5CJYAJE4l+Jh3te2XXso8C7Xj8
	BAdLPXoJwi1Ozu5Gr/LmvQ+67MUWUHTjGjUGTvChMHAYonRB9o9EhZLDhQoxZpxyRbJcfQsrFDZ2f
	h1mm5k+ARAyqM30c0RSDwIzyQqXjjCveNiG/P7bbqI2QY6Jt7IWrQ9Ew/sBehxdb1d98aE0kFjyad
	yaH+hlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtdS-0000000FiFq-1xbt;
	Fri, 27 Nov 2026 10:56:58 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtdD-0000000FiDy-3ABi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:56:45 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-862b98b2e47so3082853a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795777003; cv=none;
        d=google.com; s=arc-20260327;
        b=oY0LLbJeMs49zfbS2gm1/oh0viklmDDdvEafStqBKLb+bSEoLv/xEbFgFLlMtrAYQv
         QT89/skccXvXvUlUTozoBhkMLdKpKT9lFKFgPUQf1Jhb5t9Jo0Ji1cAAzM+Z6X6qNlKR
         52rVWvVeVgYIiQVznVt+Wn2HzXMuQ54BUZzgHf9ah4YuXfYUXo5njYMneDs+RVCa24WE
         na55d71wAP5q6IF+AvK8p981Unq7QvvyY8s201ki47XbhCKg90R8DVYpU1h5G+ypI5j0
         3MaQZ1fO4+yPjOBVuLB8WytKFInCJDhjv2mdr2b8QwK0u/L0qFlE6TRhsWf59cdzd9pp
         wsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=;
        fh=kJUI7zdvDEo3i2+nUkM/yVZiBRC5c9PgQgslgFMFM2E=;
        b=dw1tM0LuZjMs9AUC1HW+Pl92Uf1DepgabJ438kz2Xyr4XEmmXB2PSlQBVf0HQ7VYwY
         wHqo9x/ype0CVrjEI3kgW83q2PWD65q0Qmjnwzz6Zxu0opBLqf7I+8ngfRcIlEH6XfNl
         /w6/svQHy+Uj0pSH9Jm+rqcc3X2eZs3IvFu+FjUjv6BNeI73ESM3Z0lMVOaV0Pr06tZc
         LKgtq/g+shzwzEfPqrbEDhb3r2SgboOynYDe2qvC+VHbTT2n5r6TYDmYrq1CffNw1anF
         av7D3YFYi0fBgwWF2gMrcmhy1907UlDc2wNN1zXcjQc2yN/zmFMwCeYWWzt72e0rYpzC
         yM4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795777003; x=1796381803; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=;
        b=cVoYy6TxpXLnqZ63Wslcad2uGvRtV7TgpmSPjuKGCuCZk5irS63Y2OYrQufZCZNGCh
         UhNB9IYESCxUtUjw5ss7wb/6XUYs9RD8gl2gB1WAZRGi8KKcEVh/hizomILpCFOonIpd
         FIehAJBPSV1E1LtvYmIOPAppxFkjVdzVxJexJZy8uETH8U58ka/YnwsJ4cd27loBX5I+
         Hosg91MbglfU8AlMOqCWUgZJetu5tL7AmJlxdbhTj2WnkA8CyJ64T+ve2wlu/f/mAfSg
         OElaHpMHD/TbRmYcz4Gb+x4syIANkpAF11BShefEWVrmyUzQEgsnYARRibqSTDTN+IfV
         Zw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777003; x=1796381803;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C+G9MD1YETmf62awSsJnA8r3aF77m2xP9BdbBEqhs7Q=;
        b=P2vYfUpgf0+/xilwjINi5NJ8q5Ew6H3Yjgh/g0gNeDnp7T0kx3afjqQtSYSF864ZWc
         HiT3TwNMAl387IOq9EmNeaqmHuakQ4JXSqD6iY21XJMu4c4Irzk/+y+Xi1bc7+zszd9y
         2ClW1ajWVbM8JbpMStLAWt4lp4adA0xH/IaZ0l3CaXo/RDR0v+/1JAhrxilaKLAyv3cO
         WPTNkOgk3Cv9EKOul4+Ellkh03LMrL2FwIp6n25e0gu42+lfjxUT0Kb9SelnZk4eSojd
         didfK4iSyj8hg+lEMVTNI4CX0Qi4XTwwGncDANw31fqHnF7QKZ/wEom6GJ7hVIput7xN
         GoZA==
X-Forwarded-Encrypted: i=1; AL+hErFFfEYPpzzOaEu0ir4ttFVIgnjoyCRE0iKFlGSrKPMEIgGGPFuStmaRIodNWVfnH4SpfTDTBXWr0ojrq9xkVedt@lists.infradead.org
X-Gm-Message-State: APuU4Z+n1k2sq7L+o5QOqZr4LtQvc8mD7deyb3dtdeDf7EiKi8LhPVqc
	1ytfqi9vtnvF4h9AqTY8dZs8D+C8zhCvEb1wVMB7E1wBWjS+fKJhpb8gUBMUFmwhlwnRUSi48+g
	yQoJ8rq8/79rYA7y/WIONsx9LTos+DYo1fk0B6U0=
X-Gm-Gg: AZFdTZcMD86YLtfxHQ9+SwzQKUl5cKBvlrTJRMq8pZglEbDNAIAIOZ/IfSy2U8RWQah
	pUIOrraTtGXlXBJynRg8Ls0LMRbP/2dPRzCoY9kTWy8gr0JKEQIdHMp7iouLMkvkK4pj57l8pMF
	wHu1wDMxKDoa+xAL9V2GQrRKpvn66XVYM26P/69cDPKMBy3dyLVnGcRkDy4dtL+ePlfcQzFjgUT
	iS8ryxQV1n3LWq8EJhr0ToM6iXYYEYQKbECqOoFvm0RdTv8OhQifoITCf7pw4oneq77qrDd49Wg
	PubajXJ0M9rlRFpMQRiAyu09jsj2q9tpj+kgUxc1UsPf9k9lxFor0lNC/8FDcw88Ex5Kz4W/PMz
	MztBQ+RC7AHWPddJpa+q3CwyJguSuS/ymAH952I91GEM1qAVixUo5e4zYsSU2K4pnVQ==
X-Received: by 2002:a05:6808:6d92:b0:574:93c0:5aea with SMTP id
 5614622812f47-57a0c6c050dmr21770536b6e.63.1795777002704; Fri, 27 Nov 2026
 02:56:42 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 05:56:42 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
Date: Fri, 27 Nov 2026 05:56:42 -0500
X-Gm-Features: Aa3M54rDmdf4zHHYDtRAD-zOujdJiLrziVZuYZztEqHqEQISApJqxYvgDcdWXNI
Message-ID: <CA+m4KrDVNkHhqJhRVv7NRWhStNq8ZW+BfyAme6ZZrN-gqr9Q7g@mail.gmail.com>
Subject: [PATCH v2] cpuidle: psci: Skip Gaokun3 cluster power-down in s2idle
To: ulfh@kernel.org
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, christian.loehle@arm.com, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025643_822870_5A266C6A 
X-CRM114-Status: GOOD (  10.15  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Huawei MateBook E Go (Gaokun3) fails to resume from s2idle when
the SC8280XP cluster idle state (0x4100c344) is available. Keep the
cluster idle state in the Device Tree so its runtime idle governor
and the RPMh next-wakeup lookup retain the existing configuration.

For the Gaokun3 cluster domain, wrap the system power-down decision
and reject the cluster transition during s2idle. Leave the runtime
power-down callback and per-CPU idle states intact.

On a GK-W7X running firmware 2.18, the candidate booted with the
original cluster idle state in DT and resumed in the same boot after
159 seconds of s2idle using the power button and no RTC alarm. The
cluster genpd counters showed 510 runtime uses and zero s2idle uses.
The test kernel also carried a separate RPMh KTIME_MAX guard.

Link: https://lore.kernel.org/r/CA+m4KrB1p2u_y92phm-xpn3up=kebi1OmiVc3X4CCdFzHT9-5Q@mail.gmail.com
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
Changes in v2:
- Keep the DT state and runtime governor in place.
- Limit the workaround to the system governor's s2idle decision.

--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,6 +9,7 @@

 #define pr_fmt(fmt) "CPUidle PSCI: " fmt

+#include <linux/suspend.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
@@ -41,6 +42,20 @@
 	return 0;
 }

+/*
+ * The Gaokun3 cluster state fails to resume from s2idle. Keep the
+ * normal governor for runtime idle and reject only s2idle power-down.
+ */
+static bool gaokun3_cluster_system_power_down_ok(struct dev_pm_domain *pd)
+{
+	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE)
+		return false;
+
+	return pm_domain_cpu_gov.system_power_down_ok(pd);
+}
+
+static struct dev_power_governor gaokun3_cluster_gov;
+
 static int psci_pd_init(struct device_node *np, bool use_osi)
 {
 	struct generic_pm_domain *pd;
@@ -71,6 +86,13 @@

 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
+	if (pd_gov && of_machine_is_compatible("huawei,gaokun3") &&
+	    of_node_name_eq(np, "power-domain-cpu-cluster0")) {
+		gaokun3_cluster_gov = pm_domain_cpu_gov;
+		gaokun3_cluster_gov.system_power_down_ok =
+			gaokun3_cluster_system_power_down_ok;
+		pd_gov = &gaokun3_cluster_gov;
+	}

 	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)

