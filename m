Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F73606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J//e4m48;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+EiilmK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOXcm70R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=; b=J//e4m484tdT2c
	lCJQRrgxkZeFYjjlU4x1Edl/vAhnLjjEuMkHWwR17chJLhKyb1FynetQF5nuCYKrvwC0Ni1I2mYbo
	SoRwV8cJ0aquopfKDzNO9rCZIDMmsxszPn59BEboL3jSaX1BjFS0fcBw2HfkSWkSKDTAnZ3oyQ6Tr
	m1Yuu+hQCf1HNLbEgGLbvPohjt6Q8mRlIRQXh2kExZ+i3yDOfqkK51CqzFjYT0qmB4Xzot5TBb9Rj
	wCoRAez3MQOtFz7wDvZ3d8dKHGi6iB9dFUY4jNk2S0EX+OVv4oS5YOG43jULowdRmMz2nGSfXX9bp
	fhPrQQVZG3SHuW8aPByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBC1-0000000FmRM-3BHH;
	Sat, 14 Nov 2026 10:41:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBBz-0000000FmQw-1M3x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:41:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wlv9174829
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=; b=O+EiilmKR/Xj0U0X
	Wu5YbGLRpXVLgI1P2jFrxsXBneWrNq1cgE56xGn+Wy35ZwZFJ0qDvOPjCZhhTaQw
	ubeo5GrddjVdEUIAizY02thEZ8OsAL9yyTdH7VjuXiC/BB3yUfrMSKIwOxAUiv8u
	OSsyxThUjbIo5YCUt/5ag8clTNI+iChD5H2876V5gvsE5KEp0pR1C0rPd8GhlMfQ
	feZOmPe6vuQrQyIxx8yrhles/4d9SE6Qc4OTIh5uBC82ZhUqkYxBUWqgFoM13rRf
	EttXYSn4N/VALl6/vBzziz2SIqkFjUUD25jDH9KPpT+CNp8eG6fqjek/T6dxDar7
	XqxXxQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmaggtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 10:41:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso2471723a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794652865; cv=none;
        d=google.com; s=arc-20260327;
        b=UoF6JH4nJgWn+wpxzbtrEJabjGmBaQFsIvjIivVfURAV48njKlPn78CdAUshl0AtvY
         7bb1ZW5rerjAJYSAPRAHwBVwls+ftBYXBxCz0vF9TG9OVCHt8dy3cH4LGQi6y4s/FJgN
         imbl6tj0a9whcpX2JquGaVM7Ra4F2YjIKo4gDe7n1w3/7aHv/FwNgz/+VB5eDosQH5us
         azPkL1Sz70pAqu8dF8lMkdhHP5F0sdrD6PUsRCx7FTWqbHc8dF+orpGCxqlFYWHl3KHD
         IdEXqRrCsLWB+SUo1ys3/QB1s+nfdpWjOCSeqEmTMn17Jidg99Iqon0TqLqbeG3BeXRG
         FaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=;
        fh=tjJL2VICAjmdRhok1feBuexlnXnnR6F+WzLw/3EDa7I=;
        b=efl34q+/jw86fKPjtjn4bo6WesKCIfYQJvYYPi+TUM1G2c5+50HYeexOp6a4KYAk2X
         3nXb+TB90dwu8OJdHJtpZSphO33Q6zfe7XuuD0PigLk4ilCUocgD/5LRybxVpO5Nv3dt
         /NOGdgUBy1MDsKPg7M5O9UgmVhG9DBz1GNLOadAterNsHJCMHbsOC7grepDv/Miqebq7
         cOX0lt/211w5ZGrD4FJRACph4ah7KTcgmLWnG26LCeG0A5k1bH66UxH0Eh9qCakQG8uQ
         BJV/80+PXPuwjmPHCDZqI7ldM13DMkSLEZz07EjCg3SwEckMAglJ0ADdo7Yv5lHYnvcy
         y29w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794652865; x=1795257665; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=;
        b=iOXcm70RaTsEFIOpKfeDGwNe9HKgB7RhmzCN6hcVyYjaqtPnwGe1IjlwnqY7gwsiDp
         j/gWswhn9ROP56SOKpviN990cE5RlvtCVHvF6uJtyzVvQ21ljjL/FaOMew7qh3C2GVuC
         GcSfU1bD2HJvVGMrMvhUVPSM9gNmzk98ZFkINfRyOkTRo9gPEE2rcAC0/FYuGzc2I3Qy
         NWRmfbR1jjlKbfpKH4EGWA52jPmhs5rexxdd2GwEV7qweL58Fd67eWr/yq+d536kbl+i
         /J+4ur3lRfHhpHI2J+Tleu0mY/3vNMReIHCoX7lPymvl7GCWkCf1ZW7gt2e3rP/zdNdj
         PkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794652865; x=1795257665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9/cz1IPqslzTuhGV/fg0rokRPc6M/9rN+7xX5cdjGE=;
        b=TEsfPRenlDWiWKc2z2qoETHAySMq6V3AGTyIEJBqWK4OlSJxlVJELuQQRuJGRgreT8
         6M783hq5Istyaqt2n5wtBw2F0EJ8ZX+B0H+6WrEV4Nx9PJC2k7xRds0ZZKE17Bmjt83S
         Yk/htkncOqeSnTWROpTWVuggdMyrwDhFazwKCQ0RTLtLtesYRvj8QKNhRYzN9ez8XkOs
         FN0zm9j+7fTe5NcTypaD1Q1M2LwBUdfM2jxGdLEjPJuiHSXI4Et6heqdaPnahZDbcI3M
         j3Y4ZsAVAABUqWiKJvkSiVjWWQv50IP3voSCCQx8J/Hs56H7xBda4uTS/aC6VUYjKDUi
         0tEw==
X-Forwarded-Encrypted: i=1; AL+hErFxtR/91Fz8E/xD9qoYC46QvpUaeaJydz8UyaHtU7wq19CB5ObGyuk8XknlUy4WgYJgG8+JUQSNR0srVVkTzeQ8@lists.infradead.org
X-Gm-Message-State: APuU4Z8n411UPVjA6BVXPuDcWt5TB8urbAkANPcOYIpcq5hTjd1q3i+Q
	ZcCj2OFflaD4oRYhf3pvV3sTCh6ILr06UqyvmltZNikutiU6RWvk9jXSVWM0sH5II/Bjg+dnTIO
	qcfVsHOMJRTpDjqh/Xn68send6co4z9aYL84SsWickMEWERCHmwRIcOt+y+uQ6V/BDSqAHpuVQs
	22DL0bU9WnU9sHUE0mp7RSubBNC5rFwEDRF1pRw2Y0m87+2jLCaoCO
X-Gm-Gg: AYBFou0o9NIa8oZPqfffmdrfCrQ2wlsYpZ5lZKhZtMIkOSSd2p7nc1cVpHkoY+yj6Pb
	aLxDQilNhrb643/2Ie/rxzBap7FxiPouMChWG9V75BBMJ4ofotva3NuSMXy3EWoc+8vwdq1JOni
	6pPGI4bQ621Z8II1CjoCco86Mic3JawDkr6Ty16y6oyO11VhpkFgLGKHif9A==
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr4905756a91.17.1794652865126;
        Sat, 14 Nov 2026 02:41:05 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id
 98e67ed59e1d1-3b1b09e5cb0mr4905738a91.17.1794652864649; Sat, 14 Nov 2026
 02:41:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com> <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
In-Reply-To: <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 11:40:52 +0100
X-Gm-Features: AclHuK-b_isk46W-WvgZ209_oTtCfQat8eiMOwnesXkd1lptXQ-43pZaayeQKAk
Message-ID: <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: B6W9S6_RMGCRrvYT-MZdDAZow7J5BDta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0MiBTYWx0ZWRfX7FvbAEVmkgwv
 F5sm6ojU/tahAZURca/Jgwj3i3q37IXGSLvSpxUIE80bbgUfeFqkILXiJzN+XQnyfVwUcSEWGGF
 M3tkv+ia+Bxj228Mxk+a9OkMklxJ4Appi9wQdmT2Vi7il+EJ/fjm7ntcyHzixTYwNSBoC76WR7c
 pEDieAPAoZkTFdzCELBqpMxghaM7ECAB8yHXIWw0HHJhLrY7XDl7wN6t1DwXjP0aTZh4x78d/3Z
 w+gj5apBlZyEE2v1+7uT7ZgYSqmkRUiUgSEZg60mgc7Gi3LuSHboEQEIJcBZWNa8ywPS0uCdQg6
 UOODkfSEIgqBlUeSpsJ85KKjA/vtMQZ1g75HqqtEqK6JIZjGLsBBteHXILfmm4ITiy2lUAKgq2e
 mf2+uB+2nsg6km9hDDU+n2XF3Af0zSBL4R73KMa1v3tE9ci1smDUbgX2Yz0RaKkdFGfoo7l0DsH
 +3tvCyh4T2gy6feGxkA==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af83ac2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=8b9GpE9nAAAA:8 a=SRIYwMtUNH451uaLisIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: B6W9S6_RMGCRrvYT-MZdDAZow7J5BDta
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0MiBTYWx0ZWRfX7GqNaH/Kw1qB
 1VOD/hU3ruZMaqCMuWarOzfgWOELaXVcQq7nlHEhzfW+wz+HdGzdJJ/OtTRa0W4V9ew/5TCsTlr
 ega1cdMQTHBaWgl4aGJPRl6ViGyrDgI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024107_482930_51937D57 
X-CRM114-Status: GOOD (  34.28  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a generic PM domain for the STM32MP D1 domain, using the PM
> framework to manage attached devices.
>
> Make D1 a subdomain of the PSCI cluster domain, so active devices keep
> the Cortex-A35 cluster in Run1. Do not set GENPD_FLAG_ACTIVE_WAKEUP on
> D1: system wakeups are handled by EXTI1 through the RET_PD PSCI domain.

Would you mind elaborating on the system wakeups a bit more?

The devices that get attached to the D1 PM domain do they have another
PM domain as well, to support the system wakeups?

Just trying to make sure this gets modeled correctly.

One comment in the code below.

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/pmdomain/st/Kconfig             |  14 +++
>  drivers/pmdomain/st/Makefile            |   1 +
>  drivers/pmdomain/st/stm32mp-pm-domain.c | 128 ++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 drivers/pmdomain/st/stm32mp-pm-domain.c
>
> diff --git a/drivers/pmdomain/st/Kconfig b/drivers/pmdomain/st/Kconfig
> index a77a70211f61..da8a54d44158 100644
> --- a/drivers/pmdomain/st/Kconfig
> +++ b/drivers/pmdomain/st/Kconfig
> @@ -1,4 +1,18 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +config STM32MP_PM_DOMAIN
> +       tristate "STM32MP PM domain"
> +       depends on ARCH_STM32 || COMPILE_TEST
> +       select PM_GENERIC_DOMAINS
> +       default y
> +       help
> +         Enable support for the STM32MP Power Management (PM) domain dri=
ver.
> +         This driver implements a generic PM domain for STM32MP SoCs, al=
lowing
> +         the kernel to manage power domains for various hardware blocks =
using
> +         the generic power management framework. It is typically used to
> +         control the power state of devices and peripherals on STM32MP
> +         platforms. If unsure, say Y.
> +
>  config UX500_PM_DOMAIN
>         bool "ST-Ericsson ux500 Power Domain"
>         depends on ARCH_U8500 || COMPILE_TEST
> diff --git a/drivers/pmdomain/st/Makefile b/drivers/pmdomain/st/Makefile
> index 6d8b617eb834..0e8131b7fe9d 100644
> --- a/drivers/pmdomain/st/Makefile
> +++ b/drivers/pmdomain/st/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_STM32MP_PM_DOMAIN)                +=3D stm32mp-pm-domain.o
>  obj-$(CONFIG_UX500_PM_DOMAIN)          +=3D ste-ux500-pm-domain.o
> diff --git a/drivers/pmdomain/st/stm32mp-pm-domain.c b/drivers/pmdomain/s=
t/stm32mp-pm-domain.c
> new file mode 100644
> index 000000000000..1a6393840f56
> --- /dev/null
> +++ b/drivers/pmdomain/st/stm32mp-pm-domain.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Implements PM domain using the generic PM domain for STM32MP SoC.
> + *
> + * Copyright (C) STMicroelectronics 2026
> + * Author(s): Patrick Delaunay <patrick.delaunay@foss.st.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +struct stm32mp_pm_subdomain_link {
> +       struct generic_pm_domain *domain;
> +       struct generic_pm_domain *subdomain;
> +};
> +
> +static void stm32mp_pm_domain_genpd_remove(void *data)
> +{
> +       struct generic_pm_domain *genpd =3D data;
> +
> +       pm_genpd_remove(genpd);
> +}
> +
> +static void stm32mp_pm_domain_release_subdomain(void *data)
> +{
> +       struct stm32mp_pm_subdomain_link *link =3D data;
> +
> +       pm_genpd_remove_subdomain(link->domain, link->subdomain);
> +}
> +
> +static void stm32mp_pm_domain_release_genpd_provider(void *data)
> +{
> +       struct device_node *np =3D data;
> +
> +       of_genpd_del_provider(np);
> +}
> +
> +static int stm32mp_pm_domain_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct generic_pm_domain *pd;
> +       struct stm32mp_pm_subdomain_link *link;
> +       int ret;
> +
> +       if (!np)
> +               return -ENODEV;
> +
> +       /* The OF node must specify us as a power-domain provider. */
> +       if (!of_property_present(np, "#power-domain-cells")) {
> +               dev_warn(dev, "%pOF lacks #power-domain-cells\n", np);
> +               return 0;
> +       }
> +
> +       pd =3D devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> +       if (!pd)
> +               return -ENOMEM;
> +
> +       pd->name =3D dev_name(dev);
> +
> +       /*
> +        * Domain based only on PM clk framework, no GENPD_FLAG_ACTIVE_WA=
KEUP
> +        * support, the wake-up path is handled by interrupt driver with =
its
> +        * power domain. GENPD_FLAG_NO_STAY_ON as domain no required sync=
 state,
> +        * domain allow low power modes even if devices are not probed
> +        */
> +       pd->flags =3D GENPD_FLAG_PM_CLK | GENPD_FLAG_IRQ_SAFE | GENPD_FLA=
G_NO_STAY_ON;
> +
> +       ret =3D pm_genpd_init(pd, NULL, false);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to init power doma=
in\n");
> +
> +       ret =3D devm_add_action_or_reset(dev, stm32mp_pm_domain_genpd_rem=
ove, pd);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       link =3D devm_kzalloc(dev, sizeof(*link), GFP_KERNEL);
> +       if (!link)
> +               return -ENOMEM;
> +       link->domain =3D pd_to_genpd(dev->pm_domain);
> +       link->subdomain =3D pd;
> +
> +       ret =3D pm_genpd_add_subdomain(link->domain, link->subdomain);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add subdomain\n=
");
> +
> +       ret =3D devm_add_action_or_reset(dev, stm32mp_pm_domain_release_s=
ubdomain, link);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       ret =3D of_genpd_add_provider_simple(np, pd);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add power domai=
n provider\n");
> +
> +       ret =3D devm_add_action_or_reset(dev, stm32mp_pm_domain_release_g=
enpd_provider, np);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       ret =3D devm_pm_runtime_enable(dev);

What is this used for?

> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to enable pm-runti=
me\n");
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id stm32mp_pm_domain_matches[] =3D {
> +       { .compatible =3D "st,stm32mp-pm-domain", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, stm32mp_pm_domain_matches);
> +
> +static struct platform_driver stm32mp_pm_domain_driver =3D {
> +       .driver =3D {
> +               .name =3D "stm32mp_pm_domain",
> +               .of_match_table =3D stm32mp_pm_domain_matches,
> +       },
> +       .probe  =3D stm32mp_pm_domain_probe,
> +};
> +
> +module_platform_driver(stm32mp_pm_domain_driver);
> +
> +MODULE_AUTHOR("Patrick Delaunay <patrick.delaunay@foss.st.com>");
> +MODULE_DESCRIPTION("ST STM32MP power domain driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

Kind regards
Uffe

