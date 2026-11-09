Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126A3606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fLOsnmzh;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LIJrPBYa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d83Kt88Nu157+vux/kvDitp5mRWQIZYWnDgojwr6MgE=; b=fLOsnmzhj210fx
	CaZkx4OC5VgxQLdvMY8us+RxmTaPQgddWMmp+M+NX6j7bGMcr5UKSqNrmk/c7F7fOq3WZEPb7GwOc
	/WRRo6Feg/1H6NYR0VqN2xcYg5wTB9MzWTi8h2ZAY77TzazRMpKZX+Q0UGyNuWoqRLsYzXVeFF8RU
	R6AxH8wg5UTG/+K9rnw3apssbeb4t54Ke7cB5GO+8oAzd9TsfYVbRNIwQXpt/WsTC32tANJ+TG8i+
	7DnuO469gMdjdfpI8bEN5qn92857NzqY8oV2qo/IDiTev16wgTyl2m8ZFnVpVD12F5EbQP2WnLBXx
	n28uYTABlhfX7oCLMTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWP-00000001OJT-0rPD;
	Mon, 09 Nov 2026 17:51:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWL-00000001OHf-3POG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D41C91476;
	Mon,  9 Nov 2026 09:50:58 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F1AF3F673;
	Mon,  9 Nov 2026 09:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794246661; bh=/lUfAw9eGMej+oyjsDlyMUKexHDWWLSK8vp6iNpaMGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LIJrPBYaMVxejvF/SjJMtfkE9HSusKM3mY/ffkVmMYKoaI2YCkHdPerlL9BjOS9vK
	 7g4hzUBHwZ0djO8Rck28/KPSTbyoCcQ7AV2VBcZPa9tJaXCVYo9n2bENTERhVefUYN
	 h5H28MvNzCQ3ZanTJxJXhQUgdrfWLh25iYjvXksw=
Message-ID: <dc1398f4-b81c-4ad8-b706-df89a1622e6c@arm.com>
Date: Mon, 9 Nov 2026 17:50:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH 00/6] resctrl: Support mba_MBps on MPAM
To: Jinjie Ruan <ruanjinjie01@gmail.com>, babu.moger@amd.com, bp@alien8.de,
 corbet@lwn.net, Dave.Martin@arm.com, fenghuay@nvidia.com,
 james.morse@arm.com, rdunlap@infradead.org, reinette.chatre@intel.com,
 skhan@linuxfoundation.org, tony.luck@intel.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com_quarantine>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com_quarantine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095105_941825_4681AB49 
X-CRM114-Status: GOOD (  31.78  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

On 09/11/2026 13:26, Jinjie Ruan wrote:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Resctrl offers two ways to describe an MBA policy:
> - The percentage interface writes a fraction of the maximum bandwidth
>   into the hardware control register
> - The MBA software controller (mounted with -o mba_MBps) takes
>   an absolute target in MiB/s and adjusts that percentage based on
>   the MBM counters sampled once per second.
> 
> The problem is that a percentage alone isn't enough. How much bandwidth
> a percentage actually corresponds to depends on the memory frequency,
> the channel count, how many threads are generating traffic, the access
> pattern, and the traffic of other groups. Neither MPAM nor x86 resctrl
> reports the maximum bandwidth in MiB/s. So an administrator who wants
> to enforce an absolute budget (a tenant SLA, a noisy-neighbour limit)
> has to measure and re-tune the percentage on every machine. x86 resctrl
> has had this software controller since 2018; MPAM has never been able
> to use it. This series makes it work on MPAM.

I see that you are enabling the software controller at the same time as
assignable mbm counters. This means that if you enable the software
controller and create too many monitor groups then the software
controller will stop working. Any user applications already using the
software controller would be broken.

Would instead teaching MPAM about the mbm_default fixed allocation of
counters be better? If a platform has sufficient bandwidth counters then
we can ensure there is a counter for every monitor group. If necessary,
we can also reduce the number of CLOSID/RMID the driver reports so that
there is one per monitor group.

Thanks,

Ben

> 
> What this series does
> =====================
> 
> MPAM refuses mba_MBps in two places:
> - Its MBM counters are assignable, and supports_mba_mbps() refuses
>   the option when they are.
> - Its maximum bandwidth control is a soft limit by default, which
>   can't hold a single requester down to the target.
>   MPAMF_MBW_IDR.MAX_LIM reports whether the hard limit exists.
> 
> MPAM also makes two generic defects reachable:
> - Writing the control register sleeps (smp_call_on_cpu()), while
>   the worker runs under the RCU read lock
> - A 16-bit fraction lets the minimum control value reach zero, which
>   divides by zero in the estimator
> 
> The patches:
> 
> - Patches 1 and 2 fix the two generic defects.
> - Patches 3 and 4 make the loop runnable on MPAM: the worker takes the
>   CPU hotplug lock around the sleeping control update, and assignable
>   counters are accepted with a fixed assignment mode.
> - Patches 5 and 6 handle the maximum: the driver sets HARDLIM and
>   records the MAX_LIM behaviours, and mba_MBps is refused where only
>   the soft limit exists.
> 
> x86 has no assignable counters in the mode where the controller is
> allowed, and does not set the soft-limit flag, so its behaviour is
> unchanged.
> 
> Testing
> =======
> 
> With the MPAM MSC model in QEMU:
> 
> - From a 9606 MiB/s baseline, a 7000 MiB/s target converges to
>   6888 MiB/s and a 9000 MiB/s target to 8766 MiB/s.
> - The memory-side MSC register shows MBW_MAX.HARDLIM set.
> - A modelled MSC that implements only the soft limit refuses the
>   mba_MBps mount, while a plain mount succeeds.
> - With mbm_assign_on_mkdir forced on while the controller is in use,
>   a write of 0 is refused, and the user's value is restored after
>   unmount.
> - The KUnit tests for the MPAM driver pass.
> 
> Jinjie Ruan (6):
>   fs/resctrl: Avoid division by zero in the MBA software controller
>   fs/resctrl: Do not update bandwidth from a failed counter read
>   fs/resctrl: Take the CPU hotplug lock for software controller updates
>   fs/resctrl: Allow mba_MBps with assignable MBM counters
>   fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
>   arm_mpam: Program the hard limit for the software controller
> 
>  Documentation/filesystems/resctrl.rst | 13 +++-
>  drivers/resctrl/mpam_devices.c        | 55 +++++++++++++----
>  drivers/resctrl/mpam_internal.h       |  4 ++
>  drivers/resctrl/mpam_resctrl.c        |  9 +++
>  fs/resctrl/monitor.c                  | 86 +++++++++++++++++++++------
>  fs/resctrl/rdtgroup.c                 | 48 ++++++++++++---
>  include/linux/resctrl.h               |  5 ++
>  7 files changed, 179 insertions(+), 41 deletions(-)
> 


