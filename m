Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F0960A2618
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bEZKvEOC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duAOvrgs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pp5MsRRltuiHJXQeY+Ua4pR86P0Yv7OH4I2Bnu8FfDM=; b=bEZKvEOC+TMfKK01X73CRqctrd
	KW0gwh3vs5iWY4BPB2DsTbyeYLkph3QCCdRq57jMizCozGCwBcAIt2eidSUHIv9UjptgBWB/hWiDE
	iK1rzGt6H8a08wDSGTt6tb9DpERc68WGcIM/mMsmD5TjkHhN1SgdqUMzZJ98Lfe6I0cbDCMzabDSf
	egnih3Y+SEupmkq1nN0VYhjbNuPisKCNbswmki5Z37FWqODEsv0241P2WogDC9xzABvgDIfeCDwFO
	7XHG6qZKeNpNNQB1o+7qnZXYmLASiOOlUsoT5MkExucgjiWBJ3BjGxpUVpGH8o9fEhQiy3mWo6Nud
	xG3JtnXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeyt-00000002bH3-2u3E;
	Tue, 10 Nov 2026 06:05:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeys-00000002bGd-3Hym
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:05:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 899F04496E;
	Tue, 10 Nov 2026 06:05:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290718;
	b=PDYS413xF1kCBf+dBRjvDJJyXZ2X83jGIGCcNpiJo8twsZV/ddbwTzRuD8/NkvzovKh9
	 OWsr99oIoS34cvMn3ZDbcEtF/OxIbyfJ4pzwGUvZp3simvN1wa0swk+EZptwpR7p+MRpl
	 pH9T/SyTnVFvjXnRKZ25Kvzs8fDURo/kkzGdxVaBHe8DcRN5w9Lgv6kIToYUupyVZIssn
	 OE2DUpZmjy4NPjGjdujvv4+LW7ZHZKYxAQTH05ATxeXCyeHgk7jHQ8MeoTTodQ9RZ/3Gy
	 ijftP4pKFUcWZc0D5ZiXI2ajoiNjg9z/bdkiaYubYr7KyjwDp0qEjJ5PBsFjqRYmbBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290718;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=pp5MsRRltuiHJXQeY+Ua4pR86P0Yv7OH4I2Bnu8FfDM=;
	b=FFhr2cqWqGI6moeweRigvS0YierLK1LEq60kDxmxgRVdu6rPYDtD8UTyoBuJhWbF57L0
	 Z7I44zf1DAfKUSZup7Rbcs1nUDgobZsXneJRYJfQKfI2wb6USeGsDpJ20x/DEmGe9Crtk
	 fo4qCQNMTktWLo1jSR5GTAH9KLYbL8dWtmGEiDxlSs8oanSJQLT/A7MqNF24a/0TUooKz
	 BLfEe+qz8CVRI4XO3KByJyPQ+IoLAhGordCthWpqmmPTqHn3g0CmSEK2SQLGX7OqnI8cS
	 vmx7YruIhszALq5ip+PVtQJkihRFDuDqS3pFKZqKCUHEpWHhrV7PBmfDMHOqPbI573A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E01DE1F0089F;
	Tue, 10 Nov 2026 06:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290718;
	bh=pp5MsRRltuiHJXQeY+Ua4pR86P0Yv7OH4I2Bnu8FfDM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=duAOvrgs0bjFuyz8vmehk3SuH+fOCbTDVNN8Tz67LSwbycY8TK0R51RzQk/pLhaFR
	 Dfldv/+KMXxBcOUtToS5Wbo1odPN5hI2vv68W71rPSS47q43BV3tX+LIj6yTlTA6ce
	 jwatAaGuduHd+muAT4Ba/V1cTveWe0tLSXy6aKYGOnGtRRGFP+R8PEbxz9GgIoavFC
	 E0VXEWGZzdPZuH7mpUldgpxWDSwaYmu8ve7PxWHx/UiN7VUXDObNMiYuj+eWQq2yDg
	 /gJlWOZNC3nUJX981zFWKvH80CsVUtPsQmcEk4mhUrmFkQ/A4rlagbBFWl3xxVinlM
	 XWFDH3wDnfj/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E50C488D7;
	Tue, 10 Nov 2026 06:05:17 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] iommu/sun50i: Don't report TLB prefetch walks as page
 faults
Date: Tue, 10 Nov 2026 06:05:16 +0000
Message-Id: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB1IhIj2KsWFTid1BKNkjAji3
 Rvt8uPx/hOUo7DCqzgh8i4qS8iwZQE09uHLKJ9sqExVW2sNagrOCMoyzwnXyJ43GrFxRC2T986
 1kL/3IMfTfXd/axompu2OwXX9AGmBtZx5AAAA
X-Change-ID: 20261110-sun50i-iommu-prefetch-85cc9ecff559
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290717; l=1731;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=1HWI9g6TGPVRDjXZAWrid5CsNT0iypzvfoEB9OnZ4/c=;
 b=Me2JoZVpnSuI1KduurX44yUYuz80n91+47NwqBz+j+T3bVEoG7PhKHnEjJfE8zjJcNgdtG7T2
 8Wl1d/2jJAJBB7ZByCyazwlMv3D1Qz9I5yxRgcMdAEAXNW5IDAMiBqp
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On an H616 with a display scanning out, the IOMMU reports page faults
with master -1 at the IOVA right after the end of the framebuffer: once
at the first fbcon frame, and then once per frame for a while after
each TLB flush, e.g. while a video decoder frees its buffers. They are
failed walks of the TLB prefetcher, which the hardware flags with bit 31
of the page table interrupt registers and no master bit. Patch 1 stops
reporting them. Patch 2 makes the remaining fault messages say which
walk failed and what the interrupt register held.

Tested on an Orange Pi Zero2 (H616) with HDMI forced on at 1024x768 and
three 4K H.264 decodes through cedrus, on 7.3 kernels with and without
the patches:
- without: 214 "Page fault ... (master -1, dir rd)" lines;
- with: none, no "Page fault" line at all, and no decode errors or
  timeouts.
Since the patched kernel prints every fault that is not a masterless
prefetch walk, this also shows that the hardware sets bit 31 for these
walks.

These patches were developed with Claude (Anthropic) as a coding
assistant. It investigated the problem and wrote the code and the commit
messages; I reviewed them, and they were tested on an Orange Pi Zero2
(H616) as described above.

---
Arun Iyengar (2):
      iommu/sun50i: Don't report TLB prefetches of unmapped pages as faults
      iommu/sun50i: Print the page table level and status of a fault

 drivers/iommu/sun50i-iommu.c | 50 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 11 deletions(-)
---
base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
change-id: 20261110-sun50i-iommu-prefetch-85cc9ecff559

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



