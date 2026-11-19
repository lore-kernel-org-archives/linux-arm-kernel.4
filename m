Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pRPE4dHR;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hfvdMjpC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=86nB5mKnHvrFEMdujJF91U4d34lfCyWWnlHwTWhGUfg=; b=pRPE4dHRnHLkV4btV6JC1hBIhv
	gDgtG5Pu5vxWbDcNKZOe2ju6T9XqK3uKPMjaLqNeTQsaEP4ft6XM4Trp6uoForlq2b1AY/d9aXwnu
	2Z3PV0Z4XW9H247mD+y58hwWvJ2H1Bpdhw2MAaioemTkovstqXZVxGWUQcTmr0HuJJRgMaNKjKioR
	lveZvujEdmVU7OEhnMTST8uWWgWuvheAiPqESu2ghKFSw9t6B9Xy0fHNibQD4dPExezVkCYXMAu/5
	o4o6pWMEybksHSYUBedktVNGHblNfEYssCvaeHd2jBBjvs8W1m5vMLmq5wgPRaPv34ni4li+jOPgQ
	xWotuE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3tU-0000000CP3Z-0RTd;
	Thu, 19 Nov 2026 15:17:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3t7-0000000COtS-03Nt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:17:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43D2A1575;
	Thu, 19 Nov 2026 07:17:21 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5D043F882;
	Thu, 19 Nov 2026 07:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795101444; bh=Vuq3BbIJLrHa9nLpAQpd7ZqMHldDa/sBR0tInK2kjPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfvdMjpC9//mcgrUjr80UuBhFvNZhoDgdvk0gbF8xgkFxhCiZF0kP4WOw+X6ZBtu5
	 0QsFMYizHDzqYEyWy7x/mDcIQH6KRoP8OwPqpcgSlFOms5CdNWp2YiI9EvncT9RTcy
	 PmpirPiwsEy+laokQorUW6LOOvhoh/9lHjTKNCv8=
Date: Thu, 19 Nov 2026 15:17:21 +0000
From: Leo Yan <leo.yan@arm.com>
To: Igor Velkov <iav@iav.lv>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261119151721.GZ9176@e132581.arm.com>
References: <20261113-coresight-pmpcsr-question-1@iav.lv>
 <20261113144623.GQ9176@e132581.arm.com>
 <20261114-coresight-pmpcsr-reply-leo-1@iav.lv>
 <20261117183241.GV9176@e132581.arm.com>
 <20261117-coresight-pmpcsr-reply-leo-2@iav.lv>
 <20261118104917.GW9176@e132581.arm.com>
 <20261118-coresight-pmpcsr-reply-leo-3@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-coresight-pmpcsr-reply-leo-3@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_071725_118234_E9167DD2 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, Nov 18, 2026 at 08:58:26PM +0200, Igor Velkov wrote:
> On Wed, Nov 18, 2026 at 10:49:17AM +0000, Leo Yan wrote:
> >  1) If idle_cpu(cpu) == 0, sample the CPU directly.
> >  2) If idle_cpu(cpu) == 1, follow the existing flow to request
> >     power-up before sampling.
> 
> I tried step 2 on RK3399 (Cortex-A53 + A72, cpuidle with core
> powerdown), following debug_read_regs() on a running system:
> 
> - Idle A53 (EDPRSR.PU = 0): the EDOSLAR write raises an SError on the
>   reading CPU. COREPURQ brings the core up only for a moment; with
>   COREPURQ | CORENPDRQ it is off again within 10 ms, and the write
>   still faults.
> - Idle A72 (PU = 1, R = 1): the same SError on the EDOSLAR write.
> - Busy CPUs (idle_cpu() == 0) on both clusters: no errors, full PC.
> 
> So on this SoC only step 1 is safe.

This is why I suggested 3) in my previous reply. Seems you should skip
sample idle CPUs if COREPURQ/CORENPDRQ are not properly integrated in
the SoC.

Thanks,
Leo

