Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197F606D809
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mKXkic2M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLEWCsV8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=; b=mKXkic2M/gadf2S4BmxxX0OaQM
	BxxFof7jKI5OlEMsZ7PB2Dhz1pFcufJ37lSff4JTtHrYbR9ejAd5nSQWlpNAAiciHgHaKF7Z1xbMg
	pVuSGZzi8o4JnZlof0iAOAfW2dnpBlKs/fiFuqgnr3Bf0q66HuyRs7gGrA0ahwWuTDvEUgP0bXKnQ
	ecykpTOF80g5jKJVCUWDSKXsZScZXmbw6feR6vzdHkxlLXtqAS691/FmoveVaSHqPvR7b54R0rksh
	I881w23rJq6hEZWX+1d3wanA2+bE6VcF1/aDMIlOCpp3YdIjXRr+1AYrdIhXmKd+0VHww2kkceOur
	luNAQ4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOT-00000000nYL-3fZ4;
	Mon, 09 Nov 2026 13:26:41 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOQ-00000000nXV-2SLh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:26:39 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so319918a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230797; x=1794835597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
        b=rLEWCsV8+HbdPYKs5uxGDgFX5xusiexKFOxMvH5KUdTqW10oUmudJpXYHn+Lvt3QIx
         0rFcqo15yFg3IUYX2IinAWuYSegcaI2ryb9ogd7pqMrL7C34UNr0uB1ypw45dkhi8Jnc
         8s1vZeXBj9Ytn6YM+paAeEDjK27HfrlV1nXgf5IzSt4kIFdLuXKpmLtSpexVYVDzd0vR
         c0EbMEhrPmh5xmtYuHz3T4EuAX3HM5spvmgkmYRtks7HkPRmVNuC+8iHJ8RYBopXtdrE
         nucx6+sIrTg7apCJBwIeqCaf65fX3sgf3ZJFfpZB96FeNzcU71RQNtTT1i3bCWtfMOBh
         lz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230797; x=1794835597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
        b=Z6TiPSaY/zFOjv3w/iGdcQuTsExeUzGF2jR8g+VpLTwCwW7bWQckZ/obReSJsEXYKd
         mgk0JgJgQnBK84aPdkBfIKpeegzwnZEWIvd7zIJf/reBMDOY8wY6qdMpNuMmyTqgax9y
         705UujprgIrN4YHIBdfBuhepq7YSm2PRB4v2aylB8mEcOhVnL2OAULx0MD+CR1ewjkAn
         VJpEw4gblWQAgpL2kk2FILvyCpQCPG8VKnKi5OCsJMnXfesYZJsGG7P0CNdPd6VFHRHM
         O1+fboNkZWvKpDcaJ7346dydo5dOOODZVHTsCN5uI2WqdgL30yL4AHCWsYWFOZFitlFx
         lgww==
X-Forwarded-Encrypted: i=1; AL+hErF4NqGfhDMAXpjWO6SZfRfWz4BqBaD8c2mrghTyEus6n2aAaM3d2rdZ9iJwi/fCRE0a5AiuNeiLSLZkVy+QnXxR@lists.infradead.org
X-Gm-Message-State: APuU4Z+c2qWvXc8LOM/4knHqir/78+1X2NMoAcg+SRgRb181bKRttXyC
	HXq8R+5+QKp+q5OuCsV5Q9IfLjf6szl2Z0rzBU6yfndv/STSKhmaQZOG
X-Gm-Gg: AYBFou1x5Jnum0/H1JGoIJ0tM2C1jrGEVh0qUbMtpUE1Vsb07s11Y2yIKUN06f7CkLr
	ugbaUJMvqBkca0rjQilnE40k++igAKPUA3de1kU4LsbT2YxF1jU0uPN1h7I/qMsWfeX3S5F9D1y
	OmR01a9Z7FatVZexHnxLekj5Ho02zXHFe3IpNP3vKmcMwTHJpPlqf1gEqm625+A8/Ox/bK6aa9L
	aXxGKKmwHwgr/RAqk3/Nkhsbqx6kb06FKlQsZmTI2HKP17igWAysfoV2GSdGtoJkMD9eFp0CAgS
	12S2d45XEGUngTk/LywpJ8a33rhQZaexITqsVmqXVYZHNQ6pmtWbf7kB1NrIaQFBIQ3G/98p/ka
	6biYbsF/sgYWEt4euDD90EJ50QA5f2BWmWjcUoGSENKJy696dwdN8iVny0Ey6R7S36kyAIWrQoj
	xefZ8kgcsDF1rnhtlcxopkduahwVRpxqt/nNtx5pBv0e25oPshaEfuv/6zq3f0wrMnV6NappAkQ
	iQ7wPUHwb7F2aAGWAfxbuv9kFo9Ygmantktb60ORbp5osfkh1Ll0E0Y3jCoSpY3n9gfzoLUCVfJ
	xu7worPAlwODFQTeCPgnXwBPhdglwtBxPhcggZaYg6j5auCKOPat/snJGX6F8HrGz08pJbplfIZ
	DFto3+1gE
X-Received: by 2002:a17:90b:57ee:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b12d564a3emr3973293a91.46.1794230794140;
        Mon, 09 Nov 2026 05:26:34 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:33 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 00/6] resctrl: Support mba_MBps on MPAM
Date: Mon,  9 Nov 2026 21:26:15 +0800
Message-ID: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052638_656650_8A7BF95B 
X-CRM114-Status: GOOD (  18.55  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jinjie Ruan <ruanjinjie@huawei.com>

Resctrl offers two ways to describe an MBA policy:
- The percentage interface writes a fraction of the maximum bandwidth
  into the hardware control register
- The MBA software controller (mounted with -o mba_MBps) takes
  an absolute target in MiB/s and adjusts that percentage based on
  the MBM counters sampled once per second.

The problem is that a percentage alone isn't enough. How much bandwidth
a percentage actually corresponds to depends on the memory frequency,
the channel count, how many threads are generating traffic, the access
pattern, and the traffic of other groups. Neither MPAM nor x86 resctrl
reports the maximum bandwidth in MiB/s. So an administrator who wants
to enforce an absolute budget (a tenant SLA, a noisy-neighbour limit)
has to measure and re-tune the percentage on every machine. x86 resctrl
has had this software controller since 2018; MPAM has never been able
to use it. This series makes it work on MPAM.

What this series does
=====================

MPAM refuses mba_MBps in two places:
- Its MBM counters are assignable, and supports_mba_mbps() refuses
  the option when they are.
- Its maximum bandwidth control is a soft limit by default, which
  can't hold a single requester down to the target.
  MPAMF_MBW_IDR.MAX_LIM reports whether the hard limit exists.

MPAM also makes two generic defects reachable:
- Writing the control register sleeps (smp_call_on_cpu()), while
  the worker runs under the RCU read lock
- A 16-bit fraction lets the minimum control value reach zero, which
  divides by zero in the estimator

The patches:

- Patches 1 and 2 fix the two generic defects.
- Patches 3 and 4 make the loop runnable on MPAM: the worker takes the
  CPU hotplug lock around the sleeping control update, and assignable
  counters are accepted with a fixed assignment mode.
- Patches 5 and 6 handle the maximum: the driver sets HARDLIM and
  records the MAX_LIM behaviours, and mba_MBps is refused where only
  the soft limit exists.

x86 has no assignable counters in the mode where the controller is
allowed, and does not set the soft-limit flag, so its behaviour is
unchanged.

Testing
=======

With the MPAM MSC model in QEMU:

- From a 9606 MiB/s baseline, a 7000 MiB/s target converges to
  6888 MiB/s and a 9000 MiB/s target to 8766 MiB/s.
- The memory-side MSC register shows MBW_MAX.HARDLIM set.
- A modelled MSC that implements only the soft limit refuses the
  mba_MBps mount, while a plain mount succeeds.
- With mbm_assign_on_mkdir forced on while the controller is in use,
  a write of 0 is refused, and the user's value is restored after
  unmount.
- The KUnit tests for the MPAM driver pass.

Jinjie Ruan (6):
  fs/resctrl: Avoid division by zero in the MBA software controller
  fs/resctrl: Do not update bandwidth from a failed counter read
  fs/resctrl: Take the CPU hotplug lock for software controller updates
  fs/resctrl: Allow mba_MBps with assignable MBM counters
  fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
  arm_mpam: Program the hard limit for the software controller

 Documentation/filesystems/resctrl.rst | 13 +++-
 drivers/resctrl/mpam_devices.c        | 55 +++++++++++++----
 drivers/resctrl/mpam_internal.h       |  4 ++
 drivers/resctrl/mpam_resctrl.c        |  9 +++
 fs/resctrl/monitor.c                  | 86 +++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 | 48 ++++++++++++---
 include/linux/resctrl.h               |  5 ++
 7 files changed, 179 insertions(+), 41 deletions(-)

-- 
2.43.0


