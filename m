Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE2606EE86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UHMtuM3T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwYrWyq9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pqc2L1WzcvzIZX23ze7NEAQi3S+/FWCxRg0BqVfI6Vg=; b=UHMtuM3Tx+wvnHWy9jaTBPn5N2
	dd/jy21McBM5db84eQxwzX4Pfw7YazvoJJPmFMjMyPiCTv/+7pnnXfFITP47cp/oLeKTzy2pnnbR6
	hhv4J8SYat0RtrKqEr6uD1Ylyx+7wQPq7cCY9L+H5d7i9lmXODnNtoYHNfkBCDnF1T1DorknDBkC+
	XeigbSJUU5sLhFbmQnIy99l1MbS6M6yQnie426ng1iSeHfb3pjpq8NK+tpov1b8sv4Z6IeEsWk0Sr
	rD4Sqpt61IR0+LUEI521/x85IDyOEulhZh9YG1QNeGQXawlndThnBqNi9fZxGcbqvuiw1sUtSWXv0
	gxTncUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSTw-00000001Dor-0Evp;
	Mon, 09 Nov 2026 16:44:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSTv-00000001Dok-1R07
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:44:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69AC962C5A;
	Mon,  9 Nov 2026 16:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6DB1F0089F;
	Mon,  9 Nov 2026 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242670;
	bh=pqc2L1WzcvzIZX23ze7NEAQi3S+/FWCxRg0BqVfI6Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RwYrWyq9onaHDWrzcgUAnNT+SCoruSQGm9pYpLkASnNzt+eJw6UaP/20lLzCx53Tg
	 Wq/fzGQuKca+BL62LT2ecyreaIjmIcz1jp30nfdV++sUhfKFKT63PaTdjKFfDyafEr
	 98bjeO0KYM4XsracQeh3hGCrUI4SmuGqKunKrLyeAPTyqW9tfaZxcRwJL5ATMQ9lQa
	 XMSohEDAX5THIp9B+tYk3akCt1kk3PX4zT3DVK50IjlwwQLynszpFmdpQ9R/SUmz4V
	 uy8S+96lC7Ed1ISDIhV4df+jGQMzks7Ar7XQ/Qm3powg856/HDIl9f5zyAz6yLg+84
	 zi8dbhTRQ83cw==
Date: Mon, 9 Nov 2026 11:44:25 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Nicolas Schier <nsc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Russell King <linux@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: apm-power - remove driver
Message-ID: <20261109164425.GB1608140@ax162>
References: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 12:09:44AM -0800, Dmitry Torokhov wrote:
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
> Normalizing dashes and underscores in scripts/modules-check.sh for v7.5
> exposes a module name collision (apm_power) between
> drivers/input/apm-power.ko and drivers/power/supply/apm_power.ko.
> Remove this obsolete input bridge to resolve the collision rather than
> renaming a module whose last target platforms are going away in the
> same cycle.
> 
> Reported-by: Sasha Levin <sashal@kernel.org>
> Closes: https://lore.kernel.org/r/20261108225808.1809266-1-sashal@kernel.org
> Link: https://lore.kernel.org/r/20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org
> Link: https://lore.kernel.org/r/e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks a lot for helping with this.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Nicolas, do you prefer taking this via kbuild-next directly or having
Dmitry take it via the input tree and giving us an immutable branch? I
assume the chance of conflicts or follow-ups are low, so we can probably
just take it directly but I don't want to assume your preference.

-- 
Cheers,
Nathan

