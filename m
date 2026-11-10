Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9AA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zn+txvRF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuePcgnq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4uDag57MGMHKoDnL2fBg4X/AmVbZNFgXOIQxpE7QZXU=; b=zn+txvRFzdrnKsL+ug+fgtAYWu
	BtiMmTfuyS1ZxZ1C5QjMIXpzUaC6F7Q87nsn+LsnuhORclRYLdtGX30ZMYEIhJ4KO7xTR73frz4xZ
	5Llx3SL0LOft4Ga9Ygc80NsLFJbd/SohfjvqLyW5RjhghZm3MOwiFVUxuxvf96yU7ScGasf9TLQys
	uTvzur2bmnpYGZTJa641cWkS8rWqk2F6cnPM3CW4mL2B2SIGQJwR9MlCloYW9HKlAQOSAzXyId0ZY
	a1w7rOZ7SPnFdZQcujGyCXyBQ0q3W+uJT1o3mPlsmiCp09TBu24OERJo2829kK6f4EMxxYChWhvcK
	2n8MbDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQewh-00000002abc-2yQS;
	Tue, 10 Nov 2026 06:03:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQewg-00000002abN-2q7D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B3C54066D;
	Tue, 10 Nov 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290582;
	b=VkOfEApsPgkSs/h68MlhU1wQ54tmRPHzEoAWFJcBYauK7DWob+5fd385Jn6EaGI9Nu+H
	 PpiXfBWOspFsqnBqnMurprrN07u6jNwnMH0Bbd6LqxyRAXQIAK7PZkHJ7RyZKFQ452pIa
	 6nd9t7O9Mt2vuw3hxAY7BLEcPfKDmzzB7vw8nvs3fyCL+qLme98eN/jsBg7FHT7rdFzTI
	 FLahTzQjY9vWDjHzUkRvCwYnl5NByErZuOo6tiPZeJUgvmVUUF4Ta2Ixiilvcjq46JbHV
	 R/j8XxmHKCQkz0xzUqW81Gzt+VrPPQYTPru++g76gVxjaUPZnG/LO5oTc7vtV6IkDdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290582;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4uDag57MGMHKoDnL2fBg4X/AmVbZNFgXOIQxpE7QZXU=;
	b=HMAfjdBtJsMKp5p6ueEP8rJArB+r8PsRzZTgFKWjPFJWYefzn+bmqbGfAfEM8vHB0Axn
	 H7HQWl/rpbICNBcx14EXcFEjr7NJplQxxVaKLzhNUDRK2exa6ldulhosb73E4SJAE/hem
	 ss0cZy85leuoptBzWOwTAoRqFMOzRDpwUVKy3l4dWHZRYkjJbeOjeGpaIxzr2yPrJenIx
	 Q9BS5CB9qOb/AVToBkw8IlwRBo2PY7pSx3jMHLdJ1ziEvUWpObbbexrKPMiduZDi1Ng2w
	 uFYX6a9FtS9YmTW+v8m7bU20EOKD7eAD9izHKXm98mG45+1JeXVX+KkPQmjS8X41tXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C3E81F0089F;
	Tue, 10 Nov 2026 06:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290581;
	bh=4uDag57MGMHKoDnL2fBg4X/AmVbZNFgXOIQxpE7QZXU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RuePcgnqyfte1XHsFrVtjrcwYEeEMlrvEc5kHWsePiYiugAi4LVUrxeO3OTnt78gD
	 lUNH10G/Ry6sIBtDsI19jyuodatX6x2tEv0eOxXvmlGhYxxQ0n4y3Xaiuwto05L3zQ
	 2+lwcr5kcJ5eh7UJUk8B16BqQvYnqknzZ1kBABGH1NCziF6MgwoAL39chsPjFRVaOY
	 G14AZJPYKmT0FaWn+2RuPYVi5uTReweH4enmmhJFsox8698BK+rUOSb7rga4uGnafR
	 3uI2GJAnagTWcuqp0+2tJ68zpnOYVT83HIw631MRfinQQX0e+dTuxUJskZh74zgByg
	 Yyi1Waj2/8V6Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8CC5D488AF;
	Tue, 10 Nov 2026 06:03:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz and S/PDIF
 clocks
Date: Tue, 10 Nov 2026 06:02:59 +0000
Message-Id: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBcwRQr6KrKDpumMOifNNgbFd
 7fbjt/h/zOYJBWDrsqQ5K2mj62ALhXwNGw3QQ3F4GrniajGyZNHXheU+8Boe9CIDRG3PsQxiIN
 S7kmifn7X/vq3vcZZ+PldwXGc14sRa3cAAAA=
X-Change-ID: 20261110-h616-clk-emac-spdif-411c96dfbde2
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290580; l=1811;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=IFyI7JJ8fJLP5Ef3+9F0FXrHqe21a7ZPZU1S9cQpPE0=;
 b=7owWMhF0E+ULMOrWbnsnk0mKjC9hdboYHaGDF3wJNwiCdTE7p9ICpEEDXmeEk4EgPmnUT4xre
 P2q6cD2d5QxDg5AHxmameUabWmzoFT/46s8Ummp7LZinICao/MP2pvL
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

Two small fixes for the H616 CCU, found while checking the clock tree of
an Orange Pi Zero2 against the H616 user manual.

Patch 1 models the EPHY 25 MHz clock as PLL_PERI0 / 24, as the manual
describes it. Only the parent and the reported rate change; the register
writes are the same.

Patch 2 lets the S/PDIF clock change the audio PLL rate, so the 44.1 kHz
and 48 kHz families both get the right module clock. It is the H616
counterpart of the H6 patch that was just applied [1].

Tested on an Orange Pi Zero2 (H616) with a 7.3 kernel carrying both
patches:
- clk_summary shows emac-25m at 25000000 with pll-periph0 (600 MHz) as
  its parent (200000000 below ahb3 before). The Zero2 uses an external
  RGMII PHY on EMAC0, so nothing on this board consumes the clock; only
  the clock tree was checked.
- With the S/PDIF output enabled, the spdif clock is 24576000 Hz under
  aplay at 48 kHz and 22579200 Hz at 44.1 kHz. I have no S/PDIF receiver,
  so the output itself was not checked on the wire.

These patches were developed with Claude (Anthropic) as a coding
assistant. It investigated the problem and wrote the code and the commit
messages; I reviewed them, and they were tested on an Orange Pi Zero2
(H616) as described above.

[1] https://lore.kernel.org/all/20261104185027.883011-1-jernej.skrabec@gmail.com/

---
Arun Iyengar (2):
      clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent and divider
      clk: sunxi-ng: h616: Let the S/PDIF clock set the audio PLL rate

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)
---
base-commit: 280af24c860569000b375edda6436ba8e3ee4b3a
change-id: 20261110-h616-clk-emac-spdif-411c96dfbde2

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



