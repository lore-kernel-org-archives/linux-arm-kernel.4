Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC1606A897
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6PZrEPv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FjmDfQ58
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NzUe96JVXyAQFI34A54wINR48uzs8BVsrG29CnSSRI4=; b=Q6PZrEPvhn0DYeW3cx/iBHOjZT
	ZYNpf9l8XJq5hYYaGSuiHy2VxgbbVoPjLko3vbslyopvejmuLkLt5l042XwQIjCVRCcKqJ97CMVpb
	iowY8/rGN3TattUg8tOYbaBQxzfUci5MCXgkXlUq6Pa3240JzD8oXc6wfHKKRM74u8+izhCVCimp5
	8UDdsIgQ9GmWgtqs1nYGoaooMUfOnByHWrA05s79NnQpKFrqPugOMGw5AiCJHAlRvxnSZ98vf+43c
	DxmXzS+Wdbq8Fh48HO24UjTXpW0ECjO1jnE1TRR2OpSLYVelItbFEPSgcGagUYAp+a1u4I+E5ckII
	hots0ksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsY0-0000000DDR2-0Ta1;
	Fri, 13 Nov 2026 14:46:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsXr-0000000DDQ9-0M17
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:46:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D00F339;
	Fri, 13 Nov 2026 06:46:22 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 462EC3F673;
	Fri, 13 Nov 2026 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581185; bh=aq6NKdkVpAukouuQY8lIKEWV5Lcr58p7BuiGWLz4MYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjmDfQ58j8A2NukEY6Anu0yBRZfVsflGs86Pv4DKo2LUl8tBtUdNreYBdD3GUuh+O
	 lFZj8bnbMjvKOHoFW7E54RpKdF34kESYY6U8ON43GfyvhbQJq/05yFQEunZnB/P3Yb
	 hh73WAo171sYqKmDbdn+lHAt1a6ybWhiSc0kVH8w=
Date: Fri, 13 Nov 2026 14:46:23 +0000
From: Leo Yan <leo.yan@arm.com>
To: Igor Velkov <iav@iav.lv>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261113144623.GQ9176@e132581.arm.com>
References: <20261113-coresight-pmpcsr-question-1@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-coresight-pmpcsr-question-1@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_064627_322583_EF30D50F 
X-CRM114-Status: GOOD (  17.43  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Nov 13, 2026 at 07:46:41AM +0200, Igor Velkov wrote:
> Hi,
> 
> Cortex-A55 (Amlogic S905X3) reports EDDEVID.PCSample = 0, so
> coresight-cpu-debug cannot use it. The PC is available through PMPCSR
> in the external PMU frame (debug frame + 0x20000, PMDEVID.PCSample = 1).
> A lab module reading PMPCSR caught the PC of a CPU stuck on a PCIe bus
> access with IRQs off; on this GICv2 SoC the stop IPI never reaches it.
> 
> Two observations:
> - A panic notifier samples too late: the other CPUs are stopped by
>   then, and on this SoC reading the PMU frame of a stopped CPU raises a
>   synchronous external abort. Sampling on entry to smp_send_stop()
>   works.

Arm ARM, section I5.3.48 PMPCSR mentions "PMPCSR is in the Core power
domain". The challenge is ensuring that the target core remains powered
_throughout_ the access; checking its power state beforehand still
leaves a race.

For example, with CPUidle enabled, a CPU can be powered off any time so
it still race even move sampling in smp_send_stop().

This seems to be the main challenge. I'll check a bit if any guidance
for safely accessing PMPCSR.

> - Marvell has an out-of-tree patch, "coresight: cpu-debug: Add support
>   to dump PMPCSR" (2023, carried in linux-yocto); I could not find it
>   on the lists.
> 
> Is PMPCSR support in coresight-cpu-debug planned or welcome? And how
> should such a PMU frame be described in DT: arm,coresight-cpu-debug or
> a new compatible?

Would it make sense to describe external PMU frames in the PMU node
and have cpu-debug reference its phandle? As Suzuki mentioned, this
can be reviewed on patch.

Thanks,
Leo

