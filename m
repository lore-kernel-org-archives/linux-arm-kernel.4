Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21407606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q6lYuxt1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULBEWwwh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r5R4hf5cfxy+Cy66jVTd+1Csi3vyz5AZOLaI2RR9hWw=; b=q6lYuxt1y75aHs
	K355DUEewJSLE+9ivhyxKQy81dOxpAzbBEWDoJYaM8OWN1ryLFEF1mqU+gYtqH3hknyACydV0/ICL
	m1h6YzJTNK42dhVdFxnGCsJRyl9BW2VcFMVSARO9v6ToEZ/kY6eYHWjXrjpy2gnHVfAsDmTj0UDtD
	NhnPcrq4i+dZ6A3pGfIAOtlHLPMXEhrI8sNmzoN0m2wQyi6yGCjXQstwnRxIYYIJifQ3r1RLocMgl
	8mGmFPu1G5k8vBOb+q7fjzH9p06DCWUwAimLUrovWiwYdbYGeISzS0Ba26b6fHOtffT3sORQsjLjs
	sRUs7saHm9BNTMvQXcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaCu-00000004lzN-3I18;
	Mon, 23 Nov 2026 20:00:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaCs-00000004lxJ-3bgg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37B3043491;
	Mon, 23 Nov 2026 20:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D23B1F000C4;
	Mon, 23 Nov 2026 20:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464006;
	bh=r5R4hf5cfxy+Cy66jVTd+1Csi3vyz5AZOLaI2RR9hWw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ULBEWwwhcbZzrBysQKKO4FG0TZ1MltLY8mtcu1aywOvuipeHwsbdmXxmancaosNCY
	 37B/r0Rpeia5wYFfJRSxPqtsNRBRveV+xZDNY39ALewgj4vAZyhFTvoTxPngH0QZzw
	 dCp4+vXLufsU+X4Op6MKHWS8Z8Q9bnwKpKpZNxIc8H4+SYMZycXHOKsT5VKzlPrVBS
	 hTPtbloypixzbHTP8mWOWjL4f8LxTRrAIxfJ3MjNPhVgnPcQIFboSL3aEOQEttjr5/
	 +7CH+KW+z7JYtayqXCesnjSbq25lBbuOoaEL6bnaRnBM24gcMd498yrYqdSxVd5BMX
	 JSdlsZnX7F1Tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1668392FFD1;
	Mon, 23 Nov 2026 20:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <179546400452.3090992.2341650194008923425.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 20:00:04 +0000
References: <20261123160421.3227994-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20261123160421.3227994-2-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29_=3Cu=2Ekleine-koenig?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: sven@kernel.org, j@jannau.net, marcel@holtmann.org, luiz.dentz@gmail.com,
 neal@gompa.dev, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 23 Nov 2026 17:04:21 +0100 you wrote:
> Initializing a struct using list initializers is hard to read, compared
> to that using named initializers is more ideomatic. Convert the macro
> used to assign values in the driver's pci_device_id array accordingly.
> 
> This change doesn't introduce any changes to the compiled array on an
> x86 and an arm64 build.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: hci_bcm4377: Use named initializers for pci_device_id array
    https://git.kernel.org/bluetooth/bluetooth-next/c/ffb95458a0f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



