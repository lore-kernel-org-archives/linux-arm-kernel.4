Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A694606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s1KRtGHh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VuwuVl9I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=s1KRtGHhsXx3Mdsv7m22vVX3J+
	Fmyc785rDpnKDVPKmpkKd9SOa/YzSmnsOPJHNtr0Q2SpAf+fcJWzi7buywBJUqGWtofIxTwqaCSnX
	Une00PvTdVYLZMj4/sObvH19Np8BxnPiSn8zft0laSu5lizplfiprQOEMBltbB5UZS/UAnfhBnCIl
	jBCYLPQXc16wIZfaYa4OAKPuVPbqWj2g56RGogiYkIjjKE+ERGcWoUUvc9EucqfQPnsnR9+4fzHN6
	m9WLazG2oY/H1EEiCbOW3RswxLcB0BGbh7wJbJ5mmcwaFoZj9GySCcrdpjD9SiVDEXSCGUbfXE8uf
	iT2JuUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Rk-00000006z0P-1nuw;
	Wed, 11 Nov 2026 14:37:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Ri-00000006z00-2r8E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DC6941376;
	Wed, 11 Nov 2026 14:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F411F00A05;
	Wed, 11 Nov 2026 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794407826;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VuwuVl9Ir+pxEDxIzsWkrE++elA9ahbE9R+qJ75k5x7aiIK0bv1S3pcsBxp5ba0kR
	 Uq24B0RN7/EyAXa33/t7V+NMnOIEkyIQ3DTWs9xsCZjh3Ch13q4yWDgDgRVPCX4P4k
	 JaTKxwTNp1Ep1Na8PExWLs4xH3UN5ZHy0udVFHYHwn7ulEGpAlmD7Q1ctYk9Evp+VV
	 Wp/+7xQoyL1DVoBsP0W4yn0OR4JbjiHkweh8OcUhsIvPxeJ8PXsAY4HFHRYTw0Y1KS
	 iENVs1/D+oxCw2PjIZcsj75ft1nEQAuK0+Q3/5A3/hbkoyp17/3l0uQeferNXtfucf
	 csVP7LrRZs9Cw==
From: netdev-bot+sinfo@kernel.org
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, Jose.Abreu@synopsys.com
Subject: Re: [PATCH] net: stmmac: program the FSM timeout timer
Date: Wed, 11 Nov 2026 14:37:04 +0000
Message-ID: <179440782487.2168702.18094491275794664305@kernel.org>
In-Reply-To: <20261111143322.2234321-1-zxyan0222@gmail.com>
References: <20261111143322.2234321-1-zxyan0222@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

