Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEF6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WHIz7+6n;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Of5oYSrV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=; b=WHIz7+6nBE8TztVOyKETJ+15N6
	BdHe76zBzO9CAm5cWF+MltXoaZov7VpAGTlRapu4AtMKcx3MSOAIEJFoyWThL+mPC5JIwooG0GoWO
	f+zjEd5UMzYOUQGB7Kp73T3ztxbyULPSB6Ntfk1ZIBQEbnUe6Y5EiHtj1nRayBk0qbIR79z1yEOAi
	pKpQdR0kpzkRLQh+sYgMlhOeygrHjYv2EoYCveF0Lleql95uSjLtn0C8Zzn6qo2On7nVfkGs47SJR
	uHJNGaHEnOmo5CnZqCCnOfsbXqx+HqdaqWbx1YIidvyiHFj5EZMO2Cl46mz3SYw7WmgkD5q9gmwoY
	S1981xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR9N-00000009NiC-1aNn;
	Thu, 12 Nov 2026 09:31:21 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR9K-00000009Nh0-22ks
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:31:20 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67921b515a7so4623033d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 01:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475876; cv=none;
        d=google.com; s=arc-20260327;
        b=pvMoZI7+Geh+hWtpfBZN3NTOBEKANFj0V3M/rryUnOmRWXPyFzGOJWVe7GnGEPUpmr
         5BiZ8i/+XXUTBjIuPrwXycN7yB0N66lbAVH731w/AOMaeobwCYHQ0GI5ugH4jOPbNif3
         bjWf7H260Pu/2NSB4U3raemF4R6YiH5CA2AoWTWgLaRyiH6qAvPBLM5RhctuOVaqzF33
         Gr44FXLkWl3j3LbZpqtP0sizDHi+idTPPwe8v5f22w1KY1K0QnfcYbNhbH8IGlPWl+nh
         5a0spazOue9DKu/px6ttzOU/tKcoF9LN/crIPO1uwpF/3bCcpJBoyFwnZDBnK89BoDFR
         w+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
        fh=SkW/KvKEmI9FLK1hCja9k2eAgNOxse+h3Z1E1lHLP1o=;
        b=lFJEkNz0QbGRczJVKY12jmwqGSH9J8vSaZjQp1UUR+lnBzWfPR+uxK9dHGJlUswkwb
         cmF/XcMTwOz2zU/YlPgMc3tL5RcbBAuB89sDDctHh2PXlORFdrcuK5MtK2P7srRIUJXg
         M5flZPha/ppPA5O6Ahva8v/X8RK2jber9gryWEY51PirF6s8mWx7zcF0lhuhu9UqG3/B
         yGlbUhXIhB3BLQylrIns99gFskAsIkVYuF7fNqGzAdP5KGTNWyVVUC+bgZ0vYlmq0dV3
         zZ8FzyligB0gHZETgPXT9R5qhMgYCrGIczmE0td1WyBw//drwgIoljoaezys+E274Rhc
         +7Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794475876; x=1795080676; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
        b=Of5oYSrVPeHTTn8S8G7fBXulc+4t0Gmn6/EnjRKiCOTIMo6VGmBlCJdZ6bZ5cXjxBk
         kgEIpYYDzcuWPnELnYITBEVklbGZOpUv+Hy3DK9J1tST50XWgncVI7bzcSXTLG2KbJFL
         mGYl3VQJpdxX4MzyeVwnjm3GIx0Yb4eJA9uwrE/qTf9Dh+wQnqdmlKuvHpGUZ7kyhaCU
         iDw/P1vadjxFkiH6BjGae4nbBO9vAYJfgxbK0E1nAHgmL6ZHz2JDj3Jk2cbw6rz+W+wD
         xUDMWZ28FI432yuMjSO2rxnprCrgeRc9CrDEygEI+YuMm/C77nGOZzMb0aZS9VF3TEbh
         Lnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475876; x=1795080676;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ei8dH+lQVjN7xvZrUNzulVpjahdWK5/bbzW8ZyK4nJk=;
        b=KJI83FPgoAdMZKffY3HlcAXPwWOEBoWes/aegf7khkaZTwnO2MM88Al1EE3xmRu9cG
         b6Pa4XZU1tYKXUW6agCNwjU30bznSg9qQwjU1UoqJodzJ04m9zE+86d55b4QkVhYZ739
         9/gfzDGF4NMxIg56hQJw92bw7DzBU+LCzTfDwZTcL8PfU1J0ArvwCwCO/N0qS0o1bUxB
         PjkXbcYTiZAB5tuPuSlV8B6vr+TbOHBAvwmPVdVbQriL1PomF8pkOKzKKb6FfhpblCc/
         5PQRptjX8rEYnRD6xrrxt+HEZtH4XbKP7oq58XXMwFdoYXUdPdeZmk6EVip0v21r4Scn
         XhNQ==
X-Forwarded-Encrypted: i=1; AL+hErF1+34rUVFDUeK6OyR91YCwHZiSw+waWY2RpBrfkHo7oIUmujTJXs9xa2OgQibNCPjgddnt33pRkfoZezbwOj9s@lists.infradead.org
X-Gm-Message-State: APuU4Z8waAUr9LoIFQMmvmvejadETo14F6KqPDWuT/QM+Ydinh266TF+
	fQSG+BDIADS+kF8q0aHTYF178crZOE9E4zj22zR6XwxFnK7BsTbCj2hq1grnyANeeLOCAPejiCF
	ijQkHA1FPbH36hhhobU8Ujga+YehSTeO/DFseeiqTpA==
X-Gm-Gg: AYBFou3y+t2BvFzwDWMY716QLrVDjg5qVS/wjtqVYsfXOmJodkIVNiv/qYPLA4zmo47
	pfoSNfmF6K/X1OdK3ocGkvHuStQmzojzvA165roPq9bYlDPQJi1sl+CI1jWwCyagMiTkFa/tKv1
	Reeq4N7fRjpfr9joM7qKLUMgV7A/8XWboQ5kVc1tFssgIn8PjYuW9rb5kwWfGDXPcBadH3ghMvQ
	r6AXKVuTh1L8PAMh31z7BOOva2Zi1UMUcGTMJ9P1wSr0X0FT/MF5G3ijIzhklTYe1toAHRVmkhm
	LIL4PE9PtjqHMjplJCC1SjhcDrxOCAFkglx8erUcTbwK/JexEcUsX8u+DZqLgLncSpNqmaSCfQQ
	WsHsQV9s2PaRLeA6DG1I4+47m6+3zifFZ0ZcgmiG/GT83r+VrLwg/cyAykmUZjmCK3aZV6n2vGh
	K7dwJMaMIYBwm2XpI5YlMaqpcAEmvsPG4xzjOTMCpKcw==
X-Received: by 2002:a53:a74f:0:b0:67b:f91c:10b5 with SMTP id
 956f58d0204a3-67c67fdfee6mr2823993d50.98.1794475876355; Thu, 12 Nov 2026
 01:31:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com> <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
In-Reply-To: <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 09:31:05 +0000
X-Gm-Features: AclHuK9o1ZFb6zJeR4-pm6DWlpcG08b32X5ENGmHxfFB3Vx0UUm9PpdFEohX-II
Message-ID: <CAFEAcA8bim81-aKR=whfBaaT92EUAWwwNS8QFAq79Je4Sm+XwA@mail.gmail.com>
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Patrick Lister <patrick.lister.dev@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linusw@kernel.org>, Keith Packard <keithpac@amazon.com>, 
	Nicolas Pitre <nico@fluxnic.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, qemu-arm@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	luis.machado.foss@gmail.com, thiago.bauermann@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_013118_659759_5EA3CEA2 
X-CRM114-Status: GOOD (  23.93  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 07:59, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Nov 12, 2026, at 03:51, Patrick Lister wrote:
> > NWFPE locates the trapping process's saved registers relative to
> > current_thread_info(), assuming thread_info sits at the bottom of the
> > kernel stack. Since ARM moved thread_info into task_struct, that
> > expression points past the end of the task_struct instead.
> >
> > This breaks FPA instruction emulation, as the user registers are
> > never read or written and causes out-of-bounds reads and writes of
> > kernel memory beyond the task_struct. Any unprivileged process can
> > trigger this.
>
> Thanks a lot for chasing this down!
>
> As I understand it, this means that nobody has seriously used or
> tested OABI since 5.16. I last tested it myself in 5.14 when
> working on 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
> thread_info->abi_syscall"), but it was quite hard to properly
> test it at the time, even getting an old Debian rootfs to work
> with a modern kernel and qemu was nontrivial.

> I've added the maintainers for the Arm ports in gcc, qemu and binutils
> to Cc here, I believe all of these still have some level of OABI
> support that they kept just because Linux still handles it, but
> that can then also be removed.

QEMU has already deprecated its OABI and NWFPE emulation as of our
11.0 release in April this year. We'll probably remove it in 12.0
in April next year. (Our deprecation policy only requires two
releases of notice before removal, so we could have removed it
for 11.2 if we'd remembered, but as we're already in freeze it's
a bit late to do so now.)

thanks
-- PMM

