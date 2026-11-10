Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4095606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=msnOzDS2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=birImCg0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T2P/GAEk2otkWq/GcV9uWXOrUgzcWGATJfy8p7qWBJg=; b=msnOzDS26oymgG
	1i4ysTK4QboGmaFX6RRF8v9JuaoeJvbYrtibmnXxMFf0as3NgTdY/lqmIh/7kKQyACjwTOwulhwfb
	+dFi3lmca0cYASK9GzujgfXjW61vIqgdzJmAvuNTSPBhu6DpF6QUdGNqlrIZKXzf1uYVx6soVmPZ/
	niOw8GmBOA3fjEWrbIzcBef63Oh//+TlpFzVZ76ICqIGB3ztWYy2lMnEvPwe5g1BB4Xz0Kx+OSBOd
	mzUIh0KM3WEezEejGGd6z8AmvLTIKu7BeFEfAnOurvTVtacznukzZ6ZrWHiIgkuRhUuTSVOfC49TA
	QNq796g9aJplD471sj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkB2-00000003es6-1iYy;
	Tue, 10 Nov 2026 11:38:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkB1-00000003erh-1e1A;
	Tue, 10 Nov 2026 11:38:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 171E8470E4;
	Tue, 10 Nov 2026 11:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D351F008A1;
	Tue, 10 Nov 2026 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310691;
	bh=T2P/GAEk2otkWq/GcV9uWXOrUgzcWGATJfy8p7qWBJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=birImCg0ikfZlgymBPG1EQOVl8T4PvzPBJE3IkYSwyCAjX6vQwI65u9dOTVAFVIVt
	 Jr4PKTv7nmKwXrj12EPxjnX54EDhza++N11jzeedzWLJV9phNHoC61SgwtI5RgdSk4
	 IfpcIAJO3N+NPz4LziHzOcsznefoB07i+3jUEPXTN5G4V1f9MsFSrznT9QDgUE7DuQ
	 3V+rvquAaKTbafZOKdinMDkCmmpo8zf65hLVbPMJFgHEVANzwn2/5aCC29En6T6hn7
	 CMdn/xwxsklmImZWNlFx/SHbbnF8177DN3zJaSqolLxcAVpcgCeE2wzIZnqICN9XBt
	 tR3aHyt/+QvvQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8F31C310B6B7;
	Tue, 10 Nov 2026 11:38:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 llvm@lists.linux.dev, Cyril Chao <cyril.chao@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
References: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
Subject: Re: [PATCH v1 0/1] ASoC: mediatek: mt8189: Use AVOUT for DP and
 HDMI jacks
Message-Id: <179427281919.3711751.4669554819271995706.b4-ty@b4>
Date: Tue, 10 Nov 2026 01:06:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xSnEnBaKwOzWyBQ2Svyhe7l3mZBvUNDHRGh0ZFk7WrQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+Mym8lqtfYThp6fRXYmfMzI33fDycuu0Jk+H0d9lhQ
 XmlDznWd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiJY0M/2sPbpk47aLHqofX
 W4U25uY2l8zgm/+B5dSUBZefJKR5/xNg+KddJX8xILc3a89Rkedl/yJ3G1wVVzfiML2b9s9fYdN
 CEX4A
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 09 Nov 2026 11:24:08 +0800, Cyril Chao wrote:
> ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
> 
> This single-patch series declares the MT8189 DP and HDMI jacks as AV
> outputs, matching the status reported by the HDMI codec and exposing
> the video-output input switch when jack input devices are enabled.
> 
> It is based on ASoC for-next at:
>   c937f492dd40a8398d955cf0f4f9e11d7268bcb5
> No additional patch dependencies are required.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
      https://git.kernel.org/broonie/sound/c/1ab0585e7609

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


