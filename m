Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059A606A7F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RXebDdVe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LJOwH+8M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ajjGW93E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=; b=RXebDdVeKWr7E2
	2eIb8GipjgY+SrMhL3EBYZ/wtpk1jfztOjP7216tnkILMEdIwPzUgJm+ev1fMN0NB15oX/Ov1TmTK
	V5ySpm+dLqDOgKjU8P8bGopYT2IFd+99VlKfzsOU4yFdPn7o2sfr/LWKyBhCXYC1yg8f9O793ePxG
	9mVoA6Jxp9YAQF/dsAUGUoXEDWI7iD4tOwpCEkgcZfPoVwvRsfVg3AwomeOEtVkQqH1K/DiRNmZEb
	k5qUj+ZvWA7IEfB0f6Q3tXzmU7zQZ8qvKz3sfvAmVDMo2j5DY8tJwsbAwIz9IUK9v+qmq+lPLJ1rI
	qeymgp9AIGbawO+XJtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKEW-0000000ENJJ-2suc;
	Fri, 20 Nov 2026 08:44:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKDn-0000000EN6D-03GS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 08:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=; b=LJOwH+8M4madoWbePbJFNuTqKs
	VGIeeIuarBS73MGhqEockrWzfBFit+8nsg0tdDD4IVPGj0twB/A80Pt+P4Im5Ye9/GsoI2SAlhN9c
	+hgVURmjbVIXAVOUvsWgit6FdTmOvSRaVvq6s9F9qf7judrSjqv1y2x/PPx9lKs3Rnaopdwzb/zt9
	+N5WjulPlJG4NWkH9+maC7EFlZ++qeo+oDDkF1nsYm1f21/ZkqPAAcQ4WG9xnyTGxHYw/F13Hb3dK
	pDc2NomNpY92vORZkTvEKcU1J2DA++9iN64D/kdMp6qfrw32vSwbPgsSXrc5E4JMEthi/OtSlaSJc
	XtcePHQg==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKDg-00000000Yjg-3ecw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1047270b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164222; x=1795769022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
        b=ajjGW93EoAPpEdAx0rq5Ymttivvb0vgxxGVZj7usB3yhCg8JPxpd45lJgVqzWOhRyo
         WbFZv6fi0t0se8n6MIDDxPTV4+uAvhz1cTdkdp1lfRRfEz6hU11mnFgis4OBIoepyZnI
         8MENCo5R8yPJhhmbWAey+nPqsyYBjhbXcsZKpoPA+nsYz3Gq1T4/MEWVvfHoyKGdQ2ma
         yZh6QkZK1aVtYTOeV4mWCeSL8q+0QCAEEDdFKRgrAJFU6axmc6EU+4i1X/Lt45/tV+7g
         vjcL6RhZnrXqzCFnOPhRAH0awMUxYsaDohD5egHZue+USb0XT8/mYerzuYE0X7PsQexw
         q/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164222; x=1795769022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=an9c/AwHDCpMgy31fhAcNA3Rgkyae//mKDjGvqRP4jw=;
        b=iJT8IfYLEMc/9wrPd3EzBjBHy+sHYnJdvQ6iTb4BMtcEWG3H21+91hKLfWDA+njwAh
         sDRZ+8SDUue+38q9Rcepk/jP++3XoykyW7JF3RcLchvoTu2UjYi+vC/UwmgJDnAjVQ9Q
         6KwUUrs+3+rwcjTx8jecgImdg9tdmT8ZX0rveSpu85qjk2iCFMLsxTqF+3ueNSFcxGxs
         NZJ3yXDmr+N6gw+rliCNWujPwSdsnaoNmyxvZxfQP0Nqi7aVhq4eymrUf/8+4YVzlp9t
         p7NXy37/znV+Cq46xKISMozOdsycsUmVziSOK60fWHOm0AMExuEXse4pVJUSBdeLD6qJ
         5OOQ==
X-Forwarded-Encrypted: i=1; AL+hErGKkyECk11gE9lJVrNnG7fNCXUh541e8VZY0jx96mjN9R/jCg8w/wZt08CxxlhzThMjm9+IccL2wgyVrREsW9af@lists.infradead.org
X-Gm-Message-State: APuU4Z87VUSVFyt9Dx8iz3tJW/Ca3YLGkiW2GBkvQztS5U1XiCoEOcS8
	ycnvk1LPrsfuoqfMbtUIoFcY3hkuvOFfKsl93z0Bs346D6yrAjRB/YI7JE61QwXeLAM=
X-Gm-Gg: AYBFou1Nv8z4VDBR/8rQwWAytL5UpbZF3NoWNillWnR+2uJnjVP+gqxFfAB7psmDW6t
	KBAD+BAWHXn9SYtVgWe19G8N9Kwp1oaTrSWgNsnj+w7c5Ws4CgsJzTbPFoduubhbHYPasSNpLrQ
	EZ3EBuOIMZQkZhN02lXlMyNuXrTVcol1OLFOb0poPxTV8TBjRjZ+mqb6uR3Ne8Sw0H5adktA58f
	DRYGCNMLtOWLeNYUEER24w1ZdFALIRbkij88+Ni2gFi4qne0HKh13MWMFu+wpdvK8cJ4/aC2+ir
	LJUtHEes113Z/i90X2OB3C7HHy1ONUmGTOB2P7f9htbcAx/gAXckhr7enszP+Qbx+MF6O3zQsaN
	HAAT4VKG0J2diIG5pbiliG+c+PU77j+scQMXd9IuqsoYuEl52cZMoeGdH9V9WcDVUjAa3RI6noS
	baShSbYwLRekcxpiv3mA7NpYKrQ3Olkl+R0/0pfKbc69BTHLq4HC/9bnXynFxlyv6yM8sCCgjjT
	MSJLfvZs0ZaCLm0sDFrsgE89375PEN2sFngSrpZiTxsU+LF0dhXzCI0dCNS73TBLQgozMAuo6Y/
	w8a9cT3HS6yW+AiwQOVBYQPrE+U3muM8MQu8QzvhjrjNbooxYr2QJ8O82xs=
X-Received: by 2002:a05:6a00:2eaa:b0:8b5:fbd0:cb49 with SMTP id d2e1a72fcca58-8c7dd9d6a22mr2795672b3a.21.1795164221763;
        Fri, 20 Nov 2026 00:43:41 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm1163978b3a.39.2026.11.20.00.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:41 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
Date: Fri, 20 Nov 2026 16:43:31 +0800
Message-ID: <20261120084335.3492524-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_084345_230910_6ED8866B 
X-CRM114-Status: GOOD (  31.43  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Han,
> 
> On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > The SCMI core and the mailbox and shared memory transports only use
> > generic kernel interfaces. Transports that need architecture support,
> > such as SMC, already carry their own dependencies.
> >
> > Drop the ARM and ARM64 dependency so that other architectures can use
> > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> >
> > Suggested-by: Michal Simek <michal.simek@amd.com>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> 
> > ---
> > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > now goes on its own through the SCMI tree.
> >
> > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > no HAS_IOMEM, failed to link devm_ioremap().
> >
> > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > and arm64. On UML, SCMI can no longer be selected.
> >
> > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> 
> > --- a/drivers/firmware/arm_scmi/Kconfig
> > +++ b/drivers/firmware/arm_scmi/Kconfig
> > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> >
> >  config ARM_SCMI_PROTOCOL
> >         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > -       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on HAS_IOMEM || COMPILE_TEST
> 
> Please extend the dependencies to RISCV (from the link above, I assume
> you are targeting riscv?) instead.  There is no point in showing this
> option on architectures that have no users of SCMI; one already has
> too many relevant symbols to configure.
> People who want to build test on x86_64 without OF, i386, loongarch64,
> ppc64le, ... can just enable COMPILE_TEST.

Following Michal's suggestion[1], I'm dropping ARM/ARM64.

[1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/

> 
> >         help
> >           ARM System Control and Management Interface (SCMI) protocol is a
> >           set of operating system-independent software interfaces that are
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Sent using hkml (https://github.com/sjp38/hackermail)

