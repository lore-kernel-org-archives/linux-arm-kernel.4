Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7A606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pj4fPaWw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPpiE2Rs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sBoi/8R1PIhDrxBflVR5FUUlorGvIuk3wspRa7/rYcs=; b=pj4fPaWwfCALCC1vIJd2E31v8z
	/7INRiX1GJf3WbdMPhksxGM5psaVy3uh9lIoC2FmponXnV1YBPLXS2UUMeL8IUu5PoAhctdZHKSVS
	viARjqAfgTGgAYn/NsE2wVhXxtKNtQRAisucBK+jl2oLMQ7IrKBsngpzggPkaTL/Qj72nU+CYAKNN
	1A9yNmIgPHHQBCdtceH8HquaUqgg8KLBp4zH9Cyh5F00OgAiirsChNtHId0rGb35Yx67XpA4k2KW+
	Es1l7CquDvvBOfM9myThcbBRjbYn+bZOePoSJks0RmrjLS5cykuityQDymTTAYXbEOm2/qlt0W+6r
	Z94MwiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8D-00000002qSE-3Bbx;
	Tue, 10 Nov 2026 07:19:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7k-00000002plb-0s9K;
	Tue, 10 Nov 2026 07:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A26B637C8;
	Tue, 10 Nov 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295111;
	b=07KT4q7hzPYqJdNUmwk9vtfIdt0igMwv64+HqW0PpzBowC3zlzJiosOuj4rUQsRdwh+9
	 BARAp09oPtIMjB7ddbINC6GG/T69Q9N1ghMyyq21z51XVZ6AHh7vho4UYIcLF5PGOdx93
	 c01G99sQ4/Q2I8XmIFzNhhXP2OD5Hdkq2ueX1Wpiw18lxiiYnU0pUdSQzbOw4NuRy+UlB
	 dhE78Ha3ddmSbMkjPvzbALve48zHBHRrVlFtdjRg+n/B7PatuTf9DrJmJHUhNsE5cXBTE
	 rGXJpet+kkbfEP4TqkMZdPJYuIwXQH8wptmCOV+1UiexLLDRbxB5kz6rad+xcLYKa+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295111;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sBoi/8R1PIhDrxBflVR5FUUlorGvIuk3wspRa7/rYcs=;
	b=G7Nq5aXtd13jRn4DlvyzdHTplfi/yhuqoMEeazKRJeAvTr1pjDkJTLpi6E30v6Sv8DQY
	 NMOMMmOLG2p8KgwZK+gZMjwIEzm+J6G5P0ZVyL4aGM1Rr1QmZJhEMVkYW4HPK0d0Q+bAY
	 PRpePldys9UkqpTRe2KwTFpxgqJxHw1IKCJhZ8um45jlIQYUZj//8/rtjxeUZj4+1pHiX
	 oH5QT2gP5zLuEtPt9wuQhdd8HQ3yEEq5/wlh6mWsZhsTZih3FpwXf+iRvODYD0NcN8Lop
	 ptoQZ14PVhxFRk+AjxYE7+WoL0kPpbcwsTuD81g+Dr9oBX1erfeWKbAOXNe77G4lxFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1C431F0092F;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295111;
	bh=sBoi/8R1PIhDrxBflVR5FUUlorGvIuk3wspRa7/rYcs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=fPpiE2RsO1F7NDmtp8rnEwodZTUR6Fq8pwaj5qr08KnPGvsUfK9EcwVZm/c2sPeoz
	 6Q+lN0LUuDDKO25whv2tMau+5SzeHHshrBpBZjMS0cqAvWQMe54pGFrpZVSW2fTLjH
	 FOiB08J7O4paMsuHEoTwdMgPKAZznl4HocIOnB/7ThxQSx9GtqTpxno/CeOUx/Lwdz
	 YWnk6woNXG+/aTVaD3MFyq2hvsWxaKiC2oFVxvyaC9uSnYwmHgHmjwRZ01SJ8+wTnh
	 OwbR+hJxrVIK931VvgeYWHKA0uuxVA1qdeFslyCGk8FdzLAjB105FCc+/5qJDjgYOA
	 ba6hyvpAGgcpg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5654F4896C;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] media: rkvdec: vdpu381: compress the co-located motion
 vectors
Date: Tue, 10 Nov 2026 07:18:29 +0000
Message-Id: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3aLsspTUZN3k/JzcMl0TU1MDU/PkJGNLcxMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA275TMHAAAAA=
X-Change-ID: 20261110-rkvdec-colmv-455057cb3974
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295110; l=2112;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ek8nnlo2Z+H0om9KAswdYQk2Ei8TtpDwU/E3AzwDn9U=;
 b=pkad0colCQyFDuzCw0zt4yr4BdNBS2eYZJAuJmgk0HrbZkevIZyWUDS8CWoRVfxzbA2JsOYug
 cNwLsCysTI7CYDnH5IzBQqrdjpAwbA1YLhJ0YweiGOOTs5w03K2Y0U/
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VDPU381 can store the co-located motion vectors of a frame
compressed (colmv_compress_en in register 12). The Rockchip MPP enables
it for H.264 streams without field pictures or MBAFF and always for
HEVC; mainline never does. B-frames are what limits H.264 decoding at
4K on one core, and the motion vector traffic is part of that.

Patch 1 enables it for H.264 and reserves the worst case of the
compressed layout, which can be larger than the uncompressed one (the
hardware wrote up to 556128 bytes compressed against 522240
uncompressed for the motion vectors of a 4K HEVC stream): a 4K CAPTURE
buffer gets 8.3 MB instead of 4.1 MB of motion vector space on VDPU381.
Patch 2 enables it for HEVC.

Tested on an Orange Pi 5 (RK3588S), GStreamer into fakevideosink,
240-frame clips: H.264 3840x2160 65.4 -> 68.4 fps, 1920x1080 214 -> 234
fps, HEVC 3840x2160 98.6-102.8 -> 104.6 fps. Every frame's checksum is
the same with compression off and on, the decoded frames are bit-exact
with FFmpeg's software decoders, and fluster is unchanged
(JCT-VC-HEVC_V1 146/147, JVT-AVC_V1 129/135, JVT-FR-EXT 65/69). The
bytes the hardware writes into the motion vector area were measured
with a poisoned buffer to size the compressed layout.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (2):
      media: rkvdec: vdpu381: Compress the co-located motion vectors of H.264
      media: rkvdec: vdpu381: Compress the co-located motion vectors of HEVC

 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 10 ++++++++++
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  3 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c        | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-rkvdec-colmv-455057cb3974

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



