Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7291E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CGEpP7kv;
	dkim=pass (2048-bit key) header.d=tailscale.com header.i=@tailscale.com header.a=rsa-sha256 header.s=google header.b=UzJakNpJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BWrRFuEPfNkDDgiMO5F3iE5SYJuRJ+VyIA3mL6UAwNc=; b=CGEpP7kvqZyzgK
	I+Ura7z9K0Rnq3ud7ln2+D7edmAX69TTquFWSv/LYTUuBKXL2UsyGY/8thTgVOgqyml5N/3tT0a4J
	qmhyDhyU/jqdS5j3CSbcY0qot7fBobTnpnlPtGHn87iJ9mWsUtK8EG1xpSKTygS68YdgvRFmZe4ZN
	EhFl8Rh/2aRzZHkK26Ef6nQmQxKc09Bny425W7Onh6/ZASx8YiJmUUusz4lws6l2PhZuhhv9rLFWL
	ITazsV5pRBfzoPpU6GskBpY1Di8PsORrNXo7sQrLGEWq0mfKNkvuf5yl35Xn3Ho/H5KofHuUPO7y0
	uko4AuO+vC0aK1JlYZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWihG-0000000Eexs-2MXy;
	Thu, 26 Nov 2026 23:16:10 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWihD-0000000EexX-3V6B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 23:16:09 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-71b0d330acfso5500123eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 15:16:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795734966; cv=none;
        d=google.com; s=arc-20260327;
        b=B+CyZNp5QAsO8GMRZQ9jhrC7O9xG19Ony23ueMrexM8MTZYuA/cocdcQxqnrKExShz
         JyREaG6tqvP3ayQx4M2hAzL6XKssf2PUTBJ4FKyrUo3Bm1M0yznl6MgoQ+tw+3jTNOzB
         Z7AIcEB2lmTlpoen7sOCVAMsZ7fBRykF5n3FvHoehidBtSY4SrCPiLeybrmEINUV7aXa
         k6g7xJGLKGR/l63l/GOVry9DLAIWoGTHuuzUrW6PRnA339wFCrk098p5T5M+lxNkN+jq
         NZYTRdhTlanrui1viMwEtKqHGIOjkbsPTeiqIMylvjuGH3jdkXa/5HZMqkYAsb0Hgml5
         G1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWrRFuEPfNkDDgiMO5F3iE5SYJuRJ+VyIA3mL6UAwNc=;
        fh=D0GPMSB0C+0E3a/6n6Uy1K/f8c5VW9gsDJhk3oEIZF0=;
        b=ehGSx0N9xOahRFPk0iIHlzTBJYiTvfN00qdZ75hwbK2uqnouGKNyOMpUE9/pstNRmt
         7+O7NqTBuo6l194JFt6Olgf/95mTqpCns9SRR4p42o73oMqzkzZ+nv8alUx+TWkGuGzR
         /yB+MJk98597Gpm2kK6bJxhv99ztWC+ByDhtvu4/zQFinz3TljzgmJdEE98AOxc8DbO0
         cCf9yvTE8iKLmNR3FjjnEeCvkMqTqzxP6vs4+D+9zngKCqkGnDrwi5zXnhCVF9xNta78
         fLgtvHJM5+mhoEhApc+6Bakv/0cdhFnX23FF4BfqOie40rVowqJ0fwyuzoMpp09cdVpI
         2kGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tailscale.com; s=google; t=1795734966; x=1796339766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWrRFuEPfNkDDgiMO5F3iE5SYJuRJ+VyIA3mL6UAwNc=;
        b=UzJakNpJXTIgxUxGkZFEoo17oC3DvjKxfp1T8FmwLNv1moaRTxUrf5Ex+r1krUAeRs
         PNuQjugZQqo7UJFUXVQYguNZFsStHyfEb9CAJaplFt+1d7HQ0+9onyGfy6TZtPDuiUwv
         ly7JoxyTd+XcRxnLg1TZoVMR2V7clb9Ipj1w/MBq9uMlWRy1XsZMG5O1NajhKgv9norC
         +L6t0hSgeUi7DxOs5kVNOJ1LbiQMvh2RXNH8dykqvEXUiIDs333feNM3de68+XREDFK2
         qbzkc+CGpQI0bYTjmQcLt/gCe2yuHRyxY9wOOUC+qj8n38GjMzoT9sPj4iK2rWMsllJm
         7kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734966; x=1796339766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWrRFuEPfNkDDgiMO5F3iE5SYJuRJ+VyIA3mL6UAwNc=;
        b=X0/D5WPk/l0V55Gfp8KlzHc+VE8CyOBarhZi216alhXfEslqE6BYHdsvLCRL7/P8uf
         pjLXN5pWB0AJ0k2W9majp0MxDsYaozxTu/vCxISX9ke7iGNmYUIHHOkPsPdju2gkGTPP
         fy1MzwUn002dl0l1rqrXnObsLnciXC6x3sBim+mQhiTMLDQSGcANrM28ha78plfSnV6k
         s8BHVd4A5ZvWG+K+1st4LJOJmntBfEE8Jhdg8nAuN7qaxOAATwk3JWGNnFZO/d7NSADi
         uEwxd0LQ1YJBDcHO5ynThCYkLs3cEt61fV7OdWqdTdWiFrFmYAPU/gjFhDyPKPKmzFs3
         YoNA==
X-Forwarded-Encrypted: i=1; AL+hErEwCWKDBE5rghBU7XmYUUUuOOgWtgYjLUJfLSSnSOHKhbsvA5DX5Tj/Lfo+9wEssZzorASg3a54WWbrS3nG1kqi@lists.infradead.org
X-Gm-Message-State: APuU4Z+CGHAlWvqpNfYx1nEGtgVHHYN/4oMArDk6oXm1dMUxD6UT/+ik
	wOavI2cFXKm5w5LpB3cMLGNJB2s5TT3I2C7vgHXFb1NwO3DxUyxxR5i72/QaOWxxbRjWBmFIfuU
	DmQVNIgtEspnM+sfdVAsJrNb0Yum0x/hkorwbQr9KXA==
X-Gm-Gg: AZFdTZd9V25uzRCqB+DEosn9couPySl0RlT3OzvohrNThYQxL6h6iau+Y0FklyFJJO/
	gETe9D3JoepFiweXiFSiTf4rTMUvyyRagCxLOxqFYeiMLeLR/VzBB665rfpbJAGeMxmTy/0H65x
	SMm/1UrJWgTwkwHTY2wXzLZsVpKsReLdxucp8JCMiK32YPF+Rc8fhHJFDv43SqzF8AStTQcezQE
	XReW5LipyGXaj43vdwocD9nMI+BE4+YMr4/t+evgoZENmT9XPyCFvyqper1sigRo2tQ0kaJL7md
	A4lEpkU2Cv/OwhBU9PHACGgO8lwIcQrV48L1y0KO3V+t5+ZGFKRu4OVMNsepDO8pWEw0zKZW8Ng
	nk4Ntu2s6HyrKe09nYN3JjF5ExP62m0V7HT9LRnhHgVx37o6kxkXsCmbooyrKptspFKhD56vZh/
	aB7/fbLWqYKnGN4NY=
X-Received: by 2002:a05:6820:6706:b0:712:b60d:2ed1 with SMTP id
 006d021491bc7-71b39468d77mr11717331eaf.10.1795734966468; Thu, 26 Nov 2026
 15:16:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126-bradfitz-kvm_lpi_active-v1-1-9ff28176bf66@tailscale.com> <86y0agx9om.wl-maz@kernel.org>
In-Reply-To: <86y0agx9om.wl-maz@kernel.org>
From: Brad Fitzpatrick <bradfitz@tailscale.com>
Date: Thu, 26 Nov 2026 15:15:55 -0800
X-Gm-Features: Aa3M54rQby0v4QzOGwyotbdQYWTk2b1yNxvx7ILnWqoqPCMk8Ods5BwBk5a9gjU
Message-ID: <CAMkNuKA0ogr-1pkL8Zg+cS_pwsF37mL=He7V-XowhvtUpWL5DA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: GICv3: Keep active LPIs in the LRs
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_151607_890986_5BB0F2B0 
X-CRM114-Status: GOOD (  32.75  )
X-Spam-Score: -2.1 (--)
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

On Thu, Nov 26, 2026 at 12:45=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Hi Brad,
>
> On Thu, 26 Nov 2026 01:42:04 +0000,
> Brad Fitzpatrick via B4 Relay <devnull+bradfitz.tailscale.com@kernel.org>=
 wrote:
> >
> > From: Brad Fitzpatrick <bradfitz@tailscale.com>
> >
> > Since commit 73c9726975af ("KVM: arm64: GICv3: Drop LPI active state
> > when folding LRs"), the active state of a virtual LPI is discarded on
> > every exit. If the guest has acknowledged an LPI but not yet EOI'd it
> > when an exit happens, the LPI is then pruned from the ap_list, and the
> > guest's subsequent EOI targets an INTID that is not in any LR. KVM then
> > relies on the virtual CPU interface performing the priority drop
> > regardless.
> >
> > That doesn't hold for Apple's emulated GICv3 interface, as exposed by
> > macOS Virtualization.framework to a Linux guest running with nested
> > virtualization (M3 and later, e.g. "tart run --nested"). There, an EOI
> > of a vLPI that has no LR leaves the corresponding ICH_AP1R0_EL2 bit set=
.
> > The running priority of the vCPU stays at the LPI's priority forever,
> > and since Linux uses the same priority for all of its interrupts,
> > nothing is ever delivered to that vCPU again. The nested guest's CPU
> > spins on WFI, with KVM seeing pending interrupts and waking it up over
> > and over (about 30k WFI exits per second), while the guest itself
> > reports a hard lockup on that CPU. With a 2-vCPU Debian guest, this
> > happens within the first minute of boot, every time.
>
> [...]
>
> This is a known bug on Apple HW running MacOS, which has been reported
> a number of times to Apple (both directly and through hypervisor
> vendors), and resulted in a deafening silence.
>
> The nature of the bug is unclear: either the host hypervisor is buggy,
> and it needs to be fixed, or the HW is buggy, and the host hypervisor
> needs to work around the bug (working around that bug in each and
> every guest is not an acceptable outcome).
>
> The other bug is of course in the spec, where the provided pseudocode
> for aarch64/support/VirtualWriteEOIR1 is remarkably buggy. But for
> that generation of older ARM specification, the pseudocode is not
> authoritative, and it is the text that matters. Dozen of
> implementations got it right, and it is surprising that Apple didn't.
>
> The proposed fix breaks all sorts of other things, and can prevent
> pending interrupts from making it into the LRs, as we now have active
> LPIs occupying LRs for no good reasons. And to be brutally honest,
> carrying hacks that make the vgic even harder to maintain is not
> something I want to entertain anymore. If this problem is to be
> solved, it must be done on the host hypervisor, and nowhere else.
>
> The workaround I can offer is to set "kvm-arm.vgic_v3_group1_trap=3D1"
> on the Linux kernel command line. This will ask the L0 hypervisor to
> forward ICC_IAR1_EL1/ICC_EOIR1_EL1 traps to KVM, which will itself
> emulate the HW. This is expensive (each interrupt will result in about
> 4 extra full context switches in MacOS), but your guest will hopefully
> work reliably (assuming that MacOS implements trap forwarding
> correctly). This is exactly what the host hypervisor should implement
> if the HW is buggy.

Thanks! That works great. It's indeed a bit slower (12% fewer IOPS, 5
to 10% less disk throughput, 5% less networking throughput), but the
absolute numbers are still so ridiculously fast compared to the host's
actual hardware, that it's a drop in the bucket for us. And even with
the trap enabled on a recent kernel, it's still faster than the old
6.17 kernel.

I whipped up a workaround at the Proxmox layer instead that probes
whether macOS is still busted and conditionally sets the trap flag:

https://github.com/bradfitz/pve-on-macos-nested-virt-fix

We'll use that in the meantime. Maybe others will find it useful too.

>
> Feel free to additionally report the issue to Apple (once more).

I'll poke some contacts at Apple and make sure they're aware.

Thanks again!

- Brad

