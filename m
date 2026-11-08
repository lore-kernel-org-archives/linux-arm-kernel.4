Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D27606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FlBtkn6H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPdw6PTY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1//uqtjICj44uy7P8QVwmNqhHAj9tnbXTw/EVuTChBo=; b=FlBtkn6HmWrO4v
	BFLzZxNSeRz0Nr7MVGD0g9a3hU+7HNkGp05y9BA9Q9XkKxjiE4aixlatUQxsiuuBMMVk0/Zx79FKe
	n5gBJdzuP/Y9cwq02+2dASmR9cKXAqXGpgjH7FLFo0dpMleniKpt6rytUKTb0BSObq+F6Xpf5d1Te
	hFmORQmvfRXPEtS6592c4xebzJCSDuKx/pD8jcJLqod6mqsfnIk6Be5lCZ490+9mRYrq04aPWnFSY
	WrPUpPLvr2cPqE+t9YyquG238ySwYJakFQppMgakCzpYvbDVN3XwLwAl7MdOGJB0pfmVmQp9Sr+3j
	ESh/2CKepko/1kZtTAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3yB-0000000GGdO-3zg2;
	Sun, 08 Nov 2026 14:34:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3yB-0000000GGdI-1DAm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:34:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67E3A618BC;
	Sun,  8 Nov 2026 14:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6071F0089F;
	Sun,  8 Nov 2026 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148446;
	bh=1//uqtjICj44uy7P8QVwmNqhHAj9tnbXTw/EVuTChBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OPdw6PTYjC/vej+V217u0ttIjMDcXqYAAyN/xnSVNFbGrzUKrAohfmnHQTHIaFnYW
	 A81rXqrkwk+USIwXhm6DSxFNzEXSJ+nnsgQ4WWb7LbLUnWh+R8brP9MwJhXZr/VoiL
	 E85dehNN/2m+sDjFygwRPFi2RzzUit8fHqRVlRi0ohNIT15fdFqZAB64OopONYDIFq
	 GafPiNsCQvJBVJRwPeiATmj/AcROevTJ3yBlOIZpOJ3vW/+e1+fQsw5YGdcaOQw0wq
	 gCw7ZmmXb+sBSe8XWE/YkAYPUldJD304Xf3BeRiacxT9MDV5QDWR7SWr4vOW2xrT6l
	 DAn6IGdx4CM+w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E1B462C89DD1;
	Sun, 08 Nov 2026 14:34:03 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261103215824.1823272-1-Frank.Li@oss.nxp.com>
References: <20261103215824.1823272-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] spi: replace chan->device->dev with
 dmaengine_get_provider_device()
Message-Id: <179414106233.3630016.17157846219971798429.b4-ty@b4>
Date: Sun, 08 Nov 2026 12:31:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TN/StEkvmSxlu5HCIHF37V2V9EC9a6Yj6ifjtAqTSRk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+dEQXNs1TObq3ademz713JpT0sTT2uEbtvKaw9ko5P
 yNPdoBcRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZi/Zfhv9MzjiAD//4DtY2P
 cie9PlpsJOPzKlb3uv3Snjz78KwXbxkZpv1xEdmzmTPFxpaD577Stk12B4I/ZvflLVx2yM08/n0
 iFwA=
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

On Tue, 03 Nov 2026 16:58:23 -0500, Frank.Li@oss.nxp.com wrote:
> spi: replace chan->device->dev with dmaengine_get_provider_device()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: replace chan->device->dev with dmaengine_get_provider_device()
      https://git.kernel.org/broonie/spi/c/12acfe305495

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


