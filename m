Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D87F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 04:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Wdds0EW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oozVrttH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TgVNlb9qjM6ZO+q5UoCrsvegC7I7n+tFz3ZHn9Xe214=; b=0Wdds0EWLc/z5lmtNeSQlAsDj1
	1z8ucQbWPYvj+peGMdLfjB1cfPjmixK9nsnlPmIO93qPrtpC2HwNY8z/XUAO23yV1e7fkNFd6LmJy
	eisfVLfiLeOkIsEWL0Q/TQjK2qQPDCJcTZCyxZ0PTsXA2bFsdGG90+F/nsHU980WmVnPhFQbqSPs1
	ARLnQRPbri4ENv0rdYcaCUWjRtHHMuzCZGF5rftRR4c/waqelvNANHJAWI1cVZZ4vySuzp1ttqpw7
	da3lixtMXWwB+DtWcVIfouCrXPk4sLfFL4DXZMZ5paRjRtp3fYltdQDCSln92/CyoR8zhibT5CBuA
	EV8+00gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMRi-00000008gkM-3hlJ;
	Thu, 12 Nov 2026 04:29:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMRh-00000008gkC-2E2q;
	Thu, 12 Nov 2026 04:29:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 023C0432D0;
	Thu, 12 Nov 2026 04:29:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794457796;
	b=T/JbhDJwZ7TL2ROEuCafRS0E+xcAjB1IbEW6v3sMvoygGZOYKIOA20JWOQbk+0X6wKoA
	 hdlV8ZI/F8aZsA/iqiwFuoUxXwaySDBgSnWaSgbXxMpUfLi/36MGhmaZuIc2zh3l5fGv4
	 XiL2172hVKm/cBlQikqv94s9WWQe5G0pXaBrMoliTdFz+mtmwZR8f73/kmiQVHgHlpxSY
	 rrXDrp4IM6rq1tQaC+M++pzy/ZpVJnJ8Q1Tz6dXM7tldxLOkqT2q8MfTHgO73hNvsVCfe
	 kVelLS5Z3cpxbOVCVzSiiXVB9HKX0HNKLPk66X+QWCqrJkgdCIv+tWSMGQL5CcPxNtg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794457796;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=TgVNlb9qjM6ZO+q5UoCrsvegC7I7n+tFz3ZHn9Xe214=;
	b=p6JecLNlHz1x7IsjnLTS65A0PO3jHy5eUKoWaEZKcsYQNUlIxJJivO8UEWmJ1xFv2G8+
	 tutP4xtxqUtqOzgFpY5Hqyk7b0S/WOc6HPraZOX1iWjaTpupgHKLz1U9o1wn9LFHQrDTs
	 aMarCL/HDoZ0e2vcKjewpNHFDe0UNaWqtmXoVHsAVANMppdBEZPUIvL5t5iyFdy19goxG
	 ES6MKkqEaVP3kQQcT3VSgx/goxERC0DmSV1AF539uyHqOmipDQ2g3mz2c+c5UNlllJ88r
	 KimUPn+ztF2PlNbqq3CcoPtokM9GJg6RxSp4u10wZn6j1SD4VDp8zy4qTcdsvqxZzDw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B2731F00A05;
	Thu, 12 Nov 2026 04:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794457796;
	bh=TgVNlb9qjM6ZO+q5UoCrsvegC7I7n+tFz3ZHn9Xe214=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=oozVrttHVAQ9s8HODN3qyThbZ5p0FGSSp26Qc/yPdpzRgNbKJ2cGrwNMKtsGz4GXE
	 YGCt8owh/YD8807ZfyKR2v7T2tnoWWlB0sP2SDUx/E0ZjGHDAw1Dw9gFsO0I26T3oF
	 DCDKfkw6BkT6hfew+jSu+lsTEH9oVriBOmYxP8BmYOT6GhkVw0U+VPaG5Ktq2axiPE
	 VI6oC0tNSxnCF7TGl3DkHkwzcc+sVyHgFjVVbt+1eYKO/cusyIBLY5cE5lPFOkbK0p
	 t+wRtvmYvhhsPBiCl+PzExcfxzkjSAY5OSO/Sez0b/J2MQu34LYJdA2I4fgPMXW0g0
	 0eUCTQkP1zUzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EF36B4927F;
	Thu, 12 Nov 2026 04:29:55 +0000 (UTC)
From: Yusuke Hayashi via B4 Relay <devnull+yusuke8h.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 04:29:55 +0000
Subject: [PATCH] staging: bcm2835-audio: remove unused
 bcm2835_audio_retrieve_buffers() declaration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMJA9WoC/x2MQQqAIBAAvxJ7biHXiugr0cF0q4WyUIwg+nvSc
 WBmHogchCP0xQOBL4ly+AyqLMCuxi+M4jIDVdQqpQgnu1OnGzTJyYHJp8gOHdsNa2pNNvSkuYP
 cn4Fnuf/3ML7vB0o0Dc1rAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yusuke Hayashi <yusuke8h@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794457795; l=1434;
 i=yusuke8h@gmail.com; s=20261112; h=from:subject:message-id;
 bh=a+TgyUI6wkUkFO2I4cpqAGWsRWGHAWy+RkqW/CQr8tE=;
 b=bFuG0CHsUqIN8TsqRDo45PNlrMwwZoe6/DklH1Tqgyl9UR6UthH5+qMZ4VkD64Y1ybu8lGEc6
 BozwNImwss8CQG4yK414WsNFnI5f7Fz6qGtJvrZ1v3leU9tHGXi/E20
X-Developer-Key: i=yusuke8h@gmail.com; a=ed25519;
 pk=7SzYbbTWl4u1a0gmKeMxAqo7g7F1K7tnWWGWQ+LnNNs=
X-Endpoint-Received: by B4 Relay for yusuke8h@gmail.com/20261112 with
 auth_id=1495
X-Original-From: Yusuke Hayashi <yusuke8h@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: yusuke8h@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yusuke Hayashi <yusuke8h@gmail.com>

bcm2835_audio_retrieve_buffers() is declared in bcm2835.h, but its
definition and sole caller were removed in commit d7ca3a71545b
("staging: bcm2835-audio: Operate non-atomic PCM ops").

Remove the orphaned function declaration.

Signed-off-by: Yusuke Hayashi <yusuke8h@gmail.com>
---
Found while scanning staging headers for declarations without definitions
with an AI coding assistant, verified against commit d7ca3a71545b, and
compile-tested with Clang 18 (LLVM=1 W=1 C=2) and GCC 13 (W=1 C=2) with
CONFIG_SND_BCM2835=m.
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
index 5a1348747ff4..54ad749129fc 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
@@ -107,6 +107,5 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 			void *src);
 void bcm2835_playback_fifo(struct bcm2835_alsa_stream *alsa_stream,
 			   unsigned int size);
-unsigned int bcm2835_audio_retrieve_buffers(struct bcm2835_alsa_stream *alsa_stream);
 
 #endif /* __SOUND_ARM_BCM2835_H */

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-bcm2835-audio-unused-decl-426a1123b3e8

Best regards,
-- 
Yusuke Hayashi <yusuke8h@gmail.com>



