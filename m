Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JeCma/PD;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VmalHv2M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uPqiu+ElU4cIICKoPtEjFRF5YoXaI3QeZNsern0wcRA=; b=JeCma/PDNs0KMr
	lW47dcM0nzYOZgOfXpOC5b/ilE2aBOCH+WvrstpuQm4UKNZtLZyaSFkPfXoxg8AyaYW4DLyiLLM+r
	9v7RZVYk6ADOcWAxGwanbsbBc8TgxDONOteW5TToBo+SPEp+Y9TUEDKqA7uz1GnRKBgYU/X8BqOEh
	2qdHahiPr4VRqmbt7HesQUHkv5dqqMA3CLzZUqnRW+rmNl7wB0ia0dUlHoPVEQQfSgskQrPsHFwEK
	EuJxWgQrXzFbwj4Q8zaI9JOqXQyCcyISL32Tc2T0QtuvXTiAZitiZeTKx5u/326ulYZjUkCALRABG
	ez9s3yY37mUtRwCH9VIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCDP-00000007JVl-1wdx;
	Wed, 11 Nov 2026 17:34:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCDM-00000007JVB-3O2F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:34:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E4A31576;
	Wed, 11 Nov 2026 09:34:22 -0800 (PST)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC43B3F632;
	Wed, 11 Nov 2026 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794418465; bh=frQdcUhueWWzIbR9Oz8s0QL9CPkNt6BylYNzxsYqnHM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VmalHv2MEFAlvYotxBWyNb5nWPMltG0c0GKC+tKy8FxcJmRcihihtvBMUEwHt3Pj5
	 QSzlax2bALWVO5jYfq0t8ibvDrGUqeqJo7e8wDqY7EJA2QS0+54NesiijJK8a1AdwV
	 vQYJzqAFypYR0QyYjxn69GYfWDBRsM7rfcnQ4m7g=
Message-ID: <dee315cb-9218-4da6-913e-8eb946ed2d68@arm.com>
Date: Wed, 11 Nov 2026 17:34:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: Process subdirectory Makefiles unconditionally
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <4b2e518499270b2a6cab3e04a1123458d82d2759.1793990977.git.robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <4b2e518499270b2a6cab3e04a1123458d82d2759.1793990977.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_093428_893328_51ED965B 
X-CRM114-Status: GOOD (  11.79  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 6:49 pm, Robin Murphy wrote:
> Our subdirectories here are purely for file-level organisation rather
> than any particular build structure, and everything in the Makefiles
> is already conditional on the appropriate config options. Plus they're
> not exactly big and complex, so for simplicity let's just drop the
> top-level conditions.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/perf/Makefile | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
> index eb8a022dad9a..8c3146c604ce 100644
> --- a/drivers/perf/Makefile
> +++ b/drivers/perf/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +obj-y += amlogic/ arm_cspmu/ hisilicon/
>   obj-$(CONFIG_ARM_CCI_PMU) += arm-cci.o
>   obj-$(CONFIG_ARM_CCN) += arm-ccn.o
>   obj-$(CONFIG_ARM_CMN) += arm-cmn.o
> @@ -14,7 +15,6 @@ obj-$(CONFIG_ARM_SMMU_V3_PMU) += arm_smmuv3_pmu.o
>   obj-$(CONFIG_FSL_IMX8_DDR_PMU) += fsl_imx8_ddr_perf.o
>   obj-$(CONFIG_FSL_IMX9_DDR_PMU) += fsl_imx9_ddr_perf.o
>   obj-$(CONFIG_FUJITSU_UNCORE_PMU) += fujitsu_uncore_pmu.o
> -obj-$(CONFIG_HISI_PMU) += hisilicon/

Ha, in fact this might technically fix a bug already, since Sashiko's 
hilarious internal monologue inadvertently highlights that HNS3_PMU can 
be selected without HISI_PMU, but currently wouldn't be built if so.

Robin.

>   obj-$(CONFIG_QCOM_L2_PMU)	+= qcom_l2_pmu.o
>   obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
>   obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
> @@ -32,8 +32,6 @@ obj-$(CONFIG_MARVELL_PEM_PMU) += marvell_pem_pmu.o
>   obj-$(CONFIG_APPLE_M1_CPU_PMU) += apple_m1_cpu_pmu.o
>   obj-$(CONFIG_ALIBABA_UNCORE_DRW_PMU) += alibaba_uncore_drw_pmu.o
>   obj-$(CONFIG_DWC_PCIE_PMU) += dwc_pcie_pmu.o
> -obj-$(CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU) += arm_cspmu/
> -obj-$(CONFIG_MESON_DDR_PMU) += amlogic/
>   obj-$(CONFIG_CXL_PMU) += cxl_pmu.o
>   obj-$(CONFIG_NVIDIA_TEGRA410_CMEM_LATENCY_PMU) += nvidia_t410_cmem_latency_pmu.o
>   obj-$(CONFIG_NVIDIA_TEGRA410_C2C_PMU) += nvidia_t410_c2c_pmu.o


