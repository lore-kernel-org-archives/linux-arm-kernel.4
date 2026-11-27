Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VFH29m/p;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CpuxGWka;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QgRrl0qj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=; b=VFH29m/pi8qRpR
	8HG3rJqYewn3lJwaBuyxb4CG3pfUUcCH6rQAGRArLiCjF/NegDJKMc30CYw9mamWI92HBDvH8ErRQ
	f36r+GSflIiQi0Z/ugPY+KDl8hPWlwHi1EUGR8egpz3D8tTLpj9E3om8h4LToAFN9RpJT+ZgdzF9N
	hkh/1oMyi+2MV7wvJ4DCTGikCWQDBErD2RxnfGUMYRwApzDE3DPz2bCTOeW6R3MIQdg38ccs2tM6g
	JHNdN3x4bU4MeiHflRVpSMyjk9MFTPeg6iqUN/mO6DSS8eGdMvfzVpnEKo7Mtk7BAFaiuiMaR8B02
	m7zhjtXkLqLIqPFK3w9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxLY-0000000GegJ-24aH;
	Fri, 27 Nov 2026 14:54:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxKq-0000000Ge62-0yJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:54:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1J2C2376286
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=; b=CpuxGWkasThTOEJl
	vWjdj3K4FCHg10Vk1ZYTteQcS1zVGVMuXaDLIw4sLu41/sO19hPJS24lUEJ4CMlF
	PPN46Zbp1djyeDG5hSUfhjHzBWR2f6cxOjXKcuQy9IG09SFHiTid7+6/gSZ7JrQP
	gcYmjgUhmR2KHBxmW39Xlr+B2xFwmH9Avg06EjGSSnoZls/ErikXUllL7PIWz695
	cvkqhf6h/aJ2sZV3F2JIcBNwg0UaWKQS4eW8dyZLnDLUpmGg8X0PGnmj3aK11rWz
	z9NWLJgUt+zzU3Pio4Joq1yRRQrJp/izxifgVJFjC094v5eKSvZGfKZ2xiTY9jEb
	+jfqgg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huejg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:27:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f04e19d945so61656875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789673; x=1796394473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
        b=QgRrl0qj1K0+JR1aN9mUUUbHTxTR+D4G7z/bif5jc74FwHBi4Kz9uwIoi9FBR3wRPV
         GcUtTFyf2wNbVqGDC/nZ8M0cjcrGYiodf7UyF9mwUHPaw7z/7LIL6qTUXDfW2sK4U+zK
         ZGhth76fPSv3sUaFTwEBdUkapLd0cqCyofEv5x98r7fL51icr5rifEAL0c+LRgTiDks6
         sd5eTM1yOhv/6qB4Fpg3IRlK5egPWbSlcYlgz8TdVl9x21c2I3/fSnWQhprXoq7y0YIo
         52NQj0ysvV2LArnoCcZDhw2xnNOExKGh+YmiDvo2ZWGgtaYScrbkjMsDpfwJzbRx2+HR
         DRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789673; x=1796394473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
        b=uQfCK56KAslrNFybQ81GaCJeA7lNQBToMBejOvod5/G8HZaVYIKR4PRybp/xDatJjF
         L3TVsLYPn7c0rmmuywg3/eoavR/aauc/2/eC8FKOpeiJVFUpL5LU17X+pVIDg1cdHoEb
         r6IKzve23b9MQRNxXzbnZh9uo7af7TxjeLpCfJKxGvKSMwmR23KS9lmZuwy3KZzgJkSE
         LTnns0AR5CVE4IDyQRP/EH6ddYPXFtU9YYPhNjw7v0neHBdnoQLNTTeABa3yjZc+4U3J
         asd84UMAGPWG8vXY8+w5VZ5lTckyiosejfr5LIQQV6hARJjgZs+sPsQIin+wQ7jz4ese
         HrrA==
X-Forwarded-Encrypted: i=1; AL+hErEVxOoIDDjqiwhaeXTNwayi4Z+9i4SYkubWVfRJq1o2stLIT7M4IdsmUerftNFgHSpjao6llX+0QqhriGkm7dx0@lists.infradead.org
X-Gm-Message-State: APuU4Z8De8tSubg87SX0JY62hJOesGgmF0QPB5SqRS8TAfpg6/WfBnar
	/BDv7cWM+/i/BlRVqgvnE63NzmjrGxKao0porjWrz/26Le9yllnfFNE88eguOcReTIgPFt4vSFk
	Tmo76bsiubaQBjgWpd8po502WnCrJpqVPIwJEyjrfTUdW/tRPV6lrA53w0O8nx0GBhu1od8N2IF
	jz0A==
X-Gm-Gg: AZFdTZeXSQWvjbKpspZHzYVw1On8H+Xk60sQFcjF3/0s2cYQbAleHw4i5ZANxDbZC6z
	wHps/8TsbhCpdPlojbN6iw3ZkHM62KxS+yk9bZn2I4o0VJZ4Te6PCuGnsqv3JJE/TG+dRMbfqC0
	NUhdSeNCNvUNWeJlwoiRHijaT5jZ6HefkRQJil9544PoYzNsHE7xSnevhp+oTSrkbW3EzSUrPsf
	AaLjo99rmSGkXTTeLe6qWKP7D9phvmHZ8ZP++Wn02rQkQMDIxICpUNqespVBAsHwjR+9JC8R0bs
	Z2eTN6TDQ3rcoM0LuVqtsOFVdThK+BJlPr6dCj19BwKsb694frCQ95oUUxj1WxQmjt8nSbVKbui
	g2OiiBSOhMAF4o8Qc1eK17WvvuNcLT31sDPFsWS5ERjAEEU+wXpa8VuqVgTmzwG2UH1W8n2CUzZ
	fdPNNeMP4+SQ==
X-Received: by 2002:a17:902:ec8b:b0:2f0:3e5f:2a18 with SMTP id d9443c01a7336-2f03f21cebcmr205540305ad.39.1795789673062;
        Fri, 27 Nov 2026 06:27:53 -0800 (PST)
X-Received: by 2002:a17:902:ec8b:b0:2f0:3e5f:2a18 with SMTP id d9443c01a7336-2f03f21cebcmr205539645ad.39.1795789672505;
        Fri, 27 Nov 2026 06:27:52 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:27:52 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:57 +0530
Subject: [PATCH v28 04/10] firmware: arm: psci: Add support for PSCI
 auxiliary devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-4-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=8413;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6+plmcxud8+1Db2wY0PyjrfTXxkmyX+xcwc3/L5lLU4=;
 b=4xojK07eLUyXKvcM0CJ1rWgr7sJ9kRK4evE0nRq9/GcL7+l5XLu9t17mwrWRdTTJLpUV03bKw
 L3gED7f5XoKBpfufDDFpM/XWOLluno6hVqRwAStEinCGUdCg0eh5WL3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzj9nIfjFNwNQ
 yMLlDDcjiuCi1oCQrPiekjnQwetdYZDu3KPvNuaLDQ18GgJoc7dpMn75E3QoT/oe5XKOpIyHhdt
 Ush2RoyuMZt4y8Y/rZgG1M3ddGm18rE=
X-Proofpoint-GUID: I3v6YLXmYJpoXx4mV0fL7HwjUmyWdG7s
X-Proofpoint-ORIG-GUID: I3v6YLXmYJpoXx4mV0fL7HwjUmyWdG7s
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b099369 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ugXECOaDcIgpxkN7r8kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzhDFCLrmbCpA
 Z458VA3mjYmBrDi0Ta+ho8ayrOrd9FKMk3EIqvR9De2Xsbk5+o+WYHLSCkSUN0De7qOWxsIYdlm
 FnOcGImjiteAYUOYqYyHu71jUYmeUoc6bq2B9/agZCsAqrKun5ocynBf1/87PtQqr+HQbfxOstX
 GazNkf+rcsCVlgANgXsSCTyhioW0UPBzAu6e7GiV1qdn8XT1Y77oLfG7aQ73Rq4MRHgirzTgmCP
 pUMHYzUSCB+cDL1JBJ8KVm+Lf16WFy9voV0FTKJyhYBEi9Md+1aUuUJeROiJjR8/mE5+O/sNBNe
 8j47TYipceuHsSD+VKVmTuey4Z0wIAkxcCl67CZ1utZFaIqj99sGOLHooZ4ZTVtcnn5h2QKfBF4
 8SBO/rOLWcRRWU12HQHgH0AA/2y0mxP565h0kxBOloVdLWaz793UTIowwjpD+U0hLX2B7EIImzn
 e49JRtNmLcpnfeHZLig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_065400_323792_870B1E4D 
X-CRM114-Status: GOOD (  29.63  )
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

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to multiple
drivers attached to a single device node.

Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
and registers PSCI child devices on the auxiliary bus. As the first
user, register cpuidle-psci-domain as an auxiliary device.

Update cpuidle-psci-domain to probe as an auxiliary driver and use
the PSCI device node for power-domain traversal. Allow the probe to
succeed if at least one auxiliary device is created.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/cpuidle/Kconfig.arm              |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c    |  35 ++++++----
 drivers/firmware/arm/psci/Kconfig        |  14 ++++
 drivers/firmware/arm/psci/Makefile       |   1 +
 drivers/firmware/arm/psci/psci-devices.c | 116 +++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+), 15 deletions(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829d..f22e18b05053a 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on ARM_PSCI_DEVICES
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index d81be01d62e0f..03a8396992c40 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,10 +9,11 @@
 
 #define pr_fmt(fmt) "CPUidle PSCI: " fmt
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/module.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
@@ -121,14 +122,10 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
-static int psci_cpuidle_domain_probe(struct platform_device *pdev)
+static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = auxdev->dev.of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -174,19 +171,27 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	dt_idle_pd_remove_topology(np);
 	psci_pd_remove();
 exit:
-	return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM domains\n");
+	return dev_err_probe(&auxdev->dev, ret, "failed to create CPU PM domains\n");
 }
 
-static struct platform_driver psci_cpuidle_domain_driver = {
-	.probe  = psci_cpuidle_domain_probe,
+static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
+	{ .name = "arm-psci.psci-cpuidle-domain" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
+
+static struct auxiliary_driver psci_cpuidle_domain_driver = {
+	.probe = psci_cpuidle_domain_probe,
 	.driver = {
-		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
+		.suppress_bind_attrs = true,
 	},
+	.id_table = psci_cpuidle_domain_id_table,
 };
 
 static int __init psci_idle_init_domains(void)
 {
-	return platform_driver_register(&psci_cpuidle_domain_driver);
+	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
+					   THIS_MODULE,
+					   "psci-cpuidle-domain");
 }
-core_initcall(psci_idle_init_domains);
+arch_initcall(psci_idle_init_domains);
diff --git a/drivers/firmware/arm/psci/Kconfig b/drivers/firmware/arm/psci/Kconfig
index 97944168b5e66..68e381f1a618a 100644
--- a/drivers/firmware/arm/psci/Kconfig
+++ b/drivers/firmware/arm/psci/Kconfig
@@ -2,6 +2,20 @@
 config ARM_PSCI_FW
 	bool
 
+config ARM_PSCI_DEVICES
+	bool "PSCI auxiliary device support"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select AUXILIARY_BUS
+	default y
+	help
+	  Say Y here to enable auxiliary device support for PSCI.
+
+	  This creates auxiliary devices for PSCI functionality implemented
+	  outside the core PSCI firmware driver. These devices allow PSCI
+	  child drivers to bind through the auxiliary bus while sharing the
+	  PSCI firmware device as their parent.
+
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
 	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
diff --git a/drivers/firmware/arm/psci/Makefile b/drivers/firmware/arm/psci/Makefile
index 1956b882470f1..8e75a0ed6f740 100644
--- a/drivers/firmware/arm/psci/Makefile
+++ b/drivers/firmware/arm/psci/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
+obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
 obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
diff --git a/drivers/firmware/arm/psci/psci-devices.c b/drivers/firmware/arm/psci/psci-devices.c
new file mode 100644
index 0000000000000..d23befc490ed5
--- /dev/null
+++ b/drivers/firmware/arm/psci/psci-devices.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct arm_psci_device_info {
+	const char *name;
+	const char *of_node_name;
+};
+
+static const struct arm_psci_device_info arm_psci_devices[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static void arm_psci_auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	of_node_put(dev->of_node);
+	kfree(auxdev);
+}
+
+static int arm_psci_auxiliary_device_create(struct device *dev,
+					    const struct arm_psci_device_info *info)
+{
+	struct auxiliary_device *auxdev;
+	struct device_node *np;
+	int ret;
+
+	auxdev = kzalloc_obj(*auxdev);
+	if (!auxdev)
+		return -ENOMEM;
+
+	if (info->of_node_name)
+		np = of_get_child_by_name(dev->of_node, info->of_node_name);
+	else
+		np = dev->of_node;
+
+	auxdev->id = 0;
+	auxdev->name = info->name;
+	auxdev->dev.parent = dev;
+	auxdev->dev.release = arm_psci_auxiliary_device_release;
+
+	if (np)
+		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		of_node_put(auxdev->dev.of_node);
+		kfree(auxdev);
+		goto out_put_node;
+	}
+
+	ret = __auxiliary_device_add(auxdev, "arm-psci");
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		goto out_put_node;
+	}
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
+
+out_put_node:
+	if (info->of_node_name)
+		of_node_put(np);
+
+	return ret;
+}
+
+static int arm_psci_probe(struct platform_device *pdev)
+{
+	const struct arm_psci_device_info *info;
+	int auxdev_count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(arm_psci_devices); i++) {
+		info = &arm_psci_devices[i];
+		ret = arm_psci_auxiliary_device_create(&pdev->dev, info);
+		if (ret)
+			dev_warn(&pdev->dev, "failed to create %s aux device: %d\n",
+				 info->name, ret);
+		else
+			auxdev_count++;
+	}
+
+	return auxdev_count ? 0 : -ENODEV;
+}
+
+static const struct of_device_id arm_psci_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver arm_psci_driver = {
+	.probe = arm_psci_probe,
+	.driver = {
+		.name = "arm-psci",
+		.of_match_table = arm_psci_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init arm_psci_init(void)
+{
+	return platform_driver_register(&arm_psci_driver);
+}
+arch_initcall(arm_psci_init);

-- 
2.34.1


