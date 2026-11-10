Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F2360A6F78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i0Zfdq19;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+6HLqLC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=D6I+9mOh63hZoFlVcPImYCerGlblTsLsV4DNO+WiNiQ=; b=i0Zfdq19sGCbZLYMksK90Np5tG
	NDSxjIIozVNvYXEOInUJk8g3QK9JHIyk7FLSwxZuppsBvaJ3tOy5FlptNV1+6tz9MXJ5kZJrs4Nqe
	QpYazqyZ6aQbVvEaC3D0FLSqZSZwlh1A0Hz6w97yyeXe7MdoHmmSqfc8jgM4xCABSFyfjgrIlvkxb
	ZsdhMtbzgt/dQLZ4yXd/qfIeJ+b44V3h+b0FAw/jQBhw88iOBdLG7ZJcRntwUgAPAkfiFRmn9qyOW
	Hdbk0FgYS8aFAgqrQDdMqR9roxGo3AoW8SiR513W6nzAI6yL+ib3C5QLR6tgCyUlMUvAXFjgLCduz
	F464LqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKJ-00000002MXa-2u6x;
	Tue, 10 Nov 2026 04:19:19 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdKH-00000002MW4-0WCq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284357; x=1825820357;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M1DlmdfP/qnqzTDgZw6h2TGWtbHGaNHnFQKtmH0THtY=;
  b=W+6HLqLCoLrm50du3MVRlwKALHWzA+k7F4LTYysiaFADcUZGIPMzYV7+
   2rvdp0nCfezy2znPWFvQVWAfvsU7JE72CpHavZmtkUzn/KUZLH6GkHYZw
   GU2LNkdrGWTh/73TtZVkMJEGgQT67sVWi+HztbwPly/7/yZpgbvGTUUxZ
   aqtr0DgFIBSvOjdsoMPQel2ADk4AzZDXiRWS80iO1MhhSv585vd0tjzE/
   ipioxMQi4rMQOJktEViG3qN5PiMPbRIE9hsnzeV9QMlvgZ+n4VzH5I9JP
   yAfUONQJ1MoZWHK2DAbbASTaVlenc3pAzb+Jv061ruZ+c/jRry1E6h9yu
   g==;
X-CSE-ConnectionGUID: ZVMTeJrBT+yBMQcNULmwVw==
X-CSE-MsgGUID: 9czluh3YShC8frx8VmPL2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901286"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901286"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:14 -0800
X-CSE-ConnectionGUID: 203t+MEKTmimaDAVzZuetw==
X-CSE-MsgGUID: 6Q/XI7PzR9mFU4x8bWf6KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856905"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:14 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	ruanjinjie@huawei.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	tan.shaopeng@fujitsu.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH v3 0/8] arm_mpam: resctrl: Separate MPAM domains
Date: Mon,  9 Nov 2026 20:19:00 -0800
Message-ID: <cover.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_201917_205964_DCBA8E2D 
X-CRM114-Status: GOOD (  15.54  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you very much to Ben, Jinjie, and Shaopeng for reviewing and testing RFC v2.

Changes since RFC v2:
  - RFC v2: https://lore.kernel.org/lkml/cover.1792443633.git.reinette.chatre@intel.com/
  - Patch 1 is new. It adds find_mbwu_mon_comp() to replace the duplicate
    code found in resctrl_arch_cntr_read() and resctrl_arch_reset_cntr(),
    as suggested by Jinjie.
  - WARN when domain allocation fails. (Ben)
  - Squash three patches into the patches they build on. (Ben)
  - Move "Require a component for each monitoring event" ahead of the
    structure split so the check it adds precedes its first user.
  - Fix the mpam_resctrl_get_mon_domain_from_cpu() function comment that
    still referred to the control component.
  - Add tags from Jinjie and Ben.
  - Please see the individual patches for their detailed changelogs.

Changes since RFC v1:
  - RFC v1: https://lore.kernel.org/lkml/85ca29e89eacf12cfa7071249419e7cadb8f0691.1788220029.git.reinette.chatre@intel.com/
  - Give each type of domain its own structure instead of duplicating the
    shared one, set up each domain independently instead of undoing one
    domain when setting up the other fails, add additional verification
    checks.

The MPAM driver represents a resctrl domain with a single structure,
struct mpam_resctrl_dom, that holds both a control domain and a
monitoring domain. On a system that supports both allocation and
monitoring, one instance is created for each domain and its two
domains are added to the resource's control and monitoring domain
lists.

Holding both domains in one structure requires control and monitoring
to be done at the same scope, and ties each control domain to a
monitoring domain. This does not fit the proposed support for multiple
controls per resource [1]. There, each control of a resource, for
example a "min" and a "max" memory bandwidth control, has its own list
of control domains while the resource keeps a single list of
monitoring domains. With one structure for both, every control domain
would come with a monitoring domain of its own, which does not reflect
the resource.

This series gives control and monitoring domains their own structures,
set up and torn down independently as CPUs come online and go offline,
in preparation for supporting multiple controls per resource. Along
the way it stops failing CPU online when a domain cannot be set up,
and adds checks when setting up a monitoring domain.

  1     Share the lookup of the component counting an event
  2-3   Preparatory cleanups of domain allocation
  4     Do not fail CPU online when domain setup fails
  5-6   Preparation for separate domain structures
  7-8   Separate the control and monitoring domain structures

Transitioning this submission from RFC to PATCH after gaining more
confidence in the changes thanks to Jinjie and Ben's reviews and testing.

The series was rebased onto v7.4-rc2 since the for-next/mpam branch
of the arm64 tree does not exist at this time.

[1] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/

Reinette Chatre (8):
  arm_mpam: resctrl: Add a helper to find the component counting an
    event
  arm_mpam: resctrl: Use find_component() when allocating a domain
  arm_mpam: resctrl: Rename ctrl_comp in mpam_resctrl_alloc_domain()
  arm_mpam: resctrl: Do not fail CPU online when domain setup fails
  arm_mpam: resctrl: Split control and monitoring domain setup into
    helpers
  arm_mpam: resctrl: Require a component for each monitoring event
  arm_mpam: resctrl: Give the monitoring domain its own structure
  arm_mpam: resctrl: Rename struct mpam_resctrl_dom to
    mpam_resctrl_ctrl_dom

 drivers/resctrl/mpam_devices.c  |   2 +-
 drivers/resctrl/mpam_internal.h |  11 +-
 drivers/resctrl/mpam_resctrl.c  | 384 ++++++++++++++++++--------------
 3 files changed, 220 insertions(+), 177 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0


