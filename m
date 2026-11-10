Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792760707AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sX5wAYYa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izFZQUIj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KtBx36UBDrfpFx+VxUMkQATj5rmFEq4BGC1xm5D4fac=; b=sX5wAYYa2JMLxx
	5S112FHAxZ5iZ+jRNksjkvEFQ9VR+SMDJzocc6407eDdQEDyOkqa350MGdf6CUo87/vc/RCmO6tVe
	FlUqE2Q78NpfennQHB/VbCu8HKw29fNC/gPT9tWPy9r/S1OC5Ngb6X+5c+9KveBa38A0X9YRvRyNX
	vrhgQbA9zOpfvzAwrmPSdZ5EVvmlKIWQqV/6i7DBn6/khlqkWJqeVVP7lLflpidcdLJj/3KZqfgOz
	L3rbUdokXtxX08chUrRs7KKzGBeTYSQ9jWwX/N8NANRfHxlCxltdPsDynRXQ/E/YidBf5Z3UeGwhL
	Lp691rY25A/5vhyK6v6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQloK-000000042VD-03b3;
	Tue, 10 Nov 2026 13:22:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQloI-000000042US-1hW3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:22:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id DA6A6411C9;
	Tue, 10 Nov 2026 13:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3CC8E1F0089F;
	Tue, 10 Nov 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794316969;
	bh=KtBx36UBDrfpFx+VxUMkQATj5rmFEq4BGC1xm5D4fac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=izFZQUIjNGDTgyp5H8Lj+/KfWVP9QkshatS6aySNYvVvIkxgaJFnSDsf/aIXtQBti
	 LGOoT2zSR86wBAnLb3xa63h3EHnLm9oLb17Vft8x4w+jphOiYE/3viywZJB/pm5VGt
	 uv4LwW/bt2a9VaXec+UVRDUmUttYVtZkX+qN4aRw8f+PmMOaQGwpIOQ5poHrP3HPoS
	 s+uJ0OaDiN5TOVxBe+oMBezKYCKgv77GMhT3nLT/gPVaT8ygtpABc8b8XB2I3XsHlT
	 75f0mefDjWbNJtIi/lKAUyfriTrvlKD/433F+VGqgut10Jtc8t5gA4Mu059iFibcc9
	 2Ux+T5B9ePIJw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Russell King <linux@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: apm-power - remove driver
Date: Tue, 10 Nov 2026 14:22:39 +0100
Message-ID: <179431695096.1779189.14927773083935970456.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
References: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 09 Nov 2026 00:09:44 -0800, Dmitry Torokhov wrote:
> The apm-power input handler solely listens for EV_PWR KEY_SUSPEND
> events to queue APM_USER_SUSPEND via legacy APM emulation. The only
> in-tree platforms generating those events are legacy Sharp Zaurus ARM
> machines (spitz/borzoi/akita and collie), none of which were converted
> to Device Tree. Both mach-pxa board files and mach-sa1100 were marked
> deprecated in v7.3 by commit cc7852314abd ("ARM: PXA: mark remaining
> board files as deprecated") and commit 7d92e50ceacd ("ARM: mark
> mach-sa1100 as deprecated"), and are queued for removal in v7.5. None
> of the remaining ARM platforms or other APM_EMULATION targets
> (MIPS_ALCHEMY, PMAC_APM_EMU, and SH_HP6XX) emit EV_PWR input events or
> enable CONFIG_INPUT_APMPOWER, and arch/arm/configs/pxa_defconfig
> already dropped CONFIG_PXA_SHARPSL at the same time, leaving its
> CONFIG_INPUT_APMPOWER=m entry inert.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] Input: apm-power - remove driver
      https://git.kernel.org/kbuild/c/7f705c0a

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


