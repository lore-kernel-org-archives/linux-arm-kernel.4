Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D00606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ReffkzhZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyOcC/Qe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U0/3aqEl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yu1WLyNNBdbDCqNMuhUSjTu+NdHjQ3H5qJLnUEQKfTs=; b=ReffkzhZAh6skL
	+5H+Kep7Jyunky/N8boqaaPUo9sy1Tyl5d2ISOi8wrFaLJ7LCelhHZbaxCsEYELzRiGmxve7ejdj9
	Ejskv6bareFvfiOLw55zq5JnxdbThu71TOxaG0dhgg/7v5Q2N9r8vzDPvn7AERF/NRenP4LHWeE2v
	2h6wvcH10pFhxgcDcU078pQx61i080lUE0ZHBDVqoOYi+V28dzfCp3eTsaE07refpH2119s1ijM0r
	ve5GNPKd3QadlebSC1R0oVCtnILHYDrDoWSjWw393d4+u/XmxPYo4pLohqbAwE/sqdkx9rUAAXxje
	rl6WC6MngQ0zn/eMf9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy2V-0000000BK5Q-0M1x;
	Thu, 19 Nov 2026 09:02:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy1s-0000000BJoC-3lVx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:02:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7tdZl1696562
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu1WLyNNBdbDCqNMuhUSjTu+NdHjQ3H5qJLnUEQKfTs=; b=IyOcC/QeS26j2m6D
	6UExrSdZMEX+sKo6XTKluQ+cvXDO3SBTgoKd9EhNMRWOCO463A4+J6ZQSuvzBjzV
	4D00laecQgfe4oAXcXK1g4TvlQRMPyzlym0H+YIuRxPl3mY1cyBEQyci7ilg3BUu
	oRRrYcuRq6T4Q4xAWM6fxdriQiwMQY59c/FQhtdUS4lOWeossmUJTHi1XhcipyFj
	23j33KiG6Fkdz1z3FkLOcexjsh0d/O+yprNkBveyWJ7FFQTvwFNdJ67/qJzAQNLT
	hjnwKRpcXOKGQI7qhvittLkIrvvZf3MzzgK96gNLfZYBfo5vRcC5wnCKe4PWo0lM
	GhKX/w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8nm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:02:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so2709087a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078922; x=1795683722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu1WLyNNBdbDCqNMuhUSjTu+NdHjQ3H5qJLnUEQKfTs=;
        b=U0/3aqElT/1PXzdDR1/it1EH+smEV0bvcnqkJnfFz2jMNZrIKp6uFmEYYPVonIRgdF
         1awSpkr0MSJZ4ho6TmGY/MoJH8KHen13kd2qAKV90euiKTeuKrFp0bpjtoApLVEgAWlQ
         vv4T6OdpO2+UFVrlbtb4sNp9QeQNU2hgx9VdV1fOPQvcC3kJMOrX6e3xPTzLLXYy3qjW
         3dXfeLgGkpcsm47duLn/nciGu/rkrUxelgJOAk5TqGLGJlMvZ48883g7rkFCTDloXD5X
         +PrGqp7F0Lw85ciD3SwZ0OhND+YIicOML2qyy+EvQ3eMekK0t80aTHMQrUTOIKs9N+bL
         qX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078922; x=1795683722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yu1WLyNNBdbDCqNMuhUSjTu+NdHjQ3H5qJLnUEQKfTs=;
        b=dkmxKHd339sB5+Z4gpcUbNMNgUz9t/dTMYlwDHD7Rm+8Dn5mbxQh/NvtAs2NBCxrPx
         Z4yQpb7IAOrE4/swuBZNKPp+NGC4DuxjDQhHimxb3BOuCeA1La9RHxCe/okzywA2Bam/
         S+Gc+szwnANV2fCswUIBapwLhNBiHeO9A2WtybNfzEbG9HvOskg/2XLPItcOWHispllB
         qD8fmv4UBgUp5Z7ZmixUVmhhzgJ18qJn4A0uR2kYIY6Hc+YA7ORcgTtRzIlCwdr688pp
         egu84Ql/wxj/WwAQOUWHZlFefDwHKgFSwnTsJLuAuAXpC5x19l0xKE8R4AD4ozOP8ZpQ
         TRvQ==
X-Forwarded-Encrypted: i=1; AL+hErHkbOfTHDB7L7sRXfMKE68U1IRAg0a7DEwUKmfiYE7Fh+v3Spx1cXx1EhEolm6HUAzdlgPEqEgeOz7tv2wKPOCv@lists.infradead.org
X-Gm-Message-State: APuU4Z8rieidOpZgJUjCVZ2x+DtlhNkJROEWfFYCX8dBlHgaMK8bQkJj
	fcDfdRIqejCrCE0iPE0SpkJWRM/LOAnMM1qflaqyRF5MmBYxtor1dVkU2zqbfrefZ6f8y9Vlf39
	wv5gGYghVOXGv3F2IYVm5hbRL2OleNbKC93IJ1tbALG0QsotdIdwKmTIuwOTg9UTIS/GkIfLZIv
	MAxV2A4ktm0das
X-Gm-Gg: AZFdTZcTfyOOjIbhyszUF2RDyu88VDw9Q6g2KSFJtiKPzJWntB7LErEy+dQCVsg6uKE
	WbeAu5U2ZjOeQF3yZp7MFfmBttJjU1MOBa3xDMeSLpfrCR1I6V3A9xsAJIMSxZfQPS+td6so1m8
	Pmx06h+cxvDyBWplTnL0f1kGntsNDfueCkWQ37xJtQ1exf7D2rQPXjrT2n/hMuIVVPm9tdh7gqr
	d1sZDX5aC7GhlnGjUsVY5C4jonCeZsrHNJXI7ccbQmVZhm0e6Gx7yZw51bUXaqPTg/KeSDUtoqK
	4oamy6HBUbE7QtHVFFh8wZLa/Av/Ss1ZAc/HGY75jNCGbBHcz9eOL+2j23sHbnG07SwLF5qRmYA
	LuU6uaawatobnfWBnGkZeSatjbc92K/vd9Q93sThuz0LBF2r37JLf0C+W2168b0+qzr7teXyB2I
	XA564PR5m8Drl5JFkGovKgCY/kkCnnwtL7qT8p
X-Received: by 2002:a17:90b:1b07:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3b3d07d92a8mr5185171a91.67.1795078922281;
        Thu, 19 Nov 2026 01:02:02 -0800 (PST)
X-Received: by 2002:a17:90b:1b07:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3b3d07d92a8mr5185093a91.67.1795078921470;
        Thu, 19 Nov 2026 01:02:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:02:00 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:17 +0800
Subject: [PATCH RFC 4/6] coresight: qcom: add QDCP STM source
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-4-b1a730d2c57a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078891; l=19952;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SOdqfn7WryU5tL/vCm93fFlg3ZhfwFM5nHhVipZGvUQ=;
 b=glFTJhhSN6rEHAdp8G/cwOC3y6lWeFf/FJ+ceSGsh/+aPznJQUhQ51wVurHdL4+vhktT9ie7u
 G77W27A5VmQCHPWpcy3tTpnhQ5idtiiHlE+2lKwYfaD0kE/TA26/aXp
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: HwK5gJUluiwKYqRRAhUw36-fbSONmm0i
X-Proofpoint-GUID: HwK5gJUluiwKYqRRAhUw36-fbSONmm0i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXwX6DnxXbzyWw
 GqRqdvlj+3C20YvQbsDbp3QwKUDtT4Y7RN92QhZ5Bn/CzAqqJKlSvk3KOWSJdxKSx2uW61067PU
 D8ObxAGLycmp6H/p4zDuL4X62+JB+Uo=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afebb0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5ao-vDG7CpaozfWT88cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXyN0h5raWFGUb
 C5q+Ttcw9hPvmbOkXF/8zijaJ3xfE29CDl2RJLIpD7lZTHynfECCmz8Wj/TXXkvPyq0ILT6WQ3c
 OkcIB8klqx8/Vl28JlYItCeUP/big3fliXTYVT8VGdIaE0bwvWjL/j1LeeBgB8sBrjNLt/CH9gE
 DHAn8okYx9qxUvSJcxB1TfB0UAaZwMxAM37WLWXJbnC9jn8B59hk2XZCW8vl10k1lJ++4wqBqCB
 5ELeErRuMWaCCqXj1A67S5GFl3nTZqgINCnQ7vU8zFsMmtT3ylJAMC37YREAW6c9hKqhq0SBLTz
 j33Uj5aQhuOpXkLp+RRhS6f3kC0Tekeo8qTz/g9YnsSdesVZgXosT3mGVX2TLsSpVisHtQ3w+9V
 MxsSvyg3guPwtrZSDDYY5A9zBZ3O9apyq/w/HO+yKfsH7z5mW8uozfAEV0JiHaDyFLIAq6SPUIC
 lrkXMf7Dvabkytd9mOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010205_225530_D12A7629 
X-CRM114-Status: GOOD (  26.21  )
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

Add a Qualcomm-specific CoreSight STM (System Trace Macrocell) source
for platforms where the Qualcomm Embedded Co-Processor (QECP) firmware
owns the STM control registers.

The driver maps only the AP-visible STM stimulus aperture. Enable and
disable operations go through the Qualcomm Debug Control Protocol
(QDCP) provider referenced by qcom,qdcp, keeping the generic CoreSight
STM driver untouched. Firmware controls the block's clocks and power,
so the driver does no clock handling or runtime PM.

The CoreSight source disable operation cannot fail. If firmware does
not confirm a stop, the source is still marked disabled and a warning
is logged, and the failure is remembered. On removal the trace ID then
stays allocated, so no other source can reuse an ID that firmware may
still be applying. On removal the STM device is unregistered before the
CoreSight device, so its unlink callback never runs on a freed
CoreSight device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/Kconfig                |  11 +
 drivers/hwtracing/coresight/Makefile               |   2 +
 .../hwtracing/coresight/coresight-qcom-qdcp-stm.c  | 550 +++++++++++++++++++++
 3 files changed, 563 insertions(+)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 6a4239ebb582..f6ad698344fe 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -119,6 +119,17 @@ config ETM4X_IMPDEF_FEATURE
 	  ETM 4.x tracer module that can't reduce commit rate automatically.
 	  This avoids overflow between the ETM tracer module and the cpu core.
 
+config CORESIGHT_QCOM_QDCP_STM
+	tristate "Qualcomm QDCP CoreSight STM source driver"
+	depends on QCOM_QDCP
+	select CORESIGHT_LINKS_AND_SINKS
+	select STM
+	help
+	  This driver provides a Qualcomm QDCP-backed CoreSight STM source.
+	  It maps the AP-visible STM stimulus aperture but asks QECP firmware
+	  to enable and disable STM tracing through QDCP instead of touching
+	  STM control registers directly.
+
 config CORESIGHT_STM
 	tristate "CoreSight System Trace Macrocell driver"
 	depends on (ARM && !(CPU_32v3 || CPU_32v4 || CPU_32v4T)) || ARM64
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..d97e334fe1fc 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -23,6 +23,7 @@ condflags := \
 subdir-ccflags-y += $(condflags)
 
 CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
+CFLAGS_coresight-qcom-qdcp-stm.o := -D__DISABLE_TRACE_MMIO__
 
 obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
@@ -43,6 +44,7 @@ coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
 obj-$(CONFIG_CORESIGHT_SOURCE_ETM4X) += coresight-etm4x.o
 coresight-etm4x-y := coresight-etm4x-core.o coresight-etm4x-sysfs.o \
 			coresight-etm4x-cfg.o
+obj-$(CONFIG_CORESIGHT_QCOM_QDCP_STM) += coresight-qcom-qdcp-stm.o
 obj-$(CONFIG_CORESIGHT_STM) += coresight-stm.o
 obj-$(CONFIG_CORESIGHT_CPU_DEBUG) += coresight-cpu-debug.o
 obj-$(CONFIG_CORESIGHT_CATU) += coresight-catu.o
diff --git a/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c b/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c
new file mode 100644
index 000000000000..39c6a2798a0f
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-qcom-qdcp-stm.c
@@ -0,0 +1,550 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Qualcomm QDCP-backed CoreSight STM source driver.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/coresight.h>
+#include <linux/coresight-stm.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/log2.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/perf_event.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/stm.h>
+#include <linux/string.h>
+
+#include "coresight-priv.h"
+#include <linux/soc/qcom/qdcp.h>
+#include "coresight-trace-id.h"
+
+#define QDCP_STM_BYTES_PER_CHANNEL	256
+#define QDCP_STM_PKT_TYPE_DATA		0x98
+#define QDCP_STM_PKT_TYPE_FLAG		0xe8
+
+#define qdcp_stm_channel_addr(drvdata, channel) \
+	((drvdata)->stimulus_base + \
+	 ((channel) * QDCP_STM_BYTES_PER_CHANNEL))
+#define qdcp_stm_channel_off(type, options)	((type) & ~(options))
+
+/**
+ * struct qcom_qdcp_stm_drvdata - QDCP STM source data.
+ * @stm: generic STM interface handle.
+ * @csdev: CoreSight source device.
+ * @stimulus_base: mapped AP-visible STM stimulus aperture.
+ * @stimulus_phys: physical base of the STM stimulus aperture.
+ * @guaranteed: per-channel guaranteed/invariant delivery bitmap.
+ * @qdcp: QDCP connection state; @qdcp.id is the QECP firmware source
+ *	identifier, @qdcp.lock serializes sleeping QDCP operations.
+ * @traceid: CoreSight ATID assigned to this source.
+ * @fw_stop_failed: the last firmware stop was not confirmed, so firmware may
+ *	still be tagging trace with @traceid. Updated under @qdcp.lock; read
+ *	without it only on removal, when nothing else can use the source.
+ * @numsp: number of stimulus ports.
+ * @write_bytes: maximum naturally aligned stimulus write size.
+ * @port_mask: stimulus port enable mask sent to firmware. Like the STMSPER
+ *	register it mirrors, this is a 32-bit mask applied per 32-port group,
+ *	so enabling every bit covers all ports regardless of @numsp.
+ */
+struct qcom_qdcp_stm_drvdata {
+	struct stm_data		stm;
+	struct coresight_device	*csdev;
+	void __iomem		*stimulus_base;
+	phys_addr_t		stimulus_phys;
+	unsigned long		*guaranteed;
+	struct qdcp_consumer	qdcp;
+	u8			traceid;
+	bool			fw_stop_failed;
+	u32			numsp;
+	u32			write_bytes;
+	u32			port_mask;
+};
+
+static bool qdcp_stm_addr_unaligned(const void *addr, u8 write_bytes)
+{
+	return (unsigned long)addr & (write_bytes - 1);
+}
+
+static void qdcp_stm_send(void __iomem *addr, const void *data,
+			  u32 size, u8 write_bytes)
+{
+	u8 payload[8];
+
+	if (qdcp_stm_addr_unaligned(data, write_bytes)) {
+		memcpy(payload, data, size);
+		data = payload;
+	}
+
+	switch (size) {
+#ifdef CONFIG_64BIT
+	case 8:
+		writeq_relaxed(*(u64 *)data, addr);
+		break;
+#endif
+	case 4:
+		writel_relaxed(*(u32 *)data, addr);
+		break;
+	case 2:
+		writew_relaxed(*(u16 *)data, addr);
+		break;
+	case 1:
+		writeb_relaxed(*(u8 *)data, addr);
+		break;
+	default:
+		break;
+	}
+}
+
+static ssize_t notrace qdcp_stm_packet(struct stm_data *stm_data,
+				       unsigned int master, unsigned int channel,
+				       unsigned int packet, unsigned int flags,
+				       unsigned int size,
+				       const unsigned char *payload)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+	void __iomem *channel_addr;
+	unsigned int stm_flags;
+
+	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
+	if (!coresight_get_mode(drvdata->csdev))
+		return -EACCES;
+
+	if (channel >= drvdata->numsp)
+		return -EINVAL;
+
+	channel_addr = qdcp_stm_channel_addr(drvdata, channel);
+	stm_flags = flags & STP_PACKET_TIMESTAMPED ? STM_FLAG_TIMESTAMPED : 0;
+	stm_flags |= test_bit(channel, drvdata->guaranteed) ?
+		     STM_FLAG_GUARANTEED : 0;
+
+	switch (packet) {
+	case STP_PACKET_FLAG:
+		channel_addr += qdcp_stm_channel_off(QDCP_STM_PKT_TYPE_FLAG,
+							 stm_flags);
+		qdcp_stm_send(channel_addr, payload, 1, drvdata->write_bytes);
+		return 1;
+	case STP_PACKET_DATA:
+		if (!size)
+			return 0;
+		if (size > drvdata->write_bytes)
+			size = drvdata->write_bytes;
+		else
+			size = rounddown_pow_of_two(size);
+
+		stm_flags |= flags & STP_PACKET_MARKED ? STM_FLAG_MARKED : 0;
+		channel_addr += qdcp_stm_channel_off(QDCP_STM_PKT_TYPE_DATA,
+							 stm_flags);
+		qdcp_stm_send(channel_addr, payload, size, drvdata->write_bytes);
+		return size;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static phys_addr_t qdcp_stm_mmio_addr(struct stm_data *stm_data,
+				      unsigned int master, unsigned int channel,
+				      unsigned int nr_chans)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+	phys_addr_t addr;
+
+	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
+	addr = drvdata->stimulus_phys +
+	       channel * QDCP_STM_BYTES_PER_CHANNEL;
+
+	if (offset_in_page(addr) ||
+	    offset_in_page(nr_chans * QDCP_STM_BYTES_PER_CHANNEL))
+		return 0;
+
+	return addr;
+}
+
+static int qdcp_stm_link(struct stm_data *stm_data, unsigned int master,
+			 unsigned int channel)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+
+	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
+	if (!drvdata->csdev)
+		return -EINVAL;
+
+	return coresight_enable_sysfs(drvdata->csdev);
+}
+
+static void qdcp_stm_unlink(struct stm_data *stm_data, unsigned int master,
+			    unsigned int channel)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+
+	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
+	if (drvdata->csdev)
+		coresight_disable_sysfs(drvdata->csdev);
+}
+
+static long qdcp_stm_set_options(struct stm_data *stm_data,
+				 unsigned int master, unsigned int channel,
+				 unsigned int nr_chans, unsigned long options)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+
+	drvdata = container_of(stm_data, struct qcom_qdcp_stm_drvdata, stm);
+	if (!coresight_get_mode(drvdata->csdev))
+		return -EINVAL;
+
+	if (channel >= drvdata->numsp)
+		return -EINVAL;
+
+	switch (options) {
+	case STM_OPTION_GUARANTEED:
+		set_bit(channel, drvdata->guaranteed);
+		break;
+	case STM_OPTION_INVARIANT:
+		clear_bit(channel, drvdata->guaranteed);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qdcp_stm_enable(struct coresight_device *csdev,
+			   struct perf_event *event, enum cs_mode mode,
+			   struct coresight_path *path)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+	int ret;
+
+	if (mode != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	if (!coresight_take_mode(csdev, mode))
+		return -EBUSY;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	mutex_lock(&drvdata->qdcp.lock);
+	ret = qdcp_stm_source_enable(drvdata->qdcp.provider, drvdata->qdcp.id,
+				     drvdata->traceid, drvdata->port_mask,
+				     false);
+	if (!ret)
+		drvdata->fw_stop_failed = false;
+	mutex_unlock(&drvdata->qdcp.lock);
+	if (ret) {
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
+
+	dev_dbg(&csdev->dev, "QDCP STM tracing enabled\n");
+	return 0;
+}
+
+/*
+ * The CoreSight source disable op returns void and the user has already torn
+ * the path down, so the source always ends up disabled from Linux's point of
+ * view. Return the firmware result so the caller can at least report it.
+ */
+static int qdcp_stm_disable_source(struct coresight_device *csdev)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+	struct qdcp_data *qdcp;
+	u64 source_id;
+	u8 traceid;
+	int ret;
+
+	if (coresight_get_mode(csdev) != CS_MODE_SYSFS)
+		return 0;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	qdcp = drvdata->qdcp.provider;
+	source_id = drvdata->qdcp.id;
+	traceid = drvdata->traceid;
+
+	mutex_lock(&drvdata->qdcp.lock);
+	ret = qdcp_stm_source_disable(qdcp, source_id, traceid, false);
+	drvdata->fw_stop_failed = !!ret;
+	mutex_unlock(&drvdata->qdcp.lock);
+
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+	dev_dbg(&csdev->dev, "QDCP STM tracing disabled\n");
+	return ret;
+}
+
+static void qdcp_stm_disable(struct coresight_device *csdev,
+			     struct perf_event *event)
+{
+	int ret = qdcp_stm_disable_source(csdev);
+
+	if (ret)
+		dev_warn(&csdev->dev,
+			 "firmware did not confirm QDCP STM disable: %d\n",
+			 ret);
+}
+
+static int qdcp_stm_trace_id(struct coresight_device *csdev,
+			     enum cs_mode mode, struct coresight_device *sink)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	return drvdata->traceid;
+}
+
+static const struct coresight_ops_source qdcp_stm_source_ops = {
+	.enable		= qdcp_stm_enable,
+	.disable	= qdcp_stm_disable,
+};
+
+static const struct coresight_ops qdcp_stm_cs_ops = {
+	.trace_id	= qdcp_stm_trace_id,
+	.source_ops	= &qdcp_stm_source_ops,
+};
+
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%#x\n", drvdata->traceid);
+}
+static DEVICE_ATTR_RO(traceid);
+
+static struct attribute *qdcp_stm_attrs[] = {
+	&dev_attr_traceid.attr,
+	NULL,
+};
+
+static const struct attribute_group qdcp_stm_group = {
+	.attrs = qdcp_stm_attrs,
+};
+
+static const struct attribute_group *qdcp_stm_groups[] = {
+	&qdcp_stm_group,
+	NULL,
+};
+
+static int qdcp_stm_get_stimulus_area(struct platform_device *pdev,
+				      struct resource **res)
+{
+	/*
+	 * The binding requires reg-names = "stm-stimulus-base"; there is no
+	 * documented unnamed-resource form, so don't silently accept one.
+	 */
+	*res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					    "stm-stimulus-base");
+	return *res ? 0 : -EINVAL;
+}
+
+static void qdcp_stm_init_stm_data(struct qcom_qdcp_stm_drvdata *drvdata,
+				   const char *name)
+{
+	struct stm_data *stm = &drvdata->stm;
+
+	stm->name = name;
+	stm->sw_start = 1;
+	stm->sw_end = 1;
+	stm->hw_override = true;
+	stm->sw_nchannels = drvdata->numsp;
+	stm->sw_mmiosz = QDCP_STM_BYTES_PER_CHANNEL;
+	stm->packet = qdcp_stm_packet;
+	stm->mmio_addr = qdcp_stm_mmio_addr;
+	stm->link = qdcp_stm_link;
+	stm->unlink = qdcp_stm_unlink;
+	stm->set_options = qdcp_stm_set_options;
+}
+
+static int qdcp_stm_probe(struct platform_device *pdev)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata;
+	struct coresight_platform_data *pdata;
+	struct coresight_desc desc = { 0 };
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	const char *name;
+	u32 numsp;
+	int trace_id;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, drvdata);
+
+	drvdata->qdcp.provider = devm_qdcp_get(dev, "qcom,qdcp");
+	if (IS_ERR(drvdata->qdcp.provider)) {
+		dev_err(dev, "failed to get QDCP provider: %pe\n",
+			drvdata->qdcp.provider);
+		return PTR_ERR(drvdata->qdcp.provider);
+	}
+
+	ret = fwnode_property_read_u64(dev->fwnode, "qcom,qdcp-source-id",
+				       &drvdata->qdcp.id);
+	if (ret) {
+		dev_err(dev, "missing QDCP STM source id: %d\n", ret);
+		return ret;
+	}
+
+	ret = qdcp_stm_get_stimulus_area(pdev, &res);
+	if (ret) {
+		dev_err(dev, "missing STM stimulus aperture: %d\n", ret);
+		return ret;
+	}
+
+	drvdata->stimulus_phys = res->start;
+	drvdata->stimulus_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(drvdata->stimulus_base))
+		return PTR_ERR(drvdata->stimulus_base);
+
+	ret = fwnode_property_read_u32(dev->fwnode, "qcom,num-stimulus-ports",
+				       &numsp);
+	if (ret) {
+		numsp = resource_size(res) / QDCP_STM_BYTES_PER_CHANNEL;
+		if (!numsp) {
+			dev_err(dev, "stimulus aperture of %llu bytes holds no channels\n",
+				(u64)resource_size(res));
+			return -EINVAL;
+		}
+	} else if (!numsp ||
+		   (u64)numsp * QDCP_STM_BYTES_PER_CHANNEL > resource_size(res)) {
+		/*
+		 * A DT-provided port count that doesn't fit the mapped
+		 * stimulus aperture would let channel addressing in
+		 * qdcp_stm_packet()/qdcp_stm_mmio_addr() compute offsets past
+		 * the end of what devm_ioremap_resource() actually mapped.
+		 */
+		dev_err(dev, "qcom,num-stimulus-ports %u exceeds stimulus aperture of %llu bytes\n",
+			numsp, (u64)resource_size(res));
+		return -EINVAL;
+	}
+
+	drvdata->numsp = numsp;
+	drvdata->write_bytes = IS_ENABLED(CONFIG_64BIT) ? 8 : 4;
+	/*
+	 * STMSPER-style mask: enable all ports in every 32-port group. The
+	 * firmware applies it to whichever group is active, so this covers
+	 * all ports irrespective of numsp.
+	 */
+	drvdata->port_mask = U32_MAX;
+	drvdata->guaranteed = devm_bitmap_zalloc(dev, numsp, GFP_KERNEL);
+	if (!drvdata->guaranteed)
+		return -ENOMEM;
+
+	mutex_init(&drvdata->qdcp.lock);
+
+	name = coresight_alloc_device_name("qdcp_stm", dev);
+	if (!name)
+		return -ENOMEM;
+
+	trace_id = coresight_trace_id_get_system_id();
+	if (trace_id < 0)
+		return trace_id;
+	drvdata->traceid = trace_id;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		goto err_trace_id_put;
+	}
+	dev->platform_data = pdata;
+
+	desc.name = name;
+	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
+	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE;
+	desc.ops = &qdcp_stm_cs_ops;
+	desc.pdata = pdata;
+	desc.dev = dev;
+	desc.groups = qdcp_stm_groups;
+	/*
+	 * The STM control registers are owned by QECP firmware and are not
+	 * AP-accessible; only the stimulus aperture is mapped (for data
+	 * writes, not CoreSight management access). Leave desc.access unset
+	 * so the core never tries to touch programming registers directly.
+	 */
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto err_trace_id_put;
+	}
+
+	/*
+	 * csdev and traceid must both be valid before the STM char device
+	 * is live, since stm_register_device() makes drvdata->stm's
+	 * callbacks (packet(), set_options(), ...) reachable immediately via
+	 * /dev/<name> ioctls and writes, and those callbacks dereference
+	 * drvdata->csdev and drvdata->traceid.
+	 */
+	qdcp_stm_init_stm_data(drvdata, name);
+	ret = stm_register_device(dev, &drvdata->stm, THIS_MODULE);
+	if (ret) {
+		dev_err(dev, "failed to register STM: %d\n", ret);
+		goto err_coresight_unregister;
+	}
+
+	dev_info(&drvdata->csdev->dev, "QDCP STM initialized\n");
+	return 0;
+
+err_coresight_unregister:
+	coresight_unregister(drvdata->csdev);
+err_trace_id_put:
+	coresight_trace_id_put_system_id(drvdata->traceid);
+	return ret;
+}
+
+static void qdcp_stm_remove(struct platform_device *pdev)
+{
+	struct qcom_qdcp_stm_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	/*
+	 * Unregister the STM first: its unlink callback disables the source
+	 * through drvdata->csdev, which must still be live.
+	 */
+	stm_unregister_device(&drvdata->stm);
+
+	/*
+	 * No-op unless the source is still in CS_MODE_SYSFS. Without it,
+	 * removing an enabled source would leave firmware STM enabled.
+	 */
+	qdcp_stm_disable_source(drvdata->csdev);
+
+	/*
+	 * A stop that failed here or earlier (fw_stop_failed) means firmware
+	 * may still be tagging trace with this ID. Keep it allocated rather
+	 * than let another source reuse it.
+	 */
+	if (drvdata->fw_stop_failed)
+		dev_warn(&pdev->dev,
+			 "QDCP STM not confirmed stopped, leaking trace ID %u\n",
+			 drvdata->traceid);
+	else
+		coresight_trace_id_put_system_id(drvdata->traceid);
+
+	coresight_unregister(drvdata->csdev);
+}
+
+static const struct of_device_id qdcp_stm_match[] = {
+	{ .compatible = "qcom,coresight-stm-qdcp" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qdcp_stm_match);
+
+static struct platform_driver qdcp_stm_driver = {
+	.probe = qdcp_stm_probe,
+	.remove = qdcp_stm_remove,
+	.driver = {
+		.name = "coresight-qcom-qdcp-stm",
+		.of_match_table = qdcp_stm_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(qdcp_stm_driver);
+
+MODULE_DESCRIPTION("Qualcomm QDCP CoreSight STM source driver");
+MODULE_AUTHOR("Jie Gan <jie.gan@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.34.1


