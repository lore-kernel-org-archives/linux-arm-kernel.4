Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CF7606CA69
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=stNaawBU;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g49UnPYF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=coiu++CkI8S6volqEK7i4zet8hhL3SiCBfWVh0F3hvM=; b=stNaawBULrUxMnqrLi9NSBGMtb
	YWL9qtwIkfg39FUTGKhh7KQn9MqAjM7TZDW0WSJVB3nHTBuL/w+sDh4AgrcuSyDwuy9xO1kpJpxDx
	ke1CQoIbIjI6Ur2h+sn5HUx/tIZ/nS9js6WvdIJOBVWmKdLd4IvHnL4gmu5y+f6mODmVKgERVF4oO
	Y42CaapLry6EPBPVKR1eObsJoFphSR03uc5A64kmjMeQMlH/U7jdsdIZwxhw4w1dk0kfZOrRV805S
	DPIOpVD4f07juwFuwn7krC78bcNfW5M9SRlfMf+kpfaxyeyV+FOBtSNAOSECcJhApsvSPDPcEOsxT
	RWgbbHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZe-00000009mZu-1sgx;
	Wed, 18 Nov 2026 17:35:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZb-00000009mYd-3Srr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:35:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 716B61477;
	Wed, 18 Nov 2026 09:35:50 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1B23F632;
	Wed, 18 Nov 2026 09:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023353; bh=ECCDdR84SWTkFqge/zOyIB8SKY5/qRtWm4u3J4fBHAw=;
	h=From:Subject:Date:To:Cc:From;
	b=g49UnPYFsTZqbkJ+k9jgcD5W24EdR7GxlQiN932vbPl7pT96JdyI1ryBkIo0qfUYG
	 GQT10GJDQmS2DCJznEDcS9AecO4vocqB0ii0WmwoxRDRvBdGL0gdyRcfYREbIefIks
	 rt86ZW1jVNdpbsskIt2ZDFhnqhh3DQe2i40+eNsg=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v3 00/14] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
Date: Wed, 18 Nov 2026 17:35:29 +0000
Message-Id: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOHh/WoC/32NQQ6CMBBFr0K6tqYdSlFW3sMYUsoANYGaFhsN4
 e62uNCFcfky/71ZiEdn0JMqW4jDYLyxU4R8lxE9qKlHatrIBBhIzhnQwfq57o0ORd2ZB3rKEVH
 BsQVUgkTt5nA7ROt8ebO/N1fUc+qkxWD8bN1z+xl42v3JB04ZLUXeSC5Bdro4KTfutR1Jigf41
 sUPHaKOolQtMFS5Pnz0dV1fOEJtev8AAAA=
X-Change-ID: 20261102-host_gicv5_fixes-1eeea29d2ea4
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Sashiko AI <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_093555_962986_CAB567BD 
X-CRM114-Status: GOOD (  15.33  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes issues in the GICv5 host IRS and ITS drivers.

The ITS invalidation serialisation fix addresses Sashiko's report of a
race between event and device invalidation commands [1]. The other
patches fix IRS allocation and routing, IRS synchronisation, ITS table
selection and cache maintenance, ACPI coherency handling, and resource
cleanup.

Since v2, Fuad reported missing cache maintenance and L1 invalidation
when allocating an L2 device table, as well as unsafe table cleanup
after a hardware timeout [2]. This revision includes his L2
device-table cache-clean patch and adds fixes for L1 invalidation and
the host IRS and ITS timeout paths.

The IRS changes:
* Reject allocation of an SPI without a backing IRS and warn about
  broken firmware.
* Only program IRS_PE_CR0.DPS when 1-of-N routing is supported.
* Serialise synchronisation requests and their completion polls.
* Retain the L2 IST and its L1 entry if mapping times out, and prevent
  a later allocation from overwriting the pending mapping.

The ITS changes:
* Serialise event and device cache invalidations, which share the
  DIDR register.
* Select linear device and interrupt translation tables when one L2
  table covers the full ID space.
* Honour the ACPI noncoherent flag.
* Use firmware-node names in initialisation warnings.
* Invalidate the device cache before freeing an ITT.
* Correct cache-maintenance sizing after limiting the DeviceID width.
* Release the reserved MMIO region if DT-based ITS initialisation
  fails.
* Retain the ITT if device invalidation times out during registration
  or teardown.
* Clean a new L2 device table before publishing its valid L1 DTE.
* Invalidate the L1 DTE immediately after publishing the L2 device
  table, including when device registration subsequently fails.

The IRS/ITS locking fixes, ITS table-selection fix, ACPI coherency
fix, device-table cache-maintenance fixes and L1 DTE invalidation fix
carry Cc: stable trailers for backporting.

The series is based on v7.4-rc3. Thanks to Lorenzo for the review and
to Fuad for the additional reports and cache-clean patch.

Sascha

[1] https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11
[2] https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
Changes in v3:
- Rebased onto v7.4-rc3.
- Added Fuad's patch to clean an L2 device table before publishing it.
- Retain the L2 IST and its L1 entry on a mapping timeout, and reject
  subsequent allocation attempts that would overwrite a pending mapping.
- Retain ITTs when device invalidation times out during registration
  or teardown.
- Added L1 DTE invalidation immediately after publishing an L2 device
  table, keeping single-device invalidations for registration and teardown.
- Reworded the IRS synchronisation and ITS invalidation commit messages
  to describe the host issues without relying on future KVM support.
- Collected Acked-by tags and reordered commit trailers as requested.
- Link to v2: https://patch.msgid.link/20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com

Changes in v2:
- Explained why IRS synchronisation uses a raw spinlock in the KVM
  affinity path.
- Clarified the ITS invalidation race and described the KVM forwarding
  path.
- Reworked to calculate the device-table size after capping the
  DeviceID width.
- Reordered local declarations in the ITS probe function to be in
  reverse fir tree order.
- Added Acked-by tags.
- Link to v1: https://patch.msgid.link/20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Sascha Bischoff <sascha.bischoff@arm.com>
To: Timothy Hayes <timothy.hayes@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Jonathan Cameron <jic23@kernel.org>
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

---
Fuad Tabba (1):
      irqchip/gic-v5: Clean a level 2 device table before making it valid

Sascha Bischoff (13):
      irqchip/gic-v5: Reject SPIs not backed by an IRS
      irqchip/gic-v5: Only set IRS DPS when 1ofN routing is supported
      irqchip/gic-v5: Serialise IRS synchronisation requests
      irqchip/gic-v5: Retain the L2 IST when mapping times out
      irqchip/gic-v5: Serialise ITS invalidation commands
      irqchip/gic-v5: Use linear DT and ITT when L2 covers all IDs
      irqchip/gic-v5: Honour ACPI ITS noncoherent flag
      irqchip/gic-v5: Use firmware node name in ITS warning
      irqchip/gic-v5: Invalidate ITS device cache before freeing ITT
      irqchip/gic-v5: Clean the allocated linear device table size
      irqchip/gic-v5: Release ITS MMIO region on DT probe failure
      irqchip/gic-v5: Retain the ITT when device invalidation times out
      irqchip/gic-v5: Invalidate the L1 DTE when allocating an L2 device table

 drivers/irqchip/irq-gic-v5-irs.c   | 34 ++++++++++++-------
 drivers/irqchip/irq-gic-v5-its.c   | 68 +++++++++++++++++++++++++++++---------
 drivers/irqchip/irq-gic-v5.c       |  9 +++++
 include/linux/irqchip/arm-gic-v5.h |  1 +
 4 files changed, 84 insertions(+), 28 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261102-host_gicv5_fixes-1eeea29d2ea4

Best regards,
--  
Sascha Bischoff <sascha.bischoff@arm.com>


