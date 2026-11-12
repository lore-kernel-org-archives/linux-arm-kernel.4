Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF87606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPFtDwBa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PXQi/ghY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=93RGI69NSf32DDKl2tRa+oQKvQ+ls7qrUjHeMl+sVOo=; b=QPFtDwBaqxFe0dJUWOq07RobaX
	/FAm2XJY0iIzoc8cgAUQ7Phjue3Fx0u5yoj8w1j3/PC/vrJ5tZ6ydgpx8BjyoSlEWNj32VAfa9Ak9
	8RYGqJEwU0yUB23DNymmDrp6C2FztGkn/RZ33YIDARNaFPESQ6xXiaIJu/hIhioxukO/eia+EnD7N
	Fgc1cll46CHc353era8Fz/sOLwICqOcbOZGV1Dp/nVep6lCNtX0X7eaQe8SijcwK2M13nZvjAsPjc
	pOcUdYB9QFYS4J07fS4C1X9pfA4eO4Jjkbz6HfYVwMxl0IJW33c2vgwZbE78A2wCI63FzQUUL1Oea
	xJAXhu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSlB-00000009dTT-3t6P;
	Thu, 12 Nov 2026 11:14:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSl9-00000009dTF-41yj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:14:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B6F46343C;
	Thu, 12 Nov 2026 11:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E73F1F00A06;
	Thu, 12 Nov 2026 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482066;
	bh=93RGI69NSf32DDKl2tRa+oQKvQ+ls7qrUjHeMl+sVOo=;
	h=From:Subject:Date:To:Cc;
	b=PXQi/ghYHsB42zvaMfIYelcUUkC6pDhmx+0pXUDcmByTsQj+5qlCiHMB1TqBZybkn
	 Lkfk25UHBU+Nt7YVaJtqltuzKyzzsYMbLe1MWg5pRHZg2APHzFScDqnfzLj6Z+8j50
	 ws6zDlDJb9CvIO8rPxr4njQccjKin4oS6RPgXd1CLWJJbwxaPIonS24g6edrLskxyo
	 OhuE7WVeUbVHjmmV+B2ZPo7LWXIHTbNE0SCgnr1k0nmCXHGHzxWsiJs7ax/divQ0QY
	 sIKI3y65lvKfot6qgJNlGc8IKPv2u+UWMZa9HBrNUO00FE0Lk+37Qbxn4Lhmirz486
	 /blr/WNBW5jwQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 0/3] ACPI: Arm FFH: Add support for OpRegion Offset 2
 (FF-A DIRECT_REQ2)
Date: Thu, 12 Nov 2026 11:14:05 +0000
Message-Id: <20261112-acpi_ffh_ffa-v2-0-575a9dbed22b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH+f9WoC/zWNwQ6CMBBEf4Xs2ZIuIFhP/ochpsBCVwklLRAN4
 d8tGA9zeMnMmxU8OSYP12gFRwt7tkOA5BRBbfTQkeAmMCQyyRFlJnQ98qNtTYgWmFVU5UiNkmc
 Ik9FRy+9Ddy9/7OfqSfW0O/aGYT9Z9zn+Ftx7f3WKRapkEaNSAS8ChZ8bojE2tu/17UVuoD62r
 oNy27Yvg6WsubkAAAA=
X-Change-ID: 20261104-acpi_ffh_ffa-14beb61ed905
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Jamie Nguyen <jamien@nvidia.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hanjun Guo <guohanjun@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dat Mach <dmach@nvidia.com>
X-Mailer: b4 0.16.0
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

Hi,

This patch series extends the existing Linux kernel ACPI Functional Fixed
Hardware (FFH) Operation Region support to accommodate FFH Operation Region
Offset 2, as introduced in the Arm Functional Fixed Hardware Specification
v1.3.

Background
----------

The Arm FFH Specification v1.3 adds support for FFH Operation Region Offset 2.
An OpRegion declared with an offset of 2 triggers an FFA_MSG_SEND_DIRECT_REQ2
call instead of using legacy SMC/HVC or standard DIRECT_REQ variants.
This mechanism allows the platform's ACPI firmware to interact directly
with secure partitions by evaluating a service UUID.

Implementation
--------------
- Upgrades the arm64 low-level FFH handler beyond generic SMCCC calls to
  natively support the FF-A protocol. It negotiates FF-A v1.2, identifies
  sender endpoints via FFA_ID_GET, translates ACPI ToUUID properties to
  register formats, handles interrupted/yielded calls via FFA_RUN, and
  returns standard FFH status codes to AML.
- Leverages register-based endpoint discovery (FFA_PARTITION_INFO_GET_REGS)
  to resolve unique receivers from service UUIDs. This approach completely
  avoids RX/TX memory buffer ownership complexities, keeping the low-level
  ACPI FFH subsystem cleanly decoupled from the main Arm FF-A transport
  driver.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Changes in v2:
- Share FF-A version negotiation between ACPI FF-A and FF-A driver. I am
  keeping it seperate intentionally as I haven't analysed how this would
  change and work with FF-A v1.3
- Adopted guard(mutex) framework from <linux/cleanup.h> to manage
  acpi_ffh_ffa_lock, ensuring automatic lock release, eliminating
  error-exit labels (goto out) and replacing goto jumps with direct
  return statements.
- Simplified state tracking by removing the redundant
  acpi_ffh_ffa_version_negotiated global tracking flag.
- Introduced acpi_ffh_ffa_partition_info_regs static boolean to
  track partition information register support.
- Fixed a raw pointer offset in acpi_ffh_ffa_direct_req2() by switching
  the memcpy destination from an address-of-member expression (&args.a4)
  to an explicit offsetof(struct arm_smccc_1_2_regs, a4) calculation.
- Link to v1: https://patch.msgid.link/20261103173907.1996118-1-sudeep.holla@kernel.org

---
Sudeep Holla (3):
      firmware: arm_ffa: Share FF-A register field definitions
      ACPI: FFH: Support FF-A direct request 2 calls
      firmware: arm_ffa: Share FF-A version negotiation

 drivers/acpi/arm64/ffh.c           | 218 +++++++++++++++++++++++++++++++++++++
 drivers/firmware/arm_ffa/Kconfig   |   5 +
 drivers/firmware/arm_ffa/Makefile  |   3 +-
 drivers/firmware/arm_ffa/driver.c  |  79 ++++++--------
 drivers/firmware/arm_ffa/version.c |  39 +++++++
 include/linux/arm_ffa.h            |  31 ++++++
 6 files changed, 329 insertions(+), 46 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261104-acpi_ffh_ffa-14beb61ed905


-- 
Regards,
Sudeep


