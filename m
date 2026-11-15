Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD61606A8BD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aY4fpdrY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSqoY6Qo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=; b=aY4fpdrYNnskF0JPNmMP2V8nBD
	KaqgLfRuDyfLZuuKj9KChASeEQiVu+NLFE7qaDxKzRpiBSsN2o5KiXjp2+I21XZ0iAOz9HIJK2bhc
	LioS7t8gRITxK4TDB40/+cgCyBQ5AsXDhiKckvaLOa0uMc00/fwIIzJpP2ppPFinCEAl2fqbLzHsW
	wwIySDHAfHjkKuQryxrA3KxAre+1hOsTveZXk64Au+bfx4LU9uT3jTaGoVLcyJNiI18RevkjuJldM
	lauPUxu5UYDB3gIsaOcfa486///Dps3+D89Bfu6drF9g23phW8dnumeQIh6uY8B0Sr/UBb4yg1v7q
	/ULZ4ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbt-0000000HJyd-3o57;
	Sun, 15 Nov 2026 09:33:17 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbp-0000000HJxb-2gRm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:15 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6df7f544919so2084435eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735192; x=1795339992; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
        b=kSqoY6Qo32X1NA13903TDfQuGlPZQpThOIReSUVvTnfR2qCW3A9QOAiMhx2mUtCIRh
         Mv7UAcVtUgsm8DWE7z1VLvKtx8fBjjQJmM+6y1ig4TBVD7mHoOjZfHMjjZ7Pd2jo4IH7
         KJKv2z6PLBX3+G984VlE4Ux+M+uUnoRWxH4y78K1OFFZpba8J8jtSLfRaeZEL8vyFADU
         myrlSBY0WPPvWJdJWS24OhogYN0gvZQrmNDFTOucGsaxVSVkSYHdBEEIZkYF+t9P1Tcy
         rN4O1VzPFFW6zGTLQ3IM/Ka3WCClv4XAbMdv0BKkzULMybmIqVlAQ/XEflYMGC5ny22R
         CBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735192; x=1795339992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5e7EmmrAmNsJKP6AOjhCJAku3QB+VBI4feI+to/QFAw=;
        b=HF3Qq/nFIGuBXkNz1htlLHCmBjE9I7MhVrzTExgRD9kvgswfCnb5yNf1J/E+fd0Rsu
         FFKJmdO74yruX0y9H5dE1vPP4uO9hlhWIX75NZVL/1avzX0ZBNU6vZXwYgJ64r+D0MTz
         Snki4aYFnElpk+1lN195cNVz1OW+WnAIBrbJRjIk5Cm3EGGzwUi5cuflDd228my9ayIh
         anJO24uCXQFQPBm0CmbwSz3V2Xm1b984uSBWUvou3A4tWlZC596rVyPG6yvmuikKeGEf
         q+WOs8tF+E6z9d/s5kEMQZ7aHarKe/LABwdCeWOBvbNStXCXYHes9kctm97ESbFXtHbX
         T4BA==
X-Forwarded-Encrypted: i=1; AL+hErHzqpwIaDX2sBDTcxgNmjjmkorp41xdILCIvEgVVIK/UwhSmoe2jWcw+VWDZrK7eBqpi2L6b+ryMc1EcNjutZD/@lists.infradead.org
X-Gm-Message-State: APuU4Z95utXrHVDJQf4+wOuBwaQIUh61GA/xD4NIQxXL8gWpLFJEB96I
	Gy+PfqsMKHMxCbGUQF8yCdKMGlPtqU7LooPMmL7nrkeJeqrFbSR0QSxH
X-Gm-Gg: AYBFou2GTeejZPAMD/7dKjWfqPL6b99YibYkts9cb82uNUEnqFAqKuDJo4kJKDvJAP6
	mxRY/27DFpPX7gO8I3F4I5cVIfotZfx8VMzjivyKb5irMKcqzpw1UhTPH4VR4eiM07jQXgOnPpC
	/LRQosJ2qgDYVTcciuzpwe/ySrMjOZBdV0LUJyrYY7lVTTnM0eCKLvAybB3iFCa7XtcZc9MgXR1
	eqeYEfUX5wfVrH1ZeNoHK4DUnF3m1OGaQM4Mo7vzz2qQKyRbnTV+OZGUSXDjiD7+27yJuGzuZLU
	icKQGIyz4I0WiZufOeklILdmO5t/c0sCzgTWieWjM0W3asBsoCPUT1Gnlzrz2NtGwciyrOtr3QP
	CjZFL3BgI8zj8FnP43huqLqDSSBwbhajOZqHevmlHSOzp9Lsi976/knibMguwXW3wq06gMhztAH
	PpTLF9gT+UF4l7hLvrSXn/nIPQsNjvf3rL0u4RKNAwXrd9D7UETDjz0e4gbOB+O/9pMqLNaMhJn
	qeV1yHE3drsZa2gw4IRxk8sgXXwejrlk1rsQjutg5H8hiNsY78nhFyyvUocDQPX+/NgF0z/R3Ce
	eJrgbJF8+2yfCFeLSVQDQkODKiMU/Z4SwfVbJHBIXBSbSz0By8Z2G45cS6fwr4pdE0m7tgbeRp4
	9evWwp88hYFU2ClvMYZb25WIBz2H251K6GavlSsN96R3mMWa5nO8I9z7Mn7ADdP9gKJijw9wBWr
	UJ4vMpmcZOPBge9I66lxZguAJ4U9iI/EmOAwzL46ndVbWzGszZ+Nk=
X-Received: by 2002:a05:6820:617:b0:71a:e82c:1eb8 with SMTP id 006d021491bc7-71ae82c267cmr724986eaf.7.1794735192405;
        Sun, 15 Nov 2026 01:33:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/9] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Sun, 15 Nov 2026 02:32:48 -0700
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQzW4cIQwA4FdZzblUBoyBPfU9qhwMmCxVZredm
 awSRfvudSY9dHtqJCRkyf788zatsgxZp+PhbVrkOtZxOWuAXw5TPfH5UcxoGk8OHFlwzqzPZR6
 bfmcaps1snkaXbcxizvKymas1wVdvQ+qY0E7q/Fykj5e9x/eHj1iRH1K3d/hPxiK/nrX59pE2F
 V7F1MusrY4HIpckNqxUXKip2dStxyCeHTRnk8vMEgV3ird60pmPh0Y+J8RIGJmhlQIQShBqynA
 mIXTSOdF9VadYbU8ttSxgsVYK0F33yiSdAz1UX2Is91XoI2AB9UqkmLlx6EAlh8wBLCCE6BEyT
 +/7n8a6XZbX/eRXu6/7ievqA6NmCp0S1ty/Pc48nr7qsXb96v4W/f+ITsWq68ZaEUtP/4r+06J
 XUbrlWqBIpDvxdrv9Bqn1lJV2AgAA
X-Change-ID: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_013314_515234_900361ED 
X-CRM114-Status: GOOD (  12.64  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Correct interrupt routing and serialize physical-channel ownership across
allocation, completion, pause and termination. Keep paused virtual channels
off the allocator, drain completion callbacks before releasing resources,
and associate cyclic state with the descriptor that owns it.

The first patch carries Hongling Zeng's physical-channel indexing fix [0],
adapted to the configurable interrupt-bank size introduced for A733. The
second handles partially populated banks, including H3's twelve channels.
The ownership work is split into lock ordering, physical-channel locking,
completed-descriptor retirement and interrupt cleanup. Pause bookkeeping,
callback synchronization and per-descriptor cyclic state follow separately.

Based on DMAengine next at 6628e7d4c6b, with the posted IRQ-safe locking
fix [1], channel pause-bit fix [2], and shared virt-dma synchronization
helper [3] applied first. The synchronization patch uses that helper for
the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Explain that reading the pause register flushes the MMIO request
  before returning to the client, following Frank's review.
- Collect Frank's Reviewed-by tags on the interrupt-bank, lock-ordering,
  ownership, completion, interrupt-retirement, synchronization and
  cyclic-mode patches.
- Rebase onto current DMAengine next, retaining the upstream residue
  snapshot and NULL-descriptor fixes.
- Use the standalone shared virt-dma helper from MediaTek synchronization
  v3 as a prerequisite.
- Link to v3: https://patch.msgid.link/20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com

Changes in v3:
- Split the ownership patch into four commits covering lock ordering,
  physical-channel locking, completed-descriptor retirement and interrupt
  cleanup, following Frank Li's review.
- Document why virt-dma still takes vc.lock independently of sdev->lock.
- Check pending interrupt status first in the per-bank loop condition.
- Link to v2: https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

Changes in v2:
- Clear the active descriptor pointer before handing finite completion to
  virt-dma, replacing the completed-descriptor pointer.
- Release completed physical channels while their virtual channels remain
  paused, and clear the hardware pause request before reassignment.
- Keep the ownership changes in patch 3 and the pause policy in patch 4.
- Link to v1: https://lore.kernel.org/r/20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Maxime Ripard <mripard@kernel.org>
To: Jens Kuske <jenskuske@gmail.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (8):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: take the device lock before the virtual channel lock
      dmaengine: sun6i: serialize physical channel ownership
      dmaengine: sun6i: detach completed descriptors before invoking callbacks
      dmaengine: sun6i: retire interrupt state before reusing physical channels
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 184 ++++++++++++++++++++++++++++--------------------
 1 file changed, 107 insertions(+), 77 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 43704b0efab7679ada5f06b959a501040573409a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


