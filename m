Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3BA606A9E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oOgnUWZO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xgo2kU6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=258GQipFsyTOXoUA2ByHEo7WeWVzLxapMXTt6kx2fyA=; b=oOgnUWZOYUrpQo
	b8Duy/tgLs1C73UBlDu68pQJAHeH4yhua/84zA2YRBoynT3ehfwb9CpLklkM4/jaWi2hzcF9oWEfr
	rkC6Xgzq25zFHaivswjqy19o7C6jcJYaSnx2YRR7CbpFIIHabrOvNk2kMLtJB5wxkUkIbGustU/7j
	4Au5z8e8yRGR6JoFsGXl515YGd4E3WVBMq7aYsKwf0HHCIr3sjG3zvP4CeQ2BmXJ6fHQW/CiPaeSJ
	6bilw523JPuOXQFUDu/dexS6dQr/OrLhFdILUX+GPoGozG+n3BXKg6MPNauiXcsL/tb+NnVIHk/ji
	CmIh0Ed3N5GRB5a1+vxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiCZ-0000000EtHu-0zLf;
	Sat, 07 Nov 2026 15:19:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiCX-0000000EtHl-3fMC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:19:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 035C661400;
	Sat,  7 Nov 2026 15:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893CF1F0089F;
	Sat,  7 Nov 2026 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794064768;
	bh=258GQipFsyTOXoUA2ByHEo7WeWVzLxapMXTt6kx2fyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xgo2kU6BrJF85uNf2ydBeHc5WVewhtgdRgVneBNRk2GFI87HoPKGUnCYxgXK+kLaQ
	 2FPw7HkRpbYka8EGzJXqqHAXl1zdsVl1CR+8V7WDUSQdAFfpwRQM06bgZBidy64BB2
	 fgxv4gmc7LgxMSKaCPPWs9qAVdDVtimtSQnWbVOPNwrKhKgTXlBvQq43/v61YRc5rO
	 56LKgfTjl8OBebk8AUjEtljqPmz/Q4JjMnSZI6YVUUGEL1TNBcbeYpxThgfyFCuYxa
	 S8B5+gVLgE3DCVpF7fibkCQ7bsB2ZxpX2xPKDlXx2ZlWhYEa1PmXbL/6/7CMObkNcG
	 uXDTwtHQuz/Pg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C0AB92AB32AB;
	Sat, 07 Nov 2026 15:19:26 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104113405.1634275-1-peng.fan@oss.nxp.com>
References: <20261104113405.1634275-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] spi: Convert to subsys_platform_driver()
Message-Id: <179406122369.3424803.2354704707540163499.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:20:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IsGdt/njLVLe0xHvqyi3tjPSeuC6ymg0tAUQ836nNnc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeO9btbpz5m92sNtxrmp+QisY3mV3ct4NyeB896050z
 K3acD24o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABP5msPwT+mA1Kw16/dcYP30
 O9v6R7qAcz+XhF4Jr/zjM09uuPCsSmJkeJwsKcMwV+2mKMfqdT93Hje/22NSLf2Y29cnn3dNYN1
 EdgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 19:34:05 +0800, Peng Fan (OSS) wrote:
> spi: Convert to subsys_platform_driver()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: Convert to subsys_platform_driver()
      https://git.kernel.org/broonie/spi/c/4462c852b34a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


