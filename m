Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEDC606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WWWFfnSY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n1wkh3cs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOtZfRlQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=; b=WWWFfnSY+RONJY
	U/DJWZJvUMo2Xr4GZlDo0ZcJx2PjdW8i0rYN+1pUkqLRw/oOwIcQGfFI2WWNV5qKOLZs3EzczKO0I
	shCjJgmH8LrUp9BBC6Ikpt03Rz+r+ZoBTwqct5yllFBkwboYmuZ9liIKbNyFcBDyNxj8fUyWfsi05
	NE8pB37UFjekBJe/AnNe/SdQCKxoPlgtmqPLNG+D6yKyMqUboTt7jTZ9ne3tJ+R68PQ1KAuGioqkL
	rKgOI85moxPnXyMu0uaGatfE2SD27Mz98K/wYZpmzNJqo76JLvUIHkobCwGsZoDCs54OsVqGbIzyG
	0bbrRGBCqGQMTKLNO7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYpA-00000007phZ-1UWr;
	Wed, 18 Nov 2026 06:07:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYp5-00000007pgE-1cqY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:07:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2vT1959905
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=; b=n1wkh3cspR3YAudw
	jUR/+VB4/wKBtHU/RWvyUZYA/ozqzsfvR4ExHsQyNfPiHxWTi8phuYXykIhhcetf
	VZtAXS0FryCN8fhd4ZSepPR2YGXqZjFO0lJWjse126MgVVDPdyhy4+4YWWL7X5kp
	OpRb5eRNCCvYI04xnTmkKTnbvgxX8sZn12WZTvbHYXrN+I89mfNKIX1xvbgF2qjx
	mCm4Pk62gx9+HUnDfEERBo2dOOAx14bfEu3rbTl4yKDtZDQvA7Tqagx0r4EYaOV9
	ZneKGjpo4jTXP+b4Ipq7t9giwkH/MgeG1Zf4QeL8/fgujTntKMwuc0wz8cSeG3+1
	FzDGpw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hfe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:07:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso636431a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 22:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982030; x=1795586830; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=;
        b=AOtZfRlQJ3JYZfAxubXBDzMhlykqSScd0ZQSHjz8Z3HG5aEltvQg7WtJcPFQbXhB/L
         EslhewonLIjOxOORoxrvtyFKKErmrTwZeWmI8mlPD7BwJXJGvp97VqRTJMzHmlLxN0+D
         3LDLRYgXs8FCOHdnQAGNwFnj1fRZtTcILSAGN7FBS+rEqOzyXgv5QFy//1uTlG/KPHjE
         es3EiMcKmRZ97t8qCh9CkblEuV9JjspKjrU0eYbBXoNeZniH6aXjyf8R1KVwV/EcBr6F
         r/bxMA7Sx+hAWpv4wkHSoTyyq+LRWxZo5XNvOq+uD02JxngwrZqIIX4fRvDEgrym1SMh
         Ik/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982030; x=1795586830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=;
        b=MTp5A3FQIDUr+1MHM+t4BIbIfbsZgKv6GEAaJhU3AkM67t1aMyLsDEfny6quuYCJSO
         Kz9xugnnbA5TfbgDVkrjOr+yLnzcUL0NRA+T6rlIBOuZEoW68f721Dd3KZE+pNqqclpr
         K5fzeADGYtrFu1exOVMaqO0XpKY8LGRnMPUC0ZOUcWjNRtNIvyFlaTElOdMPAgN3nadP
         vzjLRSOr23BP5Wu84KPv/mKzlM4xJo7eVM3aUcXgDXewqnd6mry5rhuqbkZ03iatsDja
         Hz7Zz8UX4g26p2Y66ojB22p4LBEiT1twDaA6IRVLNpm25UIdcyzmdC3uha/eNO9Vje29
         Te8A==
X-Forwarded-Encrypted: i=1; AL+hErEIelQnnqcxRo2nRlYzG3/rd2rNL8bHQpHml/H8gvkEw6A8q5pTmrinDEY7luvvPky4aTxFT7dXYe+h09YvvOsB@lists.infradead.org
X-Gm-Message-State: APuU4Z9kxOLeyMwj8lSi9Ix/XCERhbI/cNkNnLUmEgd6xpAP7kYEWueD
	MnYHXyOSoWE9EImdFb/XoEtwOjhyAuuxT7h6bLyTEynKv10JUrZV9I+yw2sWIwA0JEIjZ8gehP4
	3E8VgjMbTiW0zTyg2Ksy+Dt91Blzi63lnBB/Ao1k9JYiozSHc5Q1tBVG55jTxvmRMPA5Qbw/rWK
	jo2A==
X-Gm-Gg: AZFdTZfkTp9M0NV4vMgOXQbSD0Sht15AaO6Wi1qr1ApGRUYFH52157ozhJm4CTHYS95
	mBrtTy/kBW3E13mtZwKdfl9QUYZTZj6jvnvRLDcsspjYf3TSlCfMfiobjxoV7bPFA+EDybxmRyh
	rIrjiZwkcAd2vkugaIrLcBWjDeyr3UtUnnkG4NB/ShjBwArlr4dJhucmamy3p2hQo5aZjdA/PxC
	+oXZ5zWSP+D3+PqqfjzHXPeLpvLjRDEF2qneH8/jg5J8fiUnCxtqoG3IsUhWMlPu/ENB/s+dxfV
	zsRBQRIupEDfsZPn9HNri2MmO8/GU6Jl8V/k1pb1Kefv69rVjqqJZ+Xyn5ZP32jQUZHKR8FXs6r
	qPPD9mrF+mGEciuTfw43T0I/ujg5Kxw5G323NeUIDnskbMF4Nn3xp82fMEs5XaPwf3bkWf8ZHV4
	FrJMc=
X-Received: by 2002:a17:90a:dfc8:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b3d06a4a99mr1641421a91.2.1794982029856;
        Tue, 17 Nov 2026 22:07:09 -0800 (PST)
X-Received: by 2002:a17:90a:dfc8:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b3d06a4a99mr1641388a91.2.1794982029266;
        Tue, 17 Nov 2026 22:07:09 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:08 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:36:18 +0530
Subject: [PATCH v4 1/2] irqchip: irq-qcom-mpm: Register MPM with cpu_pm for
 RPM notification
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-shikra_lpm_addition-v4-1-46ee87e22576@oss.qualcomm.com>
References: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
In-Reply-To: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=6532;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=1nPE6pBBUxkFLJ0rhvjZWQHDg5ZiwkVhjD+deyj8UWU=;
 b=hwgPZPuAZgl2DF7fKHIkmt6id3bmx16Wu9LKenTevW3RXeWswtcnPol5i9kwpqH5fRq15dE2p
 A7kvyvyjE09AKi1OZml0aQiUULB11nsqDaRyz0d6w5Syr5lgUI4gAyJ
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd408e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=lt-0Ylhkz4Il63NEeiEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: aA4Fz82--fyVCEKx6T7bjE2jGCE8fNbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX6I/BGKkK1tyO
 +cI55YrfPk8NYInxPMAjnz3O/bYuXScfIDUn6tR3jBMM0+wmRUrks4zKeoFYMXZwHJPyWXRN3s9
 Ibit4NPSZcTTR8iM6spfeZILo2E/pRIZozq6TLs7pCjN8CyYY38uzmbfFrIVH/FYAId3oz4vSke
 45wb/mo6qSrznNkyUi4X7UjHYyjf0BBv0/Wbs7II8tsjgbVxX+ZAuLlhyzzb8D2C3h34SzmRNiD
 0NL55PXhBnu0kUGPMocVqrJzXoQUKXLYIVPpWd2490ByPSCH/cHd96rQJbZ0/yD+lJz4kUbA1r1
 M3jrTNKHI5sbNCsCk2d0UxRAXSU0X8sDkvonfHpu7n4NiUtOPSoiKdqQ2KY+K7z4zjOipihs5IT
 fn8OYDq4KBFujmovntsDyDDvOfHDEwiZEbvKsWpNYBbQ5c2r2lKFKVkIQqCO+U6wl4+1fhd/qCM
 5AWmcnsf9xzrbWlQEGw==
X-Proofpoint-GUID: aA4Fz82--fyVCEKx6T7bjE2jGCE8fNbg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXx/JckW9X9MNt
 L3ys3/zIxKD9OdlVJ4D5saSrqgE1H/Ne7h4CXgWCG9+koKNdEKp1EtKNBzovWigP6au3/v+eguq
 5yeJfcqPwCoPyOLKjsie7G0n6Ji10Pc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_220711_442936_1F3B0652 
X-CRM114-Status: GOOD (  32.14  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 106 +++++++++++++++++++++++++++++++----------
 1 file changed, 81 insertions(+), 25 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..b837be1cce0e571de983799c4b7f2228f11d04fa 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -85,6 +86,8 @@ struct qcom_mpm_priv {
 	unsigned int reg_stride;
 	struct irq_domain *domain;
 	struct generic_pm_domain genpd;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +295,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -311,6 +312,50 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv, genpd);
+
+	return handle_rpm_notification(priv);
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv)) {
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -415,26 +460,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
-
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
-
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
-
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
-	}
-
 	priv->mbox_client.dev = dev;
 	priv->mbox_client.knows_txdone = true;
 	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
@@ -469,14 +494,45 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 		goto remove_domain;
 	}
 
+	if (of_find_property(np, "#power-domain-cells", NULL)) {
+		genpd = &priv->genpd;
+		genpd->flags = GENPD_FLAG_IRQ_SAFE;
+		genpd->power_off = mpm_pd_power_off;
+
+		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+		if (!genpd->name) {
+			ret = -ENOMEM;
+			goto remove_domain;
+		}
+
+		ret = pm_genpd_init(genpd, NULL, false);
+		if (ret) {
+			dev_err(dev, "failed to init genpd: %d\n", ret);
+			goto remove_domain;
+		}
+
+		ret = of_genpd_add_provider_simple(np, genpd);
+		if (ret) {
+			dev_err(dev, "failed to add genpd provider: %d\n", ret);
+			goto remove_genpd;
+		}
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+		if (ret) {
+			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
+			goto remove_domain;
+		}
+	}
+
 	return 0;
 
+remove_genpd:
+	pm_genpd_remove(genpd);
 remove_domain:
 	irq_domain_remove(priv->domain);
 free_mbox:
 	mbox_free_channel(priv->mbox_chan);
-remove_genpd:
-	pm_genpd_remove(genpd);
 	return ret;
 }
 

-- 
2.34.1


