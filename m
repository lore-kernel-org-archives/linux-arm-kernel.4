Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE054606A699
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sR3Gb+fd;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wBn2T8vC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GUOCNiu7cFer54u4izVvBECwy8EsL27hiy9L0uTDTa8=; b=sR3Gb+fdyMBEZ/
	Skk4fQRp0GMghNz7HEJrMt6sWurxSkTEctW/bAg9QflMB1nxNw8kdCB+OiM6FOxR5L1bev+gMtpzl
	x/6F91kZmM5JVJh6vXBbl4CNAnpg91+sChBo4lbZfauQ8nKJTLBsfObeepuRzJTgPoc6gE/+ySeqd
	UDPuGZnb4iSu787V9hlO+4ORBcci43qJo5Gwf58i5pIrv6iuOb+qPGowu7d3ytc/mu4Ktx7wdPfw6
	v9WSTfkCFRtBz0DnJGool1W6QR2H+rPHJF4u9M+QJ8nfMHPmWOMQ+RuxyNJkZcThiQ17PzhwY5T7l
	fkxZ3tYCmqW+OODiFM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF8H-0000000APrk-0iYB;
	Wed, 25 Nov 2026 15:42:05 +0000
Received: from out-151.mta0.migadu.com ([2001:41d0:1004:224b::97] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF7Y-0000000APGe-2bj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:41:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WX5/WDt3Ch560GkYrbupqthKzPK+92bD6UTcsA1auYw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621278; v=1; x=1796226078;
 b=wBn2T8vCn7idCne3+4wyIid6/RU+zbRpwGwDEy1df6X3t8KSyqU27AYgoQ+8+jWreSvevA9J
 thpHHoBIi78XLJ1EUh6e/q+GUPRhqfZf1KXY2v4CZZfnbUlwKwS0FYe7M9Ei6dmu9XvGMXGM1sa
 eIzD5XEfkyQcgB83osrjw7eQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 496adf252b9d071e;
	Wed, 25 Nov 2026 15:41:18 +0000
X-Mizu-Trace-ID: 496adf252b9d071e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/20] KVM: arm64: Advertise ECV, HAFT and ETS3 to protected VMs
Date: Wed, 25 Nov 2026 15:39:11 +0000
Message-ID: <20261125153911.106793-21-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074120_806853_33AF0738 
X-CRM114-Status: GOOD (  10.17  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Advertise FEAT_ECV, FEAT_HAFT and FEAT_ETS3 to protected VMs, with ECV
capped at IMP and HAFDBS at HAFT, since CNTPOFF and HDBSS only add EL2
and EL3 controls. ECV's self-synchronised counter views trap under the
same controls as CNTPCT_EL0 and CNTVCT_EL0, which kvm_handle_cntxct()
emulates.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 4b95128663aa8..770ba0bb0a400 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -172,16 +172,17 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr0[] = {
 	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN4, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN16, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN64, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, ECV, IMP),
 	FEAT_END
 };
 
 static const struct pvm_ftr_bits pvmid_aa64mmfr1[] = {
-	MAX_FEAT(ID_AA64MMFR1_EL1, HAFDBS, DBM),
+	MAX_FEAT(ID_AA64MMFR1_EL1, HAFDBS, HAFT),
 	MAX_FEAT_ENUM(ID_AA64MMFR1_EL1, VMIDBits, 16),
 	MAX_FEAT(ID_AA64MMFR1_EL1, HPDS, HPDS2),
 	MAX_FEAT(ID_AA64MMFR1_EL1, PAN, PAN3),
 	MAX_FEAT(ID_AA64MMFR1_EL1, SpecSEI, IMP),
-	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, ETS3),
 	MAX_FEAT(ID_AA64MMFR1_EL1, AFP, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, TIDCP1, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, CMOW, IMP),
-- 
2.47.3


