Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECC6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IRk0/pok;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FY2ih7k7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bXeo00zC+Fz/YIEVBhgtInz4Kk8T6T+8sTaeNUk6/H8=; b=IRk0/poklV+SwS
	XvDlFoTYE99cgDeSPj2solipNUrYtwXItviEMm8l3LhEJjVQ6W6lXS0395hisGLqIu+sddwCEATWf
	IH6X98zQFoosJFvh2kiZ2ipH/5RhVK5jVePFunSaeFDeU4Tst8zzFaarq1uCHGPtfxY7BAr/ERlVO
	bN8neLxUKZcSBnQDfCK31yvHDOQtil5hI2Ky0JCwzkAPyJenfp+qJeUAjaWupIuNfs4/5TIvdiyXj
	63zJYufW+ZCxQqeN/oP+HEDac379Ut60qH617hlVWTvc01EWI0Q7Cw9GBzhqxhhIy3cpfufEnaw2l
	4bt+72t8yAGrMa3rSvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUkd-00000001WMy-40Of;
	Mon, 09 Nov 2026 19:09:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUkc-00000001WMr-3o3G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99DE242A8E;
	Mon,  9 Nov 2026 19:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496461F0089F;
	Mon,  9 Nov 2026 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251394;
	bh=bXeo00zC+Fz/YIEVBhgtInz4Kk8T6T+8sTaeNUk6/H8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FY2ih7k7jZW05Nq+r2TcqolJl5AWk95Qz+JIpGAwh4gjHH93hf+tWO82G9zEarTg9
	 CCjmyPFKTLcrDsBVh9B2u800wiH4ryuUaWjJreMIsUSO8fRW8+nHFaUhzsq16KTUM+
	 OevrxascLS29HAk8qeqx3hzYHOD2+Wm7OJ3yzdR4G2A3Fm7Y+7CeKnGYD5j3CGmme6
	 bYrfFcqaHPkjUrB/k37cRkH8nep1sno3pAPpor1HpwJkkwYdJT9FlBXDEtEtEZur6B
	 tzxsb/idzrgsrYbcmLgxpDVv33c/ppsF+Mz3gXiFnsdvC2v2D96zDhevo2FSyZApq6
	 lJqWnOTfChSsg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 1B85B2F707A4;
	Mon, 09 Nov 2026 19:09:41 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104024045.1508542-1-vulab@iscas.ac.cn>
References: <20261104024045.1508542-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsl: imx-audio-rpmsg: unregister platform
 devices on probe failure
Message-Id: <179424330240.3711751.6306163881108747732.b4-ty@b4>
Date: Mon, 09 Nov 2026 16:55:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jg+mpLiVJDLq2jsfv+zC4pV1nIIzTvOIydQhC3VcHjc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+SZW8+H/+//4LLXvaLs3eKLxjEde+o+822z/YeC70S
 enkR071XzpKWRjEuBhkxRRZ4rK4X9aXvF7Dd3BhG8wcViaQIQxcnAIwkWN/GRnuPNW+UZ2+gG3T
 dk9JCTWG479KdZdJPUs48vPR/PuJ6nqxDP+T2coU70SdsJ7x8nXmtS6uJUtTt733SrtsKiauY8U
 pZccAAA==
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 02:40:45 +0000, Wentao Liang wrote:
> ASoC: fsl: imx-audio-rpmsg: unregister platform devices on probe failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl: imx-audio-rpmsg: unregister platform devices on probe failure
      https://git.kernel.org/broonie/sound/c/a3aa7ec56c14

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


