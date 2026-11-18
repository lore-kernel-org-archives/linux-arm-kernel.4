Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T37zE5Gc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MRrRVgeN;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uRUCCjhw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=koCdIud5bvpKPiL3HIQENure4nj+SWr6XN5dow1D4zc=; b=T37zE5GcyLEDH2
	850uUUBK3Vsm/cl8fYzd66NOBZnv3YER/HuT6Gee3U05nwcgaJjh7TrZpMCJOwjTyvDYI5N9+YiTo
	uec9z4Gr2TMpz3id1oPb4syOyVwU1lRsM2XGLYC5toZEPEuXTejk8aAN1+Fwva2IMY0HX/tagzGi6
	T6fMAgvtdYVSJlbm+clcyNPPJLAml3mcvs2qw2YYbrmqQx29cHCu2ZUuqauweuJP+njHcaRfwE/jV
	+wVDqUWkREZzTUhcpo1EQSyy22reFnkgtUf8PXKz0CaCoZz11XZWEpZJJplmbxbAXbNB8Z9kIiYbq
	HVKkjJYnfWJLMYxq85Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRe-00000009EXs-0eSt;
	Wed, 18 Nov 2026 15:19:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRW-00000009EQU-3x6U
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 15:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=koCdIud5bvpKPiL3HIQENure4nj+SWr6XN5dow1D4zc=; b=MRrRVgeNStpz/5U/I8J+ps2aeQ
	j2iCq9gSjgEvtgyQvpPrwB3mTpPQNe8C8UWDbOOQPj7s1PRxl3kJGd85v4UNwK0sV5HaUMRfok03e
	6Vq60LuTqqdxIq6wYEd0uowHzKEueD7VDiULSaSl3O982NvilbqHEp1UcFd6kR5eVC66E3+TSO4OO
	V33gF1946n1Nnoz91ad1vuwAu9y2c+vBzay4326vqHzQ3BEFXttdarynatcnsKD07z2AgmTs8Fxen
	ELKsnil7BJ6DlI66hDl2V4JsQELP+RL2hl08pDdNnnjRfLchZyhpXDMB6/046dZcmjpDouA2QlZYb
	uEUWdRyQ==;
Received: from out-209.mta1.migadu.com ([95.215.58.209] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRT-0000000GC4A-3SLR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:19:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Bb7O1wsvqN0w+zVyjmLfDDD+fQI7fDHwilt03qAD9W4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015160; v=1; x=1795619960;
 b=uRUCCjhwGpctUfiXbk62GkkckYA5hgq6TPTHmQXtQes/s/ys0Vcxe3zPbj820cOC7dySK1WO
 ZJypSIFBLRZLOO1Rbx0UMSGVECEzanCIf/GLYZPcUuVU8qVeyI9r/wPNqknioxB24odHvYSA/HJ
 yQZwqlD5XfLVWeAJkRKkzs00=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9ade009b9b921e73;
	Wed, 18 Nov 2026 15:19:20 +0000
X-Mizu-Trace-ID: 9ade009b9b921e73
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/13] irqchip/gic-v3-its: Page-align ITT allocations in pKVM
Date: Wed, 18 Nov 2026 15:18:55 +0000
Message-ID: <20261118151904.4099560-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118151904.4099560-1-fuad.tabba@linux.dev>
References: <20261118151904.4099560-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_151923_765535_17523FDD 
X-CRM114-Status: GOOD (  11.89  )
X-Spam-Score: -0.9 (/)
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

From: Bartłomiej Grzesik <bgrzesik@google.com>

In a subsequent patch the host donates the pages of each device's ITT
to the hypervisor. A page the hypervisor already owns can't be donated
again, so the MAPD of a device whose ITT shares a page with another
device's would be rejected.

Round each ITT up to whole pages in protected mode. This costs up to a
page per MSI device, where several 256-byte ITTs would have shared one.
That's tens of pages on a phone and thousands on a server with thousands
of VFs.

Signed-off-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f9373..bbfea565149bb 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3493,6 +3493,9 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	nr_ites = max(2, nvecs);
 	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz = max(sz, ITS_ITT_ALIGN);
+	/* The hypervisor takes whole pages for each ITT. */
+	if (gic_is_protected_kvm())
+		sz = PAGE_ALIGN(sz);
 
 	itt = itt_alloc_pool(its->numa_node, sz);
 
-- 
2.47.3


