Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E32606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1X//yOD+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JK65Cm4f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j7qDWSNS5eYxL4Rk5EXH81DBDlz72KpGeSZMRcNhxOs=; b=1X//yOD+Y6F951
	xS+3p+6NgpliV1AKnufaunC/v5nh8r4HX22OIp2BliKZ4csUxeQUX1EdoRrgY9YaiEOW9PAhe1pkE
	9akMmIAq3yZhPazhJUNYnf44nc9ym/l56hu0ZfauvRTNMzh1QAo+pAgDRbgSjckf1JAVCoLUMMw1y
	UDW+7mbr/RYuLGQRKDMagipfQKdQzDrpduLr1bfMdrsomXm1BPRdAwx9n5rf1Y+dlNaX4qZKYibu2
	aBoIdv8Po6CQKNTLtS0xLGMYped4iZazPPTHP5RlRj0TeSxWVKjbJo51JtYTFodYirj3i8Z7Pkx5Y
	YONbt9BAHWic2uMu+yTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUko-00000001WOp-0UaY;
	Mon, 09 Nov 2026 19:10:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUke-00000001WMx-1zoT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C1EC61202;
	Mon,  9 Nov 2026 19:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845811F008A1;
	Mon,  9 Nov 2026 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251395;
	bh=j7qDWSNS5eYxL4Rk5EXH81DBDlz72KpGeSZMRcNhxOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JK65Cm4fJop2ojkEpJyM1+mXqVJ7mibbrj49cM84eeQZ0JJ0OnUGxMCLP5F6a6fIt
	 WaAlubqqhIG/hr9uWg3DS4MEuQu12YKJxHPagNfGWcQeAe3sL1P9+G+uZLuyE5AZu7
	 JbUOYDiSlBlt0z4awGMCRwNMaHkX4MYIRfK670ZWrTkLI6uibkWoGgsUexeJoQxbRw
	 T7YhRytwCWU3eT1RuYOCfjHqLdoL5yKJ73ktSmHflIj5jjXM2KIaRP1ccAKoE2gO9D
	 J64V+YZmemWzVHaNenB7aQSIS3imZ+iFques75kObudZG5TWwg1UI+USWcn1GCOPIJ
	 yuC6Ax5q2iJXg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 095322F707B3;
	Mon, 09 Nov 2026 19:09:44 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <179393727482.2060666.9057920361892304525@iscas.ac.cn>
References: <179393727482.2060666.9057920361892304525@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: stm32: spdifrx: keep the control DMA channel
 on config failure
Message-Id: <179424339281.3711751.15933496452450349349.b4-ty@b4>
Date: Mon, 09 Nov 2026 16:56:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=otm/DUqabjVv2tU74m8yyYAXxBMbuTd6OXTau+Ypj4Q=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+SZVvnLZ5zkFrcefUDfwzp5jsNJIW+bumt+eZqFT8z
 2O+DcflO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRpFRGhgvy+4oMu3O3XhC6
 c6TO4jmbnNwfq2Xqaob1jWXrFu7f+ojhDw93U0+/027+FBMvj5jtws6BDW+/Jac7p3wPtc47q1z
 KBgA=
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

On Fri, 06 Nov 2026 03:54:34 -0000, Wentao Liang wrote:
> ASoC: stm32: spdifrx: keep the control DMA channel on config failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: stm32: spdifrx: keep the control DMA channel on config failure
      https://git.kernel.org/broonie/sound/c/8f0650e4695d

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


