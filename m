Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADCA606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmFTEiB0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhg3lLyE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EZjO8Rd5aju40Jas17/1asJC3gZRYfJanIkjFozuaJ0=; b=zmFTEiB0V5wXWF
	9JOCGrnjOk2EAWE6ArsnFiafFazxN6YZM3yS/GOIEgnb11FmjuJsBz7RmpYOb1BwUJEi9i8J0b41A
	aDdD6fzzGuDbg1kAAnfTBePFVbL4mEL9e8j0Rvlqhh1FMhebSLO6xZlAF4y0pJ6EdDLiqBnNqVIAE
	bShzlqJbBMWBNp174C8ia9fmvQqAk/FZrnlaauWQ+OHHh+LUzJxA4bqoXiRKW8r08pNMMmSrvm/V2
	+PBQHo3x9nVXyqu0C9CZ/Z3Kr26wtoMdj0EMUS94Qm9FXfeFv9uZX2HICSk6ZPghcI7FfP1YZXMAC
	NQPf4ouIjLs9wC6egyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYGO-0000000AiEM-2EqX;
	Thu, 12 Nov 2026 17:07:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYGL-0000000AiDr-2mdn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:07:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BBBC60D07;
	Thu, 12 Nov 2026 17:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C941F000C4;
	Thu, 12 Nov 2026 17:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503220;
	bh=EZjO8Rd5aju40Jas17/1asJC3gZRYfJanIkjFozuaJ0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=mhg3lLyEEMZjkDsxfKJ2GO3I0tvroBQGgZAfri4YvF1zJhPGpvPxcXPPFv4g6fo9P
	 n+KVWbg3gXX074L+RrBPkjvg+8rp9gmw1FPQNHk1OX7d86wDJCb4+svqUyZAaCBO55
	 Lffje6DODRbQbDAsiSgRRvS1aJhu/Mj1/7b2AAMHROL8GD3/3Oc2DyqgOGuta0udnM
	 aeZ7QIf1zzLWD12aqJxO813JCG5lNWnR3OkR2KP9n7VNIenkQWvqEMH311g19+A8Ud
	 FVoAA1LbD8EKxqs7nPyPrPGNAhi/r61eiwdQYddOGrQxRehpnS4GsN+AmS/zXXcxD2
	 2xZczUML6vYgw==
Message-ID: <9d0bb966-91ab-49c2-ac45-204b1bf0e666@kernel.org>
Date: Thu, 12 Nov 2026 18:05:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Subject: Re: [PATCH v2] arm64: defconfig: drop four symbols that no longer
 exist
To: TAKANO Mitsuhiro <takano32@gmail.com>, soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20261111202914.2558187-1-takano32@gmail.com>
 <20261111220718.2586239-1-takano32@gmail.com>
Content-Language: en-US
In-Reply-To: <20261111220718.2586239-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 23:07, TAKANO Mitsuhiro wrote:
> None of these symbols exists any more; the lines are left over from the
> removal of the options they name:
> 
>   NFS_V4_1                  folded into NFS_V4 (7537db24806f)
>   SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62)
>   NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4)
>   SCHED_DEBUG               option removed     (b52173065e0a)
> 
> The Ethernet line was added by commit 32379ad4060b ("arm64: defconfig:
> Drop unused Ethernet vendors") a week after the packetengines vendor
> directory had been removed, so it was stale from the start.
> 
> The built configuration does not change.
> 
> Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
> Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
> Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>

Reviewed-by: Vincent Mailhol (Arm) <mailhol@kernel.org>

> ---
> v2: the commit message now carries only the change itself.  The test
>     record, the earlier submissions and the AI disclosure moved below
>     this line, as Krzysztof asked.
> 
> Tested as configuration text only: "make ARCH=arm64 defconfig" on
> v7.4-rc2 with and without this change gives a byte-identical .config,
> and "make savedefconfig" emits none of the four lines.  No kernel was
> built or booted from this change.
> 
> Scanning every Kconfig definition in the tree leaves no other stale
> line in this file; similar leftovers remain in other architectures'
> defconfigs and are left for separate patches.
> 
> Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December
> 2025, and Vincent Mailhol's "configs: cleanup obsolete or incorrect
> assignments" series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in
> March 2026; both are still unmerged.  I am happy to drop the
> corresponding hunk if either author would rather keep their own.

I am not working on this anymore. I have no problem with you taking over
and continuing the work. On the contrary, thanks for your patch!

The same applies to the other changes in that series. If anyone wants to
cherry-pick or rework a patch, go ahead.


Yours sincerely,
Vincent Mailhol


