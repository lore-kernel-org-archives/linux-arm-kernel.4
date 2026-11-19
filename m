Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971E60A262B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gB3FEOtM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AvPv5gbz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=H4yit5SDhOFjRfJFYgJaFUlDDWjSPvM5/XqvlQS4pFA=; b=gB3FEOtMDLrZYfJFJY+3RUTSGf
	FtlqHJoMcME8dIwh54QNiipwXuLY9MMxgRTyECPP/AgQ54gVbkVW0x2R/mHPEb5DA1JBPBD+ti51K
	SFfiiaSY5CC6EVhnKXNqzNV4snZ+9gPpXvX7IfViu9lqLI2kV5N2wNM+oxkkVxg7GiMTZ6XKXRWNb
	tiOICLz9YtTzv92rbRJp26H2sAiTpmEol4ybTFtZ7zGlk8G9wGddqqvzY40HrU3WS0MEXdG8hZumQ
	MLXN1X1OTiSGzzkYoMe5Unmjqw8MORi+VLKMo3qdXEJlYZlpfsKmo6KU/qyrILLj/NFPNzA7gEm8a
	JzLYjYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Bn-0000000CUTF-1Upw;
	Thu, 19 Nov 2026 15:36:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Bj-0000000CUQ3-0XOL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:36:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F5D01575;
	Thu, 19 Nov 2026 07:36:32 -0800 (PST)
Received: from e142430.arm.com (e142430.arm.com [10.33.10.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2594E3F882;
	Thu, 19 Nov 2026 07:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102595; bh=F/IW7r05sEPQU7RmKMophY+HTf4SbgNHPg1LXJ+0/7s=;
	h=From:Subject:Date:To:Cc:From;
	b=AvPv5gbzj+pDeoOd2ToVmOfNzetkdOnqKDeIvzzbJSjqfvJawl8Dx7dXaOjNNm80U
	 gGYWYr/ixLyk8l6+AI6HXgPWdB4uPfhX2PSPT27QXE66hTOaLjPxcRVq9uqzQHuXhl
	 /T+RfZqr6whanh7HSkRCi/2iE6bSoRRDpzZiB6DA=
From: Ahmed Azeem <ahmed.azeem@arm.com>
Subject: [PATCH RFC 0/4] firmware: arm: Add Platform Fault Detection
 Interface support
Date: Thu, 19 Nov 2026 15:36:02 +0000
Message-Id: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIX/2oC/x2NQQ6CQAwAv0J6tgmLQMSrCQ/wajyUpbg9LGxaN
 EbC3109zhxmNjBWYYNzsYHyS0yWOYM7FOADzQ9GGTNDVVatc67DdUniDSlE+nDp8JlsVaaIaRo
 FdfLYHGt/arp6rNoWcicpT/L+P25w7S9wz3IgYxyUZh9++Ui2ssK+fwEWYBH9kQAAAA==
To: linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Divin Raj <divin.raj@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
 Ahmed Azeem <ahmed.azeem@arm.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073639_322503_A7357CD7 
X-CRM114-Status: GOOD (  19.46  )
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

Hi all,

This series proposes an arm64 driver for the Arm Platform Fault
Detection
Interface (PFDI), providing a common Linux interface for privileged
userspace to discover and invoke firmware diagnostics.

We are posting this series as an RFC to seek community feedback on both
the proposed Linux interface and the underlying firmware specification
before the specification is finalized. This series and its validation
use
the PFDI 1.0 ALP0 specification [1]. The current public revision is PFDI
1.0 BET0 [2]. Feedback on the software integration will help identify
any
changes needed to align an upstream implementation with the evolving
specification.

PFDI defines firmware calls for discovering a PE's test engine and test
parts, executing online tests, retrieving out-of-reset test results,
checking
firmware integrity, and injecting responses to validate error handling
[1].
Trusted Firmware-A documents an implementation of these services [3].

A practical use case is a safety-critical or high-availability platform
that uses manufacturer-provided software tests in firmware to detect
faults at boot and during operation. These tests can complement hardware
error-detection mechanisms by targeting failure modes that those
mechanisms do not cover. Firmware performs the boot-time tests, Linux
software can retrieve their results and request online tests at
intervals
chosen by the platform's diagnostic application. The diagnostic coverage
depends on the tests implemented by the platform.

The Linux use case is a privileged diagnostic application that needs to
discover the tests available on a CPU, run a selected range, and
retrieve
the outcome, including a failing test identifier where firmware provides
one. A common driver and documented userspace ABI would allow that
application to use the same interface across platforms implementing
PFDI,
while keeping the test implementation in platform firmware.

Kernel mediation is needed to issue the SMC calls and coordinate them
with
CPU placement and lifetime. PFDI operations are PE-local [1], so
executing
a request on the intended CPU is part of the interface's correctness.
The proposed driver uses a worker bound to each target CPU and exposes
/dev/cpu/<cpu>/pfdi. Requests and results are carried through typed
ioctls;
device nodes default to mode 0600, and each CPU device permits one open
owner at a time.

The driver leaves the choice of test ranges, execution frequency, and
response to a reported fault to userspace. It adds no periodic test loop
or automatic recovery policy. The intended upstream benefit is a shared
firmware access mechanism that platform diagnostic tools can build on,
without embedding their deployment-specific policy in the kernel.

The four patches provide:

1. A UAPI header, ioctl allocation, ABI documentation, and MAINTAINERS
   entry.
2. The firmware driver, per-CPU devices, and query operations.
3. Test execution, out-of-reset result retrieval, and error injection.
4. Worker serialization and CPU hotplug lifetime handling.

Error injection is included to exercise the software path that consumes
PFDI responses. The proposed ABI also returns the firmware's 64-bit
failing
test identifier for test execution and out-of-reset result queries.

Arm's public reference software documentation describes firmware, Linux
driver, and userspace components for a PFDI stack [4]. Its default
reference
test backend is a placeholder, so this provides integration context
rather
than evidence of hardware diagnostic coverage.

Validation of this revision:

Runtime validation was performed on Arm Zena CSS using its reference
PFDI
firmware and userspace stack, exercising service startup, per-core
diagnostic execution, out-of-reset result queries, CLI operations,
monitoring, and forced-error handling. As the default reference firmware
test backend is an integration placeholder rather than a production test
library, this validates the end-to-end userspace, Linux, SMC, and
firmware
paths rather than hardware diagnostic coverage.

I would appreciate feedback on the specification's suitability for Linux
integration, the proposed per-CPU ioctl ABI, the worker and hotplug
model,
and whether this belongs under drivers/firmware. In particular, is this
the right scope for a common PFDI interface, and should error injection
be exposed separately from normal diagnostic operations?

[1] Arm Platform Fault Detection Interface Specification, document
110468,
    version 1.0 ALP0:
    https://documentation-service.arm.com/static/68593b17961937560be90fbe

[2] Arm Platform Fault Detection Interface Specification, document
110468,
    version 1.0 BET0:
    https://support.arm.com/documentation/110468/1-0bet0/?lang=en

[3] Trusted Firmware-A PFDI implementation documentation:
    https://tf-a.docs.trustedfirmware.org/en/latest/components/pfdi.html

[4] Arm Zena CSS PFDI design documentation:
    https://arm-zena-css.docs.arm.com/en/latest/design/platform_fault_detection_interface.html

To: linux-arm-kernel@lists.infradead.org
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-api@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Divin Raj <divin.raj@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>

Signed-off-by: Ahmed Azeem <ahmed.azeem@arm.com>
---
Divin Raj (4):
      uapi: firmware: arm: Add PFDI userspace ABI
      firmware: arm: Add PFDI misc driver skeleton
      firmware: arm: Add PFDI run, result, and error injection support
      firmware: arm: Harden PFDI worker and hotplug handling

 Documentation/ABI/testing/dev-cpu-pfdi             | 103 +++
 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 MAINTAINERS                                        |   8 +
 drivers/firmware/Kconfig                           |  14 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/arm_pfdi.c                        | 948 +++++++++++++++++++++
 include/uapi/linux/pfdi.h                          |  89 ++
 7 files changed, 1164 insertions(+)
---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261119-topics-ahmaze01-upstream-pfdi-rfc-534c8594d266

Best regards,
-- 
Ahmed Azeem <ahmed.azeem@arm.com>


