Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A117606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iaeqd2T+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euu3ZruD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ajvyWW3DQr1rCnfZEzkj7OTvm1pagyyvWLXifOTGWgs=; b=Iaeqd2T+Kac/FU
	Nq0ECZjbpcIRQGKa5fhwvSQbg4+mx+Zpk6POgojTH9oYbvIYTMPQ2SYDtOrPKMFm4MFgdAzmHj6wm
	tfolGXxQSDMZA55Eu8DVL7q3Htx1GHSu1TZIUySIz3l9tmX9gkk3C/HvOwZ4FNfwLCEZeZPCq8C6F
	4lYUsxd+CA0vZHaY4pDGKWM9u3a/3Ha1hicGwouaarLV9HM77N8wUXVtkbzJhFlQYgbRMXTN0Ux7b
	sOb7hYTIpkIOAxIsZyDelV/MIrayPc361o5wDcT1IkQKI4TN7so+mH8IcoxLuRZ5AjprUEld/CXE8
	DHJx4/gvYjTe7NEG3y2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfWL-0000000EOjv-0XxY;
	Thu, 26 Nov 2026 19:52:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfWG-0000000EOiC-44qW;
	Thu, 26 Nov 2026 19:52:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D937435BC;
	Thu, 26 Nov 2026 19:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9403D1F000C6;
	Thu, 26 Nov 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722756;
	bh=ajvyWW3DQr1rCnfZEzkj7OTvm1pagyyvWLXifOTGWgs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=euu3ZruD/jO/Cz59b2NnQ2b1peKqrTn8kO+SefyayWS1KE4BmNliv+1SGG32IJluR
	 HE+Wnt4lNs2O+p0Sb7CBioN1hsFPgnPtOEqBick/8fnOwSZMmIJMF11Dp8ZQA2W4pn
	 I2nCxfnJ29minJKzmridkdPEuF4ZbJZ32VtmElZZ49wUfn7NcM95JitWOUqKHZwjxz
	 77EG/q/IMuqZJSZC8cSKn6XLotVbvPmi8H6TTceQsPDWbv2NQ62Q0V7G9lIEpN3P/J
	 Tyfuaerh/opGBOb1bUIykjFwNy2VSxqeXCsBKh/QlVUq7sKIj9nq3/0jwh5bigr2dR
	 Odj7yaMCZ4Bag==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jiebing Chen <jiebing.chen@amlogic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
Subject: Re: (subset) [PATCH v8 0/5] Add support for S4 audio
Message-Id: <179570534680.142532.3364346752372243512.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:02:26 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dN2PQHo40OLUF6RS5mHEqX2pS3hO9wRkmfDDYCTRwMA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5ev/9cO3b/bdZ+OzM2NssB23Y2pT+fPqzJFJbtbWXL
 8b16UadjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExk8itGhv+by9Ott92ZrXBs
 4/Viz6+Xqv6mv3+xtfzMctunJ3y1baQZGZ55TVU4+9H2qNDMKgtH3wmTa5vna26RtplRJ/Hn9+a
 kMA4A
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 10:28:23 +0800, Jiebing Chen wrote:
> Add support for S4 audio
> 
> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
      https://git.kernel.org/broonie/sound/c/145707a7d371
[3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
      https://git.kernel.org/broonie/sound/c/61802135f743

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


