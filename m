Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C55606A6C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQc1Io2T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHy5TQQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D0aacaaucLazBzamGaNcpBWXLJSLR5Zsq+QZIkHcA28=; b=aQc1Io2TtSD1Q+
	IveISy1t6cWywRTkkEIvC4exhBXHBvEu28Hj0IqhnjhKnxUXusdchatTIo+impKl/UMeeNNqV8vEf
	O2RnEHq8iQDWBA914NoV5dcy9bbSDMabIOtULhtAILCsI9S78VfS2r5WeXw6+cz/KwGlqCDue0O1c
	WgZtnuOBBZ8k9reggmku7PpI2l+qx1bniZyBTQydMyxSNtLLcrHQ8Bh9w3v0nok5pRJZS5iWIatyn
	qLrpyWSsWjr585smDmaF64jbjHRGDypEXpjNb4Z1G5NATlez3oJHe5YPJSeh+JKXVwj55w9JV0Ts9
	orJIgNkz8B67MQVo3hLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU7u-0000000G3Ik-2GxB;
	Fri, 20 Nov 2026 19:18:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU7h-0000000G3AW-3A7P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:18:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8411C43E77
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029691F000D4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202293;
	bh=D0aacaaucLazBzamGaNcpBWXLJSLR5Zsq+QZIkHcA28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MHy5TQQhuQENlW9zWAX/8Qh2ErEMxpjVrDs5fDwxCcveRklEdkTLcxk1fWEmYARs8
	 875mkhukfgGSCbeuC357Bd9638/MFGzqLp1iAcj57Nb0vLDq080LAnKZYCTowgENCM
	 sxMEWILYa6AHg1pa9FiOabJukGDsSSbXw8M4ebB4GEjqw3vrg2Mfuh0iQeHMYa+qPR
	 pos1lVkjxxkA1dBKJgro3hRJZ6w8wNJ3G/3GwVcSeeCY+2VRYsTmZKbKN+k2gsgLTT
	 lkoL8eSAhpd9/FkxTRv7gW+bwfBubqCJA8Cz4iHfrbGU2Dwu11yM/XGS4eZUWnmhTF
	 zkAE7aavtx8Jw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so10132631fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:18:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEyPL8IDEQX9PzBPUbrvnGOZ0s4LhNt0N0JGtIRB6TQm/BeBZjoURw64iwbi8jbAB8xTD3vgjylbbREO29qz869@lists.infradead.org
X-Gm-Message-State: APuU4Z9pneWVWlc2fT6wr0zSL5cVCKD99ZGwNyGA5V8UH9avVUNjpgIt
	CEVxcFPHhTKp50s5I49doE5VMAQVz45xi1/w+p7Hoxyn4J1ayKw5QmXG2G22UOFnqE+NR1TnjEg
	0/ZfPHrO4tUEp6H+vx3i6cwMR8NlO3I4=
X-Received: by 2002:a05:651c:419b:b0:3ac:433c:6ab7 with SMTP id
 38308e7fff4ca-3ae7f9f2550mr11211681fa.16.1795202291354; Fri, 20 Nov 2026
 11:18:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 20:17:58 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h_kRcqpfM=8wnEXSnwB5+MHHUd2wK8jruQSRoTYnuXew@mail.gmail.com>
X-Gm-Features: Aa3M54oLwSoxOTZL4M8rcFfriin7DTrg-svIenSNy9jdlFieUb2umtCsC8Amt5k
Message-ID: <CAJZ5v0h_kRcqpfM=8wnEXSnwB5+MHHUd2wK8jruQSRoTYnuXew@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/2] powercap: idle_inject: Create threads on demand
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, tglx@linutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Ziljstra <peterz@infradead.org>, Bradley Morgan <brads@mainlining.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
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

On Wed, Nov 18, 2026 at 5:16=E2=80=AFPM Daniel Lezcano
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
>

Applied as 7.5 material, thanks!

