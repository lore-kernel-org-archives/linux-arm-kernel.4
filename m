Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uabQMfZP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuPoyeeQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH5vr7sj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=; b=uabQMfZPc8WkSX
	8ddMMLl+qnsCspQkeaYUFjj0Vpjz8j4pE4yU4Vv7qr5XXAsw6w8SD1ZS7x627OaB2JoYH426YE7SU
	4L+EtdbW+iDoJWvELDn3BnuMUZ6jE7qrDHKjK+h1EPRQdskt16p8PMtjKtDx9Z2Yb+CF1/hoqGy5y
	ZXY/QE70teYawjncvebGry2UzoEmUO0+4oeOsennexE7H7bO6QBy7KfX2oVjsGumoC4Qp2tvMJrL3
	vaKT4uOexYZBbSTvPGKXbDCO4kAs6N1ly2sbX+Lkk8o8D+4+PHa3B3AbrOvdqmNGpGjTX0KHkPVKT
	j6TA7WnbcT+IEtYBw/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYpH-00000007pkC-2LrY;
	Wed, 18 Nov 2026 06:07:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYpA-00000007pht-3DBH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:07:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UqN63371306
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=; b=fuPoyeeQbFUvnxP3
	zI4UEVfhPyfSGZTSzFKnow3blQpAd4xh1qKQHGYFqgQdklOmoXA26w+6dhYLXX5h
	FQ1PXCsn5tfEwU5oFJgJstr3KacQB+CHSiYcGXMZVilROFdFLNdYUZ0O8hB7DY/q
	ktqdIPNmund+AEe0jDucDKqNKzOVDydJQdAN2QhkQeTlXBucnk4SqK0cMXRTbEWp
	uL856XCt4eu5j1j7BXVzzsAfpA4KJc5aLIZTtHJypHHNG3ym/6YoUCP65D9JHLMY
	/oKJgdi1kV8JrW0Mtf++ryag6mXmFzJbbEQWT2dlWzNFTbI+JlKaLB3cJLC3SdNf
	VrsYuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sfe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 06:07:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so575477a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 22:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982036; x=1795586836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=IH5vr7sjhz0lkS/Wl+oMJlrof9PMIfamCUz9gsW2dLXFPpwLxOQGP+B2VoA9AX1h+K
         NVVCdEXNcaiJCsqBLVvkoet9Wz+oBFKGTKi+OdlrGLAsExNjk1fYEqlsTUk3m7Aq8g3Q
         s8kOlxH8ZOVFf309ls1/fEcMzc25zJyp5dvJHL5SYI1KCsb+3kdvX7oCmxsqlrEt0bRh
         GY3bUh1Iqc8wfe37mQ9a/iuo/4yqxTf46ZWR4Y1Z9juU2qDV3Ew8NpWWh8qw0sw9aevA
         NrEm9eMQKfSMVTqWqqiNRGhCLDJOlaTDvcuA9U78x4JmAlthlq33OEl6zuzwqnOcqAMi
         lP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982036; x=1795586836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mbzOvV8B8p4Im7FX8Y/K+FDcdJCH/2lcbh6yiXftsA=;
        b=khn5+ntYU8go1caHJA9NWnizqmy7du3V0jHIoGmW6HdbQ0Xw4vTw2gnmlCfA0UedBr
         wCzAOt94RdqIgaBWb/4ksL3TEMdz01ROyA33ki7HMYuFgSed+fhP4FyOg+klip+6zUnR
         iPTriuRNXROZrn+vrZJuJHJCIrjbTGrLiSHlSuH/zEBybpvQDYXWFZOu8L1adeH11jy8
         RXHxtlBLX69X670MY3OIcrnGMbZVoHbT8jsoMOq8mrUX3GY+nxlFYaX3pcoonAAlC3yG
         5GxEUQWPlSSk7llriQHbcOo6YpuNcVnF0nShnaWiUomTO3Bxi0+JNGAoK79tTuvXTehb
         iGQw==
X-Forwarded-Encrypted: i=1; AL+hErHN8aMCgTdbyffDxzihYTQKTlMDh217j54XiMnk64+GbuYsp1nwDZal3EK0Q8gRuZ/pnEb/TPklY+SzmSyAPYqw@lists.infradead.org
X-Gm-Message-State: APuU4Z9wHuQsestcwy/rxhWo4r6c+YwIEWUIipemeYxvIa9/tN/xy+MU
	JT9aS90hqw4R+xXtyvWjTbyeSgmWhfze3QOHW7ms3t6ROtX1oqYrzELt4P58o2lqHSY+dG/Yypc
	jEC5Ylu5ap5v6gnyQmkXNI8yw3/+9Z/t/Sl/dcNhPcR0RZN8X24nKKJEpp8NhnfOqFZ5+OjObT6
	e5bw==
X-Gm-Gg: AZFdTZf/8SqEfS7W9ED4QGjYjw/nNs3OQxU3jnu7UicoGSBugqusJuDupc+8WCGfshC
	4o7j/rKuoM8z2wnnlSmXfADmCLWnNGP+Ryku7s/uR9Cbt9Vcw++Xu9s5kQZys5qCTXZGJTLJ8Fk
	t5sR/qO3czM7551JSfo2nD/McdiTk0aKGTI2lN7wDCeKisVqKG8WOZV5ihp0yL/5yq4KYWXjPZs
	Jep/39UXyRJ0VLK7AtlUcG9FbzxW8kAVBQjGXLJdJBt/2epc8W9E4GkQWRGV0lCI1gb7bEMLRdP
	274TkxedrTMQMhUGLKnyIovIpAEAH6sMzppi76WdUqTqT6cR0fsnerm/61NPzgsc/XNu7dsGH9z
	hY5VQWvGGJHa8shkPH/owofo3NATtKRzzKrQmjMyWTbE9ilWCKqNXrby7sE0GuQkE10Y3+/KAg6
	3p4gU=
X-Received: by 2002:a17:90b:440b:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b3d07e36fdmr1805335a91.63.1794982035294;
        Tue, 17 Nov 2026 22:07:15 -0800 (PST)
X-Received: by 2002:a17:90b:440b:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b3d07e36fdmr1805298a91.63.1794982034815;
        Tue, 17 Nov 2026 22:07:14 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:14 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:36:19 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: shikra: Add CPU idle states
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-shikra_lpm_addition-v4-2-46ee87e22576@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=4971;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ZnLGNV9oQobHeXgDfZngn36a5StIkhMbOX9ZnhpmU10=;
 b=Q7ulFEGoq6KIayZAONp4rB1P3oEmfSWPFce8+emz1nEuX6MYnJZxquYMrBYLymn8/H4lu7+YG
 mwB0LdYH8t3C9EYK8QtjgND7UJdDtJdtj3NzGx4x5VKK0nIUhreL/bt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4094 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oZC7bev9MFt5y4JAElUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 50uIo5waKjz_qFvfQomWkmadfSZYdukY
X-Proofpoint-ORIG-GUID: 50uIo5waKjz_qFvfQomWkmadfSZYdukY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXxtqNaxPhnQDf
 qSdGvvCyu4bZA0K+pFzIk1aaaZKH/UNUd27h0AoItCTHRJThQRWOCLlrtRjvLSogq4iCjh3O0C+
 pPkrSjF9HoEk/x4VVJYaToZSjyndBs1S5cv/x35yeNFLVfidt6PO1MT6mxCWEHxBVgJemJiIt95
 2PORCiYMjNOA5Nzpn0Q2qXD76GCTSHth+myl4GZNgUZ9q0mkatVkI+5ygTcxm3GeeT7YGAZw1Z2
 BK6dOh9k8yqjhhD0vV0vnLCC4UbEAFpOU80Dl22k4QfI+DVe2gtgYz47JpaifuY+4GOQKiZoYP3
 XuYdb7Et42RSCxOtZwjGBGYjbElvcVqJ8pqEWe3HAj9GVFHmEiwYBBwrJBUVvgM77Ra5bWh4etr
 0N6ktpue0QFs49vNDAlEvrdkZ3tANLMui+kSeYaW/+Ug2cukctUZ7jjKa020MsIs5xmS2hDDy8x
 FabgntqqtTGmoqVsoMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX7mbjBO7WlhHV
 51wb2mM1gpjoRnGBh5Mh5gIISqxKExyviJVMdr3KaGrruyF70h1Nh9RfQpXVQTRd7oib6//vKEv
 WeojyfIXW8/S+HNRwS550pe8Y7dj244=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_220716_829847_AA67139C 
X-CRM114-Status: GOOD (  15.86  )
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

Add idle states for the CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Remove #power-domain-cells from MPM device so that the driver follows the
cpu_pm notifications path to handle RPM notification. This avoids other
probe dependencies that arise due to MPM being a power domain provider.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 +++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..74be82ae50d16c7dcc7bc7af4deb28794efd47e8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,35 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {
@@ -217,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1


