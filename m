Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5053E60A2621
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yNMvu8l2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKO4cORF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=64fBYZh88PphRNRSgctD9QFwc309WJtCXN1aTwbUiyo=; b=yNMvu8l2xP9L82wHsnf2vInOGu
	lE/0DimCACelSB3k2LiKV8H/sd5fe7rzeINZ+ZFj1uLr8gkElW1RAN2G0yabSNzNQwFnSyHJeiwvd
	UZfhv06pTQrz0zaOY2e5P2BZnA//QeIsjjaGRiS0870DsHBjk0SnutgAXSp0UFfHnLHI0ICJYHxLg
	3xg9fyD8aYz/sRSAio0/7VU9GfJfo87OXXw5jh+LJMiVvXdNd+wNBcdQjvzKihs3J5U6yQXu7Cqtg
	gx5OpMxwvH6M91M7YCq24riXYZjQgjTTzjBD1Rbyv0hB1O3agrLRgqS3aXwWsStCrAhA4xSECYl/o
	6+M5mTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU562-0000000CemR-1rVO;
	Thu, 19 Nov 2026 16:34:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU561-0000000Cem3-275F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:34:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3E1F6123C;
	Thu, 19 Nov 2026 16:34:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795106088;
	b=Yizmjmq4uNJHxTKZwEH+/YbpqysqwpcCVU53yYbmocFOPtBK8dIjFegzr76etb4Wbtpi
	 hcAwYjB336nvsi6EQS+GrC/HDWfL7roMIZhc9rxygyBtaQTMqRwtbqVxVDP/54IweJgUM
	 kIG37fFueriIdYWm5YQ7K94LoPc6PbTnjQRFFTdcqcaqKNVr9jl+qIsqxBhqm29L/JEbY
	 miHMX2/Yr187yKYymMIUY9NmqQM7GVGZMc9+RkDC/gY1LIA8I94SAnmQ+hjvGUH34MxuR
	 0v5dx1oQ/KNsrusOcVFC3Fhk+GLRL35Mod0A2+odAIHyxYlMokaFqy/oWBcfbbXQ8kw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795106088;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=64fBYZh88PphRNRSgctD9QFwc309WJtCXN1aTwbUiyo=;
	b=Hfmkasj+WezOKU5YMdA6s0P6M9GVCeQq8YDBhp1OYRJ266UBlHp0LJu/3JeoQgbxMdct
	 hgRIgT+O89zQbyos+stCy029q/GKAsuXs4umE3w9zQeoBXuegtc0/CK2cw+sPdaSUd+vR
	 qJVtg93BfPOtwCgD0Ygfu76Bl0iA1PCtQi7zJQ05CfIgn1asWhAt0HCwM1B97BfRLFfni
	 cGRSSqTw1ty1gp2sY6IdwCtzcaLYybpgwq86w5bVAxIP70NOSq+gzZBFcxxTrWC/kVEAX
	 yWpRabCfBYzKFabsKsFmFuvxBwmRDzmPAoaGpTaKiqIKONQQQcv3Up3zQ/fDuQQoBmg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CED761F000C5;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106088;
	bh=64fBYZh88PphRNRSgctD9QFwc309WJtCXN1aTwbUiyo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=mKO4cORFHzRsSyQpRpaYuHS+bIG79zOCiNOdmsfX2hgfXgHzF/59ymXroJlJc5h+x
	 g6X1o/2jZepfb8y0xNUTrl9snhMvBM2iqZumrMQT1nF5+K6avtSVOjZEcOv8t1e+3n
	 cLblklzWxNLmyPBDelnaqQZ107qC9wvexUFDCcxiO9pAVlqT4YhitJyg2rojyeYFIg
	 Fsl4Ir/x3ssRYgZl8vAGM67j/Y/h1u4Ub5o4fqoPAFW4nk13bvSmE18aYl7B2YsXhv
	 BunykAPrt4sD9DzegdsPRPUI4vDSSzMH9lWOcuQSyOw5XXGNlIi9W8k/qekgn2u1PE
	 R9zSNRd31i5Hw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2BACD4B337;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] media: cedrus: allocation failure and capture payload
 fixes
Date: Thu, 19 Nov 2026 16:34:46 +0000
Message-Id: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCQAyE4VcpORswS6viq4iHNjut8bDKxopQ+
 u5Ge/wY/lnIUQ1O52ahire5PUpAdg3prS8T2HKY0j4dRKTloWVFrrPzhBKt8mgfOJ8UR9GU+zF
 3FPWz4j9EfLlu9nm4Q1+/O1rXL5JCp0J7AAAA
X-Change-ID: 20261114-b4-cedrus-generic-fixes-8ce71c2dafd5
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106086; l=997;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=wYVP1PucRg6lWg2/ngxnBUIQiUIQRKql/Gq/N+y2N6I=;
 b=6IqB4ZHRS2PcVo6o6j3tFxdrpHRv2ITJ4ztz3QgqrkrQejXbRdjRDvrBSs2dD3nlLNSTj1zuG
 9MOTavWvfvNCDfVAyLu/SUZ+Lv6dffylRiNbgtHHWBXuQYV0WTrDGqg
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

Two cedrus fixes, found on an Orange Pi Zero2 (H616) and reproduced on
media-committers next. Patch 2 concerns the private plane of Jernej
Skrabec's 10-bit HEVC support.

Tested on H616 only: 17 x 64 MiB REQBUFS gives 12 buffers and no OOM
kill (next: five processes killed); 10-bit H.265 bytesused 12441600
(next: 15552000); v4l2-compliance 49/49; MPEG-2, H.264 and H.265
bit-exact.

Developed with Claude (Anthropic) as a coding assistant, which wrote
the code and the commit messages. I reviewed and tested them.

---
Arun Iyengar (2):
      media: cedrus: fail buffer allocations that do not fit with -ENOMEM
      media: cedrus: report only the picture as capture payload

 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261114-b4-cedrus-generic-fixes-8ce71c2dafd5

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



