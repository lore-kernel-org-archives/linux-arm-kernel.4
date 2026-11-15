Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA2C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ih+dMuCG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvhXCykB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w4c5EyXhPB8AqpXcztYFqZ1wWsQTa6fMhtyUitpIppk=; b=ih+dMuCGSFOpnKt1+Z/QGHHSS4
	4TGAusndydW9jf2/7Sd1e/6mOfyjCwrx1HgvYRHhxe89+wI7krs0G54RKCJr6a+nvQfW7SKGv+glk
	S+O4jd+0RXrf16STL6ORxQCG6A/Rsjjfxpohu5l18WNmcn1MfNlVQAO+3tJxb5MnKEGfqcQYTVir/
	pXfUHICNIhtgWBd+QMP/qIeBi4DwLlM5CpypJtrdn+hYoTkFhWSnSp2swBFXTpXFBSmf3lGU6AnGF
	/6+TPkJ65tk1pG19sGa2xZHAa4d/B66vnva+3YsARMdDu/pb3u1149gsubVw0bDEWVPdqkyiqXfWj
	Dahi1obA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW4o-0000000HHMs-1SE3;
	Sun, 15 Nov 2026 08:59:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW4n-0000000HHMU-1q54;
	Sun, 15 Nov 2026 08:59:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE28A43B53;
	Sun, 15 Nov 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794733144;
	b=PYH7ONLnJweS27rUCQirrrXMrtw6Zn6TYAD0IkMivTQwH9m63GNmBpV+xaXJ+ChyKtGf
	 ruZh8/PepZj2bvQf5lXjSEDH6Dy0WXNiZqbqiPWQKpv0jMU+WdWpkHCYCiww3Hir4oZPO
	 YRVJBzGzWLwx/1uG6km196DwSQClhXlecFH2HdTOFAzhiuJQD2yWzAjk1HxVQRn92tc1n
	 JUokxEQu3YkzuulNGxMLf7eb6+awP2h9R8gl1B9ThmNlGZBVl+ALUjgzxBzJB4BsgaqAO
	 +UeC3xJpXUdU5wsL7lGUDilLaYP6TdYKzofvSuFdowdH+tVy1xZaC7SDXKG7mtJqTBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794733144;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=w4c5EyXhPB8AqpXcztYFqZ1wWsQTa6fMhtyUitpIppk=;
	b=ORPvgim5FyIBjt3UivUfsr4l39n3WxXPkIsZ8ZW1V8cHRHb2+3CZJvlUUSsComeH5Vp6
	 0dZkbB2yDZ9NChWW+r1IqM+XZHQgQcvPisgEo4hW9IHkDzNaAD5t0TvPYwdGTWLBFN2Xa
	 +3Lvwkit72T2mfexJwEsofSmQy7fKRyMPmQW7DwxgZecnE3cfX0o44hpFLMAi3fgFanxL
	 kGgXAU+017r4KfA+gdINT4ejcetjVs3fSJGBhc/jnVm/btCOJfXwNIuJPl68PlWM9zAcx
	 Z1lZR0oQA5NLniBhMepxoVMzI60OwSh691kA19h28Nw1pGpWH41nAYQxtxs4/EJYpiQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41B1D1F000C5;
	Sun, 15 Nov 2026 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733144;
	bh=w4c5EyXhPB8AqpXcztYFqZ1wWsQTa6fMhtyUitpIppk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=WvhXCykBnqMPlcGOtGXn1Ekqm+4XA/c3st/eF4qp5/ogHYJR1hwRnN4yARdjlRwLT
	 SwkNtVoagvK8zpqwgl47s/rBiUbwGOCoYcufIJO5BaAEcYoj5ekao0gQb7rN6iazSp
	 HsKAD0Ro6VomJlisbhnuZ227ITYQcUCKnXXGXsqSSDudqocEs05VFSshh6MPTF+AmF
	 McDsU+6y7+6ndfC1eWjOCOPlEQLsHcogZQJgEZhkTArhuH3hwjESvH8SBDoAE4lAvx
	 cuiNxR1MiAaV0Le2kKnF2935E63hHSxxnkKVm/0cYk6qs8MHD3Q3ymxVZu8IxWBnUc
	 rEWrtrkRdsW5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF54C4A015;
	Sun, 15 Nov 2026 08:59:03 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] media: verisilicon: av1: Fix two reference reads
Date: Sun, 15 Nov 2026 08:59:03 +0000
Message-Id: <20261115-b4-vpu981-av1-refs-v1-0-c65769715db9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAyF4atI1gZMKcPUq4iLauMYFyqNFkG8u
 9VZfg/ef4JyFFaoixMiJ1FZ5gwqC+hHP/8YJWSDqcyHiCx2FtO6uy+hT4SRB8XgLDk/kOEqQD6
 ueZXjjTbt37p3E/fbU4LrugFy+K5TdgAAAA==
X-Change-ID: 20261114-b4-vpu981-av1-refs-d9419af12e0d
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794733143; l=1051;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=KuW65qSSVnoaFOMXDWaytG4qSD+RtxeDkZRMmT3rxPk=;
 b=GOhE6FcdPqzO/RtJbvJshne/Kp5GWQEHTECh5RXURiF95TRQfXKzfe9d1oCbDfeH8DvnmWExC
 M/RJavEVeFIA1odvmPCM5B1scSIkoTHp/JQ0Wc7VbALqViO4CTSVN9r
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

The RK3588 AV1 decoder (VPU981) can read a CAPTURE buffer freed with
VIDIOC_REMOVE_BUFS (patch 1), and reads the segmentation map past the
end of a smaller reference after a switch to a larger CAPTURE format
(patch 2).

Found by code review; neither was reproduced. Tested on an Orange Pi 5
(RK3588S), 7.3-based tree with these patches: fluster AV1 test vectors,
no new failures.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

---
Arun Iyengar (2):
      media: verisilicon: av1: Find the reference buffers by timestamp
      media: verisilicon: av1: Read the segmentation map at the reference's offset

 drivers/media/platform/verisilicon/hantro_hw.h     |  1 -
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 45 +++++++++++++---------
 2 files changed, 26 insertions(+), 20 deletions(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20261114-b4-vpu981-av1-refs-d9419af12e0d

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



