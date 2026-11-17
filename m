Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC1606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wsvqhsTM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUZY2S06
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=P28P/LUBbQO6Sh4CV5K9g8WyTMgI8R9ZDNhFzP9+hV8=; b=wsvqhsTMW3krwwQNtQH2QXungA
	lUJ8BIm3y2TboWnAyDaw/8WMmuWMYpIuK86kS6r/89tRY78a1W0c+trgyFrHHm0mEU94Tt4N8p+Ok
	4DJ1tzHNEOwPZ8pnhmcCv11/xFjQsbxHCLsB9xngy2NHvuS2op7UhAhkcb5n0lbI+2Msvj9zeSixh
	MTR4MlNlVzzP+9L37gqkQBisi23PMI+JVA8fqxS1bsyZFBPjGbNckBiJo9WYEYCuPeCVC1ySxUStv
	1iEhimencFg7m8+ieRs6V62/WFapghzhy4hszWrjWDXJ5Ojt1FW/3tgc+rMK6LFeCbXTZBF9gzKf/
	4/Qgvd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRZa-00000007DRp-2KBK;
	Tue, 17 Nov 2026 22:22:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRZY-00000007DRN-0cnM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:22:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AB37421F2;
	Tue, 17 Nov 2026 22:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0371F000C9;
	Tue, 17 Nov 2026 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954159;
	bh=P28P/LUBbQO6Sh4CV5K9g8WyTMgI8R9ZDNhFzP9+hV8=;
	h=From:To:Cc:Subject:Date;
	b=aUZY2S06kYuf4atuTLbZAxbOxwlUE/nJdFcaEmhPaJfVz/IiLF/b0t6tvvUMlTpfU
	 C/hXiA1BPLa/KvzTdLtfje64PZBu0k3slf5MVEZUDKvh4kWkPf0ywcJt1CDSksrGR4
	 zjsGwjj3SGlM5z72YImxH1YHvz5ZZp488EOZvww9XF/t5UrhWsmCsmh0CYcXnkc/tH
	 u6N/SMsgu37a3ENBvjkcJQxKXLeVVFOIF4EscgBxDFvklEjhYjOxlRu4KO6It7yzWm
	 aJXg3D0jMzZAA6hF4fJ759ZzoQNDBkLhCwF+Mx16DHC/NIdaFMtMcs+gBHElzfNwcl
	 xDaYZX9Nu7BdA==
From: Arnd Bergmann <arnd@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] st64bv0 support in iommu-sva
Date: Tue, 17 Nov 2026 23:22:22 +0100
Message-ID: <20261117222224.1465328-1-arnd@kernel.org>
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

Hi Siddharth,

Here is a what I came up with for enabling ACCDATA in arm64 Linux,
similar to the earlier patch and rebased on current linux-next.

I hope this works for you, please let me know how it goes.

     Arnd

Arnd Bergmann (2):
  arm64: add HWCAP3_LS64_ACCDATA
  arm64: dynamically enable st64bv0 for SVA

 Documentation/arch/arm64/elf_hwcaps.rst |  7 ++++
 arch/arm64/include/asm/cpufeature.h     |  5 +++
 arch/arm64/include/asm/exception.h      |  1 +
 arch/arm64/include/asm/mmu_context.h    | 17 ++++++++
 arch/arm64/include/uapi/asm/hwcap.h     |  1 +
 arch/arm64/kernel/cpufeature.c          |  1 +
 arch/arm64/kernel/cpuinfo.c             |  1 +
 arch/arm64/kernel/entry-common.c        | 11 ++++++
 arch/arm64/kernel/traps.c               | 52 +++++++++++++++++++++++++
 arch/arm64/tools/sysreg                 |  5 +++
 10 files changed, 101 insertions(+)

-- 
2.53.0


Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
Cc: Catalin Marinas <catalin.marinas@arm.com>,
Cc: Will Deacon <will@kernel.org>,
Cc: Mark Rutland <mark.rutland@arm.com>,
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
Cc: Joey Gouly <joey.gouly@arm.com>,
Cc: Zenghui Yu <yuzenghui@huawei.com>,
Cc: Steffen Eiden <seiden@linux.ibm.com>,
Cc: Yicong Yang <yangyicong@hisilicon.com>,
Cc: Zhou Wang <wangzhou1@hisilicon.com>,
Cc: Navneet Singh <navneetsingh@microsoft.com>,
Cc: apais@microsoft.com, rlmenge@gmail.com,
Cc: hargar@linux.microsoft.com, kvmarm@lists.linux.dev,
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
Cc: linux-kernel@vger.kernel.org,

