Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90168606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8dNehu2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXPlAhNs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JHie8fWAj6A2BHLBsAbT3FIVRK6/99JunGJpILvdj+8=; b=G8dNehu2K9xTwm
	X/DNHoMUH1+waN7gAxuy+OyFt7kvno3kaphKw2OOasgIcFfX8UGB61yqCw3DXs0gSI9wWN/xbE8u1
	0kwgq6n7rfjtyG0zrMZj8yVZpaWc/2iMSKQTGW7gt0XLzTkyQ+f+iOGgScGxzGvTZgYzVVwNytCOi
	k5PwCKaftWw+3ae053CJFcSYphixC03Cu+clnQo72f28RK//f+AkHVcZhwrms/RcQz5jW29PlDCC6
	enVnGcFoTCkpTOHl6TVxk18cGuvAg0X1tFNvBFsDHywZhzi1iOGDQ5Og6myc3TfH0i5Ppt9yWgBIB
	bGBsWo2bKiQM/vAPrnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrdv-00000006miY-3znj;
	Tue, 24 Nov 2026 14:37:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrdu-00000006miC-0XKI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:37:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2251761F1E;
	Tue, 24 Nov 2026 14:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DEB1F000C6;
	Tue, 24 Nov 2026 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531028;
	bh=JHie8fWAj6A2BHLBsAbT3FIVRK6/99JunGJpILvdj+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QXPlAhNsEiSSNiRdS5i2OhxZ6sNUb9bPkzdxMrxP7oHG7I3MyYWoxYB6anTCZ76w8
	 kgtKEkpHYcgL0c/sIIcQwnLDMDwPq1agxxmEr/+nXjGiecD3uzbLtn8jn/b2iFTATD
	 sJRVFQNnz7jp8eGDqvlxKSsAQqQ7Mf3DkS9ZWTOCzXSBIRGjX8dyMECSSpDje9p0eE
	 WJ8oc8DIEd66H+hIIBI/sVcd4DYWshpLZ+1yNKgQsNGQyHGx8RTC0e/zDv5oVu3d+k
	 MLd4qPzBbUge0piJI6CeORLAhDn5dCC9LR/ME/NTDY/dOirN0Q3bwEK33DQcGgDi5Y
	 BwZt68rj7jYGg==
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>, linux-spi@vger.kernel.org, 
 Luo Yifan <luoyifan@cmss.chinamobile.com>
Cc: linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261117020646.20111-1-luoyifan@cmss.chinamobile.com>
References: <20261117020646.20111-1-luoyifan@cmss.chinamobile.com>
Subject: Re: [PATCH] spi: orion: handle clock failures on runtime resume
Message-Id: <179552765811.264265.12160006862599570767.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:40:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xpScwKVrQjm4gon7V/Z3meCGOFMtuSLdbczoP8wZZkE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZFwqaOaQkakyZe/Dw2+ZFF+bGs7WlXNyalmA+Q9Pnl
 cEO99dXO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjAR5R8Mf3gDWwL27tq13M+5
 LPTyofXnrujc8fbYVe5WLycb9SFh6xOGfxZy5c/39fE/ctiy6b5k0C61F0e/GLTPa752L2LFom0
 GRxgA
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

On Tue, 17 Nov 2026 10:06:46 +0800, Luo Yifan wrote:
> spi: orion: handle clock failures on runtime resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: orion: handle clock failures on runtime resume
      https://git.kernel.org/broonie/spi/c/b6f9117472ca

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


