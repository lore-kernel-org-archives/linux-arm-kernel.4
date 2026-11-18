Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C7F606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZZMBkYF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nR4xwkhR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=me4+qTl82YgNzGoxWyEsprjq4fF403Or/YIKNaUUYpQ=; b=bZZMBkYFjqI5br
	nIRmMebT9XmTDLL3asGcTGqPJXoQnhpHxdA2qRsCu753vJ5/ZIy5mGjRMXC2d70VOC7M0DVp7Q4r2
	CYkjoNVoV6+DVuvwevcDlzVTCiQg5skXtg8/D0oWC5p3QDh+A8V+DltZwm0Wc4kGJaj0cqXiHuf4s
	9Ni5QRAzD85xznQv753zcy8YbrwEB8k8PCLswI9idukAkRZXKvpm0EK1sY+gMdYSWdwsUB7wzOZZy
	ZWWjAS3+E8jk1XaIO3CqC6Vk3BekIvuaiRfOvmMVbCQ+2roKxTLpmY8Yf/0wJ+r3cag/5zgoswqwK
	837YwFD41ex8dRWE3/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi2z-00000009Nfl-0L3T;
	Wed, 18 Nov 2026 15:58:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi2x-00000009NfZ-1OWY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:58:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6C0941747
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 15:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4B11F000C9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017486;
	bh=me4+qTl82YgNzGoxWyEsprjq4fF403Or/YIKNaUUYpQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nR4xwkhRI/v0pirr69rC2d3WKCnJTP4lIle5SWKjzRn/6ZsJkm24z38aBNEOeFFkj
	 2Vx4NoUbgVLujCUM9Es41pAVcgg30YsN7lJPElJem+fAiOZEfFbpNC8hu4zk3ZPI8L
	 wyHNo6dHrT8Mw2BsSTkCo5PTEa1Z66q53DszEQfKHStlEEzC0M+3b8r4HVO30BdQ99
	 TwYkgEjgE8ZzHAZlE7ba6Bx4XfVI4z69YGwmLHjqgP2AiE5yIWOq+GsRBAzaUtmezU
	 Rcybc1skq2dGcuDD/uG5h+4m2kJRWqyitpA+8GyKvCdD/Rf9J6npBHpqSB7h2blnz3
	 6TJ9ol3BFwetw==
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so365641137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFOcq+g9Jt10gJxGi28vHatSXDfBz9DG6p8JIrEbxtSUo2w3C6gDCHUHZBJI6obdblF9ixopHXOxwJiX10eUMTl@lists.infradead.org
X-Gm-Message-State: APuU4Z+IwGDzcGm/oCyLmmS3dxWciY3xP9ZBH3JeePGt0uzEnNcvWUY1
	iXViw7tj0mv+Eerest0pFoJsKMT7RbU2fnOUJWMw88FTZG+oGAfFKsV51PGaUp2/nBJTI+pRwMp
	EaMuYfLrSTJ3rruwxJLjugxqskth0+VM=
X-Received: by 2002:a05:6102:1612:b0:7cb:288a:b66d with SMTP id
 ada2fe7eead31-7d6ba40e058mr1004520137.20.1795017485944; Wed, 18 Nov 2026
 07:58:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 18 Nov 2026 16:57:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ghznYScteMQzFkcJsMfOTDPRE+JWBoeJg7NurfcfC57A@mail.gmail.com>
X-Gm-Features: AclHuK-WQPlonzR9YQhr-Qu9V32wHoz2Spuu5LyQI3pgmeJNe67xVbxgzHuFNm8
Message-ID: <CAJZ5v0ghznYScteMQzFkcJsMfOTDPRE+JWBoeJg7NurfcfC57A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] powercap: idle_inject: Create threads on demand
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: tglx@linutronix.de, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Ziljstra <peterz@infradead.org>, Bradley Morgan <brads@mainlining.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:34=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> Idle injection currently registers per-CPU kernel threads during early
> initialization, including on CPUs for which no idle injection device
> will be registered.
>
> This series makes thread creation follow the lifetime and CPU mask of
> each idle injection device.
>
> The first patch adds an optional CPU mask to smpboot thread descriptors.
> The mask restricts thread creation, CPU hotplug handling and teardown,
> while preserving the existing behavior for descriptors without a mask.
> Registrations sharing task storage are checked for overlapping CPU
> masks under smpboot_threads_lock before any threads are created.
>
> The second patch uses this support to register idle injection threads
> when a device registers and destroy them when it unregisters. CPU
> ownership claims, registration rollback and thread teardown are
> serialized to prevent overlapping registrations from sharing threads.
>
> The series was tested on Rockchip RK3588. The updated smpboot code and
> idle injection code also build with W=3D1. Concurrent registration and
> CPU hotplug runtime testing remains outstanding.
>
> Changes in v2:
> - Reject overlapping smpboot registrations sharing per-CPU task storage
>   with WARN_ON_ONCE() and -EBUSY, as suggested by Thomas Gleixner.
> - Default a NULL CPU mask to cpu_possible_mask at registration and
>   remove redundant NULL-mask checks from the lifecycle helpers.
> - Use scoped guards for the smpboot registration locks.
> - Document the overlap restriction and registration return values, and
>   update the core commit explanation.
> - Add Bradley Morgan's Reviewed-by tag to the idle injection patch.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bradley Morgan <brads@mainlining.org>
>
> Daniel Lezcano (2):
>   smpboot: Allow restricting per-CPU threads to a CPU mask
>   powercap: idle_inject: Create per-CPU threads on registration
>
>  drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
>  include/linux/smpboot.h        |  6 +++
>  kernel/smpboot.c               | 45 +++++++++++++++++-----
>  3 files changed, 83 insertions(+), 37 deletions(-)

If I'm supposed to pick up this series, please resend it and CC both
patches and the cover letter to linux-pm.

Thanks!

