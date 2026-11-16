Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FC606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zyp/cWWV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Vqu+DQf/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cRVaCL7qU/Nur8d4hgs/SV92X/SL9mr/1daLWF0YHKI=; b=Zyp/cWWVidLclr2LB/Xqp+GRqh
	fsKrsv/D+Bv6cpPuLBrhq3cs28fSbP3e2VXQjrQl/f2447r4FXiPvfpzAA/h/5OuX6TRpL8+osVvc
	XfnHb1w6g4Z/Ot2OJxaBVl7KkbKupkDmvlX593dC/f7KrwZjBWvjBLBb7jc1g28g6Slucg9ICiksT
	Vk1VnaOYlIrUV+aF32Aj405DkiD5r71fU564M3mk4UILdYr07oPLyfWEwyE00mikQU1HYLjhf9XtY
	7dnpvjTNm+HofZzZzUb/Xeb1jGIrMfTXF7J9rRUTdknVs32x2bKreH0V/Wy/3gnzd5lz2sWFfx49l
	ofVV86vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsOY-00000001fb6-2UHA;
	Mon, 16 Nov 2026 08:48:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsOQ-00000001fXw-2mVi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:48:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1987E1476;
	Mon, 16 Nov 2026 00:48:47 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 063273F673;
	Mon, 16 Nov 2026 00:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794818930; bh=0WXE/Ly9cpApr/71QrxJ7M876eoHyZDmr6/7lDWWuQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vqu+DQf/8WoHXNUICTl252urZ1VZBjUD5IxrSPQw8Og68X/mI+9yOTKikAuycE2NM
	 JgV9UHCp9ROnf6DrjV6/siDzVuGlksM11dt4Nb6DgaYzrn6sWGuXVE4upg4m0oHcmQ
	 aqnGnd/xYeD550ektColUwYAJhb6NeVbei6HnwpM=
Date: Mon, 16 Nov 2026 08:48:41 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: sudeep.holla@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	cristian.marussi@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: fix deadlock between reboot notifier
 and forceful work
Message-ID: <avrDaZKTkXKfono7@pluto>
References: <20261104053359.1613991-1-lui2012qwq@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104053359.1613991-1-lui2012qwq@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_004850_741249_6E49CB57 
X-CRM114-Status: GOOD (  17.72  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 01:33:59PM +0800, Chengyu Liu wrote:
> scmi_reboot_notifier() calls cancel_delayed_work_sync() while holding
> sc->state_mtx, but the work it waits on - scmi_forceful_work_func() -
> takes the same mutex.  If a forceful transition work is in flight when
> the reboot notifier fires, the notifier holds the lock and waits for
> the callback while the callback waits for the lock: deadlock, and the
> reboot wedges.
> 
> Moving the cancel outside the lock is not sufficient on its own, as the
> callback also calls unregister_reboot_notifier() unconditionally, which
> blocks on the reboot chain rwsem (down_write vs. the in-progress
> chain's down_read) while the notifier waits for the callback - the
> deadlock would just move to a different lock.  Fix both sides:
> 
> - Notifier: compute the decision under state_mtx, drop the lock, then
>   cancel.  A callback that slips in between sees state ==
>   SCMI_SYSPOWER_REBOOTING (not IN_PROGRESS), skips the forceful
>   request and finishes, so the cancel cannot miss it.  (The callback's
>   own system_state early-return does not cover a work item that
>   started before the reboot began: kernel_restart_prepare() runs the
>   notifier chain before setting system_state.)
> 
> - Callback: only unregister the reboot notifier when actually forcing
>   the transition - that is the only case that needs it, because the
>   forceful kernel_restart()/kernel_power_off() would otherwise
>   re-enter scmi_reboot_notifier and self-deadlock on state_mtx.  When
>   the state is not IN_PROGRESS there is nothing to force, and skipping
>   the unregister keeps the callback from blocking on the reboot chain
>   rwsem while the notifier waits for it.
> 
> Found by static analysis.

Hi,

thanks for this, this looks good to me.

Sashiko flagged a residual issue in your patch:

https://sashiko.dev/#/patchset/20260916093527.2004594-1-vulab%40iscas.ac.cn

Since I am fixing some other issues around this driver I reposted your
patch within my own series, maintaining your authorship and adding
the additional fix needed (hopefully :P)

My series including your is at:

https://lore.kernel.org/arm-scmi/20261116084211.3066460-1-cristian.marussi@arm.com/T/#t

Thanks,
Cristian

