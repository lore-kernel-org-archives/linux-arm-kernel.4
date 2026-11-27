Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652AE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4edbde2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CfaFiVl6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QPFLcK1okWZcWAtqynqBa6AobahzgjqK0qYjYPQd7Bo=; b=P4edbde2y+s/DdFZFTNyLX3ure
	ZGUGHW4rY4HR7e1gL3s8703z5FbmRUHC5Vri29K9G6PWCjKkIz8mHUxliRkxtL567xcjoYJQrz06N
	G5OlIW0U0CFHeeleFPx1Ac5GVfKtZZohL5GCoatWiTZOlNyKbkh/+L7ApKdEgnCLQkBo8l74MsZlb
	ifvEagk5nGAsZrEDxW7i3bUp40hmf1G6ImdPr87LytgZRI6LCTTLepuw9DO6/cbTmOyZV4e1zUMjH
	zRiznvUAbUbRhxIQo2wPHmhdFYlTZHFB19eS9XczfgXCVD2nWGpl69UHiB53K0IQvft5al1guOWLu
	+gkXR64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxtH-0000000GnGM-46u8;
	Fri, 27 Nov 2026 15:29:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsU-0000000Gme7-0eiR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:28:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC278169E;
	Fri, 27 Nov 2026 07:28:40 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C774F3F632;
	Fri, 27 Nov 2026 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793323; bh=6v3GtqRecOMTMqPoCxLqCvZs6XdvKssmwdo9XhTbtNM=;
	h=From:Subject:Date:To:Cc:From;
	b=CfaFiVl6BNmDIBddb7fIf3RRCJZcBtGeyn0WnsoWfT1lT8WwjTAbuLaJltM1v7aW+
	 J7LIpF9pZgeza5WhSKDv6LcbxsXepezefDdTdRYbyvGwALbsakLABDaqbm3l9P1rbZ
	 G17G6LcUer01KATB9dy3xyGqqro9JCqhQJJPGLNY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH RFC v2 0/6] firmware: arm_firme: introduce FIRME support
 for host attestation
Date: Fri, 27 Nov 2026 15:28:30 +0000
Message-Id: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ6hCWsC/3WNwQ6CMBBEf4X0bE27AqWeTEz8AK+GmLpuZQ+Aa
 QnREP7dwsGTHmcm780kIgWmKPbZJAKNHLnvUoBNJrBx3YMk31MWoKBUBqz0HFq6cjdQ8A5JmqL
 UJeaFA7UTiXoG8vxajRdxPh1FncqG49CH9/oy6nVahfaHcNRSSWsq8j4HRIKDC+0W+3axL5RW+
 g8FprIFWqSbc1+qnuf5A9kLHnXnAAAA
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4707; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=6v3GtqRecOMTMqPoCxLqCvZs6XdvKssmwdo9XhTbtNM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGmzieZrbSUtvu/UegSU99yz2mdZ42HNtMhU
 twrUs1y7O6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhpgAKCRBt1cPRWsUx
 MwfgDACTza1ZQ6Q7zFKi/uT8O84474FB1wGBciWbihq1azitfT+JsJroJ2DSX+mGfri4OCTIeY9
 z2g6CPegfv+AoGbXnnPR8SU6igeA16T1FmoiWm8DZ4j3J2+R2z6mpaycVj04YxdQimjpYzkPVoL
 rXYLJ4N81KV2UpkxO/4jr3Pbm89FkFJT1pVqn/vQ8pgGlUwvy+wQ/ZJyXBbZVQC6pqTN06wLmGx
 xM8gGfG2zD62KQ5YitfNrdS1pVEjeRePcWbpcZ/0+JIJ1POE44TE5Fsw5swArOWgIx8G+Y6JEAn
 nRGEGS6BCuQkyJYlvQDyYYy0xeFgfoDihH9dWkwNl+iet1ACCPAEyACmVKcjYse25OzAreR6kYx
 +rudfTOmEWM10/xIY/VoyupL4MEq5RKXU/dJom3C58D4Ruarx6E8vvrM8vMsPvy/OunShi44vEy
 R3RrVCv7V2YQGwhd9auwYM/gZbZnXJgegOLX5P3KeXEY1jTpXQh8bXaWjvHL1wscddNuo=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072846_290883_BD54AD42 
X-CRM114-Status: GOOD (  11.24  )
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

The Arm Confidential Compute Architecture (CCA) introduces the
Realm Management Extension (FEAT_RME), which enables the creation and
management of dynamically allocated, attestable trusted execution
environments known as Realms.

Realm management relies on EL3 firmware to provide services for Realm
construction, resource allocation and isolation, and attestation of
the initial Realm state.

The Firmware Interface for Realm Management Extensions (FIRME) [0]
specification defines standard interfaces through which EL3 firmware
provides these services. FIRME defines the following service groups:

  - Granule Protection Table (GPT) management
  - IDE key management for PCIe and CXL Root Ports
  - Memory Encryption Context management
  - Attestation Token management
  - Integrated Device management

FIRME also defines a Base service that provides common functionality,
including service discovery and feature discovery.

Although FIRME primarily supports Arm CCA, its interfaces can also be used
on systems without FEAT_RME to provide firmware-based attestation and
other security services.

This RFC patch series introduces the arm_firme, which provides
the common APIs used to firme service driver implementation.
each firme service driver would be implmented based on the smccc-bus
with common APIs and add firme attestation provider with smccc driver.

This patch based on arm64/for-next/smccc-bus and attestation branch [1-3].

To: linux-kernel@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mark Brown <broonie@kernel.org>

Link: [0] https://support.arm.com/documentation/den0149/latest
Link: [1] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_all_2
Link: [2] https://lore.kernel.org/all/20261113155515.2510194-1-jiri@resnulli.us/
Link: [3] https://lore.kernel.org/all/20261113160838.2512652-1-jiri@resnulli.us/
---
Changes in RFCv2:
- rebase on the attestation infrastructure.
- librarise arm_firme.c from firme driver.
- add firme attestation provider.
- Link to RFCv1: https://lore.kernel.org/r/20261019-firme_interface-v1-0-27895c9cebaa@arm.com

---
Yeoreum Yun (6):
      firmware: arm-smccc: introduce match function
      firmware: arm_firme: introduce arm_firme
      Documentation/ctlv: introduce ctlv-attestation-firme family
      ctlv: add auto-generated files for ctlv-attestation-firme
      attestation: providers: introduce FIRME attestation provider
      selftest: attestation: add firme_attestation_test selftest

 Documentation/ctlv/abi/ctlv-attestation-firme.yaml |   19 +
 Documentation/ctlv/abi/families.registry.yaml      |    1 +
 Documentation/ctlv/families.yaml                   |    1 +
 Documentation/ctlv/generated-files.yaml            |   11 +
 .../ctlv/specs/ctlv-attestation-firme.yaml         |   20 +
 drivers/attestation/Kconfig                        |    9 +
 drivers/attestation/Makefile                       |    5 +
 .../generated/ctlv_attestation_firme_gen.c         |   64 +
 .../generated/ctlv_attestation_firme_gen.h         |   40 +
 drivers/attestation/providers/firme.c              |  292 ++++
 drivers/firmware/Kconfig                           |   36 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/arm_firme.c                       |  275 ++++
 drivers/firmware/smccc/bus.c                       |   24 +-
 drivers/firmware/smccc/smccc.c                     |    3 +-
 include/linux/arm-smccc-bus.h                      |    5 +-
 include/linux/arm-smccc.h                          |    1 +
 include/linux/arm_firme.h                          |  261 ++++
 include/uapi/ctlv/ctlv_attestation_firme_gen.h     |   34 +
 include/uapi/ctlv/ctlv_families_gen.h              |    1 +
 tools/testing/selftests/attestation/.gitignore     |    1 +
 tools/testing/selftests/attestation/Makefile       |   10 +-
 .../attestation/ctlv_attestation_firme_user_gen.c  | 1547 ++++++++++++++++++++
 .../attestation/ctlv_attestation_firme_user_gen.h  |   47 +
 .../selftests/attestation/firme_attestation_test.c |  232 +++
 25 files changed, 2928 insertions(+), 12 deletions(-)
---
base-commit: 7ff5e548abbc2312431d4eea9ad283347963a6e2
change-id: 20260729-firme_interface-75616c45a203

Best regards,
-- 
Sincerely,
Yeoreum Yun


