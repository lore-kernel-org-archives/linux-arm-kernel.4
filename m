Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C23606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RuPP8Jkz;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=yM2krInt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hXyGjoxmupuH9Uxjyc6eDIpIRfNyYCAFQUdO+AkdUwE=; b=RuPP8JkzxmJmX+qxFWYIhlkTMn
	Kw/dsbhyz40swRuH29lFtExY98799e9IWF4DBNGsOBFzYJuJRYKSyScZI8y6xvigZp0BR3f2SkV8x
	K/kxbgS+Dhz0Q7XWkLkXSe1DSe7ClGewNByqoJBCpbwGTNeahEXuoOREomkBAqJyPt2muhlQYGdxE
	SuLvlAkuNmODUptWeS641s0VFpX75Ewn9PLNE7coZyOEkGEx097oWBpL9b1//RZpQGIb7Kqak3dXw
	pSudYo5RINUZUkvu1TvE6Zybljqe9IB95f6XjNRRvkvgUWfcx4f7hFGrwdwS7Xu2FDNsNOkjXPY/U
	RJh6wN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2di-00000008EM4-2zfT;
	Wed, 25 Nov 2026 02:21:42 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW2de-00000008ELT-0YW7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:21:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hXyGjoxmupuH9Uxjyc6eDIpIRfNyYCAFQUdO+AkdUwE=;
	b=yM2krIntX4cuWuCww800LKQQaJX8o9jPBHeV2zWhBzk/VF4tTPi5qXB+yHWSIx3TNZh0wC8h+
	7qoj8T/+QYwBWPTRtXcF65J5PB5QJZ5O3DfxvgXMj3HdN+4Bv+q5OSR/NTJ8cmquS7teTGynGeo
	UbVAgd4iwO31Mom/NVrF61w=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jZ3Lf4NsNz12LH0;
	Wed, 25 Nov 2026 10:20:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EB53540538;
	Wed, 25 Nov 2026 10:21:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 10:21:30 +0800
Message-ID: <e5890cea-2bc8-467a-9cd9-cad5d0820c74@huawei.com>
Date: Wed, 25 Nov 2026 10:21:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] firmware: arm_sdei: Fix NMI backtrace lockups on idle
 CPUs
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, James Morse <james.morse@arm.com>
References: <20261124194707.1030653-1-kas@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261124194707.1030653-1-kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_182138_894069_51AC6927 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>, kernel-team@meta.com, Vladimir Murzin <vladimir.murzin@arm.com>, Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Cong Wang <cwang@multikernel.io>, Liao Chang <liaochang1@huawei.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, Pengjie Zhang <zhangpengjie2@huawei.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/25 3:47, Kiryl Shutsemau (Meta) 写道:
> The SDEI NMI backtrace signals event 0 to every other CPU, including the
> ones in a power-down idle state, where the kernel has SDEI masked. TF-A
> acknowledges the SGI behind event 0 on a masked PE and never ends it,
> and the PE takes no Non-secure interrupt again. Jinjie hit it on a
> 384-CPU HIP12, where one sysrq-l locked up the machine.
> 
> Patch 1 keeps event 0 away from masked PEs. Patch 2 sends the regular
> backtrace IPI to the CPUs that SDEI refused, which wakes them.
> 
> TF-A v2.13 and later refuse to signal a masked PE, but a PE that masks
> right after the check still takes the SGI. The TF-A fix is under review:
> 
>   https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55414
> 
> Tested under QEMU TCG with TF-A built without that check, 4 CPUs. One
> CPU masks and unmasks SDEI in a loop, through cpu_pm, the mask calls and
> CPU hotplug, while another signals it; sysrq-l afterwards. Signalling
> with plain SMCs, as the kernel does now, wedges the target. With the
> series every run passed, lockdep included, and a panic in the middle of
> it completes.
> 
> Jinjie ran an earlier version on HIP12 with the power-down state
> enabled: sysrq-l got 384/384 answers every run. The handshake has
> changed since; Jinjie, could you give this one a run as well?

Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

On HIP12 (SDEI v1.0 firmware), v7.4-rc3 plus the two patches, SDEI
active, acpi_idle with state1 = CorePowerdown enabled: sysrq-l answered
on all 384 CPUs on every run, nine runs total, three of them under load.
 No "still haven't responded", no SDEI_EVENT_SIGNAL failures, no "did
not arrive within 1ms" warnings, no lockups.

State1/usage shows the CPUs really did go through CorePowerdown, so the
handshake and the IPI fallback were exercised.

Thanks,
Jinjie

> 
> Kiryl Shutsemau (Meta) (2):
>   firmware: arm_sdei: Do not signal event 0 to a masked PE
>   firmware: arm_sdei_nmi: Send the backtrace IPI to CPUs with SDEI
>     masked
> 
>  arch/arm64/include/asm/nmi.h    |   7 ++
>  arch/arm64/kernel/smp.c         |   2 +-
>  drivers/firmware/arm_sdei.c     | 130 ++++++++++++++++++++++++++++++--
>  drivers/firmware/arm_sdei_nmi.c |  30 ++++++--
>  include/linux/arm_sdei.h        |   4 +-
>  5 files changed, 157 insertions(+), 16 deletions(-)
> 
> 
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f


