Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77AC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Me2Y/Z9r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwrRu7zp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AHXyk6QEYpxdCP04rxSDRnWXaEbcjS1wiyKd1DAANnM=; b=Me2Y/Z9rfTZsYS
	Cb9jNci+uNEno2TU4AtZDbSZuBNNNgA91qK1u6rIbQasTBcj5WmGIdptmZwxSw9tHucs8fAktgTxp
	mgQ4oCZ4dGIWyq6dm7AQET0zS2kTrqMfqWVY4Zv4wkgvNDX4mpxCABPeoFkKnhFJLhuuKOXq2hUED
	QY7zHuouHcotQftdxIfZCCq00R10shPiQ51EtSkPg+WZQCS0u/Z1+PTUsCLw1y4sAVWxREfGklsfd
	NlBUG648zfFzaWsyhlBxIwnc4+RnG+30EXzppzlfwxDUkPb/8eJAF19vTT2BraHQAbHxbJGhPyBSA
	5GxtFCguETA/eHX/c2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKjP-00000006Fwy-2rXj;
	Tue, 17 Nov 2026 15:04:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKjP-00000006FwZ-1YcM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAF7D43AE0;
	Tue, 17 Nov 2026 15:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9FF1F000C5;
	Tue, 17 Nov 2026 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927862;
	bh=AHXyk6QEYpxdCP04rxSDRnWXaEbcjS1wiyKd1DAANnM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IwrRu7zpyMwz+3pBMKZEdNa3FOOhkJJ7rRDV7FsoGiEP25UZcd6COzVp73Ra3sDaY
	 QTCIyNsfnvgjLMSziVizOUfmrmkBtgii/2XyZVbmzhERUvB2hsjTyXA/H4bwHHgolg
	 iK8lvuKUTamnBheTf5ktoHxqC5Sq4or6kvlmDoN6rta1sp+KxZsYsrKlOO2wisUnVZ
	 /mcsaO3ym5Ep9bdiCvKnkPwJbA5e2VMj4QIQ4+LHFk69aznFnALfdwhKClnREIU1Lf
	 4sJEcX/+UELdExcK+3tr3TwMrq1jy4OPSGbMdC7ssnm7I1A3P/4cMGkkfE+3kKYI26
	 GaW58uBuAsrjA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261115-ux500-asoc-drop-vape-v1-1-46315e14642d@kernel.org>
References: <20261115-ux500-asoc-drop-vape-v1-1-46315e14642d@kernel.org>
Subject: Re: [PATCH] ASoC: ux500: Drop the VAPE regulator
Message-Id: <179491836927.77896.17333378148547307247.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:26:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Fgd21gAwinj6UKOy3s9OTwKF0VSp7ifD/mLKvmpQ5mg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+5Hy+9cji0bmMb0eDf8fMtrezUG3b/HyGIW+i2eOe7
 5sEfZwmd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi+2YyMjR33XbW4ectXf2S
 2WL/s7ki1Q6/yhQ6FkiZVU7y6vt2sJfhr9iBy12unYnGS+f6KT+wvvcj5uLtG4u+LDtew//Kef6
 7+5wA
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

On Sun, 15 Nov 2026 23:38:14 +0100, Linus Walleij wrote:
> ASoC: ux500: Drop the VAPE regulator

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: ux500: Drop the VAPE regulator
      https://git.kernel.org/broonie/sound/c/5515e4601aa0

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


