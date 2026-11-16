Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8571B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HLhXL0Nm;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GGhaI4VR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5z4xnPV4/wkksCnrUoubh2iQH2xhzqS99QSqjxr3ccw=; b=HLhXL0Nm+w+UrCXekCS6Pq7caO
	pfWGYYKdxalJ7wGcJeJBYolgCmI32lcsk7pTobQh8mIirItDvFabF0XSA4/E8mIk5uDOtLuni4dCe
	fYYFdO3674eXJTarsd7qsrc1J1RxMkKGDGrYMzI2cdQvfbMw2tugYRdpSlTZtNvs3HjKq67yUUHUK
	BrubxvxgXIPnqjyVcKJunON3fiO+Rqva96NhOQ86Xvic9a1UdH/JBqN8geNubwaXZQfcpk/htiHOb
	FZl5yaX0Sq1g751++M8dSwSH2oG7Udt83NIe71c31XUHSj/veQ6aB0WUNYcukrLPDogej7AiVwNa1
	VhB6xF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJJ-00000002VT9-1Pff;
	Mon, 16 Nov 2026 12:59:49 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJA-00000002VEv-2HQ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5z4xnPV4/wkksCnrUoubh2iQH2xhzqS99QSqjxr3ccw=;
	b=GGhaI4VRy4IePAFtjN3m7Cbp20cvwRUu0Ne2ojWBgcVDYjzlc7O5DZDMtbgpDNxnkJTnGTzam
	BsxUAaKVjfJfH86VWlj/w5OKCdWNNI1drxYGlLqZtifEsM6vvplCincLxA8aO9n3SghFrNVU4/M
	pvRdMgaI1kHZyxnsODV5GpI=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxC0rQyz1T4dt;
	Mon, 16 Nov 2026 20:58:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 30C152011D;
	Mon, 16 Nov 2026 20:59:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:31 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 00/19] arm_mpam: Add L2 cache monitors
Date: Mon, 16 Nov 2026 20:58:55 +0800
Message-ID: <20261116125914.498841-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_045940_941179_F6E57B85 
X-CRM114-Status: GOOD (  14.46  )
X-Spam-Score: -2.1 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Resctrl exposes cache occupancy and bandwidth monitoring only at the L3
scope. MPAM can count the same things on an L2 cache: firmware points
an MSC at the cache it belongs to, and its CSU and MBWU counters can
report the occupancy of that L2 slice and the traffic the cache sees.

This series first reworks resctrl's monitor bookkeeping to track events
by scope instead of by resource, and then exposes those counters as
"l2c_occupancy" and "mbm_core_bytes"

The patch set is organized as follows:

- Patches 1-4:   Rename to drop the L3 prefix
- Patches 5-7:   Rework the bookkeeping, index monitor state by resource
                 and event, index the event table by scope and eventid
- Patches 8-13:  Make the core per-resource and add the L2 events
- Patches 14-18: Let the driver pick L2 classes for the L2 resource,
		 and expose the L2 events
- Patch 19:	 Update the documentation

Notes on the user interface
===========================

The L3 event names and semantics, the L3_MON and mon_L3_xx names and
the x86 PERF_PKG files are unchanged.

The L2 bandwidth event is called mbm_core_bytes because it counts the
bytes the L2 cache sees, which is not memory bandwidth.

And mbm_L3_assignments remains L3-only.

Testing
=======

QEMU, topology with L2, L3 and memory-controller MSCs:

- info/L2_MON lists l2c_occupancy and mbm_core_bytes, and per-core
  mon_L2_xx directories are created.

- Reads: l2c_occupancy 262144 bytes (50% of a 512KiB L2),
  llc_occupancy unchanged, mbm_core_bytes advances about 20GB per 2s
  sample.

- CDP halves num_closids and the monitor counts of every monitor
  resource.

- RMID limbo: a freed RMID is marked busy in every L2 and L3 monitor
  domain, and becomes allocatable again once those domains are
  offlined and the busy count reaches zero.

QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
Test cases: https://github.com/ruanjinjie-eng/mpam_testcase

This series is rebased on v7.4 rc3 and also available at:
	https://github.com/ruanjinjie-eng/linux/commits/mpam-l2mon-scope

Changes in RFC v3
- The event table is indexed by scope instead of by resource (Reinette)
- Patch 6 is split out so no helper takes an unused argument.
- The RMID limbo threshold is kept per resource, so an L3 domain no
  longer compares its occupancy with an L2-sized value
- Bugfixes are split out  as their own series.
- RFC v2: https://lore.kernel.org/all/20261029123611.1108424-1-ruanjinjie@huawei.com/

Changes in RFC v2:
- As Ben suggested, the existing event types now apply to any resource,
  instead of adding L2-only event IDs.
- As Ben suggested, L2 bandwidth uses an assignable counter that stays
  with the monitoring group, not a monitor borrowed for each read.
- The CDP change also halves the assignable counter count, for every
  monitor resource.
- Split by subsystem so resctrl, x86 and MPAM can be reviewed separately.
- Fix a CDP bug: a failed enable left the driver believing CDP was on.
- RFC v1: https://lore.kernel.org/all/20261022084821.4014873-1-ruanjinjie@huawei.com/

Jinjie Ruan (19):
  fs/resctrl: Rename monitor events to drop the L3 prefix
  x86/resctrl: Use the resource-agnostic monitor event names
  arm_mpam: resctrl: Use the resource-agnostic monitor event names
  resctrl: Remove the L3 monitor event names
  arm_mpam: resctrl: Index monitor state by resource and event
  x86,fs/resctrl: Record the resource that enables a monitor event
  x86,fs/resctrl: Track monitor events by scope
  fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
  fs/resctrl: Add the L2 monitor events
  fs/resctrl: Set up MBM state and workers for every monitor resource
  resctrl: Keep the RMID limbo threshold per resource
  fs/resctrl: Check RMID limbo on every resource with occupancy
  fs/resctrl: Manage assignable counters for every monitor resource
  arm_mpam: resctrl: Halve the monitor counts of every resource on CDP
  arm_mpam: resctrl: Look up the monitor domain id from the components
  arm_mpam: resctrl: Report counter assignment per resource
  arm_mpam: resctrl: Allow monitoring on resources other than the L3
  arm_mpam: resctrl: Expose the L2 monitor events
  Documentation: arm64: mpam: Describe the L2 monitor events

 Documentation/arch/arm64/mpam.rst       |  25 +-
 Documentation/filesystems/resctrl.rst   |  11 +
 arch/x86/kernel/cpu/resctrl/core.c      |  13 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c |   2 +-
 arch/x86/kernel/cpu/resctrl/internal.h  |   2 +-
 arch/x86/kernel/cpu/resctrl/monitor.c   |  10 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c  |   8 +-
 drivers/resctrl/mpam_resctrl.c          | 357 ++++++++++++++----------
 fs/resctrl/ctrlmondata.c                |  13 +-
 fs/resctrl/internal.h                   |  55 +++-
 fs/resctrl/monitor.c                    | 328 +++++++++++++---------
 fs/resctrl/rdtgroup.c                   | 158 ++++++-----
 include/linux/resctrl.h                 |  36 ++-
 include/linux/resctrl_types.h           |  16 +-
 14 files changed, 619 insertions(+), 415 deletions(-)

-- 
2.34.1


