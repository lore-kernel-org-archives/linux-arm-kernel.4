Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98117606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=29budQTT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XS7Sg/+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YElegpypmtifE9xOIzrUAsvZkT6fVaEpsIG/rSTa8SU=; b=29budQTTIPr48oikkj8jweoXJa
	RZ9nKG7/OX8kcEhUIipDltjtkjYqWTbOw6YQD6vf/bW02PmxGkzGdmIk9AxPpYublX/cjKXBJ+Ji0
	/OkrYjuKgbof9crXD1Zgfy+WfpYkKBTamXxaEoYLQfqfK/i22TN2NepoZmg+WYJrFRg6kmubicEH4
	F0O4eCM/kQVKRwtDtRVP2xF+ze+9lQWCMlveFJfiFmOTxQZwEJxXwZY/DMy64jdgBcjxHvmHwuzk2
	H++umHDTj7NKD9RYtXu1WM0M/3iRb/N0BAOJ2Gq3nNusRtOElBckStPp3bz1vrQk7rH9fCJ67fw7x
	n2z2W2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMKX-00000006TBO-2VpA;
	Tue, 17 Nov 2026 16:46:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMKT-00000006TAm-3ZcX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:46:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC63D1A00;
	Tue, 17 Nov 2026 08:46:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21ECC3F632;
	Tue, 17 Nov 2026 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794934004; bh=1oP+vDnZ3thnOYP7H8TUZmE+L78re0i2FzpsXoSUbsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XS7Sg/+4NjU8evTHYQKKaUgTIz/5+QS8k/ozGpjJgPo92BIp88BfPKMV08ES9N++1
	 jGl3Y1I1Z4z8fll59P6r0yfUmdK+1TLv5xOc3CtWPZvbCySxL0h3gEhyc51DnMYMTZ
	 6Si5BkXtRwfzcPqj8AFgdlP4s7/SM2Mdww/huG54=
Date: Tue, 17 Nov 2026 16:46:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Breno Leitao <leitao@debian.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Edward Adam Davis <eadavis@sina.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees+treewide@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Oleg Nesterov <oleg@redhat.com>, Pan Chuang <panchuang@vivo.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Petr Mladek <pmladek@suse.com>, Petr Pavlu <petr.pavlu@suse.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, arm-scmi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	systemd-devel@lists.freedesktop.org
Subject: Re: [PATCH] [RFC] kernel/reboot: Add orderly_suspend() via
 /sbin/suspend user mode helper
Message-ID: <avyE65k1dRbELB93@pluto>
References: <20261117084523.50711-1-marek.vasut+renesas@mailbox.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117084523.50711-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_084646_532672_617F9A34 
X-CRM114-Status: GOOD (  24.13  )
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

On Tue, Nov 17, 2026 at 09:44:19AM +0100, Marek Vasut wrote:
> Currently, Linux responds to firmware-issued poweroff and reboot requests
> by invoking user mode helpers /sbin/poweroff and /sbin/reboot, which give
> userspace the ability to perform orderly poweroff and reboot according to
> policy set by userspace.

Hi Marek,

> 
> This is not the case for firmware-issued suspend request, which directly
> invokes pm_suspend(PM_SUSPEND_MEM), without giving userspace any way to
> determine the suspend policy. This is problematic, because the userspace
> might not be quite ready to suspend right the instant when the suspend
> request from firmware arrives, e.g. because the user is interacting with
> the device and the userspace knows that interaction will end in the near
> future, at which point the system can be suspended perfectly well.
> 
> Introduce a user mode helper, /sbin/suspend, which acts the same way as
> the other user mode helpers, and which is invoked when firmware-issued
> suspend request arrives. Userspace can use the helper to apply suspend
> policy, most likely by invoking init system suspend target. In case the
> helper is not present, retain current behavior and suspend immediately.
> 
> Note that /sbin/suspend is non-standard. I also considered registering
> an input device and sending KEY_SUSPEND via such a device, but that does
> not seems nice. I also had a look at wake locks, but I don't think this
> is the right tool either. I am sending this as an RFC, because I would
> like to get input on this. I am including change for two platforms, SCMI
> and ZynqMP, which could benefit from this. Thank you for your input !
>

I'll let happily someone decide if this it is worth merging upstream
or not :P....but I would just say that this indeed felt exactly like the
missing bit in the shutdown/reboot kernel framework when I added the
basic reboot/shutdown functionalities to the SCMI Power Control.

If it is really needed to touch base with PID 1 before going suspending
I dont know, but at least this opens the opprtunity for a driver to
choose if userspace has to be involved or not like it is for reboot.

Thanks,
Cristian

