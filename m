Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED08606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NBqvKHB6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCW3kp4b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PAqADx6BCDJW/l9oyP65JCbSK+i8IXF6jV/NhPgDrvU=; b=NBqvKHB6aVbIJ0dGuxEiHFvP9w
	Z1J3kxVBOVmiiNGmwC/dKwI7ATbNJH4Tpm2HeUwHXx8OPmhKxG8XQVRSfcDiNghP1HBNTxlVQDKDg
	j4ybwskhBRJzOiJK+4V9vAPyWOubbdppgujH+xNvE123763C9DAsEU8g/hQa6ui6HYqx53jOLiVI4
	CxtejB7kJuccF0at8F5Y0IownFIlCYZtUZwI97TixE66gFm1jZU+tMPhiAVtFf058AHriju1/6hPk
	GMAu5EJgsLENXV+MPgprqSBrqqVs6Hpl+FtmFuKImemPQHRtONzIITkpgDgJBzwNW4cTnDshg4+om
	qwBFsBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnD-0000000Dnyb-0ZHh;
	Thu, 26 Nov 2026 15:53:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnB-0000000DnyR-3iPz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:53:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84D8441875;
	Thu, 26 Nov 2026 15:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04D01F000C4;
	Thu, 26 Nov 2026 15:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708429;
	bh=PAqADx6BCDJW/l9oyP65JCbSK+i8IXF6jV/NhPgDrvU=;
	h=From:To:Cc:Subject:Date;
	b=DCW3kp4bO4zkrtAStC232kE2c10swC9+NjsauNb1VICxzYnBnC6Js0Z7klYUz3qBs
	 xNb09tUvy+3jSA5vNRRsyZs6N405zHR4Zb8eBnYa1MPmXXiDOsWIScby8hIIbkNSOj
	 dPqo4IaDRiRWo+3dGuFQg/SMUlqX9udE+0JE3/uZTpy7EksLLYDexqgC1fbOGCRajV
	 v63CFcispC9ldwvdNol8EJ/5AT+RAJUrotsMS7d0pp3OVGGW/wvmK0dVeO1JUXbKwd
	 fviFjAB8o5HcmcZfBjavIBP3TkE8UlEjNjYW0RoSzHHKJSrdB8MjryAYKSkACAdo3Y
	 eNUvF7upBFtWA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	apais@microsoft.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	hargar@linux.microsoft.com,
	Joey Gouly <joey.gouly@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	Oliver Upton <oupton@kernel.org>,
	rlmenge@gmail.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <sven@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] st64bv0 support in iommu-sva
Date: Thu, 26 Nov 2026 16:53:36 +0100
Message-ID: <20261126155339.1349218-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

This is an updated set of patches to enable ls64_accdata with the
st64bv0 instruction in Linux.

I have included feeback from Siddharth and Sven here, in
particular:

 - fix SCTLR_USER_MASK and reset feature on fork/exec
 - add a testcase for the HWCAP
 - fix compilation with old assembler version
 - enable HCRX_EL2_EnAS0 when booting in EL2
 - restore ACCDATA_EL1 in cpu_resume
 - context-switch host ACCDATA when entering KVM guest

     Arnd

Arnd Bergmann (3):
  arm64: dynamically enable st64bv0 for SVA
  arm64: add HWCAP3_LS64_ACCDATA
  kselftest/arm64: Add HWCAP test for FEAT_LS64_ACCDATA

 Documentation/arch/arm64/elf_hwcaps.rst    |  7 +++
 arch/arm64/include/asm/cpufeature.h        |  6 +++
 arch/arm64/include/asm/el2_setup.h         |  3 ++
 arch/arm64/include/asm/exception.h         |  1 +
 arch/arm64/include/asm/mmu_context.h       | 17 +++++++
 arch/arm64/include/asm/processor.h         |  2 +-
 arch/arm64/include/uapi/asm/hwcap.h        |  1 +
 arch/arm64/kernel/cpufeature.c             |  1 +
 arch/arm64/kernel/cpuinfo.c                |  1 +
 arch/arm64/kernel/entry-common.c           | 11 ++++
 arch/arm64/kernel/process.c                | 25 +++++++++
 arch/arm64/kernel/suspend.c                | 17 +++++++
 arch/arm64/kernel/traps.c                  | 59 ++++++++++++++++++++++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  8 ++-
 arch/arm64/tools/sysreg                    |  5 ++
 tools/testing/selftests/arm64/abi/hwcap.c  | 50 ++++++++++++++++++
 16 files changed, 211 insertions(+), 3 deletions(-)

-- 
2.53.0
Cc: apais@microsoft.com
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>
Cc: hargar@linux.microsoft.com
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Navneet Singh <navneetsingh@microsoft.com>
Cc: Oliver Upton <oupton@kernel.org>
Cc: rlmenge@gmail.com
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Sven Schnelle <sven@linux.ibm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: Zenghui Yu <yuzenghui@huawei.com>
Cc: Zhou Wang <wangzhou1@hisilicon.com>
Cc: kvmarm@lists.linux.dev
Cc: kvm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org


