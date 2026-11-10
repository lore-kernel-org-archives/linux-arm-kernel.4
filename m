Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF42F606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ao/qplXE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiHUAz2g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=19XAClVuc+eajfIp7Ht34SDxVSiFZnDdEKutUwZPCB0=; b=Ao/qplXEV/9rLqYKNoWYrhfhGd
	dpiEG6+G9xsJeHQk5//dJ2R1mlIxvSOBUEWwCBRbbIehBY4nRQdhVbfnfLdPhqUFwU4vf1jIjRqBL
	m/DPjLMyPafrLRdZTKYXkWwomIzKLKLnS5WOa2+aze2W+QXtECKIQoqd2xtXOBQeE0WVCLnpMXJk6
	rVkXptIeD50u/XT/7o8lBAbc/qCbKVLQ43/aOZ/dTKqy3FOrF0M3XwV2PemdWf4zuGmB8+OpXOXpE
	W1eogh8Stdp2PysSgUy3F5nO98gzsfsZchEpi0v+pujYaZX/XQM6hypc3fDGgpLxCbVow9TaXmdIc
	0UaQQITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlbB-00000003yhG-3gZo;
	Tue, 10 Nov 2026 13:09:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlbA-00000003ygW-0KYi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:09:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 35BD363917;
	Tue, 10 Nov 2026 13:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 64AD91F0089F;
	Tue, 10 Nov 2026 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794316154;
	bh=19XAClVuc+eajfIp7Ht34SDxVSiFZnDdEKutUwZPCB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fiHUAz2gGOKSx8xziKopAJOHkhaXvZ+7Tcum0sZ0/6S2Op2IKiuhktrnDNVuS7+1T
	 TtItHcfwP4/inoOgJppZzDcuUvhjwDggPY2ZoJLFpivbPIz/TFrL+MNUgZWM0oy/OY
	 3xnPuUaoIqtjaH486n0lCjbhXgkBvh+0PpIyrxFpkEBlAML+mfeOAIrgvMt+ibFeDz
	 d6r98nQ+J6tL+sVruA8JTd48YAlctQoExvy9MV9eoU1DYT8UN47rX+AhcyYSV+wu12
	 V0voJnb9+IrTK7NY0tYecMkSXbGOpVzsuy0E6Ik7i4WYYLVK9lrvYBBPGrTdxj8aUg
	 jTAUjpaRr1tng==
Date: Tue, 10 Nov 2026 14:07:56 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Russell King <linux@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: apm-power - remove driver
Message-ID: <avMXLPuXKQGWoqL5@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Russell King <linux@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
 <20261109164425.GB1608140@ax162>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109164425.GB1608140@ax162>
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

On Mon, Nov 09, 2026 at 11:44:25AM -0500, Nathan Chancellor wrote:
> On Mon, Nov 09, 2026 at 12:09:44AM -0800, Dmitry Torokhov wrote:
> > The apm-power input handler solely listens for EV_PWR KEY_SUSPEND
> > events to queue APM_USER_SUSPEND via legacy APM emulation. The only
> > in-tree platforms generating those events are legacy Sharp Zaurus ARM
> > machines (spitz/borzoi/akita and collie), none of which were converted
> > to Device Tree. Both mach-pxa board files and mach-sa1100 were marked
> > deprecated in v7.3 by commit cc7852314abd ("ARM: PXA: mark remaining
> > board files as deprecated") and commit 7d92e50ceacd ("ARM: mark
> > mach-sa1100 as deprecated"), and are queued for removal in v7.5. None
> > of the remaining ARM platforms or other APM_EMULATION targets
> > (MIPS_ALCHEMY, PMAC_APM_EMU, and SH_HP6XX) emit EV_PWR input events or
> > enable CONFIG_INPUT_APMPOWER, and arch/arm/configs/pxa_defconfig
> > already dropped CONFIG_PXA_SHARPSL at the same time, leaving its
> > CONFIG_INPUT_APMPOWER=m entry inert.
> > 
> > Normalizing dashes and underscores in scripts/modules-check.sh for v7.5
> > exposes a module name collision (apm_power) between
> > drivers/input/apm-power.ko and drivers/power/supply/apm_power.ko.
> > Remove this obsolete input bridge to resolve the collision rather than
> > renaming a module whose last target platforms are going away in the
> > same cycle.
> > 
> > Reported-by: Sasha Levin <sashal@kernel.org>
> > Closes: https://lore.kernel.org/r/20261108225808.1809266-1-sashal@kernel.org
> > Link: https://lore.kernel.org/r/20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org
> > Link: https://lore.kernel.org/r/e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Thanks a lot for helping with this.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> Nicolas, do you prefer taking this via kbuild-next directly or having
> Dmitry take it via the input tree and giving us an immutable branch? I
> assume the chance of conflicts or follow-ups are low, so we can probably
> just take it directly but I don't want to assume your preference.

Thanks!  I'd like to take it via kbuild tree.  Please complain, if I
shall drop it again.

-- 
Nicolas

