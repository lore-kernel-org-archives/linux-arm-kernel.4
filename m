Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA0E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QAb50YZo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPM+OkcG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j1K5ewHys/5t3EL0s+jWiptRbODzjRlYhbYqEXH+Sgo=; b=QAb50YZosYkNJ6
	cz15/bU/OnkEiZyVATThGkrOjXAmooUJpzuupJShebCi69Y1vuoTi3pMvanUJR6q7XR/SmJutSj4w
	6OwIC6XKmwW6fGRa7gr4D3p9HxmUFDlPdORiPGdVKLnsNeFhoTkrwCL6JP9GV0mwZjWpxeE/qz4yd
	uMFBiUPLucmPlXAuYtKjzg2J4aQtxpdyjLs5EdJXiPrgkUHi4sOW/L+cUbBo1W6oR+SEKwBV9BrtR
	lownY3BDfSfvri7yfAlA5jxFNpncsjiEorXGG1Bsg8xuAhnCRurNTVwp3ILepwg60rLvXnt+bLq5Z
	Y3oGDu0I+rHCL6lqad7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEpT-0000000AKNz-3rVp;
	Wed, 25 Nov 2026 15:22:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEpR-0000000AKNJ-35Dw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:22:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33816611DD;
	Wed, 25 Nov 2026 15:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4C41F000F4;
	Wed, 25 Nov 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620156;
	bh=j1K5ewHys/5t3EL0s+jWiptRbODzjRlYhbYqEXH+Sgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hPM+OkcG1sXtgx5Wxj2RH5GbNjqJRQ550/a+wBrK3G9XY6yMjBY76ZtGQk6nX8irV
	 26GH8FV4g5dyFgq/QUooRTE5Jr24+cS5FV6ukbU6bz3+2e5JLy4sizWgeRuVWd5duq
	 +/ESX0cGjcNitwMHfG/ozGCkXFsb06hD6NiRz5fbLacFOjrWwokjNASQvBnlPpDtK9
	 uzLvreSsTHC3eFN1Nht1Mn7cVpP3cMGOHgNzMycD0XYGTZWhwjz+dMgdM7xIV24WlY
	 Zbp0szHBAYX7CLl5GDB9S4LZwkKA9TE4ndGEA37annqDwjJ9ExE29svoRbB6zQddxl
	 +mtqqg5LIXVgw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, git@amd.com
In-Reply-To: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
References: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
Subject: Re: [PATCH 0/3] ASoC: xlnx: spdif: switch to the common clock
 framework
Message-Id: <179554501801.947306.5510285230833292211.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:30:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m1Bh2olESyCCYp8JXYIX86p20sRKXCcRHfKKlZvkiQg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/lqE+fZyTU0IXabp8PtKTOx2f2O7bSEbdz68fEjw6
 0TJ4BL7jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkVx3D//qy3y/5z1R/+/B4
 wkyej48VtnR7Kl5NvhERGXXz0ZbvXdcYGbbceur/rYRj7ZUT6+sPXev2XRAwmbmwIcyd7XHQiks
 tfqwA
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 14:27:36 +0530, Dhanunjanrao Katta wrote:
> ASoC: xlnx: spdif: switch to the common clock framework
> 
> The Xilinx SPDIF/AES3 IP is fed by three clocks, but the binding
> described only two of them and the driver requested only one. The audio
> clock frequency was instead passed as a plain number in the custom
> "xlnx,aud_clk_i" property, and the driver relied on the firmware to
> leave the audio and AXI4-Stream clocks running.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: dt-bindings: xlnx,spdif: describe AXI4-Stream and audio clocks
      https://git.kernel.org/broonie/sound/c/8a2e765cec00
[2/3] ASoC: xlnx: spdif: namespace register macros and use a divider enum
      https://git.kernel.org/broonie/sound/c/8090aeadf3a0
[3/3] ASoC: xlnx: spdif: get clocks through the common clock framework
      https://git.kernel.org/broonie/sound/c/91c90b881e55

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


