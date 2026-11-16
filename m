Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07768606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 19:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8QJvW3v;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JP0ZNSRo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yEoaC/Ng0V2goYlLZqCkotlSndxwpWoQ6P14GTUf1pI=; b=G8QJvW3vsFyc71kYYHVoG1Lo9J
	Y8zmd6U2KV02gQChSCd9dB1OgNbKWuFzSdhl6P/3HPFn/fW0PQVVyV4ybIC52CBCio74sw54dgsc6
	IFEkzc7XfNMY8+zRecwLu/7JV1PnMSXMG1wU8Qj7mcAsAu+c2Rwu+XpMzKZ7VNwCG/1nee1qbTb2C
	KdCXJuXD33/EwuyHefVGk5UmNnINBrAoKK2aIGiHMuM2CcF54jCS69guqqRsqWieGDh0DfIWRpYgC
	fhLHrwQzLgumpNIVoxk4gRVHRU0CIoGztrT0wM7tiDB2QXOcUpIYYqWlM0Hke5vR5AchDEy7If9iB
	emw+5YLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Oc-00000003kyh-3WpG;
	Mon, 16 Nov 2026 19:29:42 +0000
Received: from out-1.mta1.migadu.com ([95.215.58.1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2OY-00000003kwn-3kMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 19:29:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZesdBexgj2dtrVEUReJJ1M0k0i4FtmIJXWQsOeWtkmI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857375; v=1; x=1795462175;
 b=JP0ZNSRor3iBh+5fJ0JweER8NJdExIiIjYISdEPhNFuMmzpJIPLxWFs0v/f/Syl4kFFRZyYZ
 kytu2TltqMWiJ4xoL468V2MckcUoLSU28yG1WjEHfWQL450fhG8N0j8iCK0UomWTQZWr20grFtt
 gTHUy0Hie56odw32//Q5uh34=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 55524de43ae1481a;
	Mon, 16 Nov 2026 19:29:35 +0000
X-Mizu-Trace-ID: 55524de43ae1481a
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
Subject: [PATCH v2 0/5] irqchip/gic-v3-its: Fixes to table allocation and the ITT pool
Date: Mon, 16 Nov 2026 19:29:28 +0000
Message-ID: <20261116192933.3266502-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_112939_606259_3843ED14 
X-CRM114-Status: GOOD (  11.18  )
X-Spam-Score: -2.8 (--)
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

Changes since v1 [1] [2]:
  - Combined the ITT pool fixes [1] and the table zeroing fixes [2] into
    one series. (Marc)
  - Dropped "Zero ITS pages before sharing them with the host". A
    separate patch fixes it in pkvm_set_memory_decrypted() instead [3],
    for every caller. (Suzuki)
  - Order the zeroing with dsb(ishst), as its_flush_cmd() does, rather
    than dma_wmb().
  - Clean the vPE table to PoC unconditionally.
  - Point the vPE table patch's Fixes: at the commit that added the
    table.
  - Rebased on 7.4-rc3.
  - Collected Reviewed-by from Suzuki on patches 3-5. (thanks!)

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

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261106092625.3977163-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261106120221.347309-1-fuad.tabba@linux.dev/
[3] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/

Fuad Tabba (5):
  irqchip/gic-v3-its: Order table zeroing before the GIC can see it
  irqchip/gic-v3-its: Clean the GICv4.1 vPE table to PoC
  irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
  irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
  irqchip/gic-v3-its: Free the page when gen_pool_add() fails

 drivers/irqchip/irq-gic-v3-its.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


