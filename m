Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385B6606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wI/HArG8;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IHiomVSm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zfR7wZtV/GSiaDeDmBX0Viv+WnEUlG7jbqXkfvtxbEM=; b=wI/HArG8oFN+5TV/iCOmKWPu7j
	cHIFauPsAapIIfg+dPYGwQeJrYA6qM2LepfEkJn1sqN7+jomAI4ZH43SLzztu3Rkz6SKtSz07qC5Z
	dMfEUv+ueZClbwCqp1XrW68kWI8mjlfUliUAAXRTdI8+X30dEX09OMhcVVbaMMbdIF5RvNDwYjJZe
	adGsyU3kYSaLf2E3kLTEpgU4bJeH98x7Hbk2CWHwKJsJWB3225sQi0/pdhnT4jthlAdKHKdyqOPji
	S9DdGp6Bev4oRmdFLrp84aueqZbRrLD2/tBfRnVGCpS9dOa+mFQqe4E0wfAhSeXjRTP7Mg2vip+C1
	OKVbZQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuiv-0000000G0Dp-3VlO;
	Fri, 27 Nov 2026 12:06:41 +0000
Received: from out-34.mta0.migadu.com ([2001:41d0:1004:224b::22] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuii-0000000G083-3jMR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:06:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cRqx2qc2ejukY6HlgnbthsWDXqld+RKdOah8C+pO2OY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781185; v=1; x=1796385985;
 b=IHiomVSm2twDV00mTWtadX07LGB1+K2Vl7NQHZlRQxw6Sv+vTQMtiY6KY7nZhQ+xdqPt5Wdk
 JD3g1HsY1QLUaRMYElpG5btCxwG9DWA5sZbXYzL7gsv5trbkJ+DR6hduxdyRinbIOattKTI0Wi6
 w4bE64sd5i7k6nVPt2NFkqmg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 239e014d3af63bbf;
	Fri, 27 Nov 2026 12:06:24 +0000
X-Mizu-Trace-ID: 239e014d3af63bbf
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] irqchip/gic-v3-its: Fixes to table allocation and the ITT pool
Date: Fri, 27 Nov 2026 12:06:18 +0000
Message-ID: <20261127120623.891129-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040629_069533_E703EC18 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v2 [1]:
  - Dropped __GFP_ZERO from the pages added to the ITT pool. (Marc)
  - Added Cc: stable to patch 3. (Marc)
  - Changed patch 2's prefix to irqchip/gic-v4.1. (Zenghui)
  - Collected Reviewed-by from Zenghui. (thanks!)

Five fixes to how the ITS driver sets up the memory the GIC reads.

The first adds the barrier that was missing between zeroing a table
page and the write that makes the page visible to the GIC. The second
cleans the GICv4.1 vPE table to PoC, as the driver already does for the
pending table. Without the clean, only a redistributor that accesses
the table as non-shareable can read stale contents from it.

The other three fix the ITT pool. Its 1-byte granule keeps ITTs aligned
only while every ITT's size is a multiple of 256, which holds for
power-of-two ITE sizes but not for QEMU's 12-byte ones. The third gives
the pool a 256-byte granule. The fourth zeroes an ITT reused from the
pool, as MAPD requires. The fifth frees the page when gen_pool_add()
fails.

With patch 4, a pKVM guest shares each new pool page with the host
before anything zeroes it. The pkvm-guest patch [2] makes
pkvm_set_memory_decrypted() zero what it shares, which closes that.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261116192933.3266502-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/

Fuad Tabba (5):
  irqchip/gic-v3-its: Order table zeroing before the GIC can see it
  irqchip/gic-v4.1: Clean the vPE table to PoC
  irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
  irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
  irqchip/gic-v3-its: Free the page when gen_pool_add() fails

 drivers/irqchip/irq-gic-v3-its.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


