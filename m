Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E696606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AA5Ny7pb;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bNYggG6W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0E5oFbfWv4al6ZhXYQB+Fc2jmPL18RQBBfOHqivCMnU=; b=AA5Ny7pbnZUr/zPAYZOcg8LdJp
	gOBP5PMqGPocK1o/F0QFw1FynB+fCA9ZRWmN3yFh0tKC+cYzlv9fto2Yiri7t/UunXv9Eiowz4a2G
	t3zd1hoFrq2quhLWczOp8U3CsyH34qxJF3PScluNmCGGPFDNfn0TVGLQ5w1zaMXmV1CsUHWNgVIm1
	+8CRAvPcoOvEzYGtGNdTPfoCvp7esA5KHjo5UHKzx+QGNVR0m8u5uBr4bBL4vaJKe048iWalgKd6Q
	b2lJckdv92u68Mkqttww+KwbNWIvT1fXXvxdUHPLuGUZabJbiGMkSs5lcyD/m1TIG4wfzlmRCA1gg
	55zFKt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxW-0000000Gq4n-3Dpd;
	Fri, 27 Nov 2026 15:33:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxwp-0000000GppJ-1cb8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:33:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9F16169E;
	Fri, 27 Nov 2026 07:33:11 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 422B03F632;
	Fri, 27 Nov 2026 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793594; bh=CREZT/iY5Maoixa1IibuDtoXUQI0xrQeRjPWVOFSKwA=;
	h=From:Subject:Date:To:Cc:From;
	b=bNYggG6W7pYvzbEvPWfcDMwAR0kUCLZHnsj/qbFyAnIGNAE1k/FTdOUVO+MbIjUiL
	 Bt1iz4axqpaEidiwhz0tkxHw5/CCUg00sNrmBm+0qsIqKgqBJYBWbhCTjyGgHbe/HS
	 FPT3VzxkYqeqpvRJs428DDnng4TvXLls3+uYj/yE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH RFC v3 0/8] attestation: provider: add CCA Realm Guest
 provider
Date: Fri, 27 Nov 2026 15:32:55 +0000
Message-Id: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKiiCWsC/22NywrCMBREf6XctZHkKrZxJQh+gFspJY9bm0UaS
 SQoJf9uyNrlzGHObJAoOkpw7jaIlF1yYa3hsOvALGp9EnO2ZkCOJy5RMhX9ZIyafGRKyKNGkmh
 ED3XwijS7T5M94H67wljLxaV3iN92kLGhf66MjDNh5aC1EkM/20uFexM8jKWUH8uK1lOnAAAA
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
 Pawel Chmielewski <pawel.chmielewski@intel.com>, 
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Gavin Shan <gshan@redhat.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4966; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=CREZT/iY5Maoixa1IibuDtoXUQI0xrQeRjPWVOFSKwA=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaKyr1sL7I3GjufUXjAqUdNumg4Eu4t6MmqHp
 tAOy6CS0BiJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmisgAKCRBt1cPRWsUx
 M/DnDACUjQ9s+JwuutCXoESK7Y3sUXsaRo4m18QvFHFWdANC8ghLblUcU2RbSsyopDlIC4GHgS6
 3o8yvxhAQUlaN9p4PY1Tf1JdklJSW7hGM89MCOFo9sfffrbHdjc/cHxEv9+I+qqVJ7mUBeLkMkQ
 6TiH5pDeXFZDFg14WE5H2C3XlQJmzwdD8HA3GA1MYq7NY4OmYSD1xmdZU1k1bc8VNOL9dGidfsB
 xQMXxlY1YIG4lxIVNL+tbU7ZBR+66zsMB1+bkuZ74j/+H4aWIxFbail6XTCD6yBdpQeleTUymbS
 JR5D090Qdxj8biSqS9Tx/OgdaFrsgFLzf7FxCAeggOK9kDfUCF3r3YoCMwrlBplw/aX/GBpXWM6
 sSZ7Z6nhzocO8wMYU9rSt0Aqz90ARhYLbgQCkkkQ33Zx7I9PQcO8UR1PtHmJScFk0SWSlWhgngX
 9kkMuWVDVyFPjKIqlwpGRVcZYHoLv7JaJpjGHSUrmGgG+Q04OeBWS5PjrzsKLRrSLbTZ8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073315_536922_00684F9E 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for Arm Confidential Compute Architecture (CCA)
measurement registers in the Linux kernel, enabling guest Realms to
access, extend, and expose measurement values for attestation and runtime
integrity tracking.

The Realm Management Monitor (RMM) defines a set of measurement registers
consisting of a Realm Initial Measurement (RIM) and a number of Realm
Extensible Measurements (REMs). This series introduces the necessary
infrastructure to interact with these registers via the RSI interface
and exposes them to userspace through CTLV attestation subsystem.

Also, this seires includes the CCA attesation token generation interface
and CCEL event-log exposure through CTLV attestation subsystem.

At a high level, the series includes:
 - Helper interfaces for reading and extending measurement
   registers via RSI
 - Definitions for Realm hash algorithms as defined by the
   RMM specification
 - Support CCEL table in arm64
 - Integration with attestation subsystem by introducing CCA Realm Guest
   provider

After applying this series, measurement registers and relative interface
will be exposed ctlv interfaces.

This patch based on arm64/for-next/smccc-bus, attestation branch[0-2] and
firme patch-series [3].

To: linux-arm-kernel@lists.infradead.org
To: linux-kernel@vger.kernel.org
To: linux-security-module@vger.kernel.org
To: linux-doc@vger.kernel.org
To: linux-kselftest@vger.kernel.org
To: linux-acpi@vger.kernel.org
To: acpica-devel@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Suzuki Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: thuth@redhat.com
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Pawel Chmielewski <pawel.chmielewski@intel.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Len Brown <lenb@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>

Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_all_2
Link: [1] https://lore.kernel.org/all/20261113155515.2510194-1-jiri@resnulli.us/
Link: [2] https://lore.kernel.org/all/20261113160838.2512652-1-jiri@resnulli.us/
Link: [3] https://lore.kernel.org/all/20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com/
---
Changes in v3:
- rebase to attestation subsystem.
- Link to v2: https://lore.kernel.org/r/20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com

Changes in v2:
- rebase to arm64 tree's for-next/smccc-bus
- Link to v1: https://lore.kernel.org/all/20260413084957.327661-1-sami.mujawar@arm.com/

---
Sami Mujawar (2):
      arm64: rsi: Add helpers for Arm CCA measurement register operations
      arm64: rsi: Add realm hash algorithm defines

Suzuki K Poulose (1):
      arm64: acpi: Enable ACPI CCEL support

Yeoreum Yun (5):
      acpi: add CCtype value macros for CCEL table
      Documentation/ctlv: introduce ctlv-attestation-cca-guest family
      ctlv: add auto-generated files for ctlv-attestation-cca-guest
      attestation: providers: introduce CCA Guest attestation provider
      selftest: attestation: add cca_guest_attestation_test selftest

 .../ctlv/abi/ctlv-attestation-cca-guest.yaml       |   19 +
 Documentation/ctlv/abi/families.registry.yaml      |    1 +
 Documentation/ctlv/families.yaml                   |    1 +
 Documentation/ctlv/generated-files.yaml            |   11 +
 .../ctlv/specs/ctlv-attestation-cca-guest.yaml     |   20 +
 arch/arm64/kernel/acpi.c                           |   11 +
 drivers/attestation/Kconfig                        |   10 +
 drivers/attestation/Makefile                       |    5 +
 .../generated/ctlv_attestation_cca_guest_gen.c     |   64 +
 .../generated/ctlv_attestation_cca_guest_gen.h     |   40 +
 drivers/attestation/providers/cca_guest.c          |  582 ++++++++
 include/acpi/actbl2.h                              |    7 +
 include/linux/arm-rsi-cmds.h                       |  118 +-
 include/linux/arm-smccc-rsi.h                      |    8 +
 include/uapi/ctlv/ctlv_attestation_cca_guest_gen.h |   34 +
 include/uapi/ctlv/ctlv_families_gen.h              |    1 +
 tools/testing/selftests/attestation/.gitignore     |    1 +
 tools/testing/selftests/attestation/Makefile       |    9 +-
 .../attestation/cca_guest_attestation_test.c       |  517 +++++++
 .../ctlv_attestation_cca_guest_user_gen.c          | 1547 ++++++++++++++++++++
 .../ctlv_attestation_cca_guest_user_gen.h          |   49 +
 21 files changed, 3051 insertions(+), 4 deletions(-)
---
base-commit: 55e9f5a2188b97fd2e3ef949b0e52910aa77d940
change-id: 20260929-arm_cca_mr-a194b2e92c17

Best regards,
-- 
Sincerely,
Yeoreum Yun


