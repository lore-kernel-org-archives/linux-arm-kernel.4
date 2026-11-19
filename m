Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E7606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rm2bvAfc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CduEh7kz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J/Eeha1Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X7nKuLItFmy6OPjhsiIHE5E7mTRVeqyMX80ivs/u7Dg=; b=Rm2bvAfcw6xDGN
	9hyO9slN5NgKR/IxQiL2IKVo8pfwZWY4my/c4a8u81I7ISb6rdq9wF413ZfHgPwryhNNIWEvROQb0
	Bu+KB+tUsl5FJAreYCO9ArkrRaN6kdHt9Ii1CrRt7yvi59A+jjz4PYtoXISIpVYNRFjRp1hYEwbbL
	T0fqqzPwfaKRjRCnalNHLxtXmnEzTwHTqxaLFnrGFkZE8FRjBiJp4K4SWG6OfmCgx5JPJx5a+HjyR
	1xidzQpzKzoM4XsDT2JKwM+w/F6ZkYZYMYMSKsDS5/3iH9IT7nsmVpD7y8Xuqdj3vbBD8KdDNZ2jx
	vg/duw1Ksw25AGcJ+kzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy2Q-0000000BK28-0sG6;
	Thu, 19 Nov 2026 09:02:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy1h-0000000BJir-2Uwd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:02:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7oacv1685166
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7nKuLItFmy6OPjhsiIHE5E7mTRVeqyMX80ivs/u7Dg=; b=CduEh7kzwuonBHsf
	8xC/KtADJeHtT9xuTJt4yBCQ04cp67JlESUjnEIAPm/YEEcC6Kh3z/sLYMEc7nQU
	H5pF9bSk1b1z5kbUnoy9QPT86r7lj+/gpoUeG3Y1GROb+dXzTDiQnijk1ZeVm4lL
	GjFYpTg5yUJXOfStde+itODD5B2Soeq0afHY3atI4eG6VyoLeH+gUyhnqdVecNNV
	EvjjC1mOMKlaNLgy/CFTec2CMgqgAnEDmfn+2Z85Q7gujX1ZpNiWgtI4vRESxf6C
	GX4LotFlqJ6hJP44UlBcZWWMzU08PYSRhRWa8lcS0/Y0RJEwu8uONq3vFkR0Nf2t
	sc/NpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8nk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:01:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so2126325a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078911; x=1795683711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7nKuLItFmy6OPjhsiIHE5E7mTRVeqyMX80ivs/u7Dg=;
        b=J/Eeha1ZZ0WTIK8XbnxuT6oUkqBnytJqjtrY5V+ZmNIK09QwuEd2mPPej1lYh8hQko
         HuHKjIgeDstubGgVn7p01dlakWEFEx96MCzMQGmOopijxYLBjS44fzXncS35M1f2ifDz
         M+MFdkwy6MJwRI0rKk7T4JcvhrETy2ayTzlD+uMsaQkcLRma1A7kVhVKSZO9IHLT3xzl
         sIae9cY9wuW0QaH42Z+2xfM2gWNK23qHN8PnF9ZLzOwZMwLAwSHw1kARELvDOUWvcBP6
         YY9GMbprbJF+f4ER1eGhAdbt+uCLkWIEPEy7RmjSOA15MM8X+B6tUTVtHILMyWpNOjWg
         hOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078911; x=1795683711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7nKuLItFmy6OPjhsiIHE5E7mTRVeqyMX80ivs/u7Dg=;
        b=06BbKm7vQVgYxxqSk8drgrqxoVmmqkmpbnPWTVezt8Le2lscConqdrDyRsr0MGZdbr
         6qhhjeAg4jrWX65JYwvMeOtLqR5xP5GWBuOyLDAInf6aAM6SZUz30loBF9aSpb8Q/cXd
         WllC+IAYYQ5qDU+XkY2wVfusJCSy523SoS0uPTQYDbSS1Yf54pDptMsd9SYjnrf1fwLg
         oZJHkTI5l+3nUlh1Rlt5r4USWRHk4kIujuIBim46Hq+nzHYo+xwBLMfa38nxW8yz6MUR
         3cXju/bXmFyoQ/jlkaMtUKsGhw7jmjvFz46Ta0vTfMzbjdPYp7X7d82jV2yOeX5fsOXq
         4Ybw==
X-Forwarded-Encrypted: i=1; AL+hErGPQvca5zavlDoDzWh02P0lcspS/3T6LbCZd5jtjZl9oknhzRwAg8mUuMb1v3t0vjrdZDqGvgEIXgQzN8OtYBBb@lists.infradead.org
X-Gm-Message-State: APuU4Z/cTUNDhyqhDAN++/sGLCSe5FX6cfPz8TtYShKZDEt866VRT5Z7
	eQ9Ui0fhRZ2vhIZx7HCBZsptcep5LhM1VBryrsWlkdcHsLMgav6AaWNTEOkabX/VpJSGoRy3xVv
	XhAHW838rSon0GNGPUkTYIN64dRYHS55noYrAYvUNOmEh9XC818ZOIo+idbyjOe9uClB9zPmuSI
	yawVLH+VJuPMr5
X-Gm-Gg: AZFdTZd41yJaufRwLSakw5KkE7E1niCfE3v99+vG0tOhEOza2PiLuznzQysdclrskEZ
	iq8mPm2n9W0U7S80FDmLMyGT3hTqYQSAatuE/yYT+MLIODCcdHAV7LCMVL9VZQhgLWhvJjahWEH
	gjibXCtA4VCTt7gh000DQsqj1682Cti6MY1CKS4vV+tTaKJP7skLDK2rDopHwoDPth5pO7qgd/k
	NmGlcXl2i0bGbCCf+FyqlDHBjoKB24NNwg0deG3uzQB5aulNIteOgDrGXa5JqbeRu8+9XYvgTB+
	7Ta9MwtYx3SgmyUOHQIZGU5qN3+6PES+xR8BMO4dCZuMMRL7j8Jc2Rnf0ShWxDUhQGmZa5o9CBm
	b/sOGourrmKnXHY1WEnT8UK5bvR9iqunN51oy2C8nO74/mKucuWQhrKEtW7ySjlULSot//ff5bd
	QLIJo2ZseNwNKMsevuu1zN4Jxwat4ZGFZHCmVw
X-Received: by 2002:a17:90b:3b8d:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b40889bd20mr633605a91.66.1795078910642;
        Thu, 19 Nov 2026 01:01:50 -0800 (PST)
X-Received: by 2002:a17:90b:3b8d:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b40889bd20mr633532a91.66.1795078909735;
        Thu, 19 Nov 2026 01:01:49 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:49 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:15 +0800
Subject: [PATCH RFC 2/6] soc: qcom: add QDCP firmware provider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-2-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078891; l=34140;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=QSDkZ4rxSc2bTbmPoDeNWSxJtY4Cg/uOn+eD/QYPcUQ=;
 b=siMMBnuUaUFLTLnvh1BSQHyBy8v43X5jc9XIiSv+9ArnWB8nxY7SJsIYYGSudvTm4MK0onz99
 2p0N0ymLzBbAtQYZ+hxhVS2vEqVE7aNDCGHpuF4VVvuRJVlSfsO1uIG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: NcyTBhdDSPONp1L5jSqtc4ISZ1b9pZ4h
X-Proofpoint-GUID: NcyTBhdDSPONp1L5jSqtc4ISZ1b9pZ4h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX85vuZk7495Ec
 ifxtMnE9qdhRMW7Zg0f4VXmxDudXfk6Dx4vwLTgs4Ga3Ku/KH5BoPdqk/nQJ14VkLsINfZMZ3DU
 in0JxITYeQIatdsSRKJUclyRSZ9xSgw=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afebb00 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=InIXwscyhpQQGMulbeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX1wX0aia3phm4
 f6YlsEGtHUFtb77HUg+vDb5+JPp1whYZ+5sb3GaOrmBHopoc0tTw2+p+3gt/c5P70pmATIatcxa
 RuVq6PlG5gLyLe4p+yfz7cy+GhCd4GkBFnJurltZ0rx69JEwkhzcl3DMlCJWC3jCWlqF74zuvMF
 NFYvprkhoxes/n7NoGE9We9Svbp6JBz1UWDXmMU1dXm9XkNGD6GPM1OqyAJaAsbkso8rA+RQCIP
 poK1biHWbHJ97nyT1TTdARLxqoq8WrbMHkusJMfG5vLjnUxwfUzCVMj6CArJQ1jWZW7oMhmi+Sj
 lmZSay9Yi9qpg4N7rL7NvQ7OlGiQrKbXTclyrzJfSgPSWllRl0oUfBHoLkdaS6+8QGilo1vYe2K
 f983wBi7NXS4o5T8o564D7mqlP/q6l369FWZ5lxDDwhPZEUtt9NRYCP7csKOGI0luXm+Lb3c2d0
 HQHdmnJ2++ETbPX2+mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010153_881727_92D5FDD7 
X-CRM114-Status: GOOD (  22.25  )
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

Add a provider for the Qualcomm Debug Control Protocol (QDCP), the QMI
(Qualcomm MSM Interface) service over QRTR (Qualcomm IPC Router) that
Linux uses to control debug and trace blocks owned by the Qualcomm
Embedded Co-Processor (QECP) firmware. The application processor (AP)
cannot access the registers of those blocks, so consumers ask firmware
to enable, disable and query them through typed provider APIs.

The provider is a Qualcomm platform/QMI service driver rather than a
CoreSight graph device. Consumers look it up through the qcom,qdcp
phandle, which must reference a connection-N child of the provider
node. The lookup takes a core-managed device link, so unbinding the
provider first unbinds its consumers, and a consumer that probes while
the provider is already unbinding defers its probe.

Use the SoC-provider compatible qcom,qdcp and keep the public consumer
API under include/linux/soc/qcom/. QCOM_QDCP selects QCOM_QMI_HELPERS
because that symbol has no prompt and can only be enabled by a select.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig      |  12 +
 drivers/soc/qcom/Makefile     |   1 +
 drivers/soc/qcom/qcom_qdcp.c  | 985 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/qdcp.h | 128 ++++++
 4 files changed, 1126 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b..5a7ad571cc58 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -330,6 +330,18 @@ config QCOM_QMI_TMD
 	  TMD messaging and handles QMI communication with remote processors
 	  to exchange mitigation state and apply thermal mitigation requests.
 
+config QCOM_QDCP
+	tristate "Qualcomm Debug Control Protocol driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on NET && QRTR
+	select QCOM_QMI_HELPERS
+	help
+	  This driver provides the Qualcomm Debug Control Protocol provider
+	  used by QECP-owned debug and trace blocks.  It is not registered as
+	  a CoreSight device; subsystem drivers call its typed APIs when block
+	  registers are owned by QECP firmware.
+
 config QCOM_UBWC_CONFIG
 	tristate
 	depends on QCOM_SMEM
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index bddd6f0a5836..5c2b4e1c67dc 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -17,6 +17,7 @@ CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
 obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
+obj-$(CONFIG_QCOM_QDCP)	+= qcom_qdcp.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
 obj-$(CONFIG_QCOM_RMTFS_MEM)	+= rmtfs_mem.o
 obj-$(CONFIG_QCOM_RPM_MASTER_STATS)	+= rpm_master_stats.o
diff --git a/drivers/soc/qcom/qcom_qdcp.c b/drivers/soc/qcom/qcom_qdcp.c
new file mode 100644
index 000000000000..295138b29881
--- /dev/null
+++ b/drivers/soc/qcom/qcom_qdcp.c
@@ -0,0 +1,985 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/jiffies.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/qmi.h>
+
+#define QCOM_QDCP_PROVIDER
+#include <linux/soc/qcom/qdcp.h>
+
+#define QDCP_TIMEOUT_MS			10000
+#define QDCP_MAX_MSG_LEN		256
+#define QDCP_MAX_ATIDS			8
+
+#define QDCP_STM_SET_STATE		0x0003
+#define QDCP_STM_HWE_SET_STATE		0x0005
+#define QDCP_STM_SET_PARAM		0x0007
+#define QDCP_TMC_SET_STATE		0x002b
+#define QDCP_TMC_ASSIGN_BUFFER		0x002d
+#define QDCP_TMC_SET_PARAM		0x0033
+#define QDCP_TMC_GET_PARAM		0x0034
+#define QDCP_ATID_SET			0x0036
+
+#define QDCP_STM_PARAM_PORT_ENABLE	0x1002
+
+/* Firmware trace-source type used in QDCP_ATID_SET requests. */
+enum qdcp_trace_source {
+	QDCP_TRACE_SOURCE_STM = 0,
+};
+
+struct qdcp_trace_source_v01 {
+	s32 type;
+	u64 id;
+};
+
+/*
+ * Every QDCP response starts with the mandatory QMI result TLV;
+ * qdcp_send_resp() relies on that to check the result without being told
+ * where it lives.
+ */
+struct qdcp_resp_v01 {
+	struct qmi_response_type_v01 resp;
+};
+
+struct qdcp_state_req_v01 {
+	u64 id;
+	s32 state;
+};
+
+struct qdcp_stm_set_param_req_v01 {
+	u64 stm_id;
+	u32 param;
+	u32 value;
+};
+
+struct qdcp_atid_set_req_v01 {
+	struct qdcp_trace_source_v01 trace_source;
+	u8 atids[QDCP_MAX_ATIDS];
+	u8 num_atids;
+};
+
+struct qdcp_tmc_buffer_v01 {
+	u64 paddr;
+	u64 iaddr;
+	u64 size;
+};
+
+struct qdcp_tmc_assign_buffer_req_v01 {
+	u64 tmc_id;
+	struct qdcp_tmc_buffer_v01 buffer;
+};
+
+struct qdcp_tmc_set_param_req_v01 {
+	u64 tmc_id;
+	u32 param;
+	u64 value;
+};
+
+struct qdcp_tmc_get_param_req_v01 {
+	u64 tmc_id;
+	u32 param;
+};
+
+struct qdcp_tmc_get_param_resp_v01 {
+	struct qmi_response_type_v01 resp;
+	u8 value_valid;
+	u64 value;
+};
+
+static_assert(offsetof(struct qdcp_resp_v01, resp) == 0);
+static_assert(offsetof(struct qdcp_tmc_get_param_resp_v01, resp) == 0);
+
+/**
+ * struct qdcp_data - QDCP connection state.
+ * @ref: lifetime reference for connection consumers.
+ * @dev: parent provider device.
+ * @of_node: connection device tree node.
+ * @qmi: QMI service handle.
+ * @sq: QRTR server address.
+ * @lock: serializes QMI connection state and transactions.
+ * @node: entry in the global provider lookup list.
+ * @service_id: QDCP QMI service identifier.
+ * @version: QDCP QMI service version.
+ * @instance_id: QDCP QMI instance identifier.
+ * @connected: true when the QDCP service is available.
+ * @dying: true when provider removal has started.
+ */
+struct qdcp_data {
+	struct kref ref;
+	struct device *dev;
+	struct device_node *of_node;
+	struct qmi_handle qmi;
+	struct sockaddr_qrtr sq;
+	/* Serializes QMI connection state and transactions. */
+	struct mutex lock;
+	struct list_head node;
+	u32 service_id;
+	u32 version;
+	u32 instance_id;
+	bool connected;
+	bool dying;
+};
+
+static LIST_HEAD(qdcp_providers);
+static DEFINE_MUTEX(qdcp_providers_lock);
+
+static void qdcp_release(struct kref *ref)
+{
+	struct qdcp_data *qdcp = container_of(ref, struct qdcp_data,
+						    ref);
+
+	of_node_put(qdcp->of_node);
+	put_device(qdcp->dev);
+	kfree(qdcp);
+}
+
+static const struct qmi_elem_info qdcp_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_resp_v01, resp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_state_req_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct qdcp_state_req_v01, id),
+	},
+	{
+		.data_type = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len = 1,
+		.elem_size = sizeof(s32),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_state_req_v01, state),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_stm_set_param_req_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct qdcp_stm_set_param_req_v01, stm_id),
+	},
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u32),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_stm_set_param_req_v01, param),
+	},
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u32),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x03,
+		.offset = offsetof(struct qdcp_stm_set_param_req_v01, value),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_trace_source_ei[] = {
+	{
+		.data_type = QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len = 1,
+		.elem_size = sizeof(s32),
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+		.offset = offsetof(struct qdcp_trace_source_v01, type),
+	},
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+		.offset = offsetof(struct qdcp_trace_source_v01, id),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_atid_set_req_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qdcp_trace_source_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct qdcp_atid_set_req_v01, trace_source),
+		.ei_array = qdcp_trace_source_ei,
+	},
+	{
+		.data_type = QMI_UNSIGNED_1_BYTE,
+		.elem_len = QDCP_MAX_ATIDS,
+		.elem_size = sizeof(u8),
+		.array_type = STATIC_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_atid_set_req_v01, atids),
+	},
+	{
+		.data_type = QMI_UNSIGNED_1_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u8),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x03,
+		.offset = offsetof(struct qdcp_atid_set_req_v01, num_atids),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_tmc_buffer_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+		.offset = offsetof(struct qdcp_tmc_buffer_v01, paddr),
+	},
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+		.offset = offsetof(struct qdcp_tmc_buffer_v01, iaddr),
+	},
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+		.offset = offsetof(struct qdcp_tmc_buffer_v01, size),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_tmc_assign_buffer_req_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct qdcp_tmc_assign_buffer_req_v01, tmc_id),
+	},
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qdcp_tmc_buffer_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_tmc_assign_buffer_req_v01, buffer),
+		.ei_array = qdcp_tmc_buffer_ei,
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_tmc_get_param_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_tmc_get_param_resp_v01, resp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		/* Decode sets value_valid only if the value TLV is present. */
+		.data_type = QMI_OPT_FLAG,
+		.elem_len = 1,
+		.elem_size = sizeof(u8),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x03,
+		.offset = offsetof(struct qdcp_tmc_get_param_resp_v01,
+				   value_valid),
+	},
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x03,
+		.offset = offsetof(struct qdcp_tmc_get_param_resp_v01, value),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_tmc_set_param_req_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct qdcp_tmc_set_param_req_v01, tmc_id),
+	},
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u32),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_tmc_set_param_req_v01, param),
+	},
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x03,
+		.offset = offsetof(struct qdcp_tmc_set_param_req_v01, value),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static const struct qmi_elem_info qdcp_tmc_get_param_req_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_8_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u64),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct qdcp_tmc_get_param_req_v01, tmc_id),
+	},
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(u32),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct qdcp_tmc_get_param_req_v01, param),
+	},
+	{
+		.data_type = QMI_EOTI,
+	},
+};
+
+static int qdcp_check_resp(struct qdcp_data *qdcp,
+			   const struct qmi_response_type_v01 *resp)
+{
+	if (resp->result == QMI_RESULT_SUCCESS_V01)
+		return 0;
+
+	dev_err(qdcp->dev, "QMI request failed: result=%u error=%u\n",
+		resp->result, resp->error);
+	return -EIO;
+}
+
+static int qdcp_send_resp(struct qdcp_data *qdcp, unsigned int msg_id,
+			  const struct qmi_elem_info *req_ei, const void *req,
+			  size_t req_len, const struct qmi_elem_info *resp_ei,
+			  void *resp, size_t resp_len)
+{
+	/* @resp starts with the QMI result TLV, see struct qdcp_resp_v01. */
+	struct qmi_response_type_v01 *qmi_resp = resp;
+	struct sockaddr_qrtr sq;
+	struct qmi_txn txn;
+	bool connected, dying;
+	int ret;
+
+	/*
+	 * Only snapshot connection state under qdcp->lock; do not hold it
+	 * across qmi_txn_wait(). qdcp_del_server()/qdcp_net_reset() also take
+	 * qdcp->lock and run on qdcp->qmi's ordered workqueue, the same
+	 * workqueue that must process the response completing this
+	 * transaction. Holding the lock across the wait can deadlock: the
+	 * workqueue thread blocks on qdcp->lock while this waiter blocks on
+	 * a completion only that (now-blocked) workqueue thread can deliver.
+	 */
+	mutex_lock(&qdcp->lock);
+	dying = qdcp->dying;
+	connected = qdcp->connected;
+	sq = qdcp->sq;
+	mutex_unlock(&qdcp->lock);
+
+	if (dying)
+		/* Provider is being removed: this is a permanent failure. */
+		return -ENODEV;
+
+	if (!connected)
+		/*
+		 * The QDCP QMI service has not registered yet (or dropped
+		 * off transiently). Report -EAGAIN rather than -ENODEV so
+		 * callers can distinguish "retry later" from "never coming
+		 * back", and defer probe instead of failing outright.
+		 */
+		return -EAGAIN;
+
+	memset(resp, 0, resp_len);
+	/*
+	 * QMI_RESULT_SUCCESS_V01 is 0, the same value memset() above just
+	 * wrote into qmi_resp->result. A firmware reply that omits the
+	 * mandatory response TLV (qmi_decode_message() does not treat a
+	 * missing TLV as an error, it just decodes however many bytes are
+	 * actually present) would otherwise leave that zero in place and
+	 * read back as an implicit success. Poison it to a failure value
+	 * first so decode must positively overwrite it with
+	 * QMI_RESULT_SUCCESS_V01 for qdcp_check_resp() to accept the reply.
+	 */
+	qmi_resp->result = QMI_RESULT_FAILURE_V01;
+	qmi_resp->error = QMI_ERR_MALFORMED_MSG_V01;
+
+	ret = qmi_txn_init(&qdcp->qmi, &txn, resp_ei, resp);
+	if (ret < 0)
+		return ret;
+
+	ret = qmi_send_request(&qdcp->qmi, &sq, &txn, msg_id, req_len, req_ei,
+			       req);
+	if (ret < 0) {
+		qmi_txn_cancel(&txn);
+		return ret;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(QDCP_TIMEOUT_MS));
+	if (ret < 0)
+		return ret;
+
+	return qdcp_check_resp(qdcp, qmi_resp);
+}
+
+static int qdcp_send(struct qdcp_data *qdcp, unsigned int msg_id,
+		     const struct qmi_elem_info *req_ei, const void *req,
+		     size_t req_len, struct qdcp_resp_v01 *resp)
+{
+	return qdcp_send_resp(qdcp, msg_id, req_ei, req, req_len, qdcp_resp_ei,
+			      resp, sizeof(*resp));
+}
+
+static int qdcp_set_state(struct qdcp_data *qdcp, unsigned int msg_id,
+			  u64 id, bool enable)
+{
+	struct qdcp_state_req_v01 req = {
+		.id = id,
+		.state = enable,
+	};
+	struct qdcp_resp_v01 resp;
+
+	return qdcp_send(qdcp, msg_id, qdcp_state_req_ei, &req, sizeof(req),
+			 &resp);
+}
+
+struct qdcp_devres {
+	struct qdcp_data *qdcp;
+};
+
+static void qdcp_release_provider(void *data)
+{
+	struct qdcp_devres *devres = data;
+
+	put_device(devres->qdcp->dev);
+	kref_put(&devres->qdcp->ref, qdcp_release);
+}
+
+struct qdcp_data *devm_qdcp_get(struct device *dev, const char *phandle_name)
+{
+	struct qdcp_devres *devres;
+	struct device_link *link;
+	struct qdcp_data *qdcp;
+	struct device_node *np;
+	int ret;
+
+	if (!dev->of_node)
+		return ERR_PTR(-ENOENT);
+
+	np = of_parse_phandle(dev->of_node, phandle_name, 0);
+	if (!np)
+		return ERR_PTR(-ENOENT);
+
+	mutex_lock(&qdcp_providers_lock);
+	list_for_each_entry(qdcp, &qdcp_providers, node) {
+		if (qdcp->of_node != np || qdcp->dying)
+			continue;
+
+		if (!kref_get_unless_zero(&qdcp->ref))
+			continue;
+
+		get_device(qdcp->dev);
+		mutex_unlock(&qdcp_providers_lock);
+		of_node_put(np);
+
+		/*
+		 * A managed link with DL_FLAG_AUTOREMOVE_CONSUMER (i.e. no
+		 * DL_FLAG_STATELESS) is required so that the driver core's
+		 * device_links_busy()/device_links_unbind_consumers()
+		 * machinery forces this consumer to unbind before
+		 * qdcp_remove() can proceed on the supplier, and so the link
+		 * itself is dropped automatically by the core when this
+		 * consumer unbinds or fails to probe. A stateless link
+		 * carries neither guarantee: qdcp_remove() could release the
+		 * QMI handle while a consumer still has outstanding or
+		 * in-flight QDCP RPCs, and device_link_del() refuses to drop
+		 * a non-stateless link while the consumer is still
+		 * registered, which is always the case from inside a devm
+		 * release callback.
+		 */
+		link = device_link_add(dev, qdcp->dev,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!link) {
+			put_device(qdcp->dev);
+			kref_put(&qdcp->ref, qdcp_release);
+			return ERR_PTR(-EINVAL);
+		}
+
+		/*
+		 * The core still creates a link to a supplier that is already
+		 * unbinding, and will not unbind this consumer for it. Defer
+		 * rather than bind to a provider that is going away.
+		 */
+		if (READ_ONCE(link->status) == DL_STATE_SUPPLIER_UNBIND) {
+			put_device(qdcp->dev);
+			kref_put(&qdcp->ref, qdcp_release);
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+
+		devres = devm_kzalloc(dev, sizeof(*devres), GFP_KERNEL);
+		if (!devres) {
+			put_device(qdcp->dev);
+			kref_put(&qdcp->ref, qdcp_release);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		devres->qdcp = qdcp;
+		ret = devm_add_action_or_reset(dev, qdcp_release_provider, devres);
+		if (ret)
+			return ERR_PTR(ret);
+
+		return qdcp;
+	}
+	mutex_unlock(&qdcp_providers_lock);
+	of_node_put(np);
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL_GPL(devm_qdcp_get);
+
+static int qdcp_set_atid(struct qdcp_data *qdcp,
+			 enum qdcp_trace_source source, u64 source_id,
+			 u8 atid)
+{
+	struct qdcp_atid_set_req_v01 req = {
+		.trace_source = {
+			.type = source,
+			.id = source_id,
+		},
+	};
+	struct qdcp_resp_v01 resp;
+
+	if (atid) {
+		req.atids[0] = atid;
+		req.num_atids = 1;
+	}
+
+	return qdcp_send(qdcp, QDCP_ATID_SET, qdcp_atid_set_req_ei, &req,
+			 sizeof(req), &resp);
+}
+
+int qdcp_stm_source_enable(struct qdcp_data *qdcp, u64 stm_id,
+			   u8 atid, u32 port_mask, bool hwevent)
+{
+	struct qdcp_stm_set_param_req_v01 port_req = {
+		.stm_id = stm_id,
+		.param = QDCP_STM_PARAM_PORT_ENABLE,
+		.value = port_mask,
+	};
+	struct qdcp_resp_v01 resp;
+	int ret;
+
+	ret = qdcp_set_atid(qdcp, QDCP_TRACE_SOURCE_STM, stm_id, atid);
+	if (ret)
+		return ret;
+
+	if (hwevent) {
+		ret = qdcp_set_state(qdcp, QDCP_STM_HWE_SET_STATE, stm_id, true);
+		if (ret)
+			goto clear_atid;
+	}
+
+	ret = qdcp_send(qdcp, QDCP_STM_SET_PARAM, qdcp_stm_set_param_req_ei,
+			&port_req, sizeof(port_req), &resp);
+	if (ret)
+		goto disable_hwevent;
+
+	ret = qdcp_set_state(qdcp, QDCP_STM_SET_STATE, stm_id, true);
+	if (ret)
+		goto disable_hwevent;
+
+	return 0;
+
+disable_hwevent:
+	if (hwevent)
+		qdcp_set_state(qdcp, QDCP_STM_HWE_SET_STATE, stm_id, false);
+clear_atid:
+	qdcp_set_atid(qdcp, QDCP_TRACE_SOURCE_STM, stm_id, 0);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qdcp_stm_source_enable);
+
+int qdcp_stm_source_disable(struct qdcp_data *qdcp, u64 stm_id,
+			    u8 atid, bool hwevent)
+{
+	int ret, err;
+
+	/* Best effort: run every step and report the first failure. */
+	ret = qdcp_set_state(qdcp, QDCP_STM_SET_STATE, stm_id, false);
+	if (hwevent) {
+		err = qdcp_set_state(qdcp, QDCP_STM_HWE_SET_STATE, stm_id,
+				     false);
+		ret = ret ?: err;
+	}
+	err = qdcp_set_atid(qdcp, QDCP_TRACE_SOURCE_STM, stm_id, 0);
+
+	return ret ?: err;
+}
+EXPORT_SYMBOL_GPL(qdcp_stm_source_disable);
+
+static int qdcp_tmc_set_param(struct qdcp_data *qdcp, u64 tmc_id,
+			      enum qdcp_tmc_param param, u64 value)
+{
+	struct qdcp_tmc_set_param_req_v01 req = {
+		.tmc_id = tmc_id,
+		.param = param,
+		.value = value,
+	};
+	struct qdcp_resp_v01 resp;
+
+	return qdcp_send(qdcp, QDCP_TMC_SET_PARAM, qdcp_tmc_set_param_req_ei,
+			 &req, sizeof(req), &resp);
+}
+
+int qdcp_tmc_get_param(struct qdcp_data *qdcp, u64 tmc_id,
+		       enum qdcp_tmc_param param, u64 *value)
+{
+	struct qdcp_tmc_get_param_req_v01 req = {
+		.tmc_id = tmc_id,
+		.param = param,
+	};
+	struct qdcp_tmc_get_param_resp_v01 resp;
+	int ret;
+
+	ret = qdcp_send_resp(qdcp, QDCP_TMC_GET_PARAM,
+			     qdcp_tmc_get_param_req_ei, &req, sizeof(req),
+			     qdcp_tmc_get_param_resp_ei, &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (!resp.value_valid)
+		return -EPROTO;
+
+	*value = resp.value;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qdcp_tmc_get_param);
+
+static int qdcp_tmc_enable(struct qdcp_data *qdcp, u64 tmc_id)
+{
+	return qdcp_set_state(qdcp, QDCP_TMC_SET_STATE, tmc_id, true);
+}
+
+static int qdcp_tmc_disable(struct qdcp_data *qdcp, u64 tmc_id)
+{
+	return qdcp_set_state(qdcp, QDCP_TMC_SET_STATE, tmc_id, false);
+}
+
+static int qdcp_tmc_assign_buffer(struct qdcp_data *qdcp, u64 tmc_id,
+				  phys_addr_t paddr, dma_addr_t iaddr,
+				  size_t size)
+{
+	struct qdcp_tmc_assign_buffer_req_v01 req = {
+		.tmc_id = tmc_id,
+		.buffer = {
+			.paddr = paddr,
+			.iaddr = iaddr,
+			.size = size,
+		},
+	};
+	struct qdcp_resp_v01 resp;
+
+	return qdcp_send(qdcp, QDCP_TMC_ASSIGN_BUFFER,
+			 qdcp_tmc_assign_buffer_req_ei, &req, sizeof(req), &resp);
+}
+
+int qdcp_tmc_etr_enable(struct qdcp_data *qdcp, const struct qdcp_tmc_cfg *cfg)
+{
+	int ret;
+
+	ret = qdcp_tmc_set_param(qdcp, cfg->tmc_id,
+				 QDCP_TMC_PARAM_SG_MODE,
+				 cfg->sg_mode ? 1 : 0);
+	if (ret)
+		return ret;
+
+	if (cfg->ffcr) {
+		ret = qdcp_tmc_set_param(qdcp, cfg->tmc_id,
+					 QDCP_TMC_PARAM_FFCR,
+					 cfg->ffcr);
+		if (ret)
+			return ret;
+	}
+
+	ret = qdcp_tmc_assign_buffer(qdcp, cfg->tmc_id, cfg->paddr, cfg->iaddr,
+				     cfg->size);
+	if (ret)
+		return ret;
+
+	return qdcp_tmc_enable(qdcp, cfg->tmc_id);
+}
+EXPORT_SYMBOL_GPL(qdcp_tmc_etr_enable);
+
+int qdcp_tmc_etr_disable(struct qdcp_data *qdcp, u64 tmc_id)
+{
+	return qdcp_tmc_disable(qdcp, tmc_id);
+}
+EXPORT_SYMBOL_GPL(qdcp_tmc_etr_disable);
+
+static int qdcp_new_server(struct qmi_handle *qmi, struct qmi_service *svc)
+{
+	struct qdcp_data *qdcp = container_of(qmi, struct qdcp_data,
+						    qmi);
+
+	if (svc->version != qdcp->version || svc->instance != qdcp->instance_id)
+		return -EINVAL;
+
+	mutex_lock(&qdcp->lock);
+	qdcp->sq.sq_family = AF_QIPCRTR;
+	qdcp->sq.sq_node = svc->node;
+	qdcp->sq.sq_port = svc->port;
+	qdcp->connected = true;
+	svc->priv = qdcp;
+	mutex_unlock(&qdcp->lock);
+
+	dev_info(qdcp->dev, "connected to QECP QDCP service %u instance %u\n",
+		 qdcp->service_id, qdcp->instance_id);
+	return 0;
+}
+
+static void qdcp_del_server(struct qmi_handle *qmi, struct qmi_service *svc)
+{
+	struct qdcp_data *qdcp = svc->priv;
+
+	if (!qdcp)
+		return;
+
+	mutex_lock(&qdcp->lock);
+	/*
+	 * svc->priv only proves this svc was once matched by
+	 * qdcp_new_server(); it doesn't prove svc is the currently active
+	 * server. A firmware restart can register a new server (updating
+	 * qdcp->sq) before the old server's DEL_SERVER arrives here, so
+	 * only clear the connection if this del_server is for the node/port
+	 * qdcp is actually connected to.
+	 */
+	if (qdcp->connected && qdcp->sq.sq_node == svc->node &&
+	    qdcp->sq.sq_port == svc->port) {
+		qdcp->connected = false;
+		memset(&qdcp->sq, 0, sizeof(qdcp->sq));
+		dev_info(qdcp->dev, "disconnected from QECP QDCP service\n");
+	}
+	mutex_unlock(&qdcp->lock);
+}
+
+static void qdcp_net_reset(struct qmi_handle *qmi)
+{
+	struct qdcp_data *qdcp = container_of(qmi, struct qdcp_data,
+						    qmi);
+
+	mutex_lock(&qdcp->lock);
+	qdcp->connected = false;
+	memset(&qdcp->sq, 0, sizeof(qdcp->sq));
+	mutex_unlock(&qdcp->lock);
+}
+
+static const struct qmi_ops qdcp_qmi_ops = {
+	.new_server = qdcp_new_server,
+	.del_server = qdcp_del_server,
+	.net_reset = qdcp_net_reset,
+};
+
+static void qdcp_connection_free(struct qdcp_data *qdcp)
+{
+	qmi_handle_release(&qdcp->qmi);
+	kref_put(&qdcp->ref, qdcp_release);
+}
+
+static struct qdcp_data *qdcp_connection_create(struct device *dev,
+						struct device_node *np)
+{
+	struct qdcp_data *qdcp;
+	int ret;
+
+	qdcp = kzalloc_obj(*qdcp);
+	if (!qdcp)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&qdcp->ref);
+	qdcp->dev = get_device(dev);
+	qdcp->of_node = of_node_get(np);
+	mutex_init(&qdcp->lock);
+	INIT_LIST_HEAD(&qdcp->node);
+
+	ret = of_property_read_u32(np, "qcom,service-id", &qdcp->service_id);
+	if (ret) {
+		dev_err(dev, "%pOFn: missing qcom,service-id: %d\n", np, ret);
+		goto err_release;
+	}
+
+	ret = of_property_read_u32(np, "qcom,instance-id", &qdcp->instance_id);
+	if (ret) {
+		dev_err(dev, "%pOFn: missing qcom,instance-id: %d\n", np, ret);
+		goto err_release;
+	}
+
+	/* qcom,version is optional; default to version 1 when absent. */
+	if (of_property_read_u32(np, "qcom,version", &qdcp->version))
+		qdcp->version = 1;
+
+	ret = qmi_handle_init(&qdcp->qmi, QDCP_MAX_MSG_LEN, &qdcp_qmi_ops, NULL);
+	if (ret) {
+		dev_err(dev, "%pOFn: failed to initialize QMI handle: %d\n",
+			np, ret);
+		goto err_release;
+	}
+
+	ret = qmi_add_lookup(&qdcp->qmi, qdcp->service_id, qdcp->version,
+			     qdcp->instance_id);
+	if (ret) {
+		dev_err(dev, "%pOFn: failed to add QMI lookup: %d\n", np, ret);
+		qmi_handle_release(&qdcp->qmi);
+		goto err_release;
+	}
+
+	dev_info(dev, "%pOFn: registered QDCP connection service=%u version=%u instance=%u\n",
+		 np, qdcp->service_id, qdcp->version, qdcp->instance_id);
+	return qdcp;
+
+err_release:
+	kref_put(&qdcp->ref, qdcp_release);
+	return ERR_PTR(ret);
+}
+
+static int qdcp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qdcp_data *qdcp, *tmp;
+	LIST_HEAD(conn_list);
+	int ret;
+
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
+		qdcp = qdcp_connection_create(dev, np);
+		if (IS_ERR(qdcp)) {
+			ret = PTR_ERR(qdcp);
+			goto err_unwind;
+		}
+		list_add_tail(&qdcp->node, &conn_list);
+	}
+
+	/*
+	 * A provider with no connection-N children is valid, since the binding
+	 * cannot require one; it simply has nothing for consumers to reference.
+	 */
+	if (list_empty(&conn_list))
+		dev_warn(dev, "no QDCP connection child nodes found\n");
+
+	mutex_lock(&qdcp_providers_lock);
+	list_splice_tail(&conn_list, &qdcp_providers);
+	mutex_unlock(&qdcp_providers_lock);
+
+	return 0;
+
+err_unwind:
+	list_for_each_entry_safe(qdcp, tmp, &conn_list, node) {
+		list_del(&qdcp->node);
+		qdcp_connection_free(qdcp);
+	}
+	return ret;
+}
+
+static void qdcp_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qdcp_data *qdcp, *tmp;
+	LIST_HEAD(removed);
+
+	mutex_lock(&qdcp_providers_lock);
+	list_for_each_entry_safe(qdcp, tmp, &qdcp_providers, node) {
+		if (qdcp->dev != dev)
+			continue;
+		list_move_tail(&qdcp->node, &removed);
+	}
+	mutex_unlock(&qdcp_providers_lock);
+
+	list_for_each_entry_safe(qdcp, tmp, &removed, node) {
+		mutex_lock(&qdcp->lock);
+		qdcp->dying = true;
+		qdcp->connected = false;
+		mutex_unlock(&qdcp->lock);
+
+		list_del(&qdcp->node);
+		qdcp_connection_free(qdcp);
+	}
+}
+
+static const struct of_device_id qdcp_match[] = {
+	{ .compatible = "qcom,qdcp" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qdcp_match);
+
+static struct platform_driver qdcp_driver = {
+	.probe = qdcp_probe,
+	.remove = qdcp_remove,
+	.driver = {
+		.name = "qcom-qdcp",
+		.of_match_table = qdcp_match,
+	},
+};
+module_platform_driver(qdcp_driver);
+
+MODULE_DESCRIPTION("Qualcomm Debug Control Protocol provider");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/qcom/qdcp.h b/include/linux/soc/qcom/qdcp.h
new file mode 100644
index 000000000000..cff50bae3c15
--- /dev/null
+++ b/include/linux/soc/qcom/qdcp.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _LINUX_SOC_QCOM_QDCP_H
+#define _LINUX_SOC_QCOM_QDCP_H
+
+#include <linux/err.h>
+#include <linux/kconfig.h>
+#include <linux/errno.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+struct device;
+struct qdcp_data;
+
+/**
+ * struct qdcp_consumer - per-consumer QDCP connection state.
+ * @provider: QDCP QMI connection this consumer was resolved against.
+ * @id: firmware identifier for this consumer within @provider (STM source
+ *	id or TMC id, depending on which consumer embeds this struct).
+ * @lock: serializes this consumer's QDCP firmware calls together with
+ *	whatever consumer-local state (mode, refcount, buffers, ...) must
+ *	stay atomic with them. Needed because QDCP enable/disable makes a
+ *	sleeping firmware RPC and therefore cannot be guarded by a spinlock.
+ *
+ * Embedded by Qualcomm CoreSight consumer drivers (QDCP STM source, QDCP
+ * TMC/ETR sink) that talk to a firmware-owned trace block through QDCP.
+ */
+struct qdcp_consumer {
+	struct qdcp_data *provider;
+	u64 id;
+	/* Serializes this consumer's QDCP firmware calls; see field comment. */
+	struct mutex lock;
+};
+
+/*
+ * QDCP TMC parameter identifiers used in QDCP_TMC_GET_PARAM/SET_PARAM
+ * requests. These are firmware-defined parameter IDs, not a mirror of the
+ * TMC MMIO register map: STS, FFCR, and DEVID happen to share their values
+ * with the corresponding TMC_STS/TMC_FFCR/CORESIGHT_DEVID register offsets
+ * because firmware proxies those specific parameters as literal register
+ * reads, but SG_MODE, RRP, and RWP are firmware-only parameter IDs with no
+ * corresponding MMIO offset. Do not "align" RRP/RWP to TMC_RRP/TMC_RWP —
+ * that would send the wrong parameter ID to firmware.
+ */
+enum qdcp_tmc_param {
+	QDCP_TMC_PARAM_STS = 0x00c,
+	QDCP_TMC_PARAM_FFCR = 0x304,
+	QDCP_TMC_PARAM_SG_MODE = 0x1002,
+	QDCP_TMC_PARAM_RRP = 0x1003,
+	QDCP_TMC_PARAM_RWP = 0x1004,
+	QDCP_TMC_PARAM_DEVID = 0xfc8,
+};
+
+struct qdcp_tmc_cfg {
+	u64 tmc_id;
+	phys_addr_t paddr;
+	dma_addr_t iaddr;
+	size_t size;
+	bool sg_mode;
+	u32 ffcr;
+};
+
+#if IS_REACHABLE(CONFIG_QCOM_QDCP) || defined(QCOM_QDCP_PROVIDER)
+/**
+ * devm_qdcp_get() - look up a QDCP connection by phandle
+ * @dev: consumer device whose DT node holds @phandle_name
+ * @phandle_name: name of the phandle property, e.g. "qcom,qdcp"
+ *
+ * @phandle_name must reference a "connection-N" child node of a
+ * "qcom,qdcp" provider (see
+ * Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml), not the
+ * top-level provider node itself. A phandle to the provider node will
+ * never match and the lookup will keep returning -EPROBE_DEFER.
+ *
+ * Return: connection handle, or an error pointer on failure.
+ */
+struct qdcp_data *devm_qdcp_get(struct device *dev, const char *phandle_name);
+int qdcp_stm_source_enable(struct qdcp_data *qdcp, u64 stm_id, u8 atid,
+			   u32 port_mask, bool hwevent);
+int qdcp_stm_source_disable(struct qdcp_data *qdcp, u64 stm_id, u8 atid,
+			    bool hwevent);
+int qdcp_tmc_get_param(struct qdcp_data *qdcp, u64 tmc_id,
+		       enum qdcp_tmc_param param, u64 *value);
+int qdcp_tmc_etr_enable(struct qdcp_data *qdcp,
+			const struct qdcp_tmc_cfg *cfg);
+int qdcp_tmc_etr_disable(struct qdcp_data *qdcp, u64 tmc_id);
+#else
+static inline struct qdcp_data *
+devm_qdcp_get(struct device *dev, const char *phandle_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline int qdcp_stm_source_enable(struct qdcp_data *qdcp, u64 stm_id,
+					 u8 atid, u32 port_mask, bool hwevent)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int qdcp_stm_source_disable(struct qdcp_data *qdcp,
+					  u64 stm_id, u8 atid, bool hwevent)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+qdcp_tmc_get_param(struct qdcp_data *qdcp, u64 tmc_id,
+		   enum qdcp_tmc_param param, u64 *value)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+qdcp_tmc_etr_enable(struct qdcp_data *qdcp, const struct qdcp_tmc_cfg *cfg)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int qdcp_tmc_etr_disable(struct qdcp_data *qdcp, u64 tmc_id)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif

-- 
2.34.1


