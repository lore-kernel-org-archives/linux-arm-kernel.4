Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E94360A260D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y57SClCp;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZlyCzvlb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QIQEjm3d2yUWI7XJ5oSFB+PNWsrkD9quGMx3NyrE8X0=; b=y57SClCpn8aOQrRMljyFrIF9fO
	dGhzpXr1TtdgfLnDVxHJIZk8e+8WmBljWUZJPbkMMtLIh3xvrgZwMhDCACGRtRt+WHVqKIUf5of8a
	30f3zr+qrkHSIZJWTEVhkki6U8RDpDvHpWWHHN2yyQUcTanqNg8HpB013ElrCq7e6L7nfDw/pmurq
	V4Egiw0j17hdp6vrN3jO4k6RU4ADnYL1nwpAPdJKLjiJK3CXZRx6jF9a8Ix4sjZDnEq4V9sXWeNR8
	EFKBVEpQzz2ZrC6kEjorTE68ecfjpyTPZbmOvdTWKZdyKcSnx/d7DaCCi1Iz727b8v2sMsL7sI6Ln
	kK7z0yJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSGN-0000000Ff5J-2tut;
	Fri, 20 Nov 2026 17:19:03 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSGH-0000000Ff3z-3NLa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795195138; x=1826731138;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/1HtlNbVvYtajBQoreiIL3kcVHwbMdxKszmOsBzjyRE=;
  b=ZlyCzvlbnZ34Me9MLfVvH1DHikvSXY7P1fZ5RJTk2/fFnTxYZQVZWC75
   U5BUwJz/y8OQwO08MyzgY6aiNJBnCG0Sz1C/wPTeZYAR2aER5A73qxFFf
   s2OR9t/X0ArSaSxxto0y4UDxszdBYeLzlRHk+MjFIX28/ZHLI2hxrf8o8
   2XUwyzyjzFn4sYZohAZau/gDhhgt/kTBdGgYXyJHOSMBH+BAwwd7v+67/
   gyOiUGy6GxY5p2zUfOYLjR4pUNq2Br6pjchpswpw0+FnZiHOgCOuTPj+P
   g9Iyp7yWMciqpeKdADYVt4lHHMF0sRPjj8QqiJD0WnZLk6BTyLXZZft3Q
   A==;
X-CSE-ConnectionGUID: Bp5jD+MBSOGH3fjHZR8/ag==
X-CSE-MsgGUID: AVUNbufhRo2yXGrlxDaPTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4083513"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4083513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 09:18:55 -0800
X-CSE-ConnectionGUID: XjeTSy/9S3a+dpzJiY3r5w==
X-CSE-MsgGUID: CovpluibRWqPAawUn0BefQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11092229"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.215])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 09:18:49 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: catalin.marinas@arm.com,
	pawel.chmielewski@intel.com,
	kyle.d.pelton@intel.com,
	lenb@kernel.org,
	guohanjun@huawei.com,
	maobibo@loongson.cn,
	lpieralisi@kernel.org,
	will@kernel.org,
	sudeep.holla@kernel.org,
	erik.kaneda@intel.com,
	rafael@kernel.org,
	robert.moore@intel.com,
	void0red@gmail.com,
	maciej.wieczor-retman@intel.com,
	superm1@kernel.org,
	chenhuacai@kernel.org
Cc: acpica-devel@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2 00/42] ACPICA: ACPICA 20260930 with follow-up fixes
Date: Fri, 20 Nov 2026 18:17:24 +0100
Message-ID: <cover.1795194329.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091858_134119_273A3A3E 
X-CRM114-Status: GOOD (  14.97  )
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

The following patches are ported from upstream ACPICA and contain the 20260930
release and some follow up fixes (so generally everything after the 20260408
release). Only source files relevant to the Linux kernel are being ported.

Changes since v1:
v1 [1] contained only commits between the 20260408 and 20260930 releases.
However sashiko.dev [2] raised some issues that needed to be either applied or
rejected. Most issues were valid and were resolved in patches that follow the
20260930 release. Things that were rejected were the whole patch [3] due to not
being a full solution to a very unlikely, debug only problem. Also the sashiko
comment related to ACPI_GPE_AUTO_ENABLED in patch [4] wasn't applied due to
not being realistically possible to happen and consequences were only an odd
looking log entry.

There are non-ACPICA changes related to constants/variable name changes
in these patches:
- ACPICA: actbl2: MPAM: adapt to MPAM ACPI spec v3.1
- ACPICA: acpica: Fix typo in the IOVT_IOMMU table definitions

The base for this patches is upstream kernel v7.4-rc3 and it consists of
the following material:

Andre Przywara (1):
      ACPICA: actbl2: MPAM: adapt to MPAM ACPI spec v3.1

Colin Ian King (2):
      ACPICA: components: Fix typo "Supress" -> "Suppress"
      ACPICA: components: Fix typo: "numer" -> "number"

Dave Jiang (2):
      ACPICA: CEDT: RDPAS: Add missing reserved field in RDPAS structure
      ACPICA: CEDT: RDPAS: Fix incorrect field positions for RDPAS

Hanjun Guo (1):
      ACPICA: add UBRT (UnifiedBus Root Table) definitions

Himanshu Chauhan (1):
      ACPICA: Introduce a new HEST notification type for RISC-V SSE events

Iurii Trukhin (1):
      ACPICA: parser: Fix parse tree memory leak on AML execution error unwind

Leonard Lausen (1):
      ACPICA: Executer: Resolve package index references used as integer operands

Maciej Strozek (1):
      ACPICA: Utilities: Fix for AcpiUtVerifyChecksum warning display

Maciej Wieczor-Retman (17):
      ACPICA: executer: Fix NULL pointer dereference in AcpiExStoreObjectToIndex()
      ACPICA: compiler: Add _Ixx GPE object
      ACPICA: namespace: Fix possible underflow and NULL pointer dereference
      ACPICA: iASL: Fix the truncated count of external control methods
      ACPICA: release: Update version to 20260930
      ACPICA: events: Add missing event mutex to AcpiEvClearGpeDispatchByOwner()
      ACPICA: events: Remove redundant code
      ACPICA: events: Fix AcpiEvClearGpeDispatchByOwner handler type processing
      ACPICA: events: Fix GPE cleanup return after changing program state
      ACPICA: events: Handle GPEs' Notify dispatch type
      ACPICA: tables: Fix wrong table unload and notify call order
      ACPICA: tables: Fix global table read missing mutex
      ACPICA: executer: Fix copying PCC source buffer data
      ACPICA: dispatcher: Fix zero size non-NULL PCC buffer pointer
      ACPICA: utilities: Clear NextObject so the outer loop doesn't read it
      ACPICA: namespace: Fix memory leak around compiler alias flag
      ACPICA: acpica: Fix typo in the IOVT_IOMMU table definitions

Mario Limonciello (AMD) (1):
      ACPICA: Add ACPI_MSG_DEBUG to set KERN_DEBUG for debug output

Pawel Chmielewski (3):
      ACPICA: ACPI 6.5 Add support for the MISC table
      ACPICA: iASL: Complete KEYP support
      ACPICA: tables: Fix table buffer leak when Load fails verification

Rong Zhang (1):
      ACPICA: parser: Set AML length for bytelist

Vidya Sagar (1):
      ACPICA: IORT: Add Root Complex PASID Flags field

ikaros (8):
      ACPICA: Events: Clear GPE dispatch by owner during table unload
      ACPICA: executer: Add bounds checking for PCC field read access
      ACPICA: Validate 4-char field names before namespace lookup
      ACPICA: Improve error handling in table loading process
      ACPICA: executer: Add bounds checking for PCC field write access
      ACPICA: tables: Fix heap-buffer-overflow in AcpiTbFindTable
      ACPICA: Fix object reference update to skip non-local notify types
      ACPICA: namespace: Recognize alias node types in detach

purofle (1):
      ACPICA: fix: build error with gcc 16: unused-but-set-variable

[1] https://lore.kernel.org/all/20261020141051.2194123-1-pawel.chmielewski@intel.com/
[2] https://sashiko.dev/#/patchset/20261020141051.2194123-1-pawel.chmielewski%40intel.com
[3] https://sashiko.dev/#/message/20261020141051.2194123-9-pawel.chmielewski%40intel.com
[4] https://sashiko.dev/#/patchset/20261020141051.2194123-1-pawel.chmielewski%40intel.com?part=7

Andre Przywara (1):
  ACPICA: actbl2: MPAM: adapt to MPAM ACPI spec v3.1

Colin Ian King (2):
  ACPICA: components: Fix typo "Supress" -> "Suppress"
  ACPICA: components: Fix typo: "numer" -> "number"

Dave Jiang (2):
  ACPICA: CEDT: RDPAS: Add missing reserved field in RDPAS structure
  ACPICA: CEDT: RDPAS: Fix incorrect field positions for RDPAS

Hanjun Guo (1):
  ACPICA: add UBRT (UnifiedBus Root Table) definitions

Himanshu Chauhan (1):
  ACPICA: Introduce a new HEST notification type for RISC-V SSE events

Iurii Trukhin (1):
  ACPICA: parser: Fix parse tree memory leak on AML execution error
    unwind

Leonard Lausen (1):
  ACPICA: Executer: Resolve package index references used as integer
    operands

Maciej Strozek (1):
  ACPICA: Utilities: Fix for AcpiUtVerifyChecksum warning display

Maciej Wieczor-Retman (17):
  ACPICA: executer: Fix NULL pointer dereference in
    AcpiExStoreObjectToIndex()
  ACPICA: compiler: Add _Ixx GPE object
  ACPICA: namespace: Fix possible underflow and NULL pointer dereference
  ACPICA: iASL: Fix the truncated count of external control methods
  ACPICA: release: Update version to 20260930
  ACPICA: events: Add missing event mutex to
    AcpiEvClearGpeDispatchByOwner()
  ACPICA: events: Remove redundant code
  ACPICA: events: Fix AcpiEvClearGpeDispatchByOwner handler type
    processing
  ACPICA: events: Fix GPE cleanup return after changing program state
  ACPICA: events: Handle GPEs' Notify dispatch type
  ACPICA: tables: Fix wrong table unload and notify call order
  ACPICA: tables: Fix global table read missing mutex
  ACPICA: executer: Fix copying PCC source buffer data
  ACPICA: dispatcher: Fix zero size non-NULL PCC buffer pointer
  ACPICA: utilities: Clear NextObject so the outer loop doesn't read it
  ACPICA: namespace: Fix memory leak around compiler alias flag
  ACPICA: acpica: Fix typo in the IOVT_IOMMU table definitions

Mario Limonciello (AMD) (1):
  ACPICA: Add ACPI_MSG_DEBUG to set KERN_DEBUG for debug output

Pawel Chmielewski (3):
  ACPICA: ACPI 6.5 Add support for the MISC table
  ACPICA: iASL: Complete KEYP support
  ACPICA: tables: Fix table buffer leak when Load fails verification

Rong Zhang (1):
  ACPICA: parser: Set AML length for bytelist

Vidya Sagar (1):
  ACPICA: IORT: Add Root Complex PASID Flags field

ikaros (8):
  ACPICA: Events: Clear GPE dispatch by owner during table unload
  ACPICA: executer: Add bounds checking for PCC field read access
  ACPICA: Validate 4-char field names before namespace lookup
  ACPICA: Improve error handling in table loading process
  ACPICA: executer: Add bounds checking for PCC field write access
  ACPICA: tables: Fix heap-buffer-overflow in AcpiTbFindTable
  ACPICA: Fix object reference update to skip non-local notify types
  ACPICA: namespace: Recognize alias node types in detach

purofle (1):
  ACPICA: fix: build error with gcc 16: unused-but-set-variable

 drivers/acpi/acpica/acevents.h  |   4 +
 drivers/acpi/acpica/acglobal.h  |   2 +-
 drivers/acpi/acpica/acpredef.h  |   1 +
 drivers/acpi/acpica/acutils.h   |   3 +
 drivers/acpi/acpica/dsfield.c   |  24 +++
 drivers/acpi/acpica/evgpe.c     | 355 ++++++++++++++++++++++++++++++++
 drivers/acpi/acpica/exconfig.c  |   3 +-
 drivers/acpi/acpica/exconvrt.c  |   4 +-
 drivers/acpi/acpica/exfield.c   | 105 +++++++---
 drivers/acpi/acpica/exresop.c   |  26 +++
 drivers/acpi/acpica/exstore.c   |  20 +-
 drivers/acpi/acpica/extrace.c   |   2 +-
 drivers/acpi/acpica/nsaccess.c  |   2 +-
 drivers/acpi/acpica/nsobject.c  |   7 +-
 drivers/acpi/acpica/nsxfname.c  |   8 +
 drivers/acpi/acpica/psargs.c    |   8 +-
 drivers/acpi/acpica/psloop.c    |   5 +-
 drivers/acpi/acpica/psobject.c  |   1 -
 drivers/acpi/acpica/psparse.c   |  16 +-
 drivers/acpi/acpica/tbdata.c    |  32 ++-
 drivers/acpi/acpica/tbfind.c    |  16 +-
 drivers/acpi/acpica/utcksum.c   |   3 +-
 drivers/acpi/acpica/utdebug.c   |   9 +-
 drivers/acpi/acpica/utdelete.c  |   5 +
 drivers/acpi/arm64/mpam.c       |   6 +-
 drivers/acpi/loongarch/iovt.c   |   6 +-
 include/acpi/acpixf.h           |   2 +-
 include/acpi/actbl1.h           |   6 +-
 include/acpi/actbl2.h           | 200 +++++++++++++++++-
 include/acpi/platform/aclinux.h |   1 +
 30 files changed, 811 insertions(+), 71 deletions(-)

-- 
2.56.0


